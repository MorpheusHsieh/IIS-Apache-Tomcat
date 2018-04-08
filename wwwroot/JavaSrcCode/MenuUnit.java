import MenuItem;
import JdbcConn06;

public class MenuUnit extends JdbcConn06
{
  // variable
  private MenuItem[] _Items = null;
  private int _Layer = -1;
  private int _Col = -1;
  private int _Row = -1;

  // Constructor
  // 以選單元素初始化主選單 -------------------------------------------------------
  public MenuUnit(MenuItem[] mi, int layer, int row, int col)
  {
    this._Layer = layer; // 設定此選單在第幾層，主選單為第 0 層，依此類推
    this._Col = col;     // 表示此選單在該層的第 ? 行
    this._Row = row;      // 表示此選單在該層的第 ? 列

    int items_cnt = mi.length;
    this._Items = null;
    this._Items = new MenuItem[items_cnt];

    for (int i=0; i<items_cnt; i++)
    {
      String name = mi[i].getName();
      this._Items[i] = new MenuItem(name);
      this._Items[i].setURL(mi[i].getURL());
      this._Items[i].setRedirect(mi[i].getRedirect());
    }
  }

  // Method
  public void setLayer(int layer) { this._Layer = layer; } // 設定此選單在第幾層
  public void setRow(int row) { this._Row = row; }         // 設定此選單在第幾列
  public void setCol(int col) { this._Col = col; }         // 設定此選單在第幾行

  public int getLayer() { return this._Layer; }            // 取出此選單在第幾層
  public int getRow() { return this._Row; }                // 取出此選單在第幾層
  public int getCol() { return this._Col; }                // 取出此選單在第幾層
  public MenuItem[] getMenuItems() { return this._Items; } // 取出主選單的元素


}