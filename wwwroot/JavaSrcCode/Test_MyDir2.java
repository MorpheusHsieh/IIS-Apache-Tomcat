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

    // 取出目前目錄下所有的檔案
    System.out.println("取出目前目錄下所有的檔案物件...");
    flist = md.getFileList();
    for (int i=0; i<flist.length; i++)
      System.out.println(flist[i]);
    System.out.println("");

    // 取出目前目錄下所有的子目錄
    System.out.println("取出目前目錄下所有的目錄物件...");
    flist = md.getDirList();
    for (int i=0; i<flist.length; i++)
      System.out.println(flist[i]);
    System.out.println("");

    // 取出目前目錄下所有檔案類別，並篩選之
    System.out.println("取出目前目錄下所有的檔案物件, 並篩選文字檔類別...");
    flist = md.getFileList("txt");
    for (int i=0; i<flist.length; i++)
      System.out.println(flist[i]);
    System.out.println("");
  }
}