import java.io.*;

public class MySession
{
  private String _sWorkno = null;
  private String _sRolecode = null;

  // 建構子
  public MySession() {}

  // 儲存 Session 屬性
  public void setWorkNo(String workno) {
    this._sWorkno = workno;
  }

  public void set(String workno) {
    this._sWorkno = workno;
  }

  // 取出 Session 屬性
  public String getWorkNo() { return this._sWorkno; }
}