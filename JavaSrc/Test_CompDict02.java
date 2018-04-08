import CompDict02;

public class Test_CompDict02
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\Infomgn.ini";
    CompDict02 cd02 = new CompDict02(ini_file);
    cd02.OpenConnection();
    cd02.getDictionaryInfomation(null);

    String[] title = cd02.getTitle();
    System.out.println("All Data is " + title.length);

    cd02.getDictionaryInfomation("case");
    title = cd02.getTitle();
    System.out.println("case is " + title.length);
//    for (int i=0; i<title.length; i++)
//      System.out.println("Title: " + title[i]);

    cd02.CloseConnection();

  }
}