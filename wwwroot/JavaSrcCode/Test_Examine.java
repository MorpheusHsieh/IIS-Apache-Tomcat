import TrueFalse;
import myMath;

public class Test_Examine
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\Java\\Src\\Examine.ini";
    TrueFalse tf = new TrueFalse(ini_file);

    String sqlstr = "select * From TrueFalse Order By Title";
    int result = tf.getResults(sqlstr);

    System.out.println("總資料筆數: " + tf.Records());
    System.out.println("每頁有多少筆記錄: " + tf.RecordsPerPage());
    System.out.println("最後一頁有多少筆記錄: " + tf.RecordsInLastPage());
    System.out.println("總共有多少頁: " + tf.Pages());

    int[] array = tf.FirstPage();
    String[][] data = tf.getData(array);
    Show(data);


/*
    myMath mm = new myMath();
    int rows = tf.Records();
    int size = tf.RecordsPerPage();
    int[] array = mm.getRandomNumber(rows, size);
    mm.BubbleSort(array);
    String[][] data = tf.getData(array);
    Show(data);
*/
    array = tf.FirstPage();
    data = tf.getData(array);
    String msg = "";
    for (int i=0; i<array.length; i++)
    {
      msg = data[i][0] + ", " + data[i][1];
      System.out.println(msg);
    }

/*
    int[] ans = { 1,1,1,1,1,1,1,0,1,1 };
    int score = tf.getScore(array, ans);
    System.out.println("Score: " + score);

    String[][] title = tf.ErrorQuestion();
    int err_rows = array.length - score;
    for (int i=0; i<err_rows; i++)
      System.out.println(title[i][0] + ": " + title[i][1] + ", " + title[i][2]);

    title = tf.CorrectQuestion();
    System.out.println("");
    for (int i=0; i<score; i++)
      System.out.println(title[i][0] + ": " + title[i][1] + ", " + title[i][2]);

    int[] array = tf.FirstPage();
    String[][] data = tf.getData(array);
    Show(data);

    array = tf.GotoPage(7);
    data = tf.getData(array);
    Show(data);

    array = tf.PrevPage();
    data = tf.getData(array);
    Show(data);

    array = tf.NextPage();
    data = tf.getData(array);
    Show(data);

    array = tf.LastPage();
    data = tf.getData(array);
    Show(data);
*/
    tf.CloseConnection();

  }

  public static void Show(String[][] data)
  {
    String msg = "";
    for (int i=0; i<data.length; i++)
    {
      msg = data[i][0] + ", " + data[i][1];
      System.out.println(msg);
    }
    System.out.println("");
  }
}