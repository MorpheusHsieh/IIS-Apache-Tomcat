import java.sql.*;
import JdbcConn03;

public class Member03 extends JdbcConn03
{
  // 變數
  private String _File = null;        // ini 檔的位置

  // Table 欄位變數
  private String[] _WorkNo = null;    // 工作代號
  private String[] _NickName = null;  // 暱稱
  private String[] _Password = null;  // 密碼
  private int[] _RoleCode = null;     // 角色代號
  private boolean[] _Pass = null;     // 通過認帳與否

  // 建構子
  public Member03()
  {
    this._File = "c:\\Java\\Src\\Member03.ini";
    this.MakingConnection(this._File);
  }
  public Member03(String file)
  {
    this._File = file;
    // Connection
    this.MakingConnection(file);
  }

  // Method
  public String WorkNo(int idx) { return this._WorkNo[idx]; }
  public String NickName(int idx) { return this._NickName[idx]; }
  public String Password(int idx) { return this._Password[idx]; }
  public int RoleCode(int idx) { return this._RoleCode[idx]; }
  public boolean Pass(int idx) { return this._Pass[idx]; }

  // 新增一筆資料 ----------------------------------------------------------------
  public int InsertRow(String wk, String nn, String pw)
  {
    int rowAdded = this.InsertRecord(wk, nn, pw, 99, false);
    return rowAdded;
  }

  public int InsertRow(String wk, String nn, String pw, int rc)
  {
    int rowAdded = this.InsertRecord(wk, nn, pw, rc, false);
    return rowAdded;
  }

  public int InsertRow(String wk, String nn, String pw, int rc, boolean pass)
  {
    int rowAdded = this.InsertRecord(wk, nn, pw, rc, pass);
    return rowAdded;
  }

  public int InsertRecord(String wk, String nn, String pw, int rc, boolean pass)
  {
    String sqlstr = "INSERT INTO Account "
                  + " (WorkNo, NickName, Password, RoleCode, Pass)"
                  + " VALUES('" + wk + "','"
                  + nn + "','"
                  + pw + "', "
                  + rc + ", "
                  + pass + ")";
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 查詢一筆資料 ---------------------------------------------------------------
  public int DeleteRecord(String field_name, String data)
  {
    String sqlstr = "DELETE FROM Account WHERE "
                  + field_name + "='" + data + "'";
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 異動一筆資料 ----------------------------------------------------------------
  public int UpdateRecord(String search_field, String search_data,
                           String replace_field, String replace_data)
  {
    String sqlstr = "UPDATE Account SET "
                  + replace_field + "='" + replace_data + "' WHERE "
                  + search_field + "='" + search_data + "'";
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 查詢所有資料 ----------------------------------------------------------------
  public void QueryAll()
  {
    // executeQuery
    String sqlstr = "SELECT * FROM Account";
    this.ExecuteQuery(sqlstr);

    // getResultSet
    this.getResults();
  }

  // 存取資料集 -----------------------------------------------------------------
  private void getResults()
  {
    if (this._rs != null)
    {
      int rows = this.Records();
      if (rows != 0)
      {
        // 配置記憶體空間以便儲存變數
        _WorkNo = null; _WorkNo = new String[rows];      // 工作代號
        _NickName = null; _NickName =new String[rows];  // 暱稱
        _Password = null; _Password =new String[rows];  // 密碼
        _RoleCode = null; _RoleCode = new int[rows];     // 角色代號
        _Pass = new boolean[rows];     // 通過認帳與否

        try
        {
          this._rs.first();
          int row = 0;
          do {
            _WorkNo[row] = this._rs.getString(1);
            _NickName[row] = this._rs.getString(2);
            _Password[row] = this._rs.getString(3);
            _RoleCode[row] = this._rs.getInt(4);
            _Pass[row] = this._rs.getBoolean(5);
            row++;
          } while (this._rs.next());
        }
        catch(SQLException sqle)
        {
          System.err.println("Error in getResults: " + sqle);
        }
      }
    }
  }
}