import CompDic01;

public class Test_CompDic01
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\java\\src\\CompDic.ini";
    CompDic01 cd = new CompDic01(ini_file);

    String sqlstr = "SELECT * FROM Dictionary ORDER BY CD_Title";
    int rows = cd.ExecuteQuery(sqlstr);
    if (rows >= 0)
    {
      System.out.println("此次查詢得到 " + rows + " 筆資料");
    }
    else
      System.out.println("此次查詢失敗...");

    int total_page = cd.getTotalPages();
    System.out.println("此次查詢共可分為 " +total_page+ " 頁");

    int cols = cd.getFields();
    rows = cd.getRecordsInNowPage();
    for (int i=1; i<=total_page; i++)
    {
      System.out.println("第 " + i + " 頁");
      String[][] data = cd.getOnePageRecord(i);
      ShowData(data);
    }

    int page = -1;
    cd.FirstPage();
    System.out.println("第 " + page + " 頁");
    String[][] data = cd.getOnePageRecord();
    ShowData(data);

    page = cd.NextPage();
    page = cd.NextPage();
    System.out.println("第 " + page + " 頁");
    data = cd.getOnePageRecord();
    ShowData(data);

    page = cd.PrevPage();
    System.out.println("第 " + page + " 頁");
    data = cd.getOnePageRecord();
    ShowData(data);

    page = cd.LastPage();
    System.out.println("第 " + page + " 頁");
    data = cd.getOnePageRecord();
    ShowData(data);

    cd.GotoPage(3);
    System.out.println("第 " + page + " 頁");
    data = cd.getOnePageRecord();
    ShowData(data);

    // 有3個 Reference
    String[] ref_list = cd.getReference(".ini file");
    for (int i=0; i<ref_list.length; i++)
      System.out.println("Refs: " + ref_list[i]);
    System.out.println("");

    // 沒有 Reference
    ref_list = cd.getReference("FAT");
    for (int i=0; i<ref_list.length; i++)
      System.out.println("Refs: " + ref_list[i]);
    System.out.println("");

    // configure 不存在
    ref_list = cd.getReference("configure");
    for (int i=0; i<ref_list.length; i++)
      System.out.println("Refs: " + ref_list[i]);
    System.out.println("");

    String[] char_list = cd.getDictionaryList();
    for (int i=0; i<char_list.length; i++)
      System.out.print(char_list[i] + ", ");
    System.out.println("");
    System.out.println("");

    // 測試圖片是否存在
    String pic_name = "1.44MB" + ".jpg";
    String path = "e:/Inetpub/wwwroot/Infomgn/ComDictionary/images/";
    boolean exist = cd.PictureExist(path, pic_name);
    System.out.println("Pic Exist:" + exist);

    cd.CloseConnection();
  }

  public static void ShowData(String[][] data)
  {
    int rows = data.length;
    // int cols = data[0].length;
    int cols = 3;

    for (int j=0; j<rows; j++)
    {
      String msg = "[" + (j+1) + "]: ";
      for (int k=0; k<cols; k++)
      {
        msg += data[j][k];
        msg += (k<cols-1) ? ", " : "";
      }
      System.out.println(msg);
    }
    System.out.println("");
  }
}