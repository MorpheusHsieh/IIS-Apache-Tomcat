public class MenuItem
{
  // Variable
  private String _sName = new String();
  private String _sURL = new String();
  private boolean _bRedirect = false;
  private boolean _Visibility = true;  // 設定此選項是否為可見？

  // Constructor
  public MenuItem() {}
  public MenuItem(String name) { this._sName = name; }

  // Method
  public void setName(String name) { this._sName = name; }
  public void setURL(String url) { this._sURL = url; }
  public void setRedirect(boolean rd) { this._bRedirect = rd; }
  public void setVisibility(boolean vb) { this._Visibility = vb; }

  public String getName() { return this._sName; }
  public String getURL() { return this._sURL; }
  public boolean getRedirect() { return this._bRedirect; }
  public boolean getVisibility() { return this._Visibility; }
}

