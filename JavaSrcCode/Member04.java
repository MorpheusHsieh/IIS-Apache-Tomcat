import java.sql.*;
import JdbcConn04;

public class Member04 extends JdbcConn04
{
  // �غc�l
  public Member04(String file) { this.MakingConnection(file); }

  // Method
  public void QueryAll()
  {
    String sqlstr = "SELECT * FROM Account";
    this.ExecuteQuery(sqlstr);
  }


}