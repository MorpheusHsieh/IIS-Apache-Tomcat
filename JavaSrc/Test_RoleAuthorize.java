import RoleAuthorize;

public class Test_RoleAuthorize
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\RoleAuthorize.ini";
    RoleAuthorize ra = new RoleAuthorize(ini_file);
    // 新增一筆資料
    ra.OpenConnection();
    int result = ra.AddMenuItem(1,"電腦名詞解釋");
    ra.CloseConnection();
    System.out.println("Result: " + result);

    // 查詢群組所能存取的系統權限
    ra.OpenConnection();
    String[] mi = ra.getMenuItem(1);
    ra.CloseConnection();
    for (int i=0; i<mi.length; i++)
      System.out.println("MenuItem: " + mi[i]);

    // 刪除群組
    ra.OpenConnection();
    result = ra.DeleteMenuItem(1);
    ra.CloseConnection();
    if (result > 0)
      System.out.println("刪除群組成功...");
    else
      System.out.println("刪除群組失敗...");

    // 增加兩個群組
    ra.OpenConnection();
    result = ra.AddMenuItem(1, "作業手冊規定");
    result = ra.AddMenuItem(1,"資訊資源分享");
    if (result > 0)
    {
      mi = ra.getMenuItem(1);
      for (int i=0; i<mi.length; i++)
        System.out.println("MenuItem: " + mi[i]);
    }
    else
      System.out.println("修改群組失敗...");
    ra.CloseConnection();
  }
}