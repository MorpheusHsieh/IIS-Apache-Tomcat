import JdbcConn07;

public class CompDict02 extends JdbcConn07
{
  // Variable
  private String _sIniFile = null;                          // 組態結構檔案的位置
  private String _sSQLstr = null;                           // 查詢命令

  private String[] _sTitle = null;                          // 英文標題
  private String[] _sName = null;                           // 中文名稱
  private String[] _sFullEnglish = null;                    // 英文全名
  private String[] _sComment = null;                        // 中文解釋內容
  private String[][] _sReference = null;                    // 參考項目
  private String[][] _sPicture = null;                      // 附圖
  private String[][] _sAttrIndex = null;                    // 分類

  // Constructor
  public CompDict02(String ini_file) { this._sIniFile = ini_file; }

  // 開啟連線 -------------------------------------------------------------------
  public void OpenConnection()
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, "CompDict02");
  }
  public void OpenConnection(String conf_name)
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, conf_name);
  }


  // Method
  public String[] getTitle() { return this._sTitle; }             // 取出標題
  public String[] getName() { return this._sName; }               // 取出中文名稱
  public String[] getFullEnglish() { return this._sFullEnglish; } // 取出英文全名
  public String[] getComment() { return this._sComment; }         // 取出註解說明
  public String[][] getReference() { return this._sReference; }   // 取出參考項目
  public String[][] getPicture() { return this._sPicture; }       // 取出圖片
  public String[][] getAttrIndex() { return this._sAttrIndex; }   // 取出分類索引

  // 以標題為查詢條件從資料表中找出資料
  public int getDictionaryInfomation(String title)
  {
    int result = -1;
    String sqlstr = "SELECT CD_Title, CD_Name, CD_FullEnglish, CD_Comment "
                  + "FROM Dictionary";
    sqlstr += (title != null) ? (" WHERE CD_Title='"+title+"'") : "";
    result = this.ExecuteQuery(sqlstr);
    if (result > 0)
    {
      int rows = result;
      this._sTitle = new String[rows];
      this._sName = new String[rows];
      this._sFullEnglish = new String[rows];
      this._sComment = new String[rows];
      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        this._sTitle[i] = data[0];
        this._sName[i] = data[1];
        this._sFullEnglish[i] = data[2];
        this._sComment[i] = data[3];
      }
    }
    return result;
  }

  // 取出 Dictionary 資料表中不重複的第一個英文字母
  public String[] getKayList()
  {
    String[] kay_list = null;
    String sqlstr = "SELECT CD_Title FROM Dictionary ORDER BY CD_Tiele";
    int rows = this.ExecuteQuery(sqlstr);

    int cnt = 0;
    String old_ch = null, new_ch = null;
    do {
      String[] data = this.getRowData(cnt++);
      new_ch = data[0].substring(0,1);
    } while(cnt<rows);
    return kay_list;
  }
}