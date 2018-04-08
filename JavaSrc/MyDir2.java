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
  // ���X�ثe�ؿ��Ҧ����ɮײM��
  public String[] getAllList()
  {
    String[] flist = this.getAllFileList(null);
    return flist;
  }

  // ���X�ثe�ؿ��U���Ҧ��ɮײM��A�ÿz�����O
  public String[] getAllList(String ext)
  {
    String[] flist = this.getAllFileList(ext);
    return flist;
  }

  // �Ȩ��X�ثe�ؿ��U�Ҧ����ɮ�
  public String[] getFileList()
  {
    String[] flist = this.getFiles(null);

    return flist;
  }

  // �Ȩ��X�ثe�ؿ��U�Ҧ����ɮסA�ÿz�����O
  public String[] getFileList(String ext)
  {
    String[] flist = this.getFiles(ext);
    return flist;
  }

  // �N getFiles �{���X���ƪ��a��g�b�o�̡A�H�F��{���X²��
  private String[] getFiles(String ext)
  {
    String[] all_list = this.getAllFileList(ext);

    // �p��ثe�ؿ������h�֭Ӭ��ɮת���A�ðt�m�������O����Ŷ�
    int files = this.getFileCount(all_list, "File");
    String[] flist = new String[files];

    // ���X�Ҧ����ɮת�����x�s�b�r��}�C��
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

  // �Ȩ��X�ثe�ؿ��U���Ҧ��l�ؿ�
  public String[] getDirList()
  {
    String[] all_list = this.getAllFileList(null);

    // �p��ثe�ؿ������h�֭Ӭ��ɮת���A�ðt�m�������O����Ŷ�
    int dirs = this.getFileCount(all_list, "Dir");
    String[] flist = new String[dirs];

    // ���X�Ҧ����ɮת�����x�s�b�r��}�C��
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

  // ���ެO�ɮשάO�ؿ��A�N�ثe�ؿ��U�Ҧ����ɮ׶Ǧ^
  private String[] getAllFileList(String ext)
  {
    String[] list = null;
    String path = this._sPath;
    File fpath = new File(path); // �H�ثe�ؿ������|�ӫإ� File ���󪺹��
    if (ext == null)
      list  = fpath.list();
    else
      list = fpath.list(new MyFilter(ext));
    return list;
  }

  // �p���ɮשΥؿ����󦳦h�֭ӡH
  private int getFileCount(String[] all_list, String cls)
  {
    // �p�⦳�h�֭��ɮ�/�ؿ�����
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

  // ���O�ظm�F FilenameFilter
  class MyFilter implements FilenameFilter
  {
    String ext;

    MyFilter(String ext) { this.ext = ext; }

    // �p�G�ɮצW�ٵ������Q�n�����ɦW�K�Ǧ^ true
    public boolean accept(File dir, String name)
    {
      return name.endsWith(ext);
    }
  }
}