<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String sID = (String)session.getAttribute("ID");
  String sName = (String)session.getAttribute("UserName");
  String sRoleName = (String)session.getAttribute("RoleName");
%>


<html>

<head>
  <title>����^�ֺި�t�Ϊ��\����</title>
  <base target="main">
</head>

<body>

<form name="frmMenu" method="post" action="Menu.jsp">

  <%
    String outstr = "";
    if (sID == null && sName == null && sRoleName == null)
      outstr = "<p><a href=\"Login/Login.htm\">�n�J</a></p>";
    else
      out.print("<p><a href=\"/DocManager/Utility/ResetSession.jsp\">�n�X</a></p>");
    out.print(outstr);  
  %>
  <p><a href="Login/NewAccount.htm">�b���ӽ�</a></p>

  

  <p><a href="GetCookie.jsp">Cookies</a></p>

  

</form>


</body>

</html>