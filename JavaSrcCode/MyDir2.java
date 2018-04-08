import java.io.*;

public class MyDir2
{
  // variable
  private String _sPath = null;

  // Constructor
  public MyDir2(String path)
  {
    this._sPath = path;
  }

  // Method
  // 取出目前目錄所有的檔案清單
  public String[] getAllList()
  {
    String[] flist = this.getAllFileList(null);
    return flist;
  }

  // 取出目前目錄下的所有檔案清單，並篩選類別
  public String[] getAllList(String ext)
  {
    String[] flist = this.getAllFileList(ext);
    return flist;
  }

  // 僅取出目前目錄下所有的檔案
  public String[] getFileList()
  {
    String[] flist = this.getFiles(null);

    return flist;
  }

  // 僅取出目前目錄下所有的檔案，並篩選類別
  public String[] getFileList(String ext)
  {
    String[] flist = this.getFiles(ext);
    return flist;
  }

  // 將 getFiles 程式碼重複的地方寫在這裡，以達到程式碼簡化
  private String[] getFiles(String ext)
  {
    String[] all_list = this.getAllFileList(ext);

    // 計算目前目錄中有多少個為檔案物件，並配置足夠的記憶體空間
    int files = this.getFileCount(all_list, "File");
    String[] flist = new String[files];

    // 取出所有的檔案物件並儲存在字串陣列中
    int file_cnt = 0;
    String path = this._sPath;
    for (int i=0; i<all_list.length; i++)
    {
      File f = new File(path, all_list[i]);
      if (f.isFile())
        flist[file_cnt++] = all_list[i];
    }
    return flist;
  }

  // 僅取出目前目錄下的所有子目錄
  public String[] getDirList()
  {
    String[] all_list = this.getAllFileList(null);

    // 計算目前目錄中有多少個為檔案物件，並配置足夠的記憶體空間
    int dirs = this.getFileCount(all_list, "Dir");
    String[] flist = new String[dirs];

    // 取出所有的檔案物件並儲存在字串陣列中
    int dir_cnt = 0;
    String path = this._sPath;
    for (int i=0; i<all_list.length; i++)
    {
      File f = new File(path, all_list[i]);
      if (f.isDirectory())
        flist[dir_cnt++] = all_list[i];
    }
    return flist;
  }

  // 不管是檔案或是目錄，將目前目錄下所有的檔案傳回
  private String[] getAllFileList(String ext)
  {
    String[] list = null;
    String path = this._sPath;
    File fpath = new File(path); // 以目前目錄為路徑來建立 File 物件的實例
    if (ext == null)
      list  = fpath.list();
    else
      list = fpath.list(new MyFilter(ext));
    return list;
  }

  // 計算檔案或目錄物件有多少個？
  private int getFileCount(String[] all_list, String cls)
  {
    // 計算有多少個檔案/目錄物件
    int count = 0;
    String path = this._sPath;
    for (int i=0; i<all_list.length; i++)
    {
      File f = new File(path, all_list[i]);
      if (cls.equals("File"))
        count += (f.isFile()) ? 1 : 0;
      else if (cls.equals("Dir"))
        count += (f.isDirectory()) ? 1 : 0;
    }
    return count;
  }

  // 類別建置了 FilenameFilter
  class MyFilter implements FilenameFilter
  {
    String ext;

    MyFilter(String ext) { this.ext = ext; }

    // 如果檔案名稱結尾為想要的副檔名便傳回 true
    public boolean accept(File dir, String name)
    {
      return name.endsWith(ext);
    }
  }
}