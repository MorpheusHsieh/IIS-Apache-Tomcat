<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>

<%
  String ini_file = request.getRealPath("/") + "MemberTest\\" + "Account01.ini";

  String workno = (String)session.getAttribute("WorkNo");
  if (workno == null)
    response.sendRedirect("index.htm");
%>

<html> 
<head><title>�ӤH��ƺ޲z���</title></head>
<body>

<%! String ActionFile = "Menu.jsp"; %>
<%@ include file ="SelectTable.inc" %>


<% 
/*
  int rolecode = Integer.parseInt((String)session.getAttribute("RoleCode"));

  switch(rolecode)
  {
    case 1: 
    case 2:
      out.print("<p>�ӤH�򥻸�ƺ޲z</p>");
      out.print("<a href='New.htm'>�s�W</a><br>");
      out.print("<a href='Modify.jsp'>�ק�</a><br>");
      out.print("<a href='Query.jsp'>�d��</a><br>");
      out.print("<a href='Erase.jsp'>�R��</a><br>");            
      break;
    case 3:
      response.sendRedirect("./Edit.jsp");
      break;
    case 99: 
      out.print("�Ь��޲z�H���}��z���v��...<br>");
      break;
    default: 
      out.print("�o�ͨt�ιw�Ƥ��~������...<br>");
    }    
  } 
*/  
%>

<p><a href='../Title.jsp'>�^�D�D��</a></p>

</body>
</html>
