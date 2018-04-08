import java.sql.*;
import java.io.File;
import BufReader;

public class JdbcConnection
{
  // 連線所需要的物件
  private Connection _conn = null;
  public Statement _stmt = null;
  public ResultSet _rs = null;

  // 連線後可以取得的變數資訊
  private int _Records = 0;           // 總資料筆數
  private int _Fields = 0;            // Table 的欄位數量
  private String[] _FieldName = null; // 存放欄位名稱的地方
  private int _nRecsPerPage = 10;     // 每頁有多少筆紀錄， 預設值為每頁10筆
  private int _nRecsInLastPage = 0;   // 最後一頁有多少筆記錄
  private int _nRecsInThisPage = 0;   // 這一頁有多少筆記錄
  private int _nPages = 0;              // 共有多少頁
  private int _nNowPage = 0;          // 現在是第幾頁

  // Method
  public int Records() { return this._Records; } // 取出此次查詢共有多少筆資料
  public int Fields() { return this._Fields; }   // 取出總共有多少個欄位
  public String FieldName(int idx) { return this._FieldName[idx]; } // 取出欄位名稱
  // 設定每頁有多少筆記錄
  public void RecordsPerPage(int recs) { this._nRecsPerPage = recs; }
  // 取出每頁有多少筆記錄
  public int RecordsPerPage() { return this._nRecsPerPage; }
  // 取出最後一頁有多少筆記錄
  public int RecordsInLastPage() { return this._nRecsInLastPage; }
  // 取出此次查詢結果共可分成多少頁
  public int Pages() { return this._nPages; }
  // 取出現在是第幾頁
  public int NowPage() { return this._nNowPage; }

  // 連線 ----------------------------------------------------------------------
  public void MakingConnection(String file)
  {
    BufReader inBuf = new BufReader(file);
    String user, passwd, driver, url;
    user = inBuf.Search("UserName");
    passwd = inBuf.Search("Password");
    driver = inBuf.Search("DriverName");
    url = inBuf.Search("URL");

    // Load driver
    try
    {
      // Load the driver class
      Class.forName(driver);

      // Define ths data source for the driver
      String srcURL = url;

      // Create a connection through the DriverManager
      if (user != null && passwd != null)
        _conn = DriverManager.getConnection(url, passwd, srcURL);
      else
        _conn = DriverManager.getConnection(srcURL);
      _stmt = _conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);
    }
    catch(ClassNotFoundException cnfe)
    {
      System.err.println("Error in MakingConnection: " + cnfe);
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in MakingConnection: " + sqle);
    }
  }

  // 執行 SQL 異動指令，包括 Insert, Delete, Update ------------------------------
  public int ExecuteUpdate(String sqlstr)
  {
    int result = 0;
    try
    {
      result = _stmt.executeUpdate(sqlstr);
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in ExecuteUpdate: " + sqle);
    }
    return result;
  }

  // 執行 SQL 查詢指令，供 Select 指令使用-----------------------------------------
  public ResultSet ExecuteQuery(String sqlstr)
  {
    try
    {
      _rs = _stmt.executeQuery(sqlstr);
      this.getRecords();
      this.getFieldName();
      this.getPages();
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in ExecuteQuery: " + sqle);
    }
    return this._rs;
  }

  // 查出這次查詢共有多少筆記錄 ----------------------------------------------------
  private void getRecords()
  {
    if (this._rs == null)
    {
      System.out.println("ResultSet 物件尚未建立...");
    }
    else
    {
      // 取出共有多少筆紀錄
      try
      {
        _rs.last();
        this._Records = _rs.getRow();
        _rs.first();
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getRecrods: " + sqle);
      }
    }
  }

  // 從資料表中取出欄位名稱 -------------------------------------------------------
  private void getFieldName()
  {
    if (this._rs == null)
    {
      System.out.println("ResultSet 物件尚未建立...");
    }
    else
    {
      // 取出所有欄位資訊
      try
      {
        ResultSetMetaData rsmd = _rs.getMetaData();
        this._Fields = rsmd.getColumnCount();

        int cols = this._Fields;
        this._FieldName = new String [cols];
        for (int i=0; i<cols; i++)
          _FieldName[i] = rsmd.getColumnName(i+1);  // 欄位索引從 1開始
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getFieldName: " + sqle);
      }
    }
  }

  // getPageInformation --------------------------------------------------------
  private void getPages()
  {
    if (this._rs == null)
      System.out.println("ResultSet 物件尚未建立...");
    else
    {
      // 計算執行 SQL 指令後，取回的資料可以分成幾頁?
      int rows = this.Records();
      int recs_per_page = this._nRecsPerPage;
      this._nPages = (rows/recs_per_page);
      // 如果 rows 不是恰好為 recs_per_page 的整數倍則加 1
      this._nPages += ((rows%recs_per_page) != 0) ? 1 : 0;
      // 最後一頁的資料筆數等於 rows 和 recs_per_page 的餘數
      this._nRecsInLastPage = (rows%recs_per_page);
    }
  }

  // FirstPage: 產生第一頁的資料記錄的編號 -----------------------------------------
  public int[] FirstPage()
  {
    int[] array = null;
    int now_page = 1;
    this._nNowPage = now_page;
    array = GenerateNumber(now_page);
    return array;
  }

  // PrevPage ------------------------------------------------------------------
  public int[] PrevPage()
  {
    int[] array = null;
    int now_page = this.NowPage() - 1;
    now_page = (now_page < 1) ? 1 : now_page; // 判斷是否小於第1頁
    this._nNowPage = now_page;
    array = GenerateNumber(now_page);
    return array;
  }

  // GotoPage ------------------------------------------------------------------
  public int[] GotoPage(int page)
  {
    int[] array = null;
    // 先判斷 page 變數是否超出範圍
    int now_page = (page < 1) ? 1 : page;
    int pages = this.Pages();
    now_page = (page > pages) ? pages : page;
    this._nNowPage = now_page; // 將 _nNowPage 變數設定為現在的頁數
    array = GenerateNumber(now_page);
    return array;
  }

  // NextPage ------------------------------------------------------------------
  public int[] NextPage()
  {
    int[] array = null;
    int now_page = this.NowPage() + 1;
    int pages = this.Pages();
    now_page = (now_page >= pages) ? pages : now_page;
    this._nNowPage = now_page;
    array = GenerateNumber(now_page);
    return array;
  }

  // LastPage ------------------------------------------------------------------
  public int[] LastPage()
  {
    int[] array = null;
    int now_page = this.Pages();
    this._nNowPage = now_page;
    array = GenerateNumber(now_page);
    return array;
  }

  // GenerateNumber ------------------------------------------------------------
  // 依據頁數產生對應的陣列，陣列內容為該頁數的資料紀錄編號
  private int[] GenerateNumber(int page)
  {
    int[] array = null;
    int recs_per_page = this.RecordsPerPage();
    int recs_in_last_page = this.RecordsInLastPage();
    int pages = this.Pages();

    // size 用來記錄第 page 頁應該有多少筆記錄
    int size = recs_per_page;
    if (page == pages) // 判斷是否為最後一頁
      size = (recs_in_last_page != 0) ? recs_in_last_page : recs_per_page;
    this._nRecsInThisPage = size;

    // 計算出第 page 頁對應的資料記錄編號
    array = new int[size];
    for (int i=0; i<size; i++)
      array[i] = (((page-1)*recs_per_page)+i+1); // 資料是從1開始計數
    return array;
  }

  // UpdateData ----------------------------------------------------------------
  public int UpdateData(String sqlstr)
  {
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // DeleteData ----------------------------------------------------------------
  public int DeleteData(String sqlstr)
  {
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // InsertData ----------------------------------------------------------------
  public int InsertData(String sqlstr)
  {
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 結束連線 -------------------------------------------------------------------
  public void CloseConnection()
  {
    if (_stmt != null)
    {
      try
      {
        _stmt.close();
        _stmt = null;
      }
      catch(SQLException sqle)
      {
        System.out.println("Error in CloseConnection...");
        System.out.println("SQLState: " + sqle.getSQLState());
        System.out.println("Message: " + sqle.getMessage());
      }
    }

    if (_conn != null)
    {
      try
      {
        _conn.close();
        _conn = null;
      }
      catch(SQLException sqle)
      {
        System.out.println("Error in CloseConnection...");
        System.out.println("SQLState: " + sqle.getSQLState());
        System.out.println("Message: " + sqle.getMessage());
      }
    }
  }
}