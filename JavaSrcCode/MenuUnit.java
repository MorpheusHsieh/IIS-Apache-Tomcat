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
  // �H��椸����l�ƥD��� -------------------------------------------------------
  public MenuUnit(MenuItem[] mi, int layer, int row, int col)
  {
    this._Layer = layer; // �]�w�����b�ĴX�h�A�D��欰�� 0 �h�A�̦�����
    this._Col = col;     // ��ܦ����b�Ӽh���� ? ��
    this._Row = row;      // ��ܦ����b�Ӽh���� ? �C

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
  public void setLayer(int layer) { this._Layer = layer; } // �]�w�����b�ĴX�h
  public void setRow(int row) { this._Row = row; }         // �]�w�����b�ĴX�C
  public void setCol(int col) { this._Col = col; }         // �]�w�����b�ĴX��

  public int getLayer() { return this._Layer; }            // ���X�����b�ĴX�h
  public int getRow() { return this._Row; }                // ���X�����b�ĴX�h
  public int getCol() { return this._Col; }                // ���X�����b�ĴX�h
  public MenuItem[] getMenuItems() { return this._Items; } // ���X�D��檺����


}