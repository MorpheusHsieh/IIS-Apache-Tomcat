import java.io.*;

public class MySession
{
  private String _sWorkno = null;
  private String _sRolecode = null;

  // �غc�l
  public MySession() {}

  // �x�s Session �ݩ�
  public void setWorkNo(String workno) {
    this._sWorkno = workno;
  }

  public void set(String workno) {
    this._sWorkno = workno;
  }

  // ���X Session �ݩ�
  public String getWorkNo() { return this._sWorkno; }
}