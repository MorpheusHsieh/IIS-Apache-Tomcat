import JdbcConn07;

public class CompDict02 extends JdbcConn07
{
  // Variable
  private String _sIniFile = null;                          // �պA���c�ɮת���m
  private String _sSQLstr = null;                           // �d�ߩR�O

  private String[] _sTitle = null;                          // �^����D
  private String[] _sName = null;                           // ����W��
  private String[] _sFullEnglish = null;                    // �^����W
  private String[] _sComment = null;                        // ����������e
  private String[][] _sReference = null;                    // �ѦҶ���
  private String[][] _sPicture = null;                      // ����
  private String[][] _sAttrIndex = null;                    // ����

  // Constructor
  public CompDict02(String ini_file) { this._sIniFile = ini_file; }

  // �}�ҳs�u -------------------------------------------------------------------
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
  public String[] getTitle() { return this._sTitle; }             // ���X���D
  public String[] getName() { return this._sName; }               // ���X����W��
  public String[] getFullEnglish() { return this._sFullEnglish; } // ���X�^����W
  public String[] getComment() { return this._sComment; }         // ���X���ѻ���
  public String[][] getReference() { return this._sReference; }   // ���X�ѦҶ���
  public String[][] getPicture() { return this._sPicture; }       // ���X�Ϥ�
  public String[][] getAttrIndex() { return this._sAttrIndex; }   // ���X��������

  // �H���D���d�߱���q��ƪ���X���
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

  // ���X Dictionary ��ƪ������ƪ��Ĥ@�ӭ^��r��
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