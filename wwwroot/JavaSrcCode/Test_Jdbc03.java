import Member03;

public class JdbcTest03
{
  public static void main(String[] args)
  {
    Member03 m03 = new Member03();  // 建構時直接連線
    m03.QueryAll();                // 執行 SQL 指令查詢

    // 執行查詢後可以知道此次查詢共有多少筆資料錄.
    int recs = m03.Records();
    System.out.println("Last Record: " + recs);

    // 執行查詢後才能知道所有的欄位名稱
    String msg = "欄位名稱： ";
    String[] field_names = m03.FieldNames();
    int cols = m03.Fields();
    for (int i=1; i<=cols; i++)
      msg += field_names[i] + ((i != cols) ? ", " : "");
    System.out.println(msg);
    System.out.println("");

    System.out.println("原始資料...");
    ShowData(m03);

    // 新增一筆資料
    int row_added = m03.InsertRow("A111111111", "RedComet", "redcomet");
    System.out.println("新增一筆資料...");
    System.out.println("Row Add: " + row_added);
    ShowData(m03);

    int row_updated = m03.UpdateRecord("WorkNo", "A111111111", "Password", "1111");
    System.out.println("修改一筆資料...");
    System.out.println("Row Update: " + row_updated);
    ShowData(m03);
/*
    int row_deled = m03.DeleteRecord("WorkNo", "A111111111");
    System.out.println("刪除一筆資料...");
    System.out.println("Row Delete: " + row_deled);
    ShowData(m03);
*/
    m03.CloseConnection();
  }

  public static void ShowData(Member03 mm)
  {
    mm.QueryAll();                // 執行 SQL 指令查詢
    int recs = mm.Records();
    for (int i=0; i<recs; i++)
    {
      System.out.println("WorkNo: " + mm.WorkNo(i));
      System.out.println("NickName: " + mm.NickName(i));
      System.out.println("Password: " + mm.Password(i));
      System.out.println("RoleCode: " + mm.RoleCode(i));
      System.out.println("Pass: " + mm.Pass(i));
      System.out.println("");
    }
  }
}