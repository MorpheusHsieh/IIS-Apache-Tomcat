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
<head><title>�t�κ޲z �w ��ƪ���</title></head>
<body>

�ڬO��ܸ�ƪ�����...<br>

<form name="TableSelected" method="post" action="TableSelect.jsp">

  <!-- �Ѻ޲z�̿����ƪ��U�ԲM�� -->  
  �п�ܸ�ƪ�G<SELECT name="TableName">
  <option></option>
  <%
    String[] tbl_list = tm.getTableList();
    int rows = tbl_list.length;
    for (int i=0; i<rows; i++)
      out.print("<option value='" + tbl_list[i] + "'>" + tbl_list[i] + "</option>");
  %>
  </SELECT>
  <input type="submit" name="Send" value="�e�X��ƪ�W��">
  </table>
  
</form>

<form name="ShowField" method="post" action="TableSelect.jsp">

  <hr>
  <%
    String tbl_name = request.getParameter("TableName");
    String send = request.getParameter("Send");
    if (tbl_name != null)
    {
      out.print(tbl_name + " ��ƪ���컡���A");
      out.print("�Y���W�٬��^��̫h��� DescribeField ���S��������T�C<br><br>");
    }  
    
    if (send != null && send.equals("�e�X��ƪ�W��"))
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
      <a href="Insert.jsp?TableName=<%=tbl_name%>">�s�@�W</a>
      <a href="Erase.jsp?TableName=<%=tbl_name%>">�R�@��</a>
      <a href="Query.jsp?TableName=<%=tbl_name%>">�d�@��</a>
      <a href="Modify.jsp?TableName=<%=tbl_name%>">�ס@��</a>
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















