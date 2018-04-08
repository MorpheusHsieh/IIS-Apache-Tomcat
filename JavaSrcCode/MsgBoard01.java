import JdbcConn07;
import myDate;

public class MsgBoard01 extends JdbcConn07
{
  /****************************************************************************
   * Variable
   ****************************************************************************/
  private String _sIniFile = null;
  private String _sSunDayCode = null;
  private String _sTitle = null;
  private String _sContent = null;
  private String _sIssueMan = null;
  private String _sIssueTime = null;
  private int _sReplyCount = -1;
  private String[][] _sReplyDept = null;
  private String[] _sAffixFile = null;

  /****************************************************************************
   * Consructor
   ****************************************************************************/
  public MsgBoard01(String ini_file) { this._sIniFile = ini_file; }

  // �}�ҳs�u -------------------------------------------------------------------
  public void OpenConnection()
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, "MsgTitle");
  }

  public void OpenConnection(String conf_name)
  {
    String ini_file = this._sIniFile;
    this.MakingConnection(ini_file, conf_name);
  }

  /****************************************************************************
   * Method
   ****************************************************************************/
  public String getSunDayCode() { return this._sSunDayCode; }  // ���o�Ӷ���y����
  public String getTitle() { return this._sTitle; }            // ���o���i�T�����D
  public String getContent() { return this._sContent; }        // ���o���i���e
  public String getIssueMan() { return this._sIssueMan; }      // ���o�o��H
  public String getIssueTime() { return this._sIssueTime; }    // ���o�o�G�ɶ�
  public String[][] getReplyUser() { return this._sReplyDept; }// ���o�^�����
  public String[] getAffixFileList() { return this._sAffixFile; }// ���o�^�����

  // �s�W���i�T�� ---------------------------------------------------------------
  public int NewMessage(String title, String content, String issueman)
  {
    int rows = -1;

    String sundaycode = this.getNewSunDayCode();
    // �N�T���g�J��Ʈw
    String sqlstr = "INSERT INTO MsgTitle(ME_SunDayCode, Title, Content, IssueMan)"
           +" Values('" + sundaycode + "','"
           + title + "','"
           + content + "','"
           + issueman + "')";
    rows = this.ExecuteUpdate(sqlstr);
    return rows;
  }

  // �p��s�T�����Ӷ���y���� -----------------------------------------------------
  public String getNewSunDayCode()
  {
    String sundaycode = null;

    // �H�~���M�Ӷ���A�[�y�����@�����޽X
    myDate md = new myDate();
    String sun_cdoe = md.SunDayCode();

    // �j�M��Ʈw�����w�g���h�ֵ��T���o��,�̦h�i�H��999��
    String sqlstr = "SELECT ME_SunDayCode FROM MsgTitle"
                  + " WHERE ME_SunDayCode LIKE '" + sun_cdoe + "%'"
                  + " ORDER BY ME_SunDayCode";
    int rows = this.ExecuteQuery(sqlstr);

    // �P�w�Ӷ���Ǹ�����, �p�G��Ʈw�O�Ū��h�Ǹ��� 0
    int iLastNum = -1;
    if (rows > 0)
    {
      String[] data = this.getRowData(rows-1);
      String sLastNum = data[0].substring(7,data[0].length());
      iLastNum = Integer.parseInt(sLastNum);
    }
    else
      iLastNum = 0;

    // ���ͷ��d�����y����...
    String sNum = Integer.toString(iLastNum+1);
    while (sNum.length() < 3) sNum = ("0" + sNum);
    sundaycode = sun_cdoe + sNum;
    return sundaycode;
  }

  // �d�ߩҦ��T�� ---------------------------------------------------------------
  public int QueryAllMessage()
  {
    String sqlstr = "";
    sqlstr = "SELECT MT.ME_SunDayCode, MT.Title, MT.IssueMan, MT.IssueDate, "
           + "IIf(IsNull([VRC.ReplyCount]),0,[VRC.ReplyCount]) "
           + "FROM MsgTitle AS MT LEFT JOIN VIEW_ReplyCount AS VRC "
           + "ON MT.ME_SunDayCode=VRC.ME_SunDayCode ORDER By MT.IssueDate DESC";
    int rows = this.ExecuteQuery(sqlstr);
    return rows;
  }
  // �d�߳浧���i�ƶ� ------------------------------------------------------------
  public String[] QuerySingleMessage(String sundaycode)
  {
    String[] data = null;
    String sqlstr = "";
    sqlstr = "SELECT MT.ME_SunDayCode, MT.Title, MT.Content, MT.IssueMan, "
           + "MT.IssueDate, IIf(IsNull([VRC.ReplyCount]),0,[VRC.ReplyCount]) "
           + "FROM MsgTitle AS MT LEFT JOIN VIEW_ReplyCount AS VRC "
           + "ON MT.ME_SunDayCode = VRC.ME_SunDayCode "
           + "WHERE MT.ME_SunDayCode='" + sundaycode + "'";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows>0)
    {
      data = this.getRowData(0);
      this._sSunDayCode = data[0];
      this._sTitle = data[1];
      this._sContent = data[2];
      this._sIssueMan = data[3];
      this._sIssueTime = data[4];
      this._sReplyCount = Integer.parseInt(data[5]);
      this._sReplyDept = this.setReplyaUser(this._sSunDayCode);
      this._sAffixFile = this.setAffixFile(this._sSunDayCode);
    }
    else
    {
      data = new String[1];
      data[0] = "Not Found...";
    }
    return data;
  }

  // �ھڤӶ��䪺�y�������X�^�����M�� --------------------------------------------
  private String[][] setReplyaUser(String sd_code)
  {
    String[][] data = null;
    String sqlstr = "SELECT ME_SunDayCode, RP_UserName, RP_Content, RP_DateTime "
                  + "FROM MsgReply WHERE ME_SunDayCode='" + sd_code + "'";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      data = new String[rows][];
      for (int i=0; i<rows; i++)
      {
        String[] rowdata = this.getRowData(i);
        data[i] = new String[rowdata.length];
        for (int j=0; j<rowdata.length; j++)
          data[i][j] = rowdata[j];
      }
    }
    return data;
  }

  // �ھڤӶ��䪺�y�������X���[�ɮײM�� ---------------------------------------------
  private String[] setAffixFile(String sd_code)
  {
    String[] data = null;
    String sqlstr = "SELECT AffixFile FROM MsgAffixFile "
                  + "WHERE ME_SunDayCode='" + sd_code + "'";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      data = new String[rows];
      for (int i=0; i<rows; i++)
      {
        String[] rowdata = this.getRowData(i);
        data[i] = rowdata[0];
      }
    }
    return data;
  }

  // ���ʤ��i�T�������D�Τ��e -----------------------------------------------------
  public int UpdateContent(String sd_code, String title, String content)
  {
    int result = -1;
    String sqlstr = "UPDATE MsgTitle SET Title='" + title + "', Content='"
                  + content + "' WHERE ME_SunDayCode='" + sd_code + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �P�_�O�_�w�g�^�� ------------------------------------------------------------
  public boolean getReplyStatus(String sd_code, String user)
  {
    boolean result = false;;
    String sqlstr = "SELECT RP_UserName FROM MsgReply "
                  + "WHERE ME_SunDayCode='" + sd_code + "'";
    int rows = this.ExecuteQuery(sqlstr);
    // �P�_�O�_�w�g�o��L�^��
    if (rows > 0)
    {
      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i);
        if (user.equals(data[0]))
        {
          result = true;
          break;
        }
      }
    }
    return result;
  }

  // �s�W�U���^���T�� ----------------------------------------------------------
  public int AddReplyMessage(String sd_code, String user, String content)
  {
    int result = -1;
    boolean bReplyStatus = this.getReplyStatus(sd_code, user);

    // �p�G�٨S���o��^���h�s�W�^��
    if (!bReplyStatus)
    {
      String sqlstr = "INSERT INTO MsgReply(ME_SunDayCode, RP_UserName, "
                    + "RP_Content) Values('" + sd_code
                    + "','" + user + "','" + content + "')";
      result = this.ExecuteUpdate(sqlstr);
    }
    return result;
  }

  // �d�ߦ^���T�� ----------------------------------------------------------------
  public String getReplyContent(String sd_code, String user)
  {
    String msg = null;
    String sqlstr = "SELECT RP_Content FROM MsgReply WHERE ME_SunDayCode='"
                  + sd_code + "' AND RP_UserName='" + user + "'";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      String[] data = this.getRowData(0);
      msg = data[0];
    }
    return msg;
  }

  // ���ʦ^���T�������e ----------------------------------------------------------
  public int UpdateReplyContent(String sd_code, String user, String content)
  {
    int result = -1;
    String sqlstr = "UPDATE MsgReply SET RP_Content='" + content
                  + "' WHERE ME_SunDayCode='" + sd_code + "' AND "
                  + "RP_UserName='" + user + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �R���^���T�� ---------------------------------------------------------------
  public int DeleteReplyContent(String sd_code, String user)
  {
    int result = -1;
    String sqlstr = "DELETE FROM MsgReply WHERE ME_SunDayCode='" + sd_code
                  + "' AND RP_UserName='" + user + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �R�����i�T�� ---------------------------------------------------------------
  public int DeletetContent(String sd_code)
  {
    int result = -1;
    String sqlstr = "DELETE FROM MsgTitle WHERE ME_SunDayCode='"+sd_code+"'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �s�W���[�ɮ� ----------------------------------------------------------------
  public int AddAffixFile(String sd_code, String filename)
  {
    int result = -1;
    //���d�ߪ��[�ɮ׬O�_�s�b
    result = this.QueryAffixFileExist(sd_code, filename);
    if (result == 0)
    {
      String sqlstr = "INSERT INTO MsgAffixFile(ME_SunDayCode, AffixFile) "
                    + "Values('" + sd_code + "','" + filename + "')";
      result = this.ExecuteUpdate(sqlstr);
    }
    return result;
  }

  // �R�����[�ɮ� ---------------------------------------------------------------
  public int DeleteAffixFile(String sd_code, String filename)
  {
    int result = -1;
    String sqlstr = "DELETE FROM MsgAffixFile WHERE ME_SunDayCode='" + sd_code
                  + "' AND AffixFile='" + filename + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �d�ߪ��[�ɮ� ---------------------------------------------------------------
  public String[] getAffixFileList(String sd_code)
  {
    String[] filelist = null;
    String sqlstr = "SELECT ME_SunDayCode, AffixFile FROM MsgAffixFile "
                  + "WHERE ME_SunDayCode='" + sd_code + "'";
    int rows = this.ExecuteQuery(sqlstr);
    if (rows > 0)
    {
      filelist = new String[rows];
      for (int i=0; i<rows; i++)
      {
        String[] data = this.getRowData(i) ;
        filelist[i] = data[1];
      }
    }
    return filelist;
  }

  // �d�߬O�_�w�g�����[�ɮ� -------------------------------------------------------
  public int QueryAffixFileExist(String sd_code, String filename)
  {
    int result = -1;
    String sqlstr = "SELECT ME_SunDayCode, AffixFile FROM MsgAffixFile "
                  + "WHERE ME_SunDayCode='" + sd_code
                  + "' AND AffixFile='" + filename + "'";
    result = this.ExecuteQuery(sqlstr);
    return result;
  }

}