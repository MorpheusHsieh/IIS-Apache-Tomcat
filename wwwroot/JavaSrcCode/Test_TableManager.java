import TableManager;

public class Test_TableManager
{
  public static void main(String[] args)
  {
    String ini_file = "c:\\java\\src\\TableManager.ini";
    TableManager tm = new TableManager(ini_file);
    String[] tables = tm.getTableList();
    ShowTableList(tables);

    String table_name = tables[0];
    System.out.println("此次選擇的資料表：" + table_name);
    System.out.println("");

    System.out.println("實際欄位資訊");
    String[] fields = tm.getFieldListFromTable(table_name);
    String[] field_type = tm.getFieldTypes();
    for (int i=0; i<fields.length; i++)
      System.out.println(fields[i] + ": " + field_type[i]);
    System.out.println("");

    System.out.println("在 DescibeField 資料表中未建立欄位的清單");
    String[][] field_desc = tm.getFieldDescription(table_name);

    int rows = field_desc.length;
    int cols = field_desc[0].length;
    String msg = "";
    for (int i=0; i<rows; i++)
    {
      msg = "";
      for (int j=0; j<cols; j++)
      {
        msg += field_desc[i][j];
        msg += (j<cols-1) ? ", " : "";
      }
      System.out.println(msg);
    }
    System.out.println("");

    rows = fields.length;
    table_name = tables[0];
    field_desc = tm.getFieldDescription(table_name);
    String[][] insert_data = new String[rows][2];
    for (int i=0; i<rows; i++)
      insert_data[i][0] = field_desc[i][1];

    insert_data[0][1] = "aaaa";
    insert_data[1][1] = "aaaa";
    insert_data[2][1] = "99";
    insert_data[3][1] = "aaa";
    insert_data[4][1] = "aaa";
    insert_data[5][1] = "04/28/2002";

    int result = tm.Insert(table_name, insert_data);
    System.out.println(result);

    tm.CloseConnection();
  }

  // 顯示所有資料表名字清單 -------------------------------------------------------
  public static void ShowTableList(String[] data)
  {
    int rows = data.length;
    for (int i=0; i<rows; i++)
      System.out.println(data[i]);
    System.out.println("");
  }
}