import java.io.*;

class myConfigUnit
{
  // Variable
  private String _sName = "";
  private String[] _sParameter = null;
  private String[] _sValue = null;

  // Construct
  public myConfigUnit(String name, int num)
  {
    this._sName = name;
    this._sParameter = new String[num];
    this._sValue = new String[num];
  }

  // Method
  public String Name() { return this._sName; } // ���X�W�r

  // �g�J�� ---------------------------------------------------------------------
  public void setParameter(String para, String value, int idx)
  {
    this._sParameter[idx] = para;
    this._sValue[idx] = value;
  }

  // �̾ڰѼƷj�M�������� ---------------------------------------------------------
  public String Search(String para)
  {
    String value_str = "Not match...";
    int len = this._sParameter.length;
    for (int i=0; i<len; i++)
    {
      if (para.equalsIgnoreCase(this._sParameter[i]))
      {
        value_str = this._sValue[i];
        break;
      }
    }
    return value_str;
  }

  // �N�Ҧ����պA�]�w�ഫ���G�}�C --------------------------------------------------
  public String[][] getAllConfig()
  {
    int len = this._sParameter.length;
    String[][] data = new String[len+1][];
    for (int i=0; i<=len; i++)
    {
      data[i] = new String[2];
      if (i > 0)
      {
        data[i][0] = new String(this._sParameter[i-1]);
        data[i][1] = new String(this._sValue[i-1]);
      }
      else if (i ==0)
      {
        data[0][0] = new String(this._sName);
        data[0][1] = new String(this._sName);
      }
    }
    return data;
  }
}

public class myConfigFile
{
  // Variable
  File _file = null;
  private String[] _sLineStr = null;
  private myConfigUnit[] _myConf = null;

  // Construct
  public myConfigFile(String ini_file)
  {
    this._file = new File(ini_file);
    this._sLineStr = this.getConfigLineString();
    this._myConf = this.LineListSplitToConfigStruct();
  }

  // Method
  public String[] ReadConfigFile() { return this._sLineStr; }
  public myConfigUnit[] ReadConfigList() { return this._myConf; }

  // �N�պA�ɮפ����Ҧ����e�g�J _LineStr �ܼƤ� ------------------------------------
  private String[] getConfigLineString()
  {
    String[] line_list = null;
    int read_ahead_limit = (int)this._file.length() + 1;
    try
    {
      BufferedReader inBuf = new BufferedReader(new FileReader(this._file));
      inBuf.mark(read_ahead_limit);

      int line_num = 0, conf_num = 0;
      String inLineStr = "";
      while((inLineStr = inBuf.readLine()) != null)
      {
        line_num++;
        int right_idx = -1, left_idx = inLineStr.indexOf('[');
        if (left_idx == 0)
          conf_num += ((right_idx=inLineStr.indexOf(']'))>0) ? 1 : 0;
      }
      line_list = new String[line_num];
      inBuf.reset();

      // ���X�պA�ɮפ��Ҧ����C���
      line_num = 0;
      while((inLineStr = inBuf.readLine()) != null)
        line_list[line_num++] = inLineStr;
    }
    catch(IOException ie)
    {
      System.err.println("Error in getConfigString: " + ie);
    }
    return line_list;
  }

  // �N�պA�ɮפ����Ҧ���Ƽg�J�պA���c��
  public myConfigUnit[] LineListSplitToConfigStruct()
  {
    myConfigUnit[] mcs = null;
    int TotalLineNum = this._sLineStr.length;  // ���X�պA�]�w�ɦ��h�ֵ��r����

    // ���p�⦳�X�ղպA
    int conf_num = 0, line_cnt = 0;
    while (line_cnt < TotalLineNum)
    {
      String str = this._sLineStr[line_cnt++];
      int right_idx = -1, left_idx = str.indexOf('[');
      if (left_idx == 0)
        conf_num += ((right_idx=str.indexOf(']'))>0) ? 1 : 0;
    }
    mcs = new myConfigUnit[conf_num];
    int[] conf_lines = new int[conf_num];

    // �p��C�ӲպA�U���h�֦C���
    line_cnt = 0;
    String name = "";
    int conf_cnt = 0, conf_line_cnt = 0;
    boolean conf_write = false;
    while (line_cnt < TotalLineNum)
    {
       String str = this._sLineStr[line_cnt++];
       int left_idx = str.indexOf('[');
       int right_idx = str.indexOf(']');
       if (left_idx == 0 && right_idx > 0)
       {
         name = str.substring(left_idx+1, right_idx);
         conf_write = true;
       }
       else if(conf_write && str.trim().length() > 0)
         conf_line_cnt++;
       else if(conf_write && str.trim().length() == 0)
       {
         mcs[conf_cnt++] = new myConfigUnit(name, conf_line_cnt);
         conf_line_cnt = 0;
         conf_write = false;
       }
    }

    // �N��Ʃ�J�պA�]�w��
    line_cnt = 0; conf_cnt = 0; conf_line_cnt = 0;
    conf_write = false;
    while (line_cnt < TotalLineNum)
    {
       String str = this._sLineStr[line_cnt++];
       int left_idx = str.indexOf('[');
       int right_idx = str.indexOf(']');
       if (left_idx == 0 && right_idx > 0)
       {
         name = str.substring(left_idx+1, right_idx);
         conf_write = true;
       }
       else if(conf_write && str.trim().length() > 0)
       {
         int posi = str.indexOf('=');
         int end = str.indexOf(';');
         String para_str = str.substring(0, posi);
         String value_str = str.substring(posi+1, end);
         mcs[conf_cnt].setParameter(para_str, value_str, conf_line_cnt);
         conf_line_cnt++;
       }
       else if(conf_write && str.trim().length() == 0)
       {
         conf_cnt++;
         conf_line_cnt = 0;
         conf_write = false;
       }
    }
    return mcs;
  }
}
