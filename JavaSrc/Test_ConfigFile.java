import myConfigFile;

public class Test_ConfigFile
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\java\\src\\MinuteBook.ini";
    myConfigFile cf = new myConfigFile(ini_file);
    String[] line_list = cf.ReadConfigFile();
    for (int i=0; i<line_list.length; i++)
      System.out.println("["+i+"]: "+line_list[i]);
    System.out.println("");

    int cnt = 0;
    myConfigUnit[] mcs = cf.ReadConfigList();
    String name = mcs[cnt].Name();
    String usrname = mcs[cnt].Search("UserName");
    String pswd = mcs[cnt].Search("Password");
    String dname = mcs[cnt].Search("DriverName");
    String url = mcs[cnt].Search("URL");
    System.out.println("  UserName: " + usrname);
    System.out.println("  Password: " + pswd);
    System.out.println("  DriverName: " + dname);
    System.out.println("  URL: " + url);
    System.out.println("");

    for (int i=0; i<mcs.length; i++)
    {
      String[][] data = mcs[i].getAllConfig();
      System.out.println("[" + mcs[i].Name() + "]");
      for (int j=1; j<data.length; j++)
        System.out.println("  " + data[j][0] + "=" + data[j][1]);
      System.out.println("");
    }
  }
}