import java.sql.*;
import BufReader;

public class JdbcConn05
{
  // �s�u�һݭn������
  private Connection _conn = null;
  public Statement _stmt = null;
  public ResultSet _rs = null;

  // �s�u�H��i�H���o�����ƪ���T
  private int _nFields = -1;              // ���ƶq
  private int _nRecords = -1;             // �`��Ƶ���
  private String[] _sFieldNames = null;   // ���W��
  private String[][] _sData = null;       // ���

  // �P�����������ܼ�
  private int _nRecsPerPage = 10;         // �C����ܦh�ֵ���ơA�w�]�Ȭ�10
  private int _nRecsInLastPage = -1;      // �̫�@�����h�ֵ����
  private int _nRecsInPage = -1;          // �{�b�o�@�����h�ֵ����
  private int _nPages = -1;               // �@���h�֭�
  private int _nNowPage = -1;             // �{�b�O�ĴX��

  // Method
  public int Records() { return this._nRecords; } // �o�������d�ߵ��G����`����
  public int Fields() { return this._nFields; }   // �o����Table���h�֭����
  public String[] FieldNames() { return this._sFieldNames; }  // ���X���W��

  // ���o��ƪ��@�C���
  public String[] getRowData(int row)
  {
    String[] row_data = null;
    if (this._sData != null)
    {
      if (row >= 0 && row < this.Records())
      {
        int cols = this.Fields();
        row_data = new String [cols];
        for (int col=0; col<cols; col++)
          row_data[col] = this._sData[row][col];
      }
    }
    return row_data;
  }

  // �M���������� Method ---------------------------------------------------------
  // �]�w�C����ܦh�ֵ����
  public void RecordsPerPage(int page) { this._nRecsPerPage = page; }
  public int Pages() { return this._nPages; }     // �`�@���h�֭�

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

  // ���� SQL �d�ߩR�O(Select) ---------------------------------------------------
  public int ExecuteQuery(String sqlstr)
  {
    int result = -1;
    try
    {
      _stmt = _conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);
      _rs = _stmt.executeQuery(sqlstr);
      getFieldNames();
      getRecords();
      result = Records();
      if (result > 0)
      {
        getResults();
        getPages();
      }
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in getResults: " + sqle);
    }
    return result;
  }
  // ���o���W�� ----------------------------------------------------------------
  private void getFieldNames()
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
        for (int i=0; i<cols; i++)
          this._sFieldNames[i] = rsmd.getColumnName(i+1);
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getFieldNames: " + sqle);
      }
    }
  }

  // ���o�����d�ߩҶǦ^����Ƶ��� --------------------------------------------------
  private void getRecords()
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
  }

  // ���o SQL�d�߫��O�᪺��ƶ� ---------------------------------------------------
  private void getResults()
  {
    int rows = -1;              // �����]����`��Ƭ�-1�A�Y�d�ߦ��\�h������
    ResultSet rs = this._rs;
    rows = this.Records(); // �p�G���e��SQL�d�ߩR�O���\�A�h Records()��������
    if (rows > 0)
    {
      // �t�m�������O���D�Ŷ��� _sData �ܼ�
      this._sData = null;
      int cols = this.Fields();
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

  // ���� -----------------------------------------------------------------------
  private int getPages()
  {
    int pages = -1;
    if (this._rs != null)
    {
      int recs = this.Records();
      int recs_per_page = this._nRecsPerPage;
      this._nPages = (recs / recs_per_page);
      // �p�G "�`��Ƶ���" ���O��n�� "�C����Ƽ�" ����ƭ��h "����" �[1
      this._nPages += ((recs % recs_per_page) != 0) ? 1 : 0;
      pages = this._nPages;
      this._nRecsInLastPage = (recs % recs_per_page);  // �̫�@������Ƶ���
    }
    return pages;
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
}