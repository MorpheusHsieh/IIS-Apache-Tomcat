<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="TableManager"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
  if (workno == null)
    response.sendRedirect("../Title.htm");
%>

<%
  String ini_file = request.getRealPath("/") + "MemberTest\\Manager\\Manager.ini";
  TableManager tm = new TableManager(ini_file);
%>  

<html>
<head><title>系統管理 ─ 資料表選擇</title></head>
<body>

我是選擇資料表的頁面...<br>

<form name="TableSelected" method="post" action="TableSelect.jsp">

  <!-- 供管理者選取資料表的下拉清單 -->  
  請選擇資料表：<SELECT name="TableName">
  <option></option>
  <%
    String[] tbl_list = tm.getTableList();
    int rows = tbl_list.length;
    for (int i=0; i<rows; i++)
      out.print("<option value='" + tbl_list[i] + "'>" + tbl_list[i] + "</option>");
  %>
  </SELECT>
  <input type="submit" name="Send" value="送出資料表名稱">
  </table>
  
</form>

<form name="ShowField" method="post" action="TableSelect.jsp">

  <hr>
  <%
    String tbl_name = request.getParameter("TableName");
    String send = request.getParameter("Send");
    if (tbl_name != null)
    {
      out.print(tbl_name + " 資料表的欄位說明，");
      out.print("若欄位名稱為英文者則表示 DescribeField 中沒有該欄位資訊。<br><br>");
    }  
    
    if (send != null && send.equals("送出資料表名稱"))
    {
    %>
      <center>
      <table border="1">
      <%
        String[][] field_desc = tm.getFieldDescription(tbl_name);

        String outstr = "";
        for (int i=0; i<field_desc.length; i++)
        {
          out.print("<tr>");
          outstr = (field_desc[i][2] == null) ? field_desc[i][1] : field_desc[i][2];
          out.print(" <td>" + outstr + "</td>");
          out.print(" <td>" + field_desc[i][3] + "</td>");
          out.print("</tr>");        
        }
      %>
      </table>
      <br>
      <a href="Insert.jsp?TableName=<%=tbl_name%>">新　增</a>
      <a href="Erase.jsp?TableName=<%=tbl_name%>">刪　除</a>
      <a href="Query.jsp?TableName=<%=tbl_name%>">查　詢</a>
      <a href="Modify.jsp?TableName=<%=tbl_name%>">修　改</a>
      </center>
      <hr>
    <%
    }
  %>
</form>
<%
  tm.CloseConnection();
%>
</body>

</html>















