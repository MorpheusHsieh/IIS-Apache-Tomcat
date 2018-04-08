import java.sql.*;
import BufReader;

public class JdbcConn06
{
  // 連線所需要的物件
  private Connection _conn = null;
  public Statement _stmt = null;
  public ResultSet _rs = null;

  // 連線以後可以取得關於資料表的資訊
  private int _nFields = -1;              // 欄位數量
  private int _nRecords = -1;             // 總資料筆數
  private String[] _sFieldNames = null;   // 欄位名稱
  private String[] _sFieldType = null;    // 欄位型態
  private String[][] _sData = null;       // 資料

  // 本程式假設只有在執行 SQL 查詢命令後才會有分頁的產生
  private int _nRecsPerPage = 5;          // 每頁顯示幾筆資料，預設值為10
  private int _nRecsInLastPage = -1;      // 最後一頁有幾筆資料
  private int _nRecsInNowPage = -1;       // 現在這一頁有幾筆資料
  private int _nTotalPages = -1;          // 共有多少頁
  private int _nNowPage = -1;             // 現在是第幾頁

  // 連線 ----------------------------------------------------------------------
  public void MakingConnection(String file)
  {
    BufReader inBuf = new BufReader(file);
    String user, passwd, driver, url;
    user = inBuf.Search("UserName");
    passwd = inBuf.Search("Password");
    driver = inBuf.Search("DriverName");
    url = inBuf.Search("URL");

    try
    {
      // Load the driver class
      Class.forName(driver);

      // create a connection throught the DriverManager
      if (user != null && passwd != null)
        _conn = DriverManager.getConnection(url, user, passwd);
      else
        _conn = DriverManager.getConnection(url);
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

  // 執行 SQL 異動命令 -----------------------------------------------------------
  public int ExecuteUpdate(String sqlstr)
  {
    int row_update = -1;
    try
    {
      this._stmt = this._conn.createStatement();
      row_update = this._stmt.executeUpdate(sqlstr);
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in ExecuteUpdate: " + sqle);
    }
    return row_update;
  }

  // 和欄位資訊有關的函數
  public int getFields() { return this._nFields; }      // 得知此Table有多少個欄位
  public String[] getFieldNames() { return this._sFieldNames; }   // 取出欄位名稱
  public String[] getFieldTypes() { return this._sFieldType; }    // 取出欄位型態

  // 和資料錄有關的函數
  public int getRecords() { return this._nRecords; }  // 得知此次查詢結果資料總筆數

  // 執行 SQL 查詢命令(Select) ---------------------------------------------------
  public int ExecuteQuery(String sqlstr)
  {
    int rows = -1;
    try
    {
      _stmt = _conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);
      _rs = _stmt.executeQuery(sqlstr);

      this.getFieldInfomation();  // 取出欄位名稱及型態
      rows = this.setRecords();   // 得知此次查詢結果有多少筆資料錄
      //System.out.println("ExecuteQuery: " + rows);

      if (rows > 0)
      {
        this.getResults();
        this._nTotalPages = this.setPages();
      }
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in getResults: " + sqle);
    }
    return rows;
  }

  // 取得 SQL查詢指令後的資料集 ---------------------------------------------------
  private void getResults()
  {
    int rows = -1; // 執行查詢命令失敗傳回 -1, 成功傳回資料錄數量
    ResultSet rs = this._rs;
    rows = this.getRecords();
    if (rows > 0)
    {
      // 配置足夠的記憶題空間給 _sData 變數
      this._sData = null;
      int cols = this.getFields();
      _sData = new String [rows][cols];
      try
      {
         rs.first();
         int row = 0;
         do {
           for (int i=0; i<cols; i++)
             _sData[row][i] = rs.getString(i+1); // 欄位編號從 1開始
           row++;
         } while(rs.next());
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getResults: " + sqle);
      }
    }
  }

  // 結束連線 -------------------------------------------------------------------
  public void CloseConnection()
  {
    if (_stmt != null)
    {
      try
      {
        _stmt.close(); _stmt = null;
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in CloseConnection: " + sqle);
      }
    }

    if (_conn != null)
    {
      try
      {
        _conn.close(); _conn = null;
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in CloseConnection: " + sqle);
      }
    }
  }

  /*****************************************************************************
   * 此區為和分頁有關的方法(Method)
   ****************************************************************************/

  // 設定每頁顯示幾筆資料 ---------------------------------------------------------
  public void setRecordsPerPage(int page) { this._nRecsPerPage = page; }

  // 取出每頁可顯示幾筆資料 -------------------------------------------------------
  public int getRecordsPerPage() { return this._nRecsPerPage; }

  //取出現在這一頁有幾筆資料 ------------------------------------------------------
  public int getRecordsInNowPage() { return this._nRecsInNowPage; }

  // 總共有多少頁 ---------------------------------------------------------------
  public int getTotalPages() { return this._nTotalPages; }

  // 現在是第幾頁 ---------------------------------------------------------------
  public int getNowPage() { return this._nNowPage; }

  // FirstPage: 第一頁 ----------------------------------------------------------
   public void FirstPage()
   {
     int now_page = 1;
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
   }

   // PrevPage: 上一頁 ----------------------------------------------------------
   public int PrevPage()
   {
     int now_page = this._nNowPage - 1;
     now_page = (now_page < 1) ? 1 : now_page;
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
     return now_page;
   }

   // GotoPage: 跳到任一頁 ------------------------------------------------------
   public void GotoPage(int page)
   {
     int now_page = (page < 1) ? 1 : page;
     int last_page = this.getTotalPages();
     now_page = (now_page > last_page) ? last_page : now_page;
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
   }

   // NextPage: 下一頁 ----------------------------------------------------------
   public int NextPage()
   {
     int now_page = this._nNowPage + 1;
     int last_page = this.getTotalPages();
     now_page = (now_page > last_page) ? last_page : now_page;
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
     return now_page;
   }

   // LastPage: 最後一頁 --------------------------------------------------------
   public int LastPage()
   {
     int now_page = this.getTotalPages();
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
     return now_page;
   }

  // 計算此次 SQL 查詢命令共可以分為幾頁 -------------------------------------------
  private int setPages()
  {
    int total_pages = -1;
    if (this._rs != null)
    {
      int recs = this.getRecords();
      int recs_per_page = this._nRecsPerPage;
      total_pages = (recs / recs_per_page);
      // 如果 "總資料筆數" 不是恰好為 "每頁資料數" 的整數倍則 "頁數" 加1
      total_pages += ((recs % recs_per_page) != 0) ? 1 : 0;
      this._nRecsInLastPage = (recs % recs_per_page);  // 最後一頁的資料筆數
    }
    return total_pages;
  }

  // 根據頁數計算此頁應該有多少筆記錄
  private int setRecordsInNowPage(int page)
  {
    int recs_in_nowpage = -1;
    int recs_per_page = this._nRecsPerPage;
    int recs_in_last_page = this._nRecsInLastPage;
    int pages = this.getTotalPages();

    // size_in_page 用來表示第 [page] 頁有多少筆資料錄
    recs_in_nowpage = recs_per_page;
    if (page == pages)
      recs_in_nowpage = (recs_in_last_page != 0) ? recs_in_last_page : recs_per_page;
    this._nRecsInNowPage = recs_in_nowpage;
    return recs_in_nowpage;
  }

  // GetnerateNumber -----------------------------------------------------------
  // 根據頁數產生對應的陣列，內容為該頁所對應的資料錄編號
  private int[] GenerateNumber(int page)
  {
    int[] array = null;
    int recs_per_page = this._nRecsPerPage;
    int recs_in_last_page = this._nRecsInLastPage;
    int pages = this.getTotalPages();
    int rec_in_nowpage = this.getRecordsInNowPage();

    // 計算出第 [page] 頁所對應的資料錄編號
    array = new int[rec_in_nowpage];
    for (int i=0; i<rec_in_nowpage; i++)
      array[i] = (((page-1)*recs_per_page) + i);     // 資料在 Data 陣列中從 0開始
    return array;
  }

  /*****************************************************************************
   * 此區為和資料表的操作有關的方法(Method)
   ****************************************************************************/
  // 取得一頁的資料錄 ------------------------------------------------------------
  public String[][] getOnePageRecord()
  {
    String[][] data = null;
    int cols = this.getFields();
    int page = this.getNowPage();
    int[] array = this.GenerateNumber(page);
    int rows = array.length;

    data = new String [rows][cols];
    for (int i=0; i<rows; i++)
      data[i] = this.getRowData(array[i]);
    return data;
  }

  public String[][] getOnePageRecord(int page)
  {
    String[][] data = null;
    this.GotoPage(page);
    int cols = this.getFields();
    int[] array = this.GenerateNumber(page);
    int rows = array.length;

    data = new String [rows][cols];
    for (int i=0; i<rows; i++)
      data[i] = this.getRowData(array[i]);
    return data;
  }

  // 取得資料表的一列資料 ---------------------------------------------------------
  public String[] getRowData(int row)
  {
    String[] row_data = null;
    if (this._sData != null)
    {
      if (row >= 0 && row < this.getRecords())
      {
        int cols = this.getFields();
        row_data = new String [cols];
        for (int col=0; col<cols; col++)
          row_data[col] = this._sData[row][col];
      }
    }
    return row_data;
  }

  // 取得欄位名稱 ----------------------------------------------------------------
  private void getFieldInfomation()
  {
    if (this._rs == null)
    {
      this._sFieldNames = new String [1];
      this._sFieldNames[0] = "ResultSet 物件尚未建立...";
    }
    else
    {
      try
      {
        ResultSetMetaData rsmd = _rs.getMetaData();

        int cols = rsmd.getColumnCount();
        this._nFields = cols;
        this._sFieldNames = new String [cols];
        this._sFieldType = new String [cols];
        for (int i=0; i<cols; i++)
        {
          this._sFieldNames[i] = rsmd.getColumnName(i+1);
          this._sFieldType[i] = rsmd.getColumnTypeName(i+1);
        }
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getFieldInfomation: " + sqle);
      }
    }
  }

  // 取得此次查詢所傳回的資料筆數 --------------------------------------------------
  private int setRecords()
  {
    if (this._rs != null)
    {
      try
      {
        this._rs.last();
        this._nRecords = this._rs.getRow();
        this._rs.first();
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getRecords: " + sqle);
      }
    }
    return this._nRecords;
  }
}