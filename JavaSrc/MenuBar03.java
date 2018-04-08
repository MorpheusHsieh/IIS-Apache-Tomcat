import java.sql.*;
import MenuUnit03;
import JdbcConn07;

public class MenuBar03 extends JdbcConn07
{
  // Variable ------------------------------------------------------------------
  private String _sSQLstr = null;
  private String _sIniFile = null;
  private MenuUnit03[][] _Unit = null; // 第一維是選單的層數, 第二維是該層的選單數量
  private int _iMaxLayer = -1;         // 最大的層數
  private int[] _iLayers = null;
  private String[] _MainItms = null;

  // 內部變數
  private String[] _Title = null;                    // 選單的標題
  private String[] _Parent = null;                   // 上一層選單
  private String[] _URL = null;                      // 轉址位址
  private boolean[] _NewFrame = null;                // 是否更新頁面

  /****************************************************************************
   * Constructor                                                              *
   ****************************************************************************/
  public MenuBar03(String ini_file)
  {
    this._sIniFile = ini_file;
    this._sSQLstr = "SELECT MenuText,Parent,URL,NewFrame FROM MenuItem ";
    this.Initiation();
  }

  public MenuBar03(String ini_file, int rolecode)
  {
    this._sIniFile = ini_file;
    this._sSQLstr = "SELECT MenuText,URLParent,,Redirect FROM RoleAuthorize"
                  + " WHERE RoleCode=" + rolecode + " AND ";
    this.Initiation();
  }

  private void Initiation()
  {
    this.ReadItemInfomationFromTable();
    this._iMaxLayer = this.getMaxLayers(); // 主選單為第 0 層
    int layers = this._iMaxLayer;
    this._Unit = new MenuUnit03[layers][];
    this._Unit[0] = this.CreateMainMenuUnit();

    MenuUnit03[] mu = this.getMainMenu();
    for (int i=1; i<this.Layers(); i++)
    {
      this._Unit[i] = this.CreateSubMenu(mu, i);
      mu = this._Unit[i];
    }
  }
  // Method --------------------------------------------------------------------
  public String Title(int idx) { return this._Title[idx]; }
  public String Parent(int idx) { return this._Parent[idx]; }
  public String URL(int idx) { return this._URL[idx]; }
  public boolean NewFrame(int idx) { return this._NewFrame[idx]; }
  public int Layers() { return this._iMaxLayer; }
  public MenuUnit03[] getMainMenu() { return this._Unit[0]; }
  public MenuUnit03[] getSubMenu(int idx) { return this._Unit[idx]; }

  // 開啟連線程式 ---------------------------------------------------------------
  public void OpenConnection()
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, "MenuBar");
  }

  public void OpenConnection(String conf_name)
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, conf_name);
  }

  // 從資料表中取出需要的資訊, 儲存在記憶體中以減少資料庫連線的次數 --------------------
  public void ReadItemInfomationFromTable()
  {
    // 先取出所有的選單元素, 以計算階度
    this.OpenConnection();
    String sqlstr = this._sSQLstr + "ORDER BY AutoNum";
    int rows = this.ExecuteQuery(sqlstr);
    this.CloseConnection();
    if (rows > 0)
    {
      this._Title = new String[rows];
      this._Parent = new String[rows];
      this._URL = new String[rows];
      this._NewFrame = new boolean[rows];
      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        this._Title[i] = data[0];
        this._Parent[i] = data[1];
        this._URL[i] = data[2];
        this._NewFrame[i] = (data[3].equals("0") ? false : true);
      }
    }
  }

  // 計算資料表中的選項可以分成幾層選單單元 -----------------------------------------
  private int getMaxLayers()
  {
    int max_layers = -1, main_itms_num = 0;
    // 先找出主選單有幾個, 配置記憶體給主選單, 並將標題存入記憶體
    for (int i=0; i<this._Title.length; i++)
      main_itms_num += (this._Parent[i].equals("") ? 1 : 0);

    this._MainItms = new String[main_itms_num];
    for (int i=0; i<this._MainItms.length; i++) // 父選項為 "" (空白字串) 時為根目錄
    {
      if (this._Parent[i].equals(""))
        this._MainItms[i] = this._Title[i];
    }

    // 依據主選單的數量, 計算其各有多少個子選單
    String[] sub_itms = null;
    String[] parent_itms = this._MainItms;
    int layers = 0;
    do {
      sub_itms = this.getSubItems(parent_itms);
      layers += (sub_itms != null) ? 1 : 0;
      parent_itms = sub_itms;
    } while(sub_itms != null);
    max_layers = (layers>max_layers) ? layers : max_layers;
    return max_layers;
  }

  // 以選項名稱為引數搜尋記憶體中的編號 ---------------------------------------------
  private String[] getSubItems(String[] parent_title)
  {
    String sub_itms[] = null;
    if (this._Title != null)
    {
      // 先計算共有多少個標題名稱符合的選項
      int match_num = 0;
      int total_itms_len = this._Parent.length;
      for (int i=0; i<parent_title.length; i++)
      {
        for (int j=0; j<total_itms_len; j++)
          match_num += (parent_title[i].equals(this.Parent(j)) ? 1 : 0);
      }
      if (match_num >0) sub_itms = new String[match_num];

      // 將標題相符的項目取出
      int cnt = 0;
      for (int i=0; i<parent_title.length; i++)
      {
        for (int j=0; j<total_itms_len; j++)
        {
          if (parent_title[i].equals(this.Parent(j)))
            sub_itms[cnt++] = this.Title(j);
        }
      }
    }
    return sub_itms;
  }

  // 先建立主選單單元 ------------------------------------------------------------
  private MenuUnit03[] CreateMainMenuUnit()
  {
    MenuUnit03[] mu = null;

    // 以主選單的名稱，配置選單單元所需記憶體並寫入
    int mu_num = this._MainItms.length;
    mu = new MenuUnit03[mu_num];                    // 配置足夠的記憶體給主選單單元
    for (int i=0; i<mu.length; i++)
    {
      mu[i] = new MenuUnit03(this._MainItms[i]);
      mu[i].setLayer(0);  // 第 0 層表示為主選單
      String name = mu[i].getName();

      int itms_cnt = 0;
      for (int j=0; j<this._Parent.length; j++)
        itms_cnt += (this._Parent[j].equals(name) ? 1 : 0);

      MenuItem03[] mi = new MenuItem03[itms_cnt];
      int cnt =0;
      for (int j=0; j<this._Parent.length; j++)
      {
        if (this._Parent[j].equals(name))
        {
          mi[cnt] = new MenuItem03(this.Title(j));
          mi[cnt].setParent(this.Parent(j));
          mi[cnt].setURL(this.URL(j));
          mi[cnt].setNewFrame(this.NewFrame(j));
          cnt++;
        }
      }
      mu[i].setMenuItems(mi, 0, i); // 主選單的列固定為 0
    }
    return mu;
  }

  // 先建立主選單單元 ------------------------------------------------------------
  private MenuUnit03[] CreateSubMenu(MenuUnit03[] parent, int layer)
  {
    MenuUnit03[] sub_mnu = null;
    int rows_sub = 0;

    // 先計算此父選單下有多少個子選單
    int sub_num = this.CalculateSubMenuNum(parent);
    //System.out.println("Sub Menu Count: " + sub_num);
    sub_mnu = new MenuUnit03[sub_num];

    // 取出子選項以建構選單
    int submnu_cnt = 0;
    for (int i=0; i<parent.length; i++)
    {
      int row_p = parent[i].getRow();
      MenuItem03[] parent_mi = parent[i].getMenuItems();
      for (int j=0; j<parent_mi.length; j++)
      {
        String sub_name = parent_mi[j].getName();
        for (int k=0; k<this._Parent.length; k++)
        {
          if (this.Parent(k).equals(sub_name))
          {
            sub_mnu[submnu_cnt] = new MenuUnit03(sub_name);
            sub_mnu[submnu_cnt].setLayer(layer);  // 第 0 層表示為主選單
            int col = parent[i].getCol();

            // 搜尋子選項有多少個
            int sub_itm_num = 0;
            for (int l=0; l<this._Parent.length; l++)
              if (this.Parent(l).equals(sub_name)) sub_itm_num++;

            int sub_mi_cnt = 0;
            MenuItem03[] sub_mi = new MenuItem03[sub_itm_num];
            for (int l=0; l<this._Parent.length; l++)
            {
              if (this.Parent(l).equals(sub_name))
              {
                sub_mi[sub_mi_cnt] = new MenuItem03(this.Title(l));
                sub_mi[sub_mi_cnt].setParent(this.Parent(l));
                sub_mi[sub_mi_cnt].setURL(this.URL(l));
                sub_mi[sub_mi_cnt].setNewFrame(this.NewFrame(l));
                sub_mi_cnt++;
              }
            }
            sub_mnu[submnu_cnt].setMenuItems(sub_mi, row_p+j, col);
            submnu_cnt++;
            break;
          }
        }
      }
    }
    return sub_mnu;
  }

  // 根據父單元引數，計算有多少個子選單
  private int CalculateSubMenuNum(MenuUnit03[] parent)
  {
    int submnu_cnt = 0;
    for (int i=0; i<parent.length; i++)
    {
      MenuItem03[] mi = parent[i].getMenuItems();
      for (int j=0; j<mi.length; j++)
      {
        String name = mi[j].getName();
        for (int k=0; k<this._Parent.length; k++)
        {
          if (this.Parent(k).equals(name))
          {
            submnu_cnt++;
            break;
          }
        }
      }
    }
    return submnu_cnt;
  }
}
