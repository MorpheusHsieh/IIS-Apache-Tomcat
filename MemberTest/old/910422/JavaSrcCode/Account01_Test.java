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

    // ��ܨ����v��
    int rolecode = ac.RoleCode(nickname);
    System.out.println("�����v���G"+ rolecode);

    // �K�X���Ҫ��d��
    result = ac.CheckPassword(nickname, password);
    switch(result)
    {
      case -1:
        System.out.println("�b�����s�b...");
        break;
      case  0:
        System.out.println("�K�X���~...");
        break;
      case  1:
        System.out.println("�K�X���T, �w�� " + nickname + " �n�J...");
        break;
      default:
        System.out.println("�o�͵L�k�w�������p...");
    }

    // �d�ߨϥΪ̸��
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

    // ��ܸ�ƪ�즳���
    ShowUser(ac);

    // ��ܼW�[ RedComet �ϥΪ̫᪺���
    result = ac.NewAccount("RedComet", "0927", "", "");
    if (result > 0)
      System.out.println("�s�W�ϥΪ̦��\..." );
    else
      System.out.println("�s�W�ϥΪ̥���..." );
    ShowUser(ac);

    // �ק�K�X
    result = ac.ChangePassword("RedComet", "0927", "0000");
    if (result > 0)
      System.out.println("�K�X�󴫦��\..." );
    else
      System.out.println("�K�X�󴫥���..." );
    ShowUser(ac);

    // �ק﨤���v��
    result = ac.UpdateRoleCode("RedComet", 3);
    if (result > 0)
      System.out.println("�K�X�󴫦��\..." );
    else
      System.out.println("�K�X�󴫥���..." );
    ShowUser(ac);

    // ��ܧR�� RedComet �ϥΪ̫᪺���
    result = ac.DeleteAccount("RedComet");
    if (result > 0)
      System.out.println("�R���ϥΪ̦��\..." );
    else
      System.out.println("�R���ϥΪ̥���..." );
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