import JdbcConn06;

public class RoleAuthorize extends JdbcConn06
{
  // variable
  String _sIniFile = null;
  String[] _sRoleName = null;

  // Constructor
  public RoleAuthorize(String ini_file) { this._sIniFile = ini_file; }

  // Method
  // 連線 ----------------------------------------------------------------------
  public void OpenConnection()
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file);
  }

  // 新增群組所能瀏覽的一個系統 ----------------------------------------------------
  public int AddMenuItem(int role_code, String items)
  {
    int result = -1;
    String sqlstr = "SELECT MenuText, Parent, URL, Redirect FROM MenuBar"
                  + " WHERE MenuText='" + items + "'";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows == 1)
    {
      String[] data = this.getRowData(0);
      sqlstr = "INSERT INTO RoleAuthorize(RoleCode, MenuText, Parent, "
             + "URL, Redirect) Values("
             + role_code + ", '"
             + items + "', '"
             + data[1] + "', '"
             + data[2] + "', '"
             + data[3] + "')";
      result = ExecuteUpdate(sqlstr);
    }
    return result;
  }

  // 查詢群組所能瀏覽的系統 -------------------------------------------------------
  public String[] getMenuItem(int role_code)
  {
    String[] mi = null;
    String sqlstr = "SELECT MenuText FROM RoleAuthorize "
                  + "WHERE RoleCode=" + role_code;
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      mi = new String[rows];
      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        mi[i] = data[0];
      }
    }
    else
    {
      mi = new String[1]; mi[0] = null;
    }
    return mi;
  }

  // 刪除群組 -------------------------------------------------------------------
  public int DeleteMenuItem(int role_code)
  {
    int result = -1;
    String sqlstr = "DELETE FROM RoleAuthorize WHERE RoleCode="
                  + role_code;
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }
}