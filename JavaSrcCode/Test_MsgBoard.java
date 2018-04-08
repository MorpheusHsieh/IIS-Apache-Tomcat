import MsgBoard01;

public class Test_MsgBoard
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\EBoard.ini";
    MsgBoard01 mb01 = new MsgBoard01(ini_file);
    mb01.OpenConnection();

    String sd_code = mb01.getNewSunDayCode();
    String title = "行政室公告系統測試"+ sd_code + "...";
    String content = "沒事...";
    String issueman = "Avatar";

    // 新增一筆公告訊息....
    int result = mb01.NewMessage(title, content, issueman);
    if (result > 0)
      System.out.println("新增公告訊息成功...");
    else
      System.out.println("新增公告訊息失敗...");
    System.out.println("");

    // 更新公告訊息
    title = "行政室公告訊息異動測試" + sd_code + "...";
    content = "沒事,沒事...";
    result = mb01.UpdateContent(sd_code, title, content);
    System.out.println("Update Result: " + result);

    // 查詢公告訊息
    System.out.println("SunDayCode: " + sd_code);
    String[] OneRowData = mb01.QuerySingleMessage(sd_code);
    String msg = "";
    for (int i=0; i<OneRowData.length; i++)
      msg += (OneRowData[i] + ", ");
    System.out.println(msg);

    // 新增一筆附加檔案
    result = mb01.AddAffixFile(sd_code, "File001.txt");
    System.out.println(result);
    if (result > 0)
      System.out.println("新增附加檔案成功...");
    else
      System.out.println("新增附加檔案失敗...");
    System.out.println("");

    // 取得所有的附加檔案清單
    String[] affix_list = mb01.getAffixFileList(sd_code);
    if (affix_list != null)
      System.out.println("Affix file length: " + affix_list.length);
//    for (int i=0; i<affix_list.length; i++)
//      System.out.println(affix_list[i]);

/*
    // 刪除一筆附加檔案
    result = mb01.DeleteAffixFile(sd_code, "File001.txt");
    if (result > 0)
      System.out.println("刪除附加檔案成功...");
    else
      System.out.println("刪除附加檔案失敗...");
    System.out.println("");

    // 刪除一筆公告訊息....
    result = mb01.DeletetContent(sd_code);
    if (result > 0)
      System.out.println("刪除公告訊息成功...");
    else
      System.out.println("刪除公告訊息失敗...");
    System.out.println("");
*/

/*
    mb01.setRecordsPerPage(10);
    mb01.QueryAllMessage();

    mb01.GotoPage(1);
    String[][] data = mb01.getOnePageRecord();
    System.out.println("Data Length: " + data.length);
    for (int i=0; i<data.length; i++)
    {
      String outstr = "";
      for (int j=0; j<data[i].length; j++)
        outstr += (data[i][j] + ", ");
      System.out.println((i+1)+": "+outstr);
    }
    System.out.println("總資料筆數："+mb01.getRecords());
    System.out.println("每頁資料錄數："+mb01.getRecords());
    System.out.println("共有多少頁："+mb01.getRecords());
    System.out.println("");


    // 取出回應單位的資料
    String[][] ReplyDepts = mb01.getReplyUser();
    System.out.println("Reply Dept count: " + ReplyDepts.length);
    for (int i=0; i<ReplyDepts.length; i++)
    {
      String outstr = "";
      for (int j=0; j<ReplyDepts[i].length; j++)
        outstr += (ReplyDepts[i][j] + ", ");
      System.out.println(outstr);
    }
    System.out.println("");

    // 取出附加檔案
    String[][] AffixFile = mb01.getAffixFiles();
    System.out.println("Affix files num: " + AffixFile.length);
    for (int i=0; i<AffixFile.length; i++)
    {
      String outstr = "";
      for (int j=0; j<AffixFile[i].length; j++)
        outstr += (AffixFile[i][j] + ", ");
      System.out.println(outstr);
    }
    System.out.println("");

    // 新增回應訊息
    sd_code = "2002225003";
    String user = "技術室";
    content = "新增回應訊息測試...";
    result = mb01.AddReplyMessage(sd_code, user, content);
    if (result>0)
      System.out.println("新增回應訊息成功...");
    else if (result == -1)
      System.out.println("新增回應訊息失敗...");

    // 查詢回應訊息
    content = mb01.getReplyContent(sd_code, user);
    System.out.println(user + " 針對 "+sd_code+" 所回應的訊息為 '"+content+"'");

    // 異動回應訊息
    content = "異動回應訊息測試...";
    result = mb01.UpdateReplyContent(sd_code, user, content);
    if (result > 0)
      System.out.println("異動回應訊成功...");
    else
      System.out.println("異動回應訊失敗...");

    // 刪除回應訊息
    sd_code = "2002225003";
    user = "技術室";
    result = mb01.DeleteReplyContent(sd_code, user);
    if (result > 0)
      System.out.println("刪除回應訊成功...");
    else
      System.out.println("刪除回應訊失敗...");


    result = mb01.DeletetContent(sd_code);
    if (result > 0)
      System.out.println("刪除訊息成功...");
    else
      System.out.println("刪除訊息成功...");
*/
    mb01.CloseConnection();
  }
}