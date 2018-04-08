import JdbcConn07;

public class Role extends JdbcConn07
{
  // Variable
  String _sIniFile = null;

  // Constructor
  public Role(String ini_file) { this._sIniFile = ini_file; }

  // 連線 ----------------------------------------------------------------------
  public void OpenConnection()
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, "Role");
  }

  // 取出所有群組名字 ------------------------------------------------------------
  public String getRoleName(int role_cdoe)
  {
    String role_name = "Not Found...";
    String sqlstr = "SELECT RoleName FROM Role WHERE RoleCode=" + role_cdoe;
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      String[] data = this.getRowData(0);
      role_name = data[0];
    }
    return role_name;
  }

  public String[][] getAllRoles()
  {
    String[][] roles = null;
    String sqlstr = "SELECT RoleCode, RoleName FROM Role ORDER BY RoleCode";
    int rows = -1;
    rows = this.ExecuteQuery(sqlstr);
    switch(rows)
    {
      case -1:
      case 0:
        roles = new String[1][1];
        roles[0][0] = Integer.toString(rows);
        break;
      default:
        roles = new String[rows][2];
        for (int row=0; row<rows; row++)
        {
          String[] data = this.getRowData(row);
          roles[row][0] = data[0];
          roles[row][1] = data[1];
        }
    }
    return roles;
  }

  // 新增群組 -------------------------------------------------------------------
  public int NewRole(int role_code, String role_name)
  {
    int result = -1;
    String sqlstr = "INSERT INTO Role(RoleCode, RoleName) Values("
                  + role_code + ", '"
                  + role_name +"')";
    result = ExecuteUpdate(sqlstr);
    return result;
  }

  // 刪除群組 -------------------------------------------------------------------
  public int DeleteRole(int role_code)
  {
    int result = -1;
    String sqlstr = "delete from Role where RoleCode=" + role_code;
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }
}