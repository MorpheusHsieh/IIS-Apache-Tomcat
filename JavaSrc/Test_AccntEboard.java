import Accnt_EBoard;

public class Test_AccntEboard
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\EBoard.ini";
    Accnt_EBoard ae = new Accnt_EBoard(ini_file);
    ae.OpenConnection();
    String name = "admin";
    ae.Query(name);
    System.out.println("RoleCode: " + ae.getRoleCode());
    System.out.println("RoleName: " + ae.getRoleGroupName());
    System.out.println("Department: " + ae.getDepartment());
    System.out.println("Password Check: " + ae.CheckPassword(name, "admini"));
    System.out.println("Password Check: " + ae.CheckPassword(name, "admin"));

    String[] user = ae.getAllUserName();
    for(int i=0; i<user.length; i++)
      System.out.println(user[i]);

    // �󴫱K�X
    int result = ae.UpdatePassword(name, "admin", "1234");
    if (result == 1)
      System.out.println("�K�X�w�g�󴫬� '1234'...");
    else
      System.out.println("�K�X�󴫥���...");

    result = ae.UpdatePassword(name, "1234", "admin");
    if (result == 1)
      System.out.println("�K�X�w�g�󴫬� 'admin'...");
    else
      System.out.println("�K�X�󴫥���...");


    ae.CloseConnection();
  }
}