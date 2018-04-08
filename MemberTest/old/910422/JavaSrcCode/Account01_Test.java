import Account01;

public class Account01_Test
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\java\\src\\Account01.ini";
    Account01 ac = new Account01(ini_file);
    String nickname = "Avatar";
    String password = "0427";
    int result = -1;

    // 顯示角色權限
    int rolecode = ac.RoleCode(nickname);
    System.out.println("角色權限："+ rolecode);

    // 密碼驗證的範例
    result = ac.CheckPassword(nickname, password);
    switch(result)
    {
      case -1:
        System.out.println("帳號不存在...");
        break;
      case  0:
        System.out.println("密碼錯誤...");
        break;
      case  1:
        System.out.println("密碼正確, 歡迎 " + nickname + " 登入...");
        break;
      default:
        System.out.println("發生無法預期的狀況...");
    }

    // 查詢使用者資料
    String[] user_data = ac.Query("Avatar");
    String msg = "";
    int cols = user_data.length;
    for (int i=0; i<cols; i++)
    {
      msg += user_data[i];
      msg += (i<cols-1) ? ", " : "";
    }
    System.out.println("Query:" + msg);
    System.out.println("");

    // 顯示資料表原有資料
    ShowUser(ac);

    // 顯示增加 RedComet 使用者後的資料
    result = ac.NewAccount("RedComet", "0927", "", "");
    if (result > 0)
      System.out.println("新增使用者成功..." );
    else
      System.out.println("新增使用者失敗..." );
    ShowUser(ac);

    // 修改密碼
    result = ac.ChangePassword("RedComet", "0927", "0000");
    if (result > 0)
      System.out.println("密碼更換成功..." );
    else
      System.out.println("密碼更換失敗..." );
    ShowUser(ac);

    // 修改角色權限
    result = ac.UpdateRoleCode("RedComet", 3);
    if (result > 0)
      System.out.println("密碼更換成功..." );
    else
      System.out.println("密碼更換失敗..." );
    ShowUser(ac);

    // 顯示刪除 RedComet 使用者後的資料
    result = ac.DeleteAccount("RedComet");
    if (result > 0)
      System.out.println("刪除使用者成功..." );
    else
      System.out.println("刪除使用者失敗..." );
    ShowUser(ac);

    ac.CloseConnection();
  }

  public static void ShowUser(Account01 ac)
  {
    String sqlstr = "SELECT * FROM Account";
    int result = ac.ExecuteQuery(sqlstr);
    int cols = ac.Fields();
    int rows = ac.Records();
    for (int row=0; row<rows; row++)
    {
      String[] user_data = ac.getRowData(row);
      String msg = "";
      for (int col=0; col<cols; col++)
      {
        msg += user_data[col];
        msg += (col < cols-1) ? ", " : "";
      }
      System.out.println(msg);
    }
    System.out.println("");
  }
}