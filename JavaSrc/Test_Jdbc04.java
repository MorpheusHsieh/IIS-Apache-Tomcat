import Member04;

public class JdbcTest04
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\Member03.ini";
    Member04 m04 = new Member04(ini_file);

    m04.QueryAll();
    int cols = m04.Fields();
    int rows = m04.Records();
    String[] data = null;
    String msg = null;
    for (int row=0; row<rows; row++)
    {
      msg = "";
      data = m04.getRowData(row);
      for (int col=0; col<cols; col++)
      {
        msg += data[col];
        msg += (col <cols-1) ? ", " : "";
      }
      System.out.println(msg);
    }
  }
}