import RoleAuthorize;

public class Test_RoleAuthorize
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\RoleAuthorize.ini";
    RoleAuthorize ra = new RoleAuthorize(ini_file);
    // �s�W�@�����
    ra.OpenConnection();
    int result = ra.AddMenuItem(1,"�q���W������");
    ra.CloseConnection();
    System.out.println("Result: " + result);

    // �d�߸s�թү�s�����t���v��
    ra.OpenConnection();
    String[] mi = ra.getMenuItem(1);
    ra.CloseConnection();
    for (int i=0; i<mi.length; i++)
      System.out.println("MenuItem: " + mi[i]);

    // �R���s��
    ra.OpenConnection();
    result = ra.DeleteMenuItem(1);
    ra.CloseConnection();
    if (result > 0)
      System.out.println("�R���s�զ��\...");
    else
      System.out.println("�R���s�ե���...");

    // �W�[��Ӹs��
    ra.OpenConnection();
    result = ra.AddMenuItem(1, "�@�~��U�W�w");
    result = ra.AddMenuItem(1,"��T�귽����");
    if (result > 0)
    {
      mi = ra.getMenuItem(1);
      for (int i=0; i<mi.length; i++)
        System.out.println("MenuItem: " + mi[i]);
    }
    else
      System.out.println("�ק�s�ե���...");
    ra.CloseConnection();
  }
}