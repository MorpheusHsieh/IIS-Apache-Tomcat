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
      System.out.println("�����d�߱o�� " + rows + " �����");
    }
    else
      System.out.println("�����d�ߥ���...");

    int total_page = cd.getTotalPages();
    System.out.println("�����d�ߦ@�i���� " +total_page+ " ��");

    int cols = cd.getFields();
    rows = cd.getRecordsInNowPage();
    for (int i=1; i<=total_page; i++)
    {
      System.out.println("�� " + i + " ��");
      String[][] data = cd.getOnePageRecord(i);
      ShowData(data);
    }

    int page = -1;
    cd.FirstPage();
    System.out.println("�� " + page + " ��");
    String[][] data = cd.getOnePageRecord();
    ShowData(data);

    page = cd.NextPage();
    page = cd.NextPage();
    System.out.println("�� " + page + " ��");
    data = cd.getOnePageRecord();
    ShowData(data);

    page = cd.PrevPage();
    System.out.println("�� " + page + " ��");
    data = cd.getOnePageRecord();
    ShowData(data);

    page = cd.LastPage();
    System.out.println("�� " + page + " ��");
    data = cd.getOnePageRecord();
    ShowData(data);

    cd.GotoPage(3);
    System.out.println("�� " + page + " ��");
    data = cd.getOnePageRecord();
    ShowData(data);

    // ��3�� Reference
    String[] ref_list = cd.getReference(".ini file");
    for (int i=0; i<ref_list.length; i++)
      System.out.println("Refs: " + ref_list[i]);
    System.out.println("");

    // �S�� Reference
    ref_list = cd.getReference("FAT");
    for (int i=0; i<ref_list.length; i++)
      System.out.println("Refs: " + ref_list[i]);
    System.out.println("");

    // configure ���s�b
    ref_list = cd.getReference("configure");
    for (int i=0; i<ref_list.length; i++)
      System.out.println("Refs: " + ref_list[i]);
    System.out.println("");

    String[] char_list = cd.getDictionaryList();
    for (int i=0; i<char_list.length; i++)
      System.out.print(char_list[i] + ", ");
    System.out.println("");
    System.out.println("");

    // ���չϤ��O�_�s�b
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