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
  public String getTitle() { return this._sTitle; } // 取出標題
  public String getName() { return this._sName; }   // 取出中文名稱
  public String getFullEnglish() { return this._sFullEnglish; } // 取出英文全名
  public String getComment() { return this._sComment; } // 取出說明

  // 取出所有的 Reference -------------------------------------------------------
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

  // 測試圖片是否存在 ------------------------------------------------------------
  public boolean PictureExist(String path, String pic_name)
  {
    File pic = new File(path, pic_name);
    return pic.exists();
  }

  // 取出所有的 Dictionary 資料表的所有資訊 ---------------------------------------
  private boolean getDictionaryInfo(String title)
  {
    boolean exist = false;
    String sqlstr = "SELECT * FROM Dictionary WHERE CD_Title='" + title + "'";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      String[] data = this.getRowData(0);  // 假如查詢到1個以上的資訊，就取第1個
      this._sTitle = data[0];
      this._sName = data[1];
      this._sFullEnglish = data[2];
      this._sComment = data[3];
      exist = true;
    }
    return exist;
  }

  // 取出 Dictionary 不重複的第1個英文字母 ----------------------------------------
  public String[] getDictionaryList()
  {
    String[] char_list = null;
    String sqlstr = "SELECT CD_Title FROM Dictionary ORDER BY CD_Title";
    int recs = this.ExecuteQuery(sqlstr);

    // 先配置一個和查詢紀錄同樣大小的記憶體空間，因為字母的種類不會超過此數目
    int rows = this.getRecords();
    String[] all_list = new String[rows];

    // 開始計算到底有多少個不重複的字元（只取第一個字元）
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

    // 配置足夠的記憶體空間存放第一個字元
    char_list = new String[cnt_of_char];
    for (int i=0; i<cnt_of_char; i++)
      char_list[i] = all_list[i];
    return char_list;
  }
}