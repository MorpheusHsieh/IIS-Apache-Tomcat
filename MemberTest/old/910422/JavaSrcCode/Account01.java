import java.sql.*;
import JdbcConn05;

public class Account01 extends JdbcConn05
{
  // private
  String _sWorkNo = null;
  String _sPassword = null;
  int _nRoleCode = -1;

  // Constructor
  public Account01(String ini_file)
  {
    MakingConnection(ini_file);
  }

  // Method
  // 判斷密碼是否正確 ------------------------------------------------------------
  public int CheckPassword(String workno, String passwd)
  {
    int result = -1;
    String sqlstr = "SELECT * FROM Account WHERE WorkNo='" + workno + "'";
    result = ExecuteQuery(sqlstr);
    if (result == 0)
      result = -1;
    else if(result > 0)
    {
      // 先找出 Password 在 Account 資料表中的第幾個欄位
      int field_num = FindFieldSequenceNumber("Password");

      // 接著比密碼是否正確？
      String[] row_data = getRowData(0);
      if (row_data[field_num].equals(passwd))
        result = 1;
      else
        result = 0;
    }
    return result;
  }

  // 尋找某個 field 是在 table 中的第幾個位置
  private int FindFieldSequenceNumber(String field_name)
  {
    int result = -1;

    String[] all_fields = FieldNames();
    int cols = all_fields.length;
    for (int i=0; i<cols; i++)
    {
      if (all_fields[i].equals(field_name))
      {
        result = i;
        break;
      }
    }
    return result;
  }

  // 新增帳號 -------------------------------------------------------------------
  public int NewAccount(String workno, String passwd, String que, String ans)
  {
    int rolecode = 99; // 角色編號預設 99 為臨時帳號
    String sqlstr = "INSERT INTO Account(WorkNo, Password, RoleCode, "
                  + "Question, Answer) Values('"
                  + workno + "','"
                  + passwd + "', "
                  + rolecode + ",'"
                  + que + "','"
                  + ans + "')";
    int result = ExecuteUpdate(sqlstr);
    return result;
  }

  // 刪除帳號 -------------------------------------------------------------------
  public int DeleteAccount(String workno)
  {
    String sqlstr = "DELETE FROM Account WHERE WorkNo='"
                  + workno + "'";
    int result = ExecuteUpdate(sqlstr);
    return result;
  }

  // 修改密碼 -------------------------------------------------------------------
  // 回傳 -1 表示帳號不存在, 回傳 0 表示密碼錯誤, 回傳 1 表示成功
  public int ChangePassword(String workno, String old_pswd, String new_pswd)
  {
    int result = -1;
    result = CheckPassword(workno, old_pswd);
    if (result > 0)
    {
      String sqlstr = "UPDATE Account SET Password='"
                    + new_pswd + "' WHERE WorkNo='"
                    + workno + "'";
      result = this.ExecuteUpdate(sqlstr);
    }
    return result;
  }

  // 修改角色權限 ----------------------------------------------------------------
  public int UpdateRoleCode(String workno, int rolecode)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET RoleCode="
                  + rolecode + " WHERE WorkNo='"
                  + workno + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 修改問題 -------------------------------------------------------------------
  public int UpdateQuestion(String workno, String ques)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET Question='"
                  + ques + "' WHERE WorkNo='"
                  + workno + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 修改答案 -------------------------------------------------------------------
  public int UpdateAnswer(String workno, String ans)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET Answer='"
                  + ans + "' WHERE WorkNo='"
                  + workno + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // 查詢帳號 -------------------------------------------------------------------
  public String[] Query(String workno)
  {
    String[] data = null;
    String sqlstr = "SELECT * FROM Account WHERE WorkNo='" + workno + "'";
    int result = this.ExecuteQuery(sqlstr);
    data = this.getRowData(0);
    return data;
  }

  // 查詢角色權限 ----------------------------------------------------------------
  public int RoleCode(String workno)
  {
    int result = -1;
    String sqlstr = "SELECT * FROM Account WHERE WorkNo='" + workno +"'";
    result = this.ExecuteQuery(sqlstr);
     if (result == 0)
      result = -1;
    else if(result > 0)
    {
      // 先找出 Password 在 Account 資料表中的第幾個欄位
      int field_num = FindFieldSequenceNumber("RoleCode");

      // 取出角色權限
      String[] row_data = getRowData(0);
      result = Integer.parseInt(row_data[field_num]);
    }
    return result;
  }
}