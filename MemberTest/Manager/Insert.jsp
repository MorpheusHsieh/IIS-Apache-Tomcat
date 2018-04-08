<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="TableManager, java.util.*"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
  if (workno == null)
    response.sendRedirect("../Title.htm");
    
  String submit = request.getParameter("Submit");
%>

<html>
<head><title>�ڬO�޲z�H���s�W��ƪ�����</title></head>
<body>

<p>�ڬO�޲z�H���s�W��ƪ�����...</p>

<form name="frmInsert" method="post" action="Insert.jsp">
<%
  String ini_file = request.getRealPath("/") + "MemberTest\\Manager\\Manager.ini";
  TableManager tm = new TableManager(ini_file);

  String tbl_name = request.getParameter("TableName");
  String[][] field_desc = tm.getFieldDescription(tbl_name);
  
  int rows = field_desc.length;
  
  if (submit != null && submit.equals("�ڭn�s�W�@���O��"))
  {
    String field_name = "";
    String[][] insert_data = new String[rows][2];
    for (int i=0; i<rows; i++)
    {
      field_name = field_desc[i][1];
      insert_data[i][0] = field_name;
      insert_data[i][1] = request.getParameter(field_name);
    }  
    int result = tm.Insert(tbl_name, insert_data);

    String msg = "";
    switch(result)
    {
      case 1:
        msg = "�s�W�@���O�����\";
        break;
      case -1:
        msg = "�s�W�@���O������...";
        break;
    }
    out.print(msg);
  }
  else
  {
  %>
    <p><center>
    �z�{�b�s�誺�O <%=tbl_name%> ��ƪ�<br>
    <table border="1">
    <%
      String outstr = "";
      for (int i=0; i<rows; i++)
      {
        out.print("<tr>");
        outstr = (field_desc[i][2] != null) ? field_desc[i][2] : field_desc[i][1];
        out.print(" <td>" + outstr + "</td>");

        outstr = "<td><input type='text' name='" + field_desc[i][1] + "' ";
        if (field_desc[i][0].equalsIgnoreCase("DATETIME"))
        {
          Date date = new Date();
          int yy = date.getYear() + 1900;
          int mm = date.getMonth() + 1 ;
          int dd= date.getDate();
          outstr += "value= '" + mm + "/" + dd + "/" + yy + "' ";
        }  
        outstr += "size=50></td>";
        out.print(outstr);
        out.print("</tr>");
      }
    %>
    </table>
    <input type="hidden" name="TableName" value="<%=tbl_name%>">
    <input type="submit" name="Submit" value="�ڭn�s�W�@���O��">
    <input type="reset">
    </center></p>
  <%
  }
  tm.CloseConnection();
%> 
  <hr><p><center>
  <a href="Insert.jsp?TableName=<%=tbl_name%>">�s�@�W</a>
  <a href="Erase.jsp?TableName=<%=tbl_name%>">�R�@��</a>
  <a href="Query.jsp?TableName=<%=tbl_name%>">�d�@��</a>
  <a href="Modify.jsp?TableName=<%=tbl_name%>">�ס@��</a>
  </center></p> 
</form>  

</body>

</html>
