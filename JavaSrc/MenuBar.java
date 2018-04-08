import JdbcConn06;

public class MenuBar extends JdbcConn06
{
  // Variable
  String[] _sMainMenu = null;
  String[][] _sSubMenu = null;
  String[][] _sSubMenuURL = null;

  // Constructor
  public MenuBar(String ini_file)
  {
    this.MakingConnection(ini_file);
    this.getAllMenuText();
    this.CloseConnection();
  }

  // Method
  // ���o�D��檺��r ------------------------------------------------------------
  public String[] getMainMenuText() { return this._sMainMenu; }

  // ���o�ƿ�檺��r ------------------------------------------------------------
  public String[] getSubMenuText(String main_text)
  {
    String[] submenu = null;

    // ���X [main_text] �O�b�D��檺�ĴX�Ӧ�m�A�H�K�o���ƿ�檺�ƥ�
    int mainmenu_num = -1, submenu_len = -1;
    int mainmenu_len = this._sMainMenu.length;
    //System.out.println("MainText: " + main_text);
    //System.out.println("MainMenu Length: " +mainmenu_len);
    for (int i=0; i<mainmenu_len; i++)
    {
      String maintext = this._sMainMenu[i];
      if (maintext.equals(main_text))
      {
        mainmenu_num = i;
        submenu_len = this._sSubMenu[i].length;
        break;
      }
    }
    //System.out.println("MainText Num: " + mainmenu_num);
    //System.out.println("SubMenu Len: " + submenu_len);

    // �ƿ�檺�ƥت��D��A���X�ƿ�檺���
    if (submenu_len != -1)
    {
      submenu = new String[submenu_len];
      for (int i=0; i<submenu_len; i++)
        submenu[i] = this._sSubMenu[mainmenu_num][i];
    }
    else
    {
      submenu = new String[1];
      submenu[0] = "-1";
    }
    return submenu;
  }

  // ���o�ƿ�檺�W�s�� ------------------------------------------------------------
  public String[] getSubMenuURL(String main_text)
  {
    String[] submenu = null;

    // ���X [main_text] �O�b�D��檺�ĴX�Ӧ�m�A�H�K�o���ƿ�檺�ƥ�
    int mainmenu_num = -1, submenu_len = -1;
    int mainmenu_len = this._sMainMenu.length;
    for (int i=0; i<mainmenu_len; i++)
    {
      String maintext = this._sMainMenu[i];
      if (maintext.equals(main_text))
      {
        mainmenu_num = i;
        submenu_len = this._sSubMenu[i].length;
        break;
      }
    }

    // �ƿ�檺�ƥت��D��A���X�ƿ�檺���
    if (submenu_len != -1)
    {
      submenu = new String[submenu_len];
      for (int i=0; i<submenu_len; i++)
        submenu[i] = this._sSubMenuURL[mainmenu_num][i];
    }
    else
    {
      submenu = new String[1];
      submenu[0] = "-1";
    }
    return submenu;
  }

  // �q��Ʈw�����o�Ҧ�����r ----------------------------------------------------
  private void getAllMenuText()
  {
    _sMainMenu = null;
    // ���X�D��檺��r
    String sqlstr = "SELECT MenuText FROM MenuBar WHERE Parent=''"
                  + " ORDER BY AutoNum";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      this._sMainMenu = null;
      this._sMainMenu = new String[rows]; // �t�m�������O����Ŷ����D���
      this._sSubMenu = null;
      this._sSubMenu = new String[rows][]; // �t�m�������O����Ŷ����ƿ��
      this._sSubMenuURL = null;
      this._sSubMenuURL = new String[rows][]; // �t�m�������O����Ŷ����ƿ��

      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        this._sMainMenu[i] = data[0];
      }
    }

    // ���X�Ĥ@�h�ƿ�檺��r
    int main_rows = this._sMainMenu.length;
    for (int row=0; row<main_rows; row++)
    {
      sqlstr = "SELECT MenuText, URL FROM MenuBar WHERE Parent='"
             + this._sMainMenu[row] + "' ORDER BY AutoNum";
      int sub_rows = this.ExecuteQuery(sqlstr);
      this._sSubMenu[row] = new String[sub_rows];
      this._sSubMenuURL[row] = new String[sub_rows];
      //System.out.println("Sub: " + this._sSubMenu[row].length);
      for (int i=0; i<sub_rows; i++)
      {
        String[] data = this.getRowData(i);
        this._sSubMenu[row][i] = data[0];
        this._sSubMenuURL[row][i] = data[1];
      }
    }
  }
}