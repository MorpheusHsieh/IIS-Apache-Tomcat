import java.sql.*;
import MenuUnit03;
import JdbcConn07;

public class MenuBar03 extends JdbcConn07
{
  // Variable ------------------------------------------------------------------
  private String _sSQLstr = null;
  private String _sIniFile = null;
  private MenuUnit03[][] _Unit = null; // �Ĥ@���O��檺�h��, �ĤG���O�Ӽh�����ƶq
  private int _iMaxLayer = -1;         // �̤j���h��
  private int[] _iLayers = null;
  private String[] _MainItms = null;

  // �����ܼ�
  private String[] _Title = null;                    // ��檺���D
  private String[] _Parent = null;                   // �W�@�h���
  private String[] _URL = null;                      // ��}��}
  private boolean[] _NewFrame = null;                // �O�_��s����

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
    this._iMaxLayer = this.getMaxLayers(); // �D��欰�� 0 �h
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

  // �}�ҳs�u�{�� ---------------------------------------------------------------
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

  // �q��ƪ����X�ݭn����T, �x�s�b�O���餤�H��ָ�Ʈw�s�u������ --------------------
  public void ReadItemInfomationFromTable()
  {
    // �����X�Ҧ�����椸��, �H�p�ⶥ��
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

  // �p���ƪ����ﶵ�i�H�����X�h���椸 -----------------------------------------
  private int getMaxLayers()
  {
    int max_layers = -1, main_itms_num = 0;
    // ����X�D��榳�X��, �t�m�O���鵹�D���, �ñN���D�s�J�O����
    for (int i=0; i<this._Title.length; i++)
      main_itms_num += (this._Parent[i].equals("") ? 1 : 0);

    this._MainItms = new String[main_itms_num];
    for (int i=0; i<this._MainItms.length; i++) // ���ﶵ�� "" (�ťզr��) �ɬ��ڥؿ�
    {
      if (this._Parent[i].equals(""))
        this._MainItms[i] = this._Title[i];
    }

    // �̾ڥD��檺�ƶq, �p���U���h�֭Ӥl���
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

  // �H�ﶵ�W�٬��޼Ʒj�M�O���餤���s�� ---------------------------------------------
  private String[] getSubItems(String[] parent_title)
  {
    String sub_itms[] = null;
    if (this._Title != null)
    {
      // ���p��@���h�֭Ӽ��D�W�ٲŦX���ﶵ
      int match_num = 0;
      int total_itms_len = this._Parent.length;
      for (int i=0; i<parent_title.length; i++)
      {
        for (int j=0; j<total_itms_len; j++)
          match_num += (parent_title[i].equals(this.Parent(j)) ? 1 : 0);
      }
      if (match_num >0) sub_itms = new String[match_num];

      // �N���D�۲Ū����ب��X
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

  // ���إߥD���椸 ------------------------------------------------------------
  private MenuUnit03[] CreateMainMenuUnit()
  {
    MenuUnit03[] mu = null;

    // �H�D��檺�W�١A�t�m���椸�һݰO����üg�J
    int mu_num = this._MainItms.length;
    mu = new MenuUnit03[mu_num];                    // �t�m�������O���鵹�D���椸
    for (int i=0; i<mu.length; i++)
    {
      mu[i] = new MenuUnit03(this._MainItms[i]);
      mu[i].setLayer(0);  // �� 0 �h��ܬ��D���
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
      mu[i].setMenuItems(mi, 0, i); // �D��檺�C�T�w�� 0
    }
    return mu;
  }

  // ���إߥD���椸 ------------------------------------------------------------
  private MenuUnit03[] CreateSubMenu(MenuUnit03[] parent, int layer)
  {
    MenuUnit03[] sub_mnu = null;
    int rows_sub = 0;

    // ���p�⦹�����U���h�֭Ӥl���
    int sub_num = this.CalculateSubMenuNum(parent);
    //System.out.println("Sub Menu Count: " + sub_num);
    sub_mnu = new MenuUnit03[sub_num];

    // ���X�l�ﶵ�H�غc���
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
            sub_mnu[submnu_cnt].setLayer(layer);  // �� 0 �h��ܬ��D���
            int col = parent[i].getCol();

            // �j�M�l�ﶵ���h�֭�
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

  // �ھڤ��椸�޼ơA�p�⦳�h�֭Ӥl���
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
