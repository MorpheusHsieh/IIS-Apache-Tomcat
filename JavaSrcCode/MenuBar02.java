import MenuUnit;
import JdbcConn06;

public class MenuBar02 extends JdbcConn06
{
  // Variable ------------------------------------------------------------------
  private MenuItem[] _MainItem = null;
  private MenuUnit[] _MainMenu = null;
  private MenuUnit[][] _SubMenu = null;

  private String _IniFile = "";
  private String _sSQLstr = "";
  // Constructor ---------------------------------------------------------------
  public MenuBar02(String ini_file)
  {
    this._IniFile = ini_file;
    this._sSQLstr = "SELECT MenuText, URL, Redirect FROM MenuBar WHERE";
  }
  public MenuBar02(String ini_file, int rolecode)
  {
    this._IniFile = ini_file;
    this._sSQLstr = "SELECT MenuText, URL, Redirect FROM RoleAuthorize"
                  + " WHERE RoleCode=" + rolecode + " AND";
  }

  // Method --------------------------------------------------------------------
  //���X�D��檺�ﶵ -------------------------------------------------------------
  public MenuItem[] getMainMenuItem()
  {
    String ini_file = this._IniFile;
    this.MakingConnection(ini_file);
    this._MainItem = this.getMenuBarItemInfomation();
    this.CloseConnection();
    return this._MainItem;
  }

  // ���X�D��� -----------------------------------------------------------------
  public MenuUnit[] getMainMenu()
  {
    String ini_file = this._IniFile;
    this.MakingConnection(ini_file);
    this._MainMenu = this.getMainMenuInfomation();
    this.CloseConnection();
    return this._MainMenu;
  }

  public void setSQLCommand(String sqlstr) { this._sSQLstr = sqlstr; }

  // ���X�Ĥ@�h�l�ؿ� ------------------------------------------------------------
  public MenuUnit[] getSubMenu(MenuUnit[] main_mnu, int layer)
  {
    String ini_file = this._IniFile;
    this.MakingConnection(ini_file);
    int sub_mnu_size = this.getSubMenuInfomation(main_mnu, layer);
    this.CloseConnection();

    int sub_mnu_cnt = 0;
    MenuUnit[] sub_mnu = null;
    sub_mnu = new MenuUnit[sub_mnu_size];
    int cols = main_mnu.length;
    for (int i=0; i<cols; i++)
    {
      MenuItem[] mi = main_mnu[i].getMenuItems();
      int rows = mi.length;
      for (int j=0; j<rows; j++)
      {
        if (this._SubMenu[i][j] != null)
          sub_mnu[sub_mnu_cnt++] = this._SubMenu[i][j];
      }
    }
    return sub_mnu;
  }

  // �N�D��檺�ﶵ�s�J this._MainItem �O���餤 ------------------------------------
  private MenuItem[] getMenuBarItemInfomation()
  {
    MenuItem[] mi = null;
    String sqlstr = this._sSQLstr + " Parent='' ORDER BY AutoNum";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      mi = new MenuItem[rows]; // �t�m�O���鵹�D���
      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        mi[i] = new MenuItem(data[0]);
        mi[i].setURL(data[1]);
        boolean result = (data[2].equals("0") ? false : true);
        mi[i].setRedirect(result);
      }
    }
    else
    {
      mi = new MenuItem[1];
      mi[0] = new MenuItem(Integer.toString(rows));
    }
    return mi;
  }

  // �N�D���s�J this._MainMenu �O���餤 -----------------------------------------
  private MenuUnit[] getMainMenuInfomation()
  {
    MenuUnit[] main_unt = null;
    MenuItem[] main_itm = this._MainItem;  // ��M�@���D�ﶵ
    int mnu_itm_col = main_itm.length;
    main_unt = new MenuUnit[mnu_itm_col];  // �t�m�������O����s��D���

    // �q��Ʈw�����X�D��檺�ﶵ
    for (int i=0; i<mnu_itm_col; i++)
    {
      String name = main_itm[i].getName();
      String sqlstr = this._sSQLstr+" Parent='"+name+"' ORDER BY AutoNum";
      int rows = this.ExecuteQuery(sqlstr);
      if (rows > 0)
      {
        MenuItem[] mi = new MenuItem[rows];//�w��C�ӥD��檺�ﶵ�Ӽưt�m�������O����
        for (int j=0; j<rows; j++)
        {
          String[] data = this.getRowData(j);
          mi[j] = new MenuItem(data[0]);
          mi[j].setURL(data[1]);
          boolean result = (data[2].equals("0") ? false : true);
          mi[j].setRedirect(result);
        }
        main_unt[i] = new MenuUnit(mi, 0, 0, i);
      }
    }
    return main_unt;
  }

  // ���X�l��檺��T ------------------------------------------------------------
  private int getSubMenuInfomation(MenuUnit[] parent, int layer)
  {
    int sub_mnu_cnt = 0, rows_sub = 0;

    // �̾ڤ���檺�Ӽưt�m�Ĥ@���O����
    int parent_mnu_cnt = parent.length;
    this._SubMenu = new MenuUnit[parent_mnu_cnt][];
    //System.out.println("Main Menu Count: " + parent_mnu_cnt);

    for (int i=0; i<parent_mnu_cnt; i++)
    {
      MenuItem[] parent_itms = parent[i].getMenuItems();
      int parent_itm_cnt = parent_itms.length; // ���o����椤�C�ӿﶵ���Ӽ�
      // System.out.println("["+i+"] item num: " + parent_itm_cnt);

      int parent_col = parent[i].getCol();
      rows_sub = (parent_col > 0) ? 0 : rows_sub;
      //int parent_row = parent[i].getRow();

      // �̾ڤ���檺�ﶵ�Ӽưt�m�l���һݪ��O����
      this._SubMenu[i] = new MenuUnit[parent_itm_cnt];
      for (int j=0; j<parent_itm_cnt; j++)
      {
        // �}�l�̾ڤ���椤���C�ӿﶵ�j�M��Ʈw
        String name = parent_itms[j].getName();
        //System.out.println("Items Name: " + name);

        String sqlstr = this._sSQLstr + " Parent='" + name + "' ORDER BY AutoNum";
        int rows = this.ExecuteQuery(sqlstr);
        if (rows > 0)
        {
          sub_mnu_cnt++;
          //System.out.println("["+sub_mnu_cnt+"] - Name: " + name);
          MenuItem[] mi = new MenuItem[rows]; // �w��C�Ӥl��檺�ﶵ�Ӽưt�m�������O����
          for (int k=0; k<rows; k++)
          {
            String[] data = this.getRowData(k);
            mi[k] = new MenuItem(data[0]);
            mi[k].setURL(data[1]);
            boolean result = (data[2].equals("0") ? false : true);
            mi[k].setRedirect(result);
          }
          this._SubMenu[i][j] = new MenuUnit(mi, layer, rows_sub+j, parent_col);
        }
      }
      rows_sub = (parent_col == 0) ? (rows_sub + parent_itms.length) : 0;
    }
    return sub_mnu_cnt;
  }
}