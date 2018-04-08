import java.sql.*;
import JdbcConn03;

public class Member03 extends JdbcConn03
{
  // �ܼ�
  private String _File = null;        // ini �ɪ���m

  // Table ����ܼ�
  private String[] _WorkNo = null;    // �u�@�N��
  private String[] _NickName = null;  // �ʺ�
  private String[] _Password = null;  // �K�X
  private int[] _RoleCode = null;     // ����N��
  private boolean[] _Pass = null;     // �q�L�{�b�P�_

  // �غc�l
  public Member03()
  {
    this._File = "c:\\Java\\Src\\Member03.ini";
    this.MakingConnection(this._File);
  }
  public Member03(String file)
  {
    this._File = file;
    // Connection
    this.MakingConnection(file);
  }

  // Method
  public String WorkNo(int idx) { return this._WorkNo[idx]; }
  public String NickName(int idx) { return this._NickName[idx]; }
  public String Password(int idx) { return this._Password[idx]; }
  public int RoleCode(int idx) { return this._RoleCode[idx]; }
  public boolean Pass(int idx) { return this._Pass[idx]; }

  // �s�W�@����� ----------------------------------------------------------------
  public int InsertRow(String wk, String nn, String pw)
  {
    int rowAdded = this.InsertRecord(wk, nn, pw, 99, false);
    return rowAdded;
  }

  public int InsertRow(String wk, String nn, String pw, int rc)
  {
    int rowAdded = this.InsertRecord(wk, nn, pw, rc, false);
    return rowAdded;
  }

  public int InsertRow(String wk, String nn, String pw, int rc, boolean pass)
  {
    int rowAdded = this.InsertRecord(wk, nn, pw, rc, pass);
    return rowAdded;
  }

  public int InsertRecord(String wk, String nn, String pw, int rc, boolean pass)
  {
    String sqlstr = "INSERT INTO Account "
                  + " (WorkNo, NickName, Password, RoleCode, Pass)"
                  + " VALUES('" + wk + "','"
                  + nn + "','"
                  + pw + "', "
                  + rc + ", "
                  + pass + ")";
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �d�ߤ@����� ---------------------------------------------------------------
  public int DeleteRecord(String field_name, String data)
  {
    String sqlstr = "DELETE FROM Account WHERE "
                  + field_name + "='" + data + "'";
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // ���ʤ@����� ----------------------------------------------------------------
  public int UpdateRecord(String search_field, String search_data,
                           String replace_field, String replace_data)
  {
    String sqlstr = "UPDATE Account SET "
                  + replace_field + "='" + replace_data + "' WHERE "
                  + search_field + "='" + search_data + "'";
    int result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �d�ߩҦ���� ----------------------------------------------------------------
  public void QueryAll()
  {
    // executeQuery
    String sqlstr = "SELECT * FROM Account";
    this.ExecuteQuery(sqlstr);

    // getResultSet
    this.getResults();
  }

  // �s����ƶ� -----------------------------------------------------------------
  private void getResults()
  {
    if (this._rs != null)
    {
      int rows = this.Records();
      if (rows != 0)
      {
        // �t�m�O����Ŷ��H�K�x�s�ܼ�
        _WorkNo = null; _WorkNo = new String[rows];      // �u�@�N��
        _NickName = null; _NickName =new String[rows];  // �ʺ�
        _Password = null; _Password =new String[rows];  // �K�X
        _RoleCode = null; _RoleCode = new int[rows];     // ����N��
        _Pass = new boolean[rows];     // �q�L�{�b�P�_

        try
        {
          this._rs.first();
          int row = 0;
          do {
            _WorkNo[row] = this._rs.getString(1);
            _NickName[row] = this._rs.getString(2);
            _Password[row] = this._rs.getString(3);
            _RoleCode[row] = this._rs.getInt(4);
            _Pass[row] = this._rs.getBoolean(5);
            row++;
          } while (this._rs.next());
        }
        catch(SQLException sqle)
        {
          System.err.println("Error in getResults: " + sqle);
        }
      }
    }
  }
}