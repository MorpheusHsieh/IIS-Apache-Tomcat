<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String workno = (String)session.getAttribute("WorkNo");

  int rolecode = -1;
  if (workno != null)
   rolecode = Integer.parseInt((String)session.getAttribute("RoleCode"));
%>

<html>
<head><title>�ӤH��ƺ޲z���</title></head>
<body>

<%
  switch(rolecode)
  {
    case 1:
    case 2:
      response.sendRedirect("../Manager/TableSelect.jsp");
      //out.print("<p>�ӤH�򥻸�ƺ޲z</p>");
      //out.print("<a href='New.jsp'>�s�W</a><br>");
      //out.print("<a href='Modify.jsp'>�ק�</a><br>");
      //out.print("<a href='Query.jsp'>�d��</a><br>");
      //out.print("<a href='Erase.jsp'>�R��</a><br>");            
      break;
    case 3:
      response.sendRedirect("./Edit.jsp");
      break;
    case 99: 
      out.print("�Ь��޲z�H���}��z���v��...<br>");
      break;
    case -1:
      out.print("�z�|���n�J���t��...<br>");
      break;
    default: 
      out.print("�o�ͨt�ιw�Ƥ��~������...<br>");
  }
%>

</body>

</html>