
  <form action="<%=ActionFile%>" name="frmSelectTable" method="post">
  <%  
    Account01 ac = new Account01(ini_file);
    String sqlstr = "SELECT TBL_Title FROM TableList";
    int tbl_cnt = ac.ExecuteQuery(sqlstr);
  %>

    請選擇您要查詢的帳號：<SELECT name="TableName">
    <option selected></option>
    <%
      for (int row=0; row<tbl_cnt; row++)
      {
        String[] data = ac.getRowData(row);
        out.print("<option>"+data[0]+"</option>");
      }
      ac.CloseConnection();
    %>
    </Select>
    <input type="submit" name="Send" value="送出資料表名稱"> 
  </form>