<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>
<head><title>登入網頁所需要的等級</title></head>
<body>

<%
  boolean exist = session.isNew();
  if (exist)
  {
    String workno = (String)session.getAttribute("WorkNo");
    if (workno == null)
      response.sendRedirect("");
    int nRolecode = Integer.parseInt((String)session.getAttribute("RoleCode"));
  }  

%>

</body>

</html>
