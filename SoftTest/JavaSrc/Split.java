public class Split
{
  // Variable
  private int _size;
  private int _array[] = null;

  // Constructor
  public Split(String str)
  {
    _size = Size(str, ",");
    _array = new int[_size];
    _array = StartSplit(str, ",");
  }

  public Split(String str, String mark)
  {
    _size = Size(str, mark);
    _array = new int[_size];
    _array = StartSplit(str, mark);
  }

  // Method
  public int Size() { return _size; }
  public int[] toArray() { return _array; }

  private int Size(String str, String mark)
  {
    int array_size = 0, start = 0, posi = 0, end = str.length();
    String tmp_str = str;

    int result;
    do {
      result = tmp_str.indexOf(mark);
      if (result != -1)
      {
        posi += (result + 1);
        array_size += 1;
        tmp_str = str.substring(posi, end);
      }
    } while(result>0);
    array_size++;
    return array_size;
  }

  private int[] StartSplit(String str, String mark)
  {
    int cnt = 0, sz = _size;
    int array[] = new int [sz];
    int start=0, posi = 0, end = str.length(), locate;
    String tmp_str = str;
    do
    {
      locate = tmp_str.indexOf(mark);
      if (locate != -1)
      {
        posi += (locate+1);
        array[cnt++] = Integer.parseInt(tmp_str.substring(0,locate).trim());
        tmp_str = str.substring(posi, end);
      }
      else
      {
        array[cnt++] = Integer.parseInt(tmp_str.trim());
      }
    } while (locate>0);
    return array;
  }
}