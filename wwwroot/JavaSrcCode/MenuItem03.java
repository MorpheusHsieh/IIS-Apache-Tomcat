public class MenuItem03
{
  // Variable ------------------------------------------------------------------
  private String _sName = new String();
  private String _sURL = new String();
  private String _sParent = new String();
  private boolean _bNewFrmae = false;

  // Constructor
  public MenuItem03(String name) { this._sName = name; }

  // Method
  public void setURL(String url) { this._sURL = url; }
  public void setParent(String pare) { this._sParent = pare; }
  public void setNewFrame(boolean nf) { this._bNewFrmae = nf; }

  public String getName() { return this._sName; }
  public String getParent() { return this._sParent; }
  public String getURL() { return this._sURL; }
  public boolean getNewFrame() { return this._bNewFrmae; }
}