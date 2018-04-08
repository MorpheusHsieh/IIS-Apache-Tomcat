import JdbcConn06;

public class TableManager extends JdbcConn06
{
  // Variable
  private String[] _sTableList = null;  // 儲存所有資料表的名稱
  private String[][] _sFieldList = null;  // 儲存某特定資料表的所有欄位名稱

  // Constructor
  public TableManager(String ini_file)
  {
    this.MakingConnection(ini_file);
  }

  // Method
  // 取出所有資料表資訊 ----------------------------------------------------------
  public String[] getTableList()
  {
    this.getTabelNameFromFile();
    return this._sTableList;
  }

  // 將 DescribeTable 中所有資料表資訊儲存到記憶體中 -------------------------------
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

  // 取出某資料表的欄位資訊 -------------------------------------------------------
  public String[] getFieldListFromTable(String tbl_name)
  {
    String sqlstr = "SELECT * FROM " + tbl_name;
    int result = this.ExecuteQuery(sqlstr);
    return this.getFieldNames();
  }

  // 取出某資料表欄位所對應的中文名稱 ----------------------------------------------
  public String[][] getFieldDescription(String tbl_name)
  {
    // 先取出實際上在資料表中的所有欄位清單
    String[] src_flist = this.getFieldListFromTable(tbl_name);
    String[] field_type = this.getFieldTypes();

    int rows = src_flist.length;
    this._sFieldList = new String[rows][4]; // 只儲存欄位型態、英、中文名稱、描述
    for (int i=0; i<rows; i++)
    {
      this._sFieldList[i][0] = field_type[i];
      this._sFieldList[i][1] = src_flist[i];
    }

    // 接著取出儲存在 DescribeField 資料表中的中文欄位資訊
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

  // 新增一筆紀錄  --------------------------------------------------------------
  public int Insert(String tbl_name, String[][] data)
  {
    int rows = data.length;
    String sqlstr = "INSERT INTO " + tbl_name + "(";
    for (int i=0; i<rows; i++) { // 先將欄位清單寫入 SQL 查詢命令
      sqlstr += data[i][0];
      sqlstr += (i < rows-1) ? ", " : "";
    }
    sqlstr += ") Values(";
    for (int i=0; i<rows; i++) { // 再將欄位資料寫入 SQL 查詢命令
      sqlstr += ("'" + data[i][1] + "'");
      sqlstr += (i < rows-1) ? ", " : "";
    }
    sqlstr += ")";

    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }
}