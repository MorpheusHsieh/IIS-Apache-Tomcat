import MsgBoard01;

public class Test_MsgBoard
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\EBoard.ini";
    MsgBoard01 mb01 = new MsgBoard01(ini_file);
    mb01.OpenConnection();

    String sd_code = mb01.getNewSunDayCode();
    String title = "��F�Ǥ��i�t�δ���"+ sd_code + "...";
    String content = "�S��...";
    String issueman = "Avatar";

    // �s�W�@�����i�T��....
    int result = mb01.NewMessage(title, content, issueman);
    if (result > 0)
      System.out.println("�s�W���i�T�����\...");
    else
      System.out.println("�s�W���i�T������...");
    System.out.println("");

    // ��s���i�T��
    title = "��F�Ǥ��i�T�����ʴ���" + sd_code + "...";
    content = "�S��,�S��...";
    result = mb01.UpdateContent(sd_code, title, content);
    System.out.println("Update Result: " + result);

    // �d�ߤ��i�T��
    System.out.println("SunDayCode: " + sd_code);
    String[] OneRowData = mb01.QuerySingleMessage(sd_code);
    String msg = "";
    for (int i=0; i<OneRowData.length; i++)
      msg += (OneRowData[i] + ", ");
    System.out.println(msg);

    // �s�W�@�����[�ɮ�
    result = mb01.AddAffixFile(sd_code, "File001.txt");
    System.out.println(result);
    if (result > 0)
      System.out.println("�s�W���[�ɮצ��\...");
    else
      System.out.println("�s�W���[�ɮץ���...");
    System.out.println("");

    // ���o�Ҧ������[�ɮײM��
    String[] affix_list = mb01.getAffixFileList(sd_code);
    if (affix_list != null)
      System.out.println("Affix file length: " + affix_list.length);
//    for (int i=0; i<affix_list.length; i++)
//      System.out.println(affix_list[i]);

/*
    // �R���@�����[�ɮ�
    result = mb01.DeleteAffixFile(sd_code, "File001.txt");
    if (result > 0)
      System.out.println("�R�����[�ɮצ��\...");
    else
      System.out.println("�R�����[�ɮץ���...");
    System.out.println("");

    // �R���@�����i�T��....
    result = mb01.DeletetContent(sd_code);
    if (result > 0)
      System.out.println("�R�����i�T�����\...");
    else
      System.out.println("�R�����i�T������...");
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
    System.out.println("�`��Ƶ��ơG"+mb01.getRecords());
    System.out.println("�C����ƿ��ơG"+mb01.getRecords());
    System.out.println("�@���h�֭��G"+mb01.getRecords());
    System.out.println("");


    // ���X�^����쪺���
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

    // ���X���[�ɮ�
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

    // �s�W�^���T��
    sd_code = "2002225003";
    String user = "�޳N��";
    content = "�s�W�^���T������...";
    result = mb01.AddReplyMessage(sd_code, user, content);
    if (result>0)
      System.out.println("�s�W�^���T�����\...");
    else if (result == -1)
      System.out.println("�s�W�^���T������...");

    // �d�ߦ^���T��
    content = mb01.getReplyContent(sd_code, user);
    System.out.println(user + " �w�� "+sd_code+" �Ҧ^�����T���� '"+content+"'");

    // ���ʦ^���T��
    content = "���ʦ^���T������...";
    result = mb01.UpdateReplyContent(sd_code, user, content);
    if (result > 0)
      System.out.println("���ʦ^���T���\...");
    else
      System.out.println("���ʦ^���T����...");

    // �R���^���T��
    sd_code = "2002225003";
    user = "�޳N��";
    result = mb01.DeleteReplyContent(sd_code, user);
    if (result > 0)
      System.out.println("�R���^���T���\...");
    else
      System.out.println("�R���^���T����...");


    result = mb01.DeletetContent(sd_code);
    if (result > 0)
      System.out.println("�R���T�����\...");
    else
      System.out.println("�R���T�����\...");
*/
    mb01.CloseConnection();
  }
}