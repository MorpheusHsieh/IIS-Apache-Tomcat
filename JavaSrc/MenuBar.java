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
  // 取得主選單的文字 ------------------------------------------------------------
  public String[] getMainMenuText() { return this._sMainMenu; }

  // 取得副選單的文字 ------------------------------------------------------------
  public String[] getSubMenuText(String main_text)
  {
    String[] submenu = null;

    // 顯找出 [main_text] 是在主選單的第幾個位置，以便得知副選單的數目
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

    // 副選單的數目知道後，取出副選單的資料
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

  // 取得副選單的超連結 ------------------------------------------------------------
  public String[] getSubMenuURL(String main_text)
  {
    String[] submenu = null;

    // 顯找出 [main_text] 是在主選單的第幾個位置，以便得知副選單的數目
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

    // 副選單的數目知道後，取出副選單的資料
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

  // 從資料庫中取得所有選單文字 ----------------------------------------------------
  private void getAllMenuText()
  {
    _sMainMenu = null;
    // 取出主選單的文字
    String sqlstr = "SELECT MenuText FROM MenuBar WHERE Parent=''"
                  + " ORDER BY AutoNum";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      this._sMainMenu = null;
      this._sMainMenu = new String[rows]; // 配置足夠的記憶體空間給主選單
      this._sSubMenu = null;
      this._sSubMenu = new String[rows][]; // 配置足夠的記憶體空間給副選單
      this._sSubMenuURL = null;
      this._sSubMenuURL = new String[rows][]; // 配置足夠的記憶體空間給副選單

      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        this._sMainMenu[i] = data[0];
      }
    }

    // 取出第一層副選單的文字
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