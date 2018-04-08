<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="java.util.Date"%>

<html>

<head><title>Reset Session</title></head>

<body>

  <%
    if (!session.isNew())  // 判斷 Session 是否為新的
    {
      session.invalidate();  // 強制中斷 Session 物件
      out.print("此 Session 物件<font color=blue>非新增</font>的物件，已強制中斷...<br>");
    }
    else
      out.print("此 Session 物件為<font color=red>新增</font>的物件.<br>");
      
    response.sendRedirect("./login.htm");
  %>

</body>

</html>
