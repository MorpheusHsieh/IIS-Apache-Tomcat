import MenuItem03;

public class MenuUnit03
{
  // variable
  private String _sName = "";
  private int _iLayer = -1;
  private int _iCol = -1;
  private int _iRow = -1;
  private MenuItem03[] _Items = null;

  // Constructor
  // 選單單元建構元, 主選單需提供選項名稱
  public MenuUnit03(String name) { this.NewUnit(name, 0); }
  // 選單單元建構元, 副選單單元的名字為上一層選單元素名稱
  public MenuUnit03(String name, int layer) { this.NewUnit(name, layer); }

  private void NewUnit(String name, int layer)
  {
    this._sName = name;
    this._iLayer = layer;
  }

  // Method --------------------------------------------------------------------
  public void setLayer(int layer) { this._iLayer = layer; } // 設定此選單在第幾層
  public void setRow(int row) { this._iRow = row; }         // 設定此選單在第幾列
  public void setCol(int col) { this._iCol = col; }         // 設定此選單在第幾行

  // 將選單元素放進本選單單元中 ---------------------------------------------------
  public void setMenuItems(MenuItem03[] mi, int row, int col)
  {
    this._iRow = row;
    this._iCol = col;
    int mi_len = mi.length;
    this._Items = new MenuItem03[mi_len];
    for (int i=0; i<mi.length; i++)
    {
      this._Items[i] = new MenuItem03(mi[i].getName());
      this._Items[i].setURL(mi[i].getURL());
      this._Items[i].setNewFrame(mi[i].getNewFrame());
    }
  }

  public String getName() { return this._sName; }             // 取出此選單單元的名稱
  public int Layer() { return this._iLayer; }                 // 取出此選單在第幾層
  public int getRow() { return this._iRow; }                  // 取出此選單在第幾層
  public int getCol() { return this._iCol; }                  // 取出此選單在第幾層
  public MenuItem03[] getMenuItems() { return this._Items; }  // 取出主選單的元素
  public int getItemCount() { return this._Items.length; }    // 取得選項數量


}