import java.sql.*;
import java.io.File;
import BufReader;

public class JdbcConnection
{
  // �s�u�һݭn������
  private Connection _conn = null;
  public Statement _stmt = null;
  public ResultSet _rs = null;

  // �s�u��i�H���o���ܼƸ�T
  private int _Records = 0;           // �`��Ƶ���
  private int _Fields = 0;            // Table �����ƶq
  private String[] _FieldName = null; // �s�����W�٪��a��
  private int _nRecsPerPage = 10;     // �C�����h�ֵ������A �w�]�Ȭ��C��10��
  private int _nRecsInLastPage = 0;   // �̫�@�����h�ֵ��O��
  private int _nRecsInThisPage = 0;   // �o�@�����h�ֵ��O��
  private int _nPages = 0;              // �@���h�֭�
  private int _nNowPage = 0;          // �{�b�O�ĴX��

  // Method
  public int Records() { return this._Records; } // ���X�����d�ߦ@���h�ֵ����
  public int Fields() { return this._Fields; }   // ���X�`�@���h�֭����
  public String FieldName(int idx) { return this._FieldName[idx]; } // ���X���W��
  // �]�w�C�����h�ֵ��O��
  public void RecordsPerPage(int recs) { this._nRecsPerPage = recs; }
  // ���X�C�����h�ֵ��O��
  public int RecordsPerPage() { return this._nRecsPerPage; }
  // ���X�̫�@�����h�ֵ��O��
  public int RecordsInLastPage() { return this._nRecsInLastPage; }
  // ���X�����d�ߵ��G�@�i�����h�֭�
  public int Pages() { return this._nPages; }
  // ���X�{�b�O�ĴX��
  public int NowPage() { return this._nNowPage; }

  // �s�u ----------------------------------------------------------------------
  public void MakingConnection(String file)
  {
    BufReader inBuf = new BufReader(file);
    String user, passwd, driver, url;
    user = inBuf.Search("UserName");
    passwd = inBuf.Search("Password");
    driver = inBuf.Search("DriverName");
    url = inBuf.Search("URL");

    // Load driver
    try
    {
      // Load the driver class
      Class.forName(driver);

      // Define ths data source for the driver
      String srcURL = url;

      // Create a connection through the DriverManager
      if (user != null && passwd != null)
        _conn = DriverManager.getConnection(url, passwd, srcURL);
      else
        _conn = DriverManager.getConnection(srcURL);
      _stmt = _conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);
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

  // ���� SQL ���ʫ��O�A�]�A Insert, Delete, Update ------------------------------
  public int ExecuteUpdate(String sqlstr)
  {
    int result = 0;
    try
    {
      result = _stmt.executeUpdate(sqlstr);
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in ExecuteUpdate: " + sqle);
    }
    return result;
  }

  // ���� SQL �d�߫��O�A�� Select ���O�ϥ�-----------------------------------------
  public ResultSet ExecuteQuery(String sqlstr)
  {
    try
    {
      _rs = _stmt.executeQuery(sqlstr);
      this.getRecords();
      this.getFieldName();
      this.getPages();
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in ExecuteQuery: " + sqle);
    }
    return this._rs;
  }

  // �d�X�o���d�ߦ@���h�ֵ��O�� ----------------------------------------------------
  private void getRecords()
  {
    if (this._rs == null)
    {
      System.out.println("ResultSet ����|���إ�...");
    }
    else
    {
      // ���X�@���h�ֵ�����
      try
      {
        _rs.last();
        this._Records = _rs.getRow();
        _rs.first();
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getRecrods: " + sqle);
      }
    }
  }

  // �q��ƪ����X���W�� -------------------------------------------------------
  private void getFieldName()
  {
    if (this._rs == null)
    {
      System.out.println("ResultSet ����|���إ�...");
    }
    else
    {
      // ���X�Ҧ�����T
      try
      {
        ResultSetMetaData rsmd = _rs.getMetaData();
        this._Fields = rsmd.getColumnCount();

        int cols = this._Fields;
        this._FieldName = new String [cols];
        for (int i=0; i<cols; i++)
          _FieldName[i] = rsmd.getColumnName(i+1);  // �����ޱq 1�}�l
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getFieldName: " + sqle);
      }
    }
  }

  // getPageInformation --------------------------------------------------------
  private void getPages()
  {
    if (this._rs == null)
      System.out.println("ResultSet ����|���إ�...");
    else
    {
      // �p����� SQL ���O��A���^����ƥi�H�����X��?
      int rows = this.Records();
      int recs_per_page = this._nRecsPerPage;
      this._nPages = (rows/recs_per_page);
      // �p�G rows ���O��n�� recs_per_page ����ƭ��h�[ 1
      this._nPages += ((rows%recs_per_page) != 0) ? 1 : 0;
      // �̫�@������Ƶ��Ƶ��� rows �M recs_per_page ���l��
      this._nRecsInLastPage = (rows%recs_per_page);
    }
  }

  // FirstPage: ���ͲĤ@������ưO�����s�� -----------------------------------------
  public int[] FirstPage()
  {
    int[] array = null;
    int now_page = 1;
    this._nNowPage = now_page;
    array = GenerateNumber(now_page);
    return array;
  }

  // PrevPage ------------------------------------------------------------------
  public int[] PrevPage()
  {
    int[] array = null;
    int now_page = this.NowPage() - 1;
    now_page = (now_page < 1) ? 1 : now_page; // �P�_�O�_�p���1��
    this._nNowPage = now_page;
    array = GenerateNumber(now_page);
    return array;
  }

  // GotoPage ------------------------------------------------------------------
  public int[] GotoPage(int page)
  {
    int[] array = null;
    // ���P�_ page �ܼƬO�_�W�X�d��
    int now_page = (page < 1) ? 1 : page;
    int pages = this.Pages();
    now_page = (page > pages) ? pages : page;
    this._nNowPage = now_page; // �N _nNowPage �ܼƳ]�w���{�b������
    array = GenerateNumber(now_page);
    return array;
  }

  // NextPage ------------------------------------------------------------------
  public int[] NextPage()
  {
    int[] array = null;
    int now_page = this.NowPage() + 1;
    int pages = this.Pages();
    now_page = (now_page >= pages) ? pages : now_page;
    this._nNowPage = now_page;
    array = GenerateNumber(now_page);
    return array;
  }

  // LastPage ------------------------------------------------------------------
  public int[] LastPage()
  {
    int[] array = null;
    int now_page = this.Pages();
    this._nNowPage = now_page;
    array = GenerateNumber(now_page);
    return array;
  }

  // GenerateNumber ------------------------------------------------------------
  // �̾ڭ��Ʋ��͹������}�C�A�}�C���e���ӭ��ƪ���Ƭ����s��
  private int[] GenerateNumber(int page)
  {
    int[] array = null;
    int recs_per_page = this.RecordsPerPage();
    int recs_in_last_page = this.RecordsInLastPage();
    int pages = this.Pages();

    // size �ΨӰO���� page �����Ӧ��h�ֵ��O��
    int size = recs_per_page;
    if (page == pages) // �P�_�O�_���̫�@��
      size = (recs_in_last_page != 0) ? recs_in_last_page : recs_per_page;
    this._nRecsInThisPage = size;

    // �p��X�� page ����������ưO���s��
    array = new int[size];
    for (int i=0; i<size; i++)
      array[i] = (((page-1)*recs_per_page)+i+1); // ��ƬO�q1�}�l�p��
    return array;
  }

  // UpdateData ----------------------------------------------------------------
  public int UpdateData(String sqlstr)
  {
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // DeleteData ----------------------------------------------------------------
  public int DeleteData(String sqlstr)
  {
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // InsertData ----------------------------------------------------------------
  public int InsertData(String sqlstr)
  {
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �����s�u -------------------------------------------------------------------
  public void CloseConnection()
  {
    if (_stmt != null)
    {
      try
      {
        _stmt.close();
        _stmt = null;
      }
      catch(SQLException sqle)
      {
        System.out.println("Error in CloseConnection...");
        System.out.println("SQLState: " + sqle.getSQLState());
        System.out.println("Message: " + sqle.getMessage());
      }
    }

    if (_conn != null)
    {
      try
      {
        _conn.close();
        _conn = null;
      }
      catch(SQLException sqle)
      {
        System.out.println("Error in CloseConnection...");
        System.out.println("SQLState: " + sqle.getSQLState());
        System.out.println("Message: " + sqle.getMessage());
      }
    }
  }
}