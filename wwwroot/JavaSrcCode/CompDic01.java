import java.io.*;
import JdbcConn06;

public class CompDic01 extends JdbcConn06
{
  // Variable
  String _sTitle = null;
  String _sName = null;
  String _sFullEnglish = null;
  String _sComment = null;
  String[] _sReference = null;
  String[] _sPictures = null;

  // Constructor
  public CompDic01(String ini_file)
  {
    this.MakingConnection(ini_file);
  }

  // Method
  public String getTitle() { return this._sTitle; } // ���X���D
  public String getName() { return this._sName; }   // ���X����W��
  public String getFullEnglish() { return this._sFullEnglish; } // ���X�^����W
  public String getComment() { return this._sComment; } // ���X����

  // ���X�Ҧ��� Reference -------------------------------------------------------
  public String[] getReference(String title)
  {
    String[] ref_list = null;

    boolean exist = this.getDictionaryInfo(title);
    if (exist)
    {
      String sqlstr = "SELECT CD_Reference FROM Reference WHERE CD_Title='" + title + "'";
      int rows = this.ExecuteQuery(sqlstr);
      if (rows > 0)
      {
        ref_list  = new String[rows];
        for (int i=0; i<rows; i++)
        {
          String[] data = this.getRowData(i);
          ref_list[i] = data[0];
        }
      }
      else
      {
        ref_list = new String[1];
        ref_list[0] = Integer.toString(rows);
      }
    }
    else
    {
      ref_list = new String[1];
      ref_list[0] = Integer.toString(-1);
    }
    return ref_list;
  }

  // ���չϤ��O�_�s�b ------------------------------------------------------------
  public boolean PictureExist(String path, String pic_name)
  {
    File pic = new File(path, pic_name);
    return pic.exists();
  }

  // ���X�Ҧ��� Dictionary ��ƪ��Ҧ���T ---------------------------------------
  private boolean getDictionaryInfo(String title)
  {
    boolean exist = false;
    String sqlstr = "SELECT * FROM Dictionary WHERE CD_Title='" + title + "'";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      String[] data = this.getRowData(0);  // ���p�d�ߨ�1�ӥH�W����T�A�N����1��
      this._sTitle = data[0];
      this._sName = data[1];
      this._sFullEnglish = data[2];
      this._sComment = data[3];
      exist = true;
    }
    return exist;
  }

  // ���X Dictionary �����ƪ���1�ӭ^��r�� ----------------------------------------
  public String[] getDictionaryList()
  {
    String[] char_list = null;
    String sqlstr = "SELECT CD_Title FROM Dictionary ORDER BY CD_Title";
    int recs = this.ExecuteQuery(sqlstr);

    // ���t�m�@�өM�d�߬����P�ˤj�p���O����Ŷ��A�]���r�����������|�W�L���ƥ�
    int rows = this.getRecords();
    String[] all_list = new String[rows];

    // �}�l�p��쩳���h�֭Ӥ����ƪ��r���]�u���Ĥ@�Ӧr���^
    int cnt = 0, cnt_of_char = 0;
    String old_first_char = "", new_first_char = "";
    do {
      String[] str = this.getRowData(cnt++);
      new_first_char = str[0].substring(0,1);
      if (!new_first_char.equals(old_first_char))
      {
        old_first_char = new_first_char;
        all_list[cnt_of_char++] = old_first_char.toUpperCase();
      }
    } while(cnt < recs);

    // �t�m�������O����Ŷ��s��Ĥ@�Ӧr��
    char_list = new String[cnt_of_char];
    for (int i=0; i<cnt_of_char; i++)
      char_list[i] = all_list[i];
    return char_list;
  }
}