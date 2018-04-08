import java.io.*;

public class myDir
{
  // variable
  private String _sPath = null;
  private String[] _sFile = null;
  private String[] _sDir = null;

  // Constructor
  public myDir(String path)
  {
    this.getFileList(path);
  }

  // Method
  public String getPath() { return this._sPath; }
  public void setPath(String path) { this._sPath = path; }
  public String[] getDirectory() { return this._sDir; }
  public String[] getFileName() { return this._sFile; }

  private void getFileList(String fpath)
  {
    File path = new File(fpath);  // 以目前的目錄為路徑來建立File物件的實例
    String[] flist = path.list();
    //System.out.println("File List count is " + flist.length);

    // 先計算 File 及 Dir 各有多少個
    int files = 0, dirs = 0;
    for (int i=0; i<flist.length; i++)
    {
      File f = new File(fpath, flist[i]);
      if (f.isFile())
        files++;
      else if (f.isDirectory())
        dirs++;
    }

    // 配置足夠的記憶體空間給 _sFile 和 _sDir 變數
    this._sFile = new String[files];
    this._sDir = new String[dirs];

    // 將目前目錄下的所有 File 物件分類，檔案型別放入 _sFile，目錄型別放入 _sDir
    int file_cnt = 0, dir_cnt = 0;
    for (int i=0; i<flist.length; i++)
    {
      File f = new File(fpath, flist[i]);
      if (f.isFile())
        this._sFile[file_cnt++] = flist[i];
      else if (f.isDirectory())
        this._sDir[dir_cnt++] = flist[i];
    }
    //System.out.println("File count is " + file_cnt);
    //System.out.println("Dir count is " + dir_cnt);
  }

  // 類別建置了 FilenameFilter
  class MyFilter implements FilenameFilter
  {
    String ext;

    MyFilter(String ext) { this.ext = ext; }

    // 如果檔案名稱為想要的副檔名便傳回 true
    public boolean accept(File dir, String name)
    {
      return name.endsWith(ext);
    }
  }

}