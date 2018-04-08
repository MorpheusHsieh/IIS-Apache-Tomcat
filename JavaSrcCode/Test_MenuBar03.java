import MenuUnit03;

public class Test_MenuBar03
{
  public static void main(String[] args)
  {
    String ini_file = "C:\\Java\\Src\\Infomgn.ini";
    MenuBar03 mb03 = new MenuBar03(ini_file);
    mb03.ReadItemInfomationFromTable();
    int layers = mb03.Layers();
    System.out.println("Layers: " + layers);
    System.out.println("");

    System.out.println("主選單");
    MenuUnit03[] main_mnu = mb03.getMainMenu();
    ShowUnit(main_mnu);

    for (int i=1; i<mb03.Layers(); i++)
    {
      MenuUnit03[] sub = mb03.getSubMenu(i);
      System.out.println("子選單[" + i + "]");
      ShowUnit(sub);
      System.out.println("");
    }
  }

  public static void ShowUnit(MenuUnit03[] mu)
  {
    for (int i=0; i<mu.length; i++)
    {
      System.out.println("Name: " + mu[i].getName()
        + ", Layer: " + mu[i].Layer()
        + ", Col: " + mu[i].getCol()
        + ", Row: " + mu[i].getRow());
      MenuItem03[] mi = mu[i].getMenuItems();
      for (int j=0; j<mi.length; j++)
      {
        System.out.println("  '" + mi[j].getName() + "', '" + mi[j].getParent()
          + "', '" + mi[j].getURL() + "', '" + mi[j].getNewFrame() + "'");
      }
      System.out.println("");
    }
  }
}