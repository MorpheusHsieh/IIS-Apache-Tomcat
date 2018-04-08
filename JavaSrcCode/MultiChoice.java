import java.sql.*;
import JdbcConnection;

public class MultiChoice extends JdbcConnection
{
  // Variable
  private int[] _Answer = null;
  private String[] _Title = null;
  private String[][] _Choice = null;
  private String[][] _Data = null;

  // Constructor
  public MultiChoice(String ini_file)
  {
    this.MakingConnection(ini_file);
  }

  // Method
  public int Answer(int idx) { return this._Answer[idx]; }
  public String Title(int idx) { return this._Title[idx]; }
  public String[] Choice(int idx)
  {
    String[] data = new String[4];
    for (int i=0; i<data.length; i++)
      data[i] = this._Choice[idx][i];
    return data;
  }

  // getScore ------------------------------------------------------------------
  public int getScore(int[] titles, int[] ans)
  {
    int score = 0;
    int rows = titles.length;
    for (int i=0; i<rows; i++)
    {
      int row = titles[i]-1;
      score += (this._Answer[row] == ans[i]) ? 1 : 0;
    }
    return score;
  }

  // getResulrs ----------------------------------------------------------------
  public int getResults(String sqlstr)
  {
    int rows = -1;      // 先假設一定失敗，如果成功則會傳回正值(>0)
    ResultSet rs = this.ExecuteQuery(sqlstr); // 執行 SQL 指令
    rows = this.Records(); // 如果 SQL 指令成功則 result 為資料筆數
    if (rows > 0)
    {
      // 配置足夠的空間給 _Data 變數
      _Answer = null; _Title = null; _Choice = null;
      _Answer = new int[rows];
      _Title = new String[rows];
      _Choice = new String[rows][4];

      try
      {
        rs.first();
        int row = 0;
        do {
          _Answer[row] = rs.getInt("Answer");
          _Title[row] = rs.getString("Title");
          _Choice[row][0] = rs.getString("Choice01");
          _Choice[row][1] = rs.getString("Choice02");
          _Choice[row][2] = rs.getString("Choice03");
          _Choice[row][3] = rs.getString("Choice04");
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
  public String[][] getData(int[] ques_num)
  {
    int row, rows = ques_num.length;
    _Data = null;
    _Data = new String[rows][6];
    for (int i=0; i<rows; i++)
    {
      row = ques_num[i] - 1; // 在題目編號陣列中從1開始索引，但 data 陣列從 0 開始索引
      _Data[i][0] = String.valueOf(this._Answer[row]);
      _Data[i][1] = this._Title[row];
      _Data[i][2] = this._Choice[row][0];
      _Data[i][3] = this._Choice[row][1];
      _Data[i][4] = this._Choice[row][2];
      _Data[i][5] = this._Choice[row][3];
    }
    return this._Data;
  }
}