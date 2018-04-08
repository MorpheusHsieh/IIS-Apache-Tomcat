
public class myMath
{
  // Constructor
  public myMath() {};

  // Method
  public int[] getRandomNumber(int range, int size)
  {
    if (range <= size)
    {
      System.out.println("range small than size...");
      return null;
    }
    else
    {
      boolean result = true;
      int[] array = new int [size];
      for (int i=0; i<size; i++)
      {
        do {
          array[i] = (int)((range+1) * Math.random());
          result =  (array[i] >= 1) ? true : false;
          for (int j=0; j<i; j++)
          {
            if (array[j] == array[i])
            {
              result = false;
              break;
            }
          }
        } while (!result);
      }
      return array;
    }
  }

  // Bubble sort
  public void BubbleSort(int[] sort)
  {
    int tmp;
    int size = sort.length;
    for (int i=0; i<size-1; i++)
    {
      for (int j=i+1; j<size; j++)
      {
       if (sort[j] < sort[i])
       {
       	 tmp = sort[i]; sort[i] = sort[j]; sort[j] = tmp;
       }
      }
    }
  }
}