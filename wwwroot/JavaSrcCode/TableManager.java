import JdbcConn06;

public class TableManager extends JdbcConn06
{
  // Variable
  private String[] _sTableList = null;  // �x�s�Ҧ���ƪ��W��
  private String[][] _sFieldList = null;  // �x�s�Y�S�w��ƪ��Ҧ����W��

  // Constructor
  public TableManager(String ini_file)
  {
    this.MakingConnection(ini_file);
  }

  // Method
  // ���X�Ҧ���ƪ��T ----------------------------------------------------------
  public String[] getTableList()
  {
    this.getTabelNameFromFile();
    return this._sTableList;
  }

  // �N DescribeTable ���Ҧ���ƪ��T�x�s��O���餤 -------------------------------
  private void getTabelNameFromFile()
  {
    String sqlstr = "SELECT DT_Name FROM DescribeTable Order By DT_Name";
    int recs = -1;
    recs = this.ExecuteQuery(sqlstr);
    if (recs > 0)
    {
      _sTableList = new String[recs];
      for (int i=0; i<recs; i++)
      {
        String[] data = this.getRowData(i);
        _sTableList[i] = data[0];
      }
    }
  }

  // ���X�Y��ƪ�����T -------------------------------------------------------
  public String[] getFieldListFromTable(String tbl_name)
  {
    String sqlstr = "SELECT * FROM " + tbl_name;
    int result = this.ExecuteQuery(sqlstr);
    return this.getFieldNames();
  }

  // ���X�Y��ƪ����ҹ���������W�� ----------------------------------------------
  public String[][] getFieldDescription(String tbl_name)
  {
    // �����X��ڤW�b��ƪ����Ҧ����M��
    String[] src_flist = this.getFieldListFromTable(tbl_name);
    String[] field_type = this.getFieldTypes();

    int rows = src_flist.length;
    this._sFieldList = new String[rows][4]; // �u�x�s��쫬�A�B�^�B����W�١B�y�z
    for (int i=0; i<rows; i++)
    {
      this._sFieldList[i][0] = field_type[i];
      this._sFieldList[i][1] = src_flist[i];
    }

    // ���ۨ��X�x�s�b DescribeField ��ƪ�����������T
    String sqlstr = "SELECT DF_Name, DF_CName, DF_Description "
                  + "FROM DescribeField WHERE DT_Name='" + tbl_name + "'";
    int recs = this.ExecuteQuery(sqlstr);
    for (int i=0; i<recs; i++)
    {
      String[] data = this.getRowData(i);
      int cols = data.length;
      for (int j=0; j<cols; j++)
      {
        if (src_flist[i].equalsIgnoreCase(data[0]))
        {
          this._sFieldList[i][2] = data[1];
          this._sFieldList[i][3] = data[2];
        }
      }
    }
    return this._sFieldList;
  }

  // �s�W�@������  --------------------------------------------------------------
  public int Insert(String tbl_name, String[][] data)
  {
    int rows = data.length;
    String sqlstr = "INSERT INTO " + tbl_name + "(";
    for (int i=0; i<rows; i++) { // ���N���M��g�J SQL �d�ߩR�O
      sqlstr += data[i][0];
      sqlstr += (i < rows-1) ? ", " : "";
    }
    sqlstr += ") Values(";
    for (int i=0; i<rows; i++) { // �A�N����Ƽg�J SQL �d�ߩR�O
      sqlstr += ("'" + data[i][1] + "'");
      sqlstr += (i < rows-1) ? ", " : "";
    }
    sqlstr += ")";

    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }
}