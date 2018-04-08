import java.sql.*;
import java.util.Properties;

abstract public class JdbcConnection
{
  // variable
  public Connection _conn;
  public Statement _stmt;

  // Constructor
  JdbcConnection() {}

  // Method
  public void MakingJdbcConnection(String odbc_name)
  {
    String url = "jdbc:odbc:" + odbc_name;
    String user = "";
    String passwd = "";
    getConnection(url, user, passwd);
  }

  public void MakingJdbcConnection(String odbc_name, String user, String passwd)
  {
    String url = "jdbc:odbc:" + odbc_name;
    getConnection(url, user, passwd);
  }

  private void getConnection(String url, String user, String passwd)
  {
    String _driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
    try
    {
      Class.forName(_driverName);
      if (user =="" && passwd =="")
      {
        _conn = DriverManager.getConnection(url);
      }
      else
      {
        Properties prop = new Properties();
        prop.setProperty("user", user);
        prop.setProperty("password", passwd);
        _conn = DriverManager.getConnection(url, prop);
      }
      _stmt = _conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                 ResultSet.CONCUR_READ_ONLY);
    }
    catch(ClassNotFoundException cnfe)
    {
      System.err.println(cnfe.toString());
    }
    catch(SQLException sqle)
    {
      System.err.println(sqle);
    }
  }

  public void closeConnection()
  {
    if (_conn != null)
    {
      try
      {
        _conn.close();
        _conn = null;
      }
      catch(SQLException ex)
      {
        System.out.println("\nSQLException------------------\n");
        System.out.println("SQLState:" + ex.getSQLState());
        System.out.println("Message :" + ex.getMessage());
      }
    }
  }

  abstract public void getResults(String SQLstr);
}