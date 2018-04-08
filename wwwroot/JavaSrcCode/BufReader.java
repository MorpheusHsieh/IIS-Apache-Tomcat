import java.io.*;

public class BufReader
{
  // Variable
  int _size = 0;
  int _readAheadLimit = 2048;  //此處代表可以返回的最大位元數
  String[] _name = null;
  String[] _value = null;
  File _file = null;

  // Constructor
  public BufReader(String filename)
  {
      _file = new File(filename);
      getParameter();
  }

  // Method
  public void ShowParameter()
  {
    int sz = _size;
    for (int i=0; i<sz; i++)
      System.out.println((i+1) + "." + _name[i]);
  }

  private void getParameter()
  {
    int sz = 0;
    try
    {
      BufferedReader inBuf = new BufferedReader(
                             new FileReader(_file));
      inBuf.mark(_readAheadLimit);
      while (inBuf.readLine() != null)
        sz++;
      _size = sz;
      inBuf.reset();
      String[] data = new String[sz];
      _name = new String[sz];
      _value = new String[sz];

      sz = 0;
      String in_str = "";
      while ((in_str = inBuf.readLine()) != null)
        data[sz++] = in_str;
      inBuf.close();

      int posi, end;
      for(int i=0; i<sz; i++)
      {
        posi = data[i].indexOf('=');
        end = data[i].indexOf(';');
        _name[i] = (posi>0) ? data[i].substring(0, posi) : null;
        _value[i] = (end>posi+1) ?data[i].substring(posi+1, end) : null;
      }
    }
    catch(IOException e)
    {
      System.err.println(e);
    }
  }

  public String Search(String name)
  {
    int sz = _size;
    String param = "Nothing";
    for (int i=0; i<sz; i++)
    {
      if (name.equalsIgnoreCase(_name[i]))
      {
        param = _value[i];
        break;
      }
    }
    return param;
  }
}