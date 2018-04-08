public class myConfigStruct
{
  // Variable
  private String _sName = "";
  private String[] _sParameter = null;
  private String[] _sValue = null;

  // Construct
  public myConfigStruct(String name, int num)
  {
    this._sName = name;
    this._sParameter = new String[num];
    this._sValue = new String[num];
  }

  // Method
  public String Name() { return this._sName; } // 取出名字

  // 寫入值 ---------------------------------------------------------------------
  public void setParameter(String para, String value, int idx)
  {
    this._sParameter[idx] = para;
    this._sValue[idx] = value;
  }

  // 依據參數搜尋對應的值 ---------------------------------------------------------
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
}