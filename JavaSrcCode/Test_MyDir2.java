import MyDir2;

public class MyDir2_Test
{
  public static void main(String[] args)
  {
    String dir = new String("c:\\temp");
    MyDir2 md = new MyDir2(dir);

    String[] flist = md.getAllList();
    for (int i=0; i<flist.length; i++)
      System.out.println(flist[i]);
    System.out.println("");

    flist = md.getAllList("txt");
    for (int i=0; i<flist.length; i++)
      System.out.println(flist[i]);
    System.out.println("");

    // ���X�ثe�ؿ��U�Ҧ����ɮ�
    System.out.println("���X�ثe�ؿ��U�Ҧ����ɮת���...");
    flist = md.getFileList();
    for (int i=0; i<flist.length; i++)
      System.out.println(flist[i]);
    System.out.println("");

    // ���X�ثe�ؿ��U�Ҧ����l�ؿ�
    System.out.println("���X�ثe�ؿ��U�Ҧ����ؿ�����...");
    flist = md.getDirList();
    for (int i=0; i<flist.length; i++)
      System.out.println(flist[i]);
    System.out.println("");

    // ���X�ثe�ؿ��U�Ҧ��ɮ����O�A�ÿz�蠟
    System.out.println("���X�ثe�ؿ��U�Ҧ����ɮת���, �ÿz���r�����O...");
    flist = md.getFileList("txt");
    for (int i=0; i<flist.length; i++)
      System.out.println(flist[i]);
    System.out.println("");
  }
}