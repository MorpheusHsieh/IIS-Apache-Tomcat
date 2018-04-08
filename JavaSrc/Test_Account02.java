import Account02;

public class Test_Account02
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\Infomgn.ini";

    System.out.println("查詢帳號 Avatar 的資料");
    String user = "Avatar";
    Account02 ac = new Account02();
    ac.OpenConnection(ini_file);
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("沒有此帳號...");

    // 檢查密碼
    int result = ac.CheckPassword(user, "0427");
    System.out.println("密碼檢查結果: " + result);
    System.out.println("");

    // 新增一個帳號
    System.out.println("新增帳號");
    user = "RedComet";
    ac.NewAccount(user, "0927", "AAA", "AAA");
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("沒有此帳號...");

    // 修改密碼
    System.out.println("修改密碼");
    ac.UpdatePassword(user, "0927", "0000");
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("沒有此帳號...");

    // 修改群組
    System.out.println("修改群組");
    ac.UpdateRole(user, 3);
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("沒有此帳號...");

    // 修改問題及答案
    System.out.println("修改問題及答案");
    ac.UpdateQuestion(user, "BBBB", "BBBB");
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("沒有此帳號...");

    // 刪除一個帳號
    System.out.println("刪除帳號之後...");
    user = "RedComet";
    ac.DeleteAccount(user);
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("沒有此帳號...");

    ac.CloseConnection();
  }

  public static void ShowUser(Account02 ac)
  {
    String user = ac.getUserName();
    String pswd = ac.getPassword();
    String rolename = ac.getRoleName();
    String ques = ac.getQuestion();
    String ans = ac.getAnswer();
    System.out.println("UserName: " + user);
    System.out.println("Password: " + pswd);
    System.out.println("RoleName: " + rolename);
    System.out.println("Question: " + ques);
    System.out.println("Answer: " + ans);
    System.out.println("");
  }
}