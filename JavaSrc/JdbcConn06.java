import java.sql.*;
import BufReader;

public class JdbcConn06
{
  // �s�u�һݭn������
  private Connection _conn = null;
  public Statement _stmt = null;
  public ResultSet _rs = null;

  // �s�u�H��i�H���o�����ƪ���T
  private int _nFields = -1;              // ���ƶq
  private int _nRecords = -1;             // �`��Ƶ���
  private String[] _sFieldNames = null;   // ���W��
  private String[] _sFieldType = null;    // ��쫬�A
  private String[][] _sData = null;       // ���

  // ���{�����]�u���b���� SQL �d�ߩR�O��~�|������������
  private int _nRecsPerPage = 5;          // �C����ܴX����ơA�w�]�Ȭ�10
  private int _nRecsInLastPage = -1;      // �̫�@�����X�����
  private int _nRecsInNowPage = -1;       // �{�b�o�@�����X�����
  private int _nTotalPages = -1;          // �@���h�֭�
  private int _nNowPage = -1;             // �{�b�O�ĴX��

  // �s�u ----------------------------------------------------------------------
  public void MakingConnection(String file)
  {
    BufReader inBuf = new BufReader(file);
    String user, passwd, driver, url;
    user = inBuf.Search("UserName");
    passwd = inBuf.Search("Password");
    driver = inBuf.Search("DriverName");
    url = inBuf.Search("URL");

    try
    {
      // Load the driver class
      Class.forName(driver);

      // create a connection throught the DriverManager
      if (user != null && passwd != null)
        _conn = DriverManager.getConnection(url, user, passwd);
      else
        _conn = DriverManager.getConnection(url);
    }
    catch(ClassNotFoundException cnfe)
    {
      System.err.println("Error in MakingConnection: " + cnfe);
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in MakingConnection: " + sqle);
    }
  }

  // ���� SQL ���ʩR�O -----------------------------------------------------------
  public int ExecuteUpdate(String sqlstr)
  {
    int row_update = -1;
    try
    {
      this._stmt = this._conn.createStatement();
      row_update = this._stmt.executeUpdate(sqlstr);
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in ExecuteUpdate: " + sqle);
    }
    return row_update;
  }

  // �M����T���������
  public int getFields() { return this._nFields; }      // �o����Table���h�֭����
  public String[] getFieldNames() { return this._sFieldNames; }   // ���X���W��
  public String[] getFieldTypes() { return this._sFieldType; }    // ���X��쫬�A

  // �M��ƿ����������
  public int getRecords() { return this._nRecords; }  // �o�������d�ߵ��G����`����

  // ���� SQL �d�ߩR�O(Select) ---------------------------------------------------
  public int ExecuteQuery(String sqlstr)
  {
    int rows = -1;
    try
    {
      _stmt = _conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);
      _rs = _stmt.executeQuery(sqlstr);

      this.getFieldInfomation();  // ���X���W�٤Ϋ��A
      rows = this.setRecords();   // �o�������d�ߵ��G���h�ֵ���ƿ�
      //System.out.println("ExecuteQuery: " + rows);

      if (rows > 0)
      {
        this.getResults();
        this._nTotalPages = this.setPages();
      }
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in getResults: " + sqle);
    }
    return rows;
  }

  // ���o SQL�d�߫��O�᪺��ƶ� ---------------------------------------------------
  private void getResults()
  {
    int rows = -1; // ����d�ߩR�O���ѶǦ^ -1, ���\�Ǧ^��ƿ��ƶq
    ResultSet rs = this._rs;
    rows = this.getRecords();
    if (rows > 0)
    {
      // �t�m�������O���D�Ŷ��� _sData �ܼ�
      this._sData = null;
      int cols = this.getFields();
      _sData = new String [rows][cols];
      try
      {
         rs.first();
         int row = 0;
         do {
           for (int i=0; i<cols; i++)
             _sData[row][i] = rs.getString(i+1); // ���s���q 1�}�l
           row++;
         } while(rs.next());
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getResults: " + sqle);
      }
    }
  }

  // �����s�u -------------------------------------------------------------------
  public void CloseConnection()
  {
    if (_stmt != null)
    {
      try
      {
        _stmt.close(); _stmt = null;
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in CloseConnection: " + sqle);
      }
    }

    if (_conn != null)
    {
      try
      {
        _conn.close(); _conn = null;
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in CloseConnection: " + sqle);
      }
    }
  }

  /*****************************************************************************
   * ���Ϭ��M������������k(Method)
   ****************************************************************************/

  // �]�w�C����ܴX����� ---------------------------------------------------------
  public void setRecordsPerPage(int page) { this._nRecsPerPage = page; }

  // ���X�C���i��ܴX����� -------------------------------------------------------
  public int getRecordsPerPage() { return this._nRecsPerPage; }

  //���X�{�b�o�@�����X����� ------------------------------------------------------
  public int getRecordsInNowPage() { return this._nRecsInNowPage; }

  // �`�@���h�֭� ---------------------------------------------------------------
  public int getTotalPages() { return this._nTotalPages; }

  // �{�b�O�ĴX�� ---------------------------------------------------------------
  public int getNowPage() { return this._nNowPage; }

  // FirstPage: �Ĥ@�� ----------------------------------------------------------
   public void FirstPage()
   {
     int now_page = 1;
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
   }

   // PrevPage: �W�@�� ----------------------------------------------------------
   public int PrevPage()
   {
     int now_page = this._nNowPage - 1;
     now_page = (now_page < 1) ? 1 : now_page;
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
     return now_page;
   }

   // GotoPage: ������@�� ------------------------------------------------------
   public void GotoPage(int page)
   {
     int now_page = (page < 1) ? 1 : page;
     int last_page = this.getTotalPages();
     now_page = (now_page > last_page) ? last_page : now_page;
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
   }

   // NextPage: �U�@�� ----------------------------------------------------------
   public int NextPage()
   {
     int now_page = this._nNowPage + 1;
     int last_page = this.getTotalPages();
     now_page = (now_page > last_page) ? last_page : now_page;
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
     return now_page;
   }

   // LastPage: �̫�@�� --------------------------------------------------------
   public int LastPage()
   {
     int now_page = this.getTotalPages();
     this._nNowPage = now_page;
     this._nRecsInNowPage = this.setRecordsInNowPage(now_page);
     return now_page;
   }

  // �p�⦹�� SQL �d�ߩR�O�@�i�H�����X�� -------------------------------------------
  private int setPages()
  {
    int total_pages = -1;
    if (this._rs != null)
    {
      int recs = this.getRecords();
      int recs_per_page = this._nRecsPerPage;
      total_pages = (recs / recs_per_page);
      // �p�G "�`��Ƶ���" ���O��n�� "�C����Ƽ�" ����ƭ��h "����" �[1
      total_pages += ((recs % recs_per_page) != 0) ? 1 : 0;
      this._nRecsInLastPage = (recs % recs_per_page);  // �̫�@������Ƶ���
    }
    return total_pages;
  }

  // �ھڭ��ƭp�⦹�����Ӧ��h�ֵ��O��
  private int setRecordsInNowPage(int page)
  {
    int recs_in_nowpage = -1;
    int recs_per_page = this._nRecsPerPage;
    int recs_in_last_page = this._nRecsInLastPage;
    int pages = this.getTotalPages();

    // size_in_page �ΨӪ�ܲ� [page] �����h�ֵ���ƿ�
    recs_in_nowpage = recs_per_page;
    if (page == pages)
      recs_in_nowpage = (recs_in_last_page != 0) ? recs_in_last_page : recs_per_page;
    this._nRecsInNowPage = recs_in_nowpage;
    return recs_in_nowpage;
  }

  // GetnerateNumber -----------------------------------------------------------
  // �ھڭ��Ʋ��͹������}�C�A���e���ӭ��ҹ�������ƿ��s��
  private int[] GenerateNumber(int page)
  {
    int[] array = null;
    int recs_per_page = this._nRecsPerPage;
    int recs_in_last_page = this._nRecsInLastPage;
    int pages = this.getTotalPages();
    int rec_in_nowpage = this.getRecordsInNowPage();

    // �p��X�� [page] ���ҹ�������ƿ��s��
    array = new int[rec_in_nowpage];
    for (int i=0; i<rec_in_nowpage; i++)
      array[i] = (((page-1)*recs_per_page) + i);     // ��Ʀb Data �}�C���q 0�}�l
    return array;
  }

  /*****************************************************************************
   * ���Ϭ��M��ƪ��ާ@��������k(Method)
   ****************************************************************************/
  // ���o�@������ƿ� ------------------------------------------------------------
  public String[][] getOnePageRecord()
  {
    String[][] data = null;
    int cols = this.getFields();
    int page = this.getNowPage();
    int[] array = this.GenerateNumber(page);
    int rows = array.length;

    data = new String [rows][cols];
    for (int i=0; i<rows; i++)
      data[i] = this.getRowData(array[i]);
    return data;
  }

  public String[][] getOnePageRecord(int page)
  {
    String[][] data = null;
    this.GotoPage(page);
    int cols = this.getFields();
    int[] array = this.GenerateNumber(page);
    int rows = array.length;

    data = new String [rows][cols];
    for (int i=0; i<rows; i++)
      data[i] = this.getRowData(array[i]);
    return data;
  }

  // ���o��ƪ��@�C��� ---------------------------------------------------------
  public String[] getRowData(int row)
  {
    String[] row_data = null;
    if (this._sData != null)
    {
      if (row >= 0 && row < this.getRecords())
      {
        int cols = this.getFields();
        row_data = new String [cols];
        for (int col=0; col<cols; col++)
          row_data[col] = this._sData[row][col];
      }
    }
    return row_data;
  }

  // ���o���W�� ----------------------------------------------------------------
  private void getFieldInfomation()
  {
    if (this._rs == null)
    {
      this._sFieldNames = new String [1];
      this._sFieldNames[0] = "ResultSet ����|���إ�...";
    }
    else
    {
      try
      {
        ResultSetMetaData rsmd = _rs.getMetaData();

        int cols = rsmd.getColumnCount();
        this._nFields = cols;
        this._sFieldNames = new String [cols];
        this._sFieldType = new String [cols];
        for (int i=0; i<cols; i++)
        {
          this._sFieldNames[i] = rsmd.getColumnName(i+1);
          this._sFieldType[i] = rsmd.getColumnTypeName(i+1);
        }
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getFieldInfomation: " + sqle);
      }
    }
  }

  // ���o�����d�ߩҶǦ^����Ƶ��� --------------------------------------------------
  private int setRecords()
  {
    if (this._rs != null)
    {
      try
      {
        this._rs.last();
        this._nRecords = this._rs.getRow();
        this._rs.first();
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getRecords: " + sqle);
      }
    }
    return this._nRecords;
  }
}