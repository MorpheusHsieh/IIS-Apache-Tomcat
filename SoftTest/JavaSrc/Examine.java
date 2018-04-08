import java.sql.*;
import java.lang.*;
import JdbcConnection;

public class Examine extends JdbcConnection
{
  // Variable
  int _size = 0;
  int _fields = 0;
  int _totalRec = 0;
  int _titleNum[] = null;
  public String _data[][] = null;
  public String _odbcname = null;
  public ResultSet _rs;

  // Constructor
  public Examine() { Initial(10); }
  public Examine(int sz) { Initial(sz); }
  private void Initial(int sz) { _size = sz; _titleNum = new int[sz+1]; }

  // Method
  public int Size() { return _size; }
  public void Size(int sz) { _size = sz; }
  public int Fields() { return _fields; }
  public int TotalRecords() { return _totalRec; }
  public String OdbcName() { return _odbcname; }
  public void OdbcName(String odbc_name) { _odbcname = odbc_name; }
  public String Data(int col, int row) { return _data[col][row]; }
  public int TitleNum(int idx) { return _titleNum[idx]; }
  public String Title(int idx) { return _data[3][idx]; }
  public int Answer(int idx) { return Integer.parseInt(_data[2][idx]); }

  public void getResults(String sqlstr)
  {
    int sz = _size;
    String odbc_name = OdbcName();

    if (odbc_name == null)
    {
      System.out.println("尚未設定 ODBC 名稱");
    }
    else
    {
      MakingJdbcConnection(odbc_name);
      try
      {
        _rs = _stmt.executeQuery(sqlstr);

        //計算 _data 需要多大的記憶體空間
        ResultSetMetaData rsmd = _rs.getMetaData();
        _fields = rsmd.getColumnCount();
        _data = new String [_fields+1][sz+1];

        //取出欄位名稱放在_data[][0]的位置
        for (int i=1; i<=_fields; i++)
          _data[i][0] = rsmd.getColumnName(i);

        //計算資料表總共有多少筆資料錄
        _rs.last();
        _totalRec = _rs.getRow();

        //以亂數產生題目
        boolean result = true;
        for (int i=1; i<=sz; i++)
        {
          do {
            _titleNum[i] = (int)((_totalRec+1) * Math.random());
            result =  (_titleNum[i] >= 1) ? true : false;
            for (int j=1; j<i; j++)
            {
              if (_titleNum[j] == _titleNum[i])
              {
                result = false;
                break;
              }
            }
          } while (!result);
        }
        BubbleSort(_titleNum);

        _rs.first();
        for (int i=1; i<=sz; i++)
        {
          _rs.absolute(_titleNum[i]);
          for (int j=1; j<=_fields; j++)
            _data[j][i] = _rs.getString(j);
        }
        _rs.close();
      }
      catch(SQLException sqle)
      {
        System.err.println("SQLState:" + sqle.getSQLState());
        System.err.println("Message :" + sqle.getMessage());
      }
      closeConnection();
    }
  }

  public void getResults(String sqlstr, int title_num[])
  {
    _size = title_num.length;
    int sz = _size;
    String odbc_name = OdbcName();

    if (odbc_name == null)
    {
      System.out.println("尚未設定 ODBC 名稱");
    }
    else
    {
      MakingJdbcConnection(odbc_name);
      try
      {
        _rs = _stmt.executeQuery(sqlstr);

        //計算 _data 需要多大的記憶體空間
        ResultSetMetaData rsmd = _rs.getMetaData();
        _fields = rsmd.getColumnCount();
        _data = new String [_fields+1][sz+1];

        //取出欄位名稱放在_data[][0]的位置
        for (int i=1; i<=_fields; i++)
          _data[i][0] = rsmd.getColumnName(i);

        //計算資料表總共有多少筆資料錄
        _rs.last();
        _totalRec = _rs.getRow();

        _rs.first();
        for (int i=1; i<=sz; i++)
        {
          _titleNum[i] = title_num[i-1];
          _rs.absolute(title_num[i-1]);
          for (int j=1; j<=_fields; j++)
            _data[j][i] = _rs.getString(j);
        }
        _rs.close();
      }
      catch(SQLException sqle)
      {
        System.err.println("SQLState:" + sqle.getSQLState());
        System.err.println("Message :" + sqle.getMessage());
      }
      closeConnection();
    }
  }

  // Compare Answer
  public int Score(int test_ans[])
  {
    int acc_ans, score = 0, sz = Size();
    for (int i=1; i<=sz; i++)
    {
      acc_ans = Integer.parseInt(Data(2,i).trim());
      score += (acc_ans == test_ans[i]) ? 1 : 0;
    }
    return score;
  }

  // Bubble sort
  private void BubbleSort(int[] sort)
  {
    int tmp;
    for (int i=1; i<_size; i++)
    {
      for (int j=i+1; j<=_size; j++)
      {
       if (sort[j] < sort[i])
       {
       	 tmp = sort[i]; sort[i] = sort[j]; sort[j] = tmp;
       }
      }
    }
  }
}
