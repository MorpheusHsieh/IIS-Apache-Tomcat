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
  // ���椸�غc��, �D���ݴ��ѿﶵ�W��
  public MenuUnit03(String name) { this.NewUnit(name, 0); }
  // ���椸�غc��, �ƿ��椸���W�r���W�@�h��椸���W��
  public MenuUnit03(String name, int layer) { this.NewUnit(name, layer); }

  private void NewUnit(String name, int layer)
  {
    this._sName = name;
    this._iLayer = layer;
  }

  // Method --------------------------------------------------------------------
  public void setLayer(int layer) { this._iLayer = layer; } // �]�w�����b�ĴX�h
  public void setRow(int row) { this._iRow = row; }         // �]�w�����b�ĴX�C
  public void setCol(int col) { this._iCol = col; }         // �]�w�����b�ĴX��

  // �N��椸����i�����椸�� ---------------------------------------------------
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

  public String getName() { return this._sName; }             // ���X�����椸���W��
  public int Layer() { return this._iLayer; }                 // ���X�����b�ĴX�h
  public int getRow() { return this._iRow; }                  // ���X�����b�ĴX�h
  public int getCol() { return this._iCol; }                  // ���X�����b�ĴX�h
  public MenuItem03[] getMenuItems() { return this._Items; }  // ���X�D��檺����
  public int getItemCount() { return this._Items.length; }    // ���o�ﶵ�ƶq


}