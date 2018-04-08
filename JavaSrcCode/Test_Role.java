import Role;

public class Test_Role
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\Infomgn.ini";
    Role r01 = new Role(ini_file);
    r01.OpenConnection();
    String[][] roles = r01.getAllRoles();
    r01.CloseConnection();
    for (int i=0; i<roles.length; i++)
      System.out.println("["+(i+1)+"]: "+roles[i][0]+", "+roles[i][1]);
    System.out.println("");

    r01.OpenConnection();
    int result = r01.NewRole(107, "Test107");
    r01.CloseConnection();
    System.out.println("New: " + result);

    r01.OpenConnection();
    result = r01.DeleteRole(107);
    r01.CloseConnection();
    System.out.println("Delete: " + result);
  }
}