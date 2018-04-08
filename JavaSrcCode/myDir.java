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
    File path = new File(fpath);  // �H�ثe���ؿ������|�ӫإ�File���󪺹��
    String[] flist = path.list();
    //System.out.println("File List count is " + flist.length);

    // ���p�� File �� Dir �U���h�֭�
    int files = 0, dirs = 0;
    for (int i=0; i<flist.length; i++)
    {
      File f = new File(fpath, flist[i]);
      if (f.isFile())
        files++;
      else if (f.isDirectory())
        dirs++;
    }

    // �t�m�������O����Ŷ��� _sFile �M _sDir �ܼ�
    this._sFile = new String[files];
    this._sDir = new String[dirs];

    // �N�ثe�ؿ��U���Ҧ� File ��������A�ɮ׫��O��J _sFile�A�ؿ����O��J _sDir
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

  // ���O�ظm�F FilenameFilter
  class MyFilter implements FilenameFilter
  {
    String ext;

    MyFilter(String ext) { this.ext = ext; }

    // �p�G�ɮצW�٬��Q�n�����ɦW�K�Ǧ^ true
    public boolean accept(File dir, String name)
    {
      return name.endsWith(ext);
    }
  }

}