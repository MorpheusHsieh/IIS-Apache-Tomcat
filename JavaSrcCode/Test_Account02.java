import Account02;

public class Test_Account02
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\Infomgn.ini";

    System.out.println("�d�߱b�� Avatar �����");
    String user = "Avatar";
    Account02 ac = new Account02();
    ac.OpenConnection(ini_file);
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("�S�����b��...");

    // �ˬd�K�X
    int result = ac.CheckPassword(user, "0427");
    System.out.println("�K�X�ˬd���G: " + result);
    System.out.println("");

    // �s�W�@�ӱb��
    System.out.println("�s�W�b��");
    user = "RedComet";
    ac.NewAccount(user, "0927", "AAA", "AAA");
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("�S�����b��...");

    // �ק�K�X
    System.out.println("�ק�K�X");
    ac.UpdatePassword(user, "0927", "0000");
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("�S�����b��...");

    // �ק�s��
    System.out.println("�ק�s��");
    ac.UpdateRole(user, 3);
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("�S�����b��...");

    // �ק���D�ε���
    System.out.println("�ק���D�ε���");
    ac.UpdateQuestion(user, "BBBB", "BBBB");
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("�S�����b��...");

    // �R���@�ӱb��
    System.out.println("�R���b������...");
    user = "RedComet";
    ac.DeleteAccount(user);
    if (ac.Query(user) > 0)
      ShowUser(ac);
    else
      System.out.println("�S�����b��...");

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