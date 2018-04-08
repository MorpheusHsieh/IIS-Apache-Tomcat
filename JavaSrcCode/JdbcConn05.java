import java.sql.*;
import BufReader;

public class JdbcConn05
{
  // 連線所需要的物件
  private Connection _conn = null;
  public Statement _stmt = null;
  public ResultSet _rs = null;

  // 連線以後可以取得關於資料表的資訊
  private int _nFields = -1;              // 欄位數量
  private int _nRecords = -1;             // 總資料筆數
  private String[] _sFieldNames = null;   // 欄位名稱
  private String[][] _sData = null;       // 資料

  // 與分頁有關的變數
  private int _nRecsPerPage = 10;         // 每頁顯示多少筆資料，預設值為10
  private int _nRecsInLastPage = -1;      // 最後一頁有多少筆資料
  private int _nRecsInPage = -1;          // 現在這一頁有多少筆資料
  private int _nPages = -1;               // 共有多少頁
  private int _nNowPage = -1;             // 現在是第幾頁

  // Method
  public int Records() { return this._nRecords; } // 得知此次查詢結果資料總筆數
  public int Fields() { return this._nFields; }   // 得知此Table有多少個欄位
  public String[] FieldNames() { return this._sFieldNames; }  // 取出欄位名稱

  // 取得資料表的一列資料
  public String[] getRowData(int row)
  {
    String[] row_data = null;
    if (this._sData != null)
    {
      if (row >= 0 && row < this.Records())
      {
        int cols = this.Fields();
        row_data = new String [cols];
        for (int col=0; col<cols; col++)
          row_data[col] = this._sData[row][col];
      }
    }
    return row_data;
  }

  // 和分頁有關的 Method ---------------------------------------------------------
  // 設定每頁顯示多少筆資料
  public void RecordsPerPage(int page) { this._nRecsPerPage = page; }
  public int Pages() { return this._nPages; }     // 總共有多少頁

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

  // 執行 SQL 查詢命令(Select) ---------------------------------------------------
  public int ExecuteQuery(String sqlstr)
  {
    int result = -1;
    try
    {
      _stmt = _conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);
      _rs = _stmt.executeQuery(sqlstr);
      getFieldNames();
      getRecords();
      result = Records();
      if (result > 0)
      {
        getResults();
        getPages();
      }
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in getResults: " + sqle);
    }
    return result;
  }
  // 取得欄位名稱 ----------------------------------------------------------------
  private void getFieldNames()
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
        for (int i=0; i<cols; i++)
          this._sFieldNames[i] = rsmd.getColumnName(i+1);
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getFieldNames: " + sqle);
      }
    }
  }

  // 取得此次查詢所傳回的資料筆數 --------------------------------------------------
  private void getRecords()
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
  }

  // 取得 SQL查詢指令後的資料集 ---------------------------------------------------
  private void getResults()
  {
    int rows = -1;              // 先假設資料總比數為-1，若查詢成功則為正數
    ResultSet rs = this._rs;
    rows = this.Records(); // 如果先前的SQL查詢命令成功，則 Records()應為正數
    if (rows > 0)
    {
      // 配置足夠的記憶題空間給 _sData 變數
      this._sData = null;
      int cols = this.Fields();
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

  // 分頁 -----------------------------------------------------------------------
  private int getPages()
  {
    int pages = -1;
    if (this._rs != null)
    {
      int recs = this.Records();
      int recs_per_page = this._nRecsPerPage;
      this._nPages = (recs / recs_per_page);
      // 如果 "總資料筆數" 不是恰好為 "每頁資料數" 的整數倍則 "頁數" 加1
      this._nPages += ((recs % recs_per_page) != 0) ? 1 : 0;
      pages = this._nPages;
      this._nRecsInLastPage = (recs % recs_per_page);  // 最後一頁的資料筆數
    }
    return pages;
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
}