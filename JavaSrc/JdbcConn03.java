import java.sql.*;
import BufReader;

public class JdbcConn03
{
  // �s�u�һݭn������
  private Connection _conn = null;
  public Statement _stmt = null;
  public ResultSet _rs = null;

  // �s�u�H��i�H���o�����ƪ���T
  private int _nFields = -1;
  private int _nRecords = -1;
  private String[] _sFieldNames = null;

  // Method
  public int Records() { return this._nRecords; }
  public int Fields() { return this._nFields; }
  public String[] FieldNames() { return this._sFieldNames; }

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

  // ���� SQL �d�ߩR�O(Select) ---------------------------------------------------
  public void ExecuteQuery(String sqlstr)
  {
    try
    {
      this._stmt = this._conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                              ResultSet.CONCUR_READ_ONLY);
      this._rs = this._stmt.executeQuery(sqlstr);
      this.getFieldNames();
      this.getRecords();
    }
    catch(SQLException sqle)
    {
      System.err.println("Error in getResults: " + sqle);
    }
  }

  // ���� SQL ���ʩR�O -----------------------------------------------------------
  public int ExecuteUpdate(String sqlstr)
  {
    int row_update = 0;
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
        this._sFieldNames = new String [cols+1];
        for (int i=1; i<=cols; i++)
          this._sFieldNames[i] = rsmd.getColumnName(i);
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