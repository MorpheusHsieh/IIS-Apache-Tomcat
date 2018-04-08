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
  public String getUserName() { return this._sUserName; } // ���X�ϥΪ̦W��
  public String getPassword() { return this._sPassword; } // ���X�K�X
  public int getRoleCode() { return this._iRoleCode; } // ���X�s�ո��X
  public String getQuestion() { return this._sQuestion; } // ���X���D
  public String getAnswer() { return this._sAnswer; }     // ���X����

  // ���X�s�զW�� ---------------------------------------------------------------
  public String getRoleName()
  {
    String role_name = "Not Found...";
    Role r01 = new Role(this._sIniFile);
    r01.OpenConnection();
    role_name = r01.getRoleName(this._iRoleCode);
    r01.CloseConnection();
    return role_name;
  }

  // �}�ҳs�u -------------------------------------------------------------------
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

  // �s�W�b�� -------------------------------------------------------------------
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

  // �R���b�� -------------------------------------------------------------------
  public int DeleteAccount(String name)
  {
    int rows = -1;
    String sqlstr = "DELETE FROM Account WHERE UserName='"
                  + name + "'";
    rows = ExecuteUpdate(sqlstr);
    return rows;
  }

  // �d�߱b���Ҧ���� ------------------------------------------------------------
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

  // �ק�K�X -------------------------------------------------------------------
  // �^�� -1 ��ܱb�����s�b, �^�� 0 ��ܱK�X���~, �^�� 1 ��ܦ��\
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

  // ���s�� -------------------------------------------------------------------
  public int UpdateRole(String name, int rolecode)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET RoleCode=" + rolecode
                  + " WHERE UserName='" + name + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �ק���D�ε��� --------------------------------------------------------------
  public int UpdateQuestion(String name, String ques, String ans)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET Question='" + ques
                  + "', Answer='" + ans
                  + "' WHERE UserName='" + name + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �K�X�ˬd -------------------------------------------------------------------
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