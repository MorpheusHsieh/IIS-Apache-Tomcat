import MenuItem;
import SubMenu;

public class MenuBar01 extends JdbcConn06
{
  // variable ------------------------------------------------------------------
  private MenuItem[] _ZeroLayer = null;           // 彈出式選單第 0 層
  private MenuItem[][] _FirstLayer = null;        // 彈出式選單第 1 層
  private MenuItem[][][] _SecondLayer = null;     // 彈出式選單第 2 層
  private MenuItem[][][][] _ThirdLayer = null;    // 彈出式選單第 3 層
  //private MenuItem[][][][][] _FourthLayer = null; // 彈出式選單第 4 層

  private String _sSQLstr = "SELECT MenuText, URL, Redirect FROM MenuBar01";

  // Constructor ---------------------------------------------------------------
  public MenuBar01(String ini_file)
  {
    this.MakingConnection(ini_file);
    this.getAllMenuText();
    this.CloseConnection();
  }

  // Method
  // 取出第零層元素 --------------------------------------------------------------
  public MenuItem[] getZeroLayerItem() { return this._ZeroLayer; }

  // 取出第一層元素 --------------------------------------------------------------
  public MenuItem[][] getFirstLayerItem() { return this._FirstLayer; }

  // 取出第二層元素 --------------------------------------------------------------
  public MenuItem[][][] getSecondLayerItem() { return this._SecondLayer; }

  // 取出第三層元素 --------------------------------------------------------------
  public MenuItem[][][][] getThirdLayerItem() { return this._ThirdLayer; }

  // 取出所有的選單資訊  ----------------------------------------------------------
  private void getAllMenuText()
  {
    this.getZeroLayerInfomation();
    this.getFirstLayerInfomation();
    this.getSecondLayerInfomation();
    this.getThirdLayerInfomation();
  }

  // 取出第 0 層選單 -------------------------------------------------------------
  private void getZeroLayerInfomation()
  {
    String sqlstr = _sSQLstr + " WHERE Parent='' ORDER BY AutoNum";
    int rows = this.ExecuteQuery(sqlstr);
    //System.out.println("Rows: " + rows);
    if (rows > 0)
    {
      this._ZeroLayer = null; // 初始化第 0 層的資料
      this._ZeroLayer = new MenuItem[rows];
      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        this._ZeroLayer[i] = new MenuItem(data[0]);
        this._ZeroLayer[i].setURL(data[1]);
        boolean result = data[2].equals("0") ? false : true;
        this._ZeroLayer[i].setRedirect(result);
        //System.out.println("Name: " + this._ZeroLayer[i].getName());
        //System.out.println("Parent: " + this._ZeroLayer[i].getParent());
        //System.out.println("URL: " + this._ZeroLayer[i].getURL());
        //System.out.println("Redirect[" + i + "]: " + this._ZeroLayer[i].getRedirect());
      }
    }
    else
    {
      this._ZeroLayer = new MenuItem[1];
      this._ZeroLayer[0] = new MenuItem(null);
      this._ZeroLayer[0].setURL(null);
      this._ZeroLayer[0].setRedirect(false);
    }
  }

  // 取出第 1 層選單 -------------------------------------------------------------
  private void getFirstLayerInfomation()
  {
    int zero_layer_cnt = this._ZeroLayer.length;
    this._FirstLayer = null;
    this._FirstLayer = new MenuItem[zero_layer_cnt][];
    // System.out.println("Zero layer count is " + zero_layer_cnt);

    for (int i=0; i<zero_layer_cnt; i++)
    {
      String name = this._ZeroLayer[i].getName();
      String sqlstr = _sSQLstr + " WHERE Parent='" + name + "' ORDER BY AutoNum";
      int rows = this.ExecuteQuery(sqlstr);
      //System.out.println("Rows: " + rows);
      if (rows > 0)
      {
        this._FirstLayer[i] = new MenuItem[rows];
        for (int j=0; j<rows; j++)
        {
          String[] data = this.getRowData(j);
          this._FirstLayer[i][j] = new MenuItem(data[0]);
          this._FirstLayer[i][j].setURL(data[1]);
          boolean result = data[2].equals("0") ? false : true;
          this._FirstLayer[i][j].setRedirect(result);
        }
      }
      else
      {
        this._FirstLayer[i] = new MenuItem[1];
        this._FirstLayer[i][0] = new MenuItem(null);
        this._FirstLayer[i][0].setURL(null);
        this._FirstLayer[i][0].setRedirect(false);
      }
    }
  }

  // 取出第 2 層選單 -------------------------------------------------------------
  public void getSecondLayerInfomation()
  {
    int zero_layer_cnt = this._ZeroLayer.length;

    // 配置第二層的第一段記憶體
    this._SecondLayer = null;
    this._SecondLayer = new MenuItem[zero_layer_cnt][][];

    // 配置第二層的第二段記憶體
    for(int i=0; i<zero_layer_cnt; i++)
    {
      int first_layer_cnt = this._FirstLayer[i].length;
      this._SecondLayer[i] = new MenuItem[first_layer_cnt][];
    }

    // 以第一層的元件來作為 SQL 查詢命令的依據
    for (int i=0; i<zero_layer_cnt; i++)
    {
      int first_layer_cnt = this._FirstLayer[i].length;
      for (int j=0; j<first_layer_cnt; j++)
      {
        String name = this._FirstLayer[i][j].getName();
        String sqlstr = _sSQLstr + " WHERE Parent='"
                      + name + "' ORDER BY AutoNum";
        int rows = this.ExecuteQuery(sqlstr);
        if (rows > 0)
        {
          this._SecondLayer[i][j] = new MenuItem[rows];
          for (int k=0; k<rows; k++)
          {
            String[] data = this.getRowData(k);
            this._SecondLayer[i][j][k] = new MenuItem(data[0]);
            this._SecondLayer[i][j][k].setURL(data[1]);
            boolean result = data[2].equals("0") ? false : true;
            this._SecondLayer[i][j][k].setRedirect(result);
          }
        }
        else
        {
          this._SecondLayer[i][j] = new MenuItem[1];
          this._SecondLayer[i][j][0] = new MenuItem(null);
          this._SecondLayer[i][j][0].setURL(null);
          this._SecondLayer[i][j][0].setRedirect(false);
        }
     }
    }
  }

  // 取出第 3 層選單 -------------------------------------------------------------
  private void getThirdLayerInfomation()
  {
    int zero_layer_cnt = this._ZeroLayer.length;

    // 配置第三層的第一段記憶體
    this._ThirdLayer = null;
    this._ThirdLayer = new MenuItem[zero_layer_cnt][][][];

    // 配置第三層的第二段記憶體
    for(int i=0; i<zero_layer_cnt; i++)
    {
      int first_layer_cnt = this._FirstLayer[i].length;
      this._ThirdLayer[i] = new MenuItem[first_layer_cnt][][];
    }

    // 配置第三層的第三段記憶體
    for(int i=0; i<zero_layer_cnt; i++)
    {
      int first_layer_cnt = this._FirstLayer[i].length;
      for (int j=0; j<first_layer_cnt; j++)
      {
        int second_layer_cnt = this._SecondLayer[i][j].length;
        this._ThirdLayer[i][j] = new MenuItem[second_layer_cnt][];
      }
    }

    // 以第二層的元件來作為 SQL 查詢命令的依據
    for (int i=0; i<zero_layer_cnt; i++)
    {
      int first_layer_cnt = this._FirstLayer[i].length;
      for (int j=0; j<first_layer_cnt; j++)
      {
        int second_layer_cnt = this._SecondLayer[i][j].length;
        for (int k=0; k<second_layer_cnt; k++)
        {
          String name = this._SecondLayer[i][j][k].getName();
          //System.out.println("["+i+"]["+j+"]["+k+"]: " +  name);
          if (name == null)  // 如果第
          {
            this._ThirdLayer[i][j][k] = new MenuItem[1];
            this._ThirdLayer[i][j][k][0] = new MenuItem(null);
            this._ThirdLayer[i][j][k][0].setURL(null);
            this._ThirdLayer[i][j][k][0].setRedirect(false);
          }
          else
          {
          String sqlstr = _sSQLstr + " WHERE Parent='"
                        + name + "' ORDER BY AutoNum";
            int rows = this.ExecuteQuery(sqlstr);
            if (rows > 0)
            {
              this._ThirdLayer[i][j][k] = new MenuItem[rows];
              for (int l=0; l<rows; l++)
              {
                String[] data = this.getRowData(l);
                this._ThirdLayer[i][j][k][l] = new MenuItem(data[0]);
                this._ThirdLayer[i][j][k][l].setURL(data[1]);
                boolean result = data[2].equals("0") ? false : true;
                this._SecondLayer[i][j][k].setRedirect(result);
              }
            }
            else
            {
              this._ThirdLayer[i][j][k] = new MenuItem[1];
              this._ThirdLayer[i][j][k][0] = new MenuItem(null);
              this._ThirdLayer[i][j][k][0].setURL(null);
              this._ThirdLayer[i][j][k][0].setRedirect(false);
            }
          }
        }
     }
    }
  }
}