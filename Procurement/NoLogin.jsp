<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <title>還未登入系統訊息</title>
</head>

<body>


<form name="frmGetMesg" method="get">
  <%
    String strMesg = request.getParameter("Mesg");
    out.print(strMesg);
  %>
</form>

</body>

</html>