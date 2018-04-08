import MenuBar02;

public class Test_MenuBar02
{
  public static void main(String[] args)
  {
    int iRoleCode = 99;
    String ini_file = "c:\\java\\src\\MenuBar.ini";
    MenuBar02 mb02 = new MenuBar02(ini_file, iRoleCode);
    MenuItem[] main_itm = mb02.getMainMenuItem();  // 取出主選單的選項

    if (main_itm[0].getName().equals("-1"))
      System.out.println("SQL查詢命令錯誤...");
    else if (main_itm[0].getName().equals("0"))
    {
      mb02.CloseConnection();
      mb02 = null;
      mb02 = new MenuBar02(ini_file);
      main_itm = null;
      main_itm = mb02.getMainMenuItem();
    }

    // 取出主選單的選項測試程式
    for (int i=0; i<main_itm.length; i++)
    {
      String name = main_itm[i].getName();
      System.out.println("Name: " + name);
    }
    System.out.println("");

    // 取出主選單視窗的資料
    MenuUnit[] main_mnu = mb02.getMainMenu();
    int main_mnu_cnt = main_mnu.length;
    for (int i=0; i<main_mnu_cnt; i++)
    {
      MenuItem[] mi = main_mnu[i].getMenuItems();

      int layer = main_mnu[i].getLayer();
      int col = main_mnu[i].getCol();
      int row = main_mnu[i].getRow();
      System.out.println("Layer: "+layer+", Row: "+row+", Col: "+col);

      int unit_cnt = mi.length;
      for (int j=0; j<unit_cnt; j++)
      {
        String name = mi[j].getName();
        System.out.println("  " + name);
      }
      System.out.println("");
    }

    // 取出第一層子選單的資訊
    MenuUnit[] sub_mnu = mb02.getSubMenu(main_mnu, 1);
    for (int i=0; i<sub_mnu.length; i++)
    {
      MenuItem[] mi = sub_mnu[i].getMenuItems();
      System.out.println("SubMenu1[" + i + "]");
      int layer = sub_mnu[i].getLayer();
      int col = sub_mnu[i].getCol();
      int row = sub_mnu[i].getRow();
      System.out.println("Layer: "+layer+", Row: "+row+", Col: "+col);

      for (int j=0; j<mi.length; j++)
        System.out.println(mi[j].getName());
      System.out.println("");
    }

    // 取出第二層子選單的資訊
    MenuUnit[] sub_mnu2 = mb02.getSubMenu(sub_mnu, 2);
    for (int i=0; i<sub_mnu2.length; i++)
    {
      MenuItem[] mi = sub_mnu2[i].getMenuItems();
      System.out.println("SubMenu2[" + i + "]");
      int layer = sub_mnu2[i].getLayer();
      int col = sub_mnu2[i].getCol();
      int row = sub_mnu2[i].getRow();
      System.out.println("Layer: "+layer+", Row: "+row+", Col: "+col);

      for (int j=0; j<mi.length; j++)
        System.out.println(mi[j].getName());
      System.out.println("");
    }
  }
}