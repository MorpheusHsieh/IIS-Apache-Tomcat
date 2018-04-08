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
  // �P�_�K�X�O�_���T ------------------------------------------------------------
  public int CheckPassword(String workno, String passwd)
  {
    int result = -1;
    String sqlstr = "SELECT * FROM Account WHERE WorkNo='" + workno + "'";
    result = ExecuteQuery(sqlstr);
    if (result == 0)
      result = -1;
    else if(result > 0)
    {
      // ����X Password �b Account ��ƪ����ĴX�����
      int field_num = FindFieldSequenceNumber("Password");

      // ���ۤ�K�X�O�_���T�H
      String[] row_data = getRowData(0);
      if (row_data[field_num].equals(passwd))
        result = 1;
      else
        result = 0;
    }
    return result;
  }

  // �M��Y�� field �O�b table �����ĴX�Ӧ�m
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

  // �s�W�b�� -------------------------------------------------------------------
  public int NewAccount(String workno, String passwd, String que, String ans)
  {
    int rolecode = 99; // ����s���w�] 99 ���{�ɱb��
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

  // �R���b�� -------------------------------------------------------------------
  public int DeleteAccount(String workno)
  {
    String sqlstr = "DELETE FROM Account WHERE WorkNo='"
                  + workno + "'";
    int result = ExecuteUpdate(sqlstr);
    return result;
  }

  // �ק�K�X -------------------------------------------------------------------
  // �^�� -1 ��ܱb�����s�b, �^�� 0 ��ܱK�X���~, �^�� 1 ��ܦ��\
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

  // �ק﨤���v�� ----------------------------------------------------------------
  public int UpdateRoleCode(String workno, int rolecode)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET RoleCode="
                  + rolecode + " WHERE WorkNo='"
                  + workno + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �ק���D -------------------------------------------------------------------
  public int UpdateQuestion(String workno, String ques)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET Question='"
                  + ques + "' WHERE WorkNo='"
                  + workno + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �קﵪ�� -------------------------------------------------------------------
  public int UpdateAnswer(String workno, String ans)
  {
    int result = -1;
    String sqlstr = "UPDATE Account SET Answer='"
                  + ans + "' WHERE WorkNo='"
                  + workno + "'";
    result = this.ExecuteUpdate(sqlstr);
    return result;
  }

  // �d�߱b�� -------------------------------------------------------------------
  public String[] Query(String workno)
  {
    String[] data = null;
    String sqlstr = "SELECT * FROM Account WHERE WorkNo='" + workno + "'";
    int result = this.ExecuteQuery(sqlstr);
    data = this.getRowData(0);
    return data;
  }

  // �d�ߨ����v�� ----------------------------------------------------------------
  public int RoleCode(String workno)
  {
    int result = -1;
    String sqlstr = "SELECT * FROM Account WHERE WorkNo='" + workno +"'";
    result = this.ExecuteQuery(sqlstr);
     if (result == 0)
      result = -1;
    else if(result > 0)
    {
      // ����X Password �b Account ��ƪ����ĴX�����
      int field_num = FindFieldSequenceNumber("RoleCode");

      // ���X�����v��
      String[] row_data = getRowData(0);
      result = Integer.parseInt(row_data[field_num]);
    }
    return result;
  }
}