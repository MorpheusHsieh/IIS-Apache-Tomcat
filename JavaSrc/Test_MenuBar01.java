import MenuBar01;

public class Test_MenuBar01
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\java\\src\\MenuBar.ini";
    MenuBar01 mb01 = new MenuBar01(ini_file);

    // 取出第零層元素的範例
    MenuItem[] mi = mb01.getZeroLayerItem();
    int zy_cnt = mi.length;
    for (int i=0; i<zy_cnt; i++)
      System.out.println("Layer["+i+"]: " + mi[i].getName());
    System.out.println("");

    // 取出第一層元素的範例
    MenuItem[][] mi_01 = mb01.getFirstLayerItem();
    zy_cnt = mi_01.length;
    for (int i=0; i<zy_cnt; i++)
    {
      int fy_cnt = mi_01[i].length;
      //System.out.println("[" + i + "] -- " + fy_cnt);
      for (int j=0; j<fy_cnt; j++)
        System.out.println("Layer["+((i+1)*10+(j+1))+"]: "+mi_01[i][j].getName());
      System.out.println("");
    }

    // 取出第二層元素的範例
    MenuItem[][][] mi_02 = mb01.getSecondLayerItem();
    zy_cnt = mi_02.length;
    for (int i=0; i<zy_cnt; i++)
    {
      int fy_cnt = mi_02[i].length;
      for (int j=0; j<fy_cnt; j++)
      {
        int sy_cnt = mi_02[i][j].length;
        for (int k=0; k<sy_cnt; k++)
          System.out.println("Layer["+((i+1)*100+(j+1)*10+k+1)+"]: "+mi_02[i][j][k].getName());
      }
      System.out.println("");
    }

    // 取出第三層元素的範例
    MenuItem[][][][] mi_03 = mb01.getThirdLayerItem();
    zy_cnt = mi_03.length;
    for (int i=0; i<zy_cnt; i++)
    {
      int fy_cnt = mi_03[i].length;
      for (int j=0; j<fy_cnt; j++)
      {
        int sy_cnt = mi_03[i][j].length;
        for (int k=0; k<sy_cnt; k++)
        {
          int ty_cnt = mi_03[i][j][k].length;
          for (int l=0; l<ty_cnt; l++)
            System.out.println("Layer["+((j+1)*100+(k+1)*10+l+1)+"]: "
              + mi_03[i][j][k][l].getName());
        }
      }
      System.out.println("");
    }
    System.out.println("");

  }
}