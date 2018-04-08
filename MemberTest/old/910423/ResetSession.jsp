<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  // 如果 Session 不是新的，就將Session設為無效
  if (! session.isNew())
  {
    session.invalidate();
    out.print("此 Session 物件非新增的物件，已經強制中斷...");
  }
  else
    out.print("此 Session 物件為新增的物件.");
  response.sendRedirect("Message.jsp");  
%>
