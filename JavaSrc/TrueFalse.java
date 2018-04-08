import java.sql.*;
import JdbcConnection;

public class TrueFalse extends JdbcConnection
{
  // Variable
  private int[] _Answer = null;
  private String[] _Title = null;
  private String[][] _Data = null;

  // Constructor
  public TrueFalse(String ini_file)
  {
    this.MakingConnection(ini_file);
  }

  // Method
  public int Answer(int idx) { return this._Answer[idx]; }
  public String Title(int idx) { return this._Title[idx]; }

  // getScore ------------------------------------------------------------------
  public int getScore(int[] titles, int[] ans)
  {
    int score = 0;
    int rows = titles.length;
    for (int i=0; i<rows; i++)
    {
      int row = titles[i] - 1;
      score += (this._Answer[row] == ans[i]) ? 1 : 0;
    }
    return score;
  }

  // getResulrs ----------------------------------------------------------------
  public int getResults(String sqlstr)
  {
    int rows = -1;      // �����]�@�w���ѡA�p�G���\�h�|�Ǧ^����(>0)
    ResultSet rs = this.ExecuteQuery(sqlstr); // ���� SQL ���O
    rows = this.Records(); // �p�G SQL ���O���\�h result ����Ƶ���
    if (rows > 0)
    {
      // �t�m�������Ŷ��� _Data �ܼ�
      _Answer = null; _Title = null;
      _Answer = new int[rows];
      _Title = new String[rows];

      try
      {
        rs.first();
        int row = 0;
        do {
          _Answer[row] = rs.getInt("Answer");
          _Title[row] = rs.getString("Title");
          row++;
        } while(rs.next());
      }
      catch(SQLException sqle)
      {
        System.err.println("Error in getResults: " + sqle);
      }
    }
    return rows;
  }

  // getFirstPageRecord---------------------------------------------------------
  // �ǵ���Ƥ@�Ӿ�ư}�C�A��Ƥ@�}�C���e���X�������D�ضǦ^
  public String[][] getData(int[] ques_num)
  {
    int row, rows = ques_num.length;
    _Data = null;
    _Data = new String[rows][2];
    for (int i=0; i<rows; i++)
    {
      row = ques_num[i] - 1; // �b�D�ؽs���}�C���q1�}�l���ޡA�� data �}�C�q 0 �}�l����
      _Data[i][0] = String.valueOf(this._Answer[row]);
      _Data[i][1] = this._Title[row];
    }
    return this._Data;
  }
}