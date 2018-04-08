import MultiChoice;
import myMath;

public class Test_ExamChoice
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\Examine.ini";
    MultiChoice mc = new MultiChoice(ini_file);

    String sqlstr = "select * From MultiChoice Order By Title";
    int result = mc.getResults(sqlstr);

    System.out.println("�`��Ƶ���: " + mc.Records());
    System.out.println("�C�����h�ֵ��O��: " + mc.RecordsPerPage());
    System.out.println("�̫�@�����h�ֵ��O��: " + mc.RecordsInLastPage());
    System.out.println("�`�@���h�֭�: " + mc.Pages());

    myMath mm = new myMath();
    int rows = mc.Records();
    int size = mc.RecordsPerPage();
    int[] array = mm.getRandomNumber(rows, size);
    mm.BubbleSort(array);
    String[][] data = mc.getData(array);
    Show(data);
  }

  public static void Show(String[][] data)
  {
    String msg = "";
    for (int i=0; i<data.length; i++)
    {
      msg = data[i][0] + ", " + data[i][1];
      System.out.println(msg);
      msg = data[i][2] + ", " + data[i][3];
      System.out.println(msg);
      msg = data[i][4] + ", " + data[i][5];
      System.out.println(msg);
    }
    System.out.println("");
  }
}