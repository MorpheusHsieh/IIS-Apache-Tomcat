import MenuBar;

public class Test_MenuBar
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\java\\src\\MenuBar.ini";
    MenuBar mb = new MenuBar(ini_file);

    String[] mmenu = mb.getMainMenuText();
    for (int i=0; i<mmenu.length; i++)
    {
      System.out.println("MainMenu Text: " + mmenu[i]);
      String[] smenu = mb.getSubMenuText(mmenu[i]);
      String[] smenu_url = mb.getSubMenuURL(mmenu[i]);
      for (int j=0; j<smenu.length; j++)
      {
        System.out.println("  SubText: " + smenu[j] + " --> " + smenu_url[j]);
      }
      System.out.println("");
    }
  }
}