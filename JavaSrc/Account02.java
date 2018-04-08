import Role;
import JdbcConn07;

public class Account02 extends JdbcConn07
{
  // Variable
  private String _sIniFile = null;
  private String _sUserName = null;
  private String _sPassword = null;
  private String _sQuestion = null;
  private String _sAnswer = null;
  private int _iRoleCode = -1;

  // Constructor
  public Account02() {}

  // Method
  public String getUserName() { return this._sUserName; } // 取出使用者名稱
  public String getPassword() { return this._sPassword; } // 取出密碼
  public int getRoleCode() { return this._iRoleCode; } // 取出群組號碼
  public String getQuestion() { return this._sQuestion; } // 取出問題
  public String getAnswer() { return this._sAnswer; }     // 取出答案

  // 取出群組名稱 ---------------------------------------------------------------
  public String getRoleName()
  {
    String role_name = "Not Found...";
    Role r01 = new Role(this._sIniFile);
    r01.OpenConnection();
    role_name = r01.getRoleName(this._iRoleCode);
    r01.CloseConnection();
    return role_name;
  }

  // 開啟連線 -------------------------------------------------------------------
  public void OpenConnection(String ini_file)
  {
    this._sIniFile = ini_file;
    this.MakingConnection(ini_file, "Account");
  }

  public void OpenConnection(String ini_file, String conf_name)
  {
    this._sIniFile = ini_file;
    this.MakingConnection(ini_file, conf_name);
  }

  // 新增帳號 -------------------------------------------------------------------
  public int NewAccount(String name, String pswd, String ques, String ans)
  {
    int rows = -1, rolecode = 99;
    String sqlstr = "INSERT INTO Account(UserName, Password, RoleCode, "
                  + "Question, Answer) Values('"
                  + name + "','"
                  + pswd + "', "
                  + rolecode + ",'"
                  + ques + "','"
                  + ans + "')";
    rows = ExecuteUpdate(sqlstr);
    return rows;
  }

  // 刪除帳號 -------------------------------------------------------------------
  public int DeleteAccount(String name)
  {
    int rows = -1;
    String sqlstr = "DELETE FROM Account WHERE UserName='"
                  + name + "'";
    rows = ExecuteUpdate(sqlstr);
    return rows;
  }

  // 查詢帳號所有資料 ------------------------------------------------------------
  public int Query(String name)
  {
    int rows = -1;
    this._sUserName = name;
    String sqlstr = "SELECT Password, RoleCode, Question, Answer FROM Account"
                  + " WHERE UserName='" + name + "'";
    rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      String[] data = this.getRowData(0);
      this._sPassword = data[0];
      try {
        this._iRoleCode = Integer.parseInt(data[1]);
      }
      catch(Exception e)
      {
        this._iRoleCode = -1;
      }
      this._sQuestion = data[2];
      this._sAnswer = data[3];
    }
    return rows;
  }

  // 修改密碼 -------------------------------------------------------------------
  // 回傳 -1 表示帳號不存在, 回傳 0 表示密碼錯誤, 回傳 1 表示成功
  public int UpdatePassword(String name, String old_pswd, String new_pswd)
  {
    int result = CheckPassword(name, old_pswd);
    if (result == 1)
    {
      String sqlstr = "UPDATE Account SET Password='" + new_pswd
                    + "' WHERE UserName='" + name + "'";
      result = this.ExecuteUpdate(sqlstr);
    }
    return result;
  }

  // 更改群組 -------------------------------------------------------------------
  public int UpdateRole(String name, int rolecode)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET RoleCode=" + rolecode
                  + " WHERE UserName='" + name + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 修改問題及答案 --------------------------------------------------------------
  public int UpdateQuestion(String name, String ques, String ans)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET Question='" + ques
                  + "', Answer='" + ans
                  + "' WHERE UserName='" + name + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 密碼檢查 -------------------------------------------------------------------
  public int CheckPassword(String name, String passwd)
  {
    int result = -1;
    int rows = this.Query(name);
    if (rows == 0)
      result = -1;
    else if(rows > 0)
    {
      if (this._sPassword.equals(passwd))
        result = 1;
      else
        result = 0;
    }
    return result;
  }
}