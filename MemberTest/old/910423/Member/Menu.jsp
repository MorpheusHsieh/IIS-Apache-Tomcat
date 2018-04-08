<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
  int rolecode = -1;

  if (workno == null)
    out.print("您尚未登入...<br>");
//    response.sendRedirect("index.htm");
  else  
   rolecode = Integer.parseInt((String)session.getAttribute("RoleCode"));
%>

<html>

<head><title>個人資料管理選單</title></head>

<body>

<%
  switch(rolecode)
  {
    case 1: 
    case 2:
      out.print("<p>個人基本資料管理</p>");
      out.print("<a href='New.htm'>新增</a><br>");
      out.print("<a href='Modify.jsp'>修改</a><br>");
      out.print("<a href='Query.jsp'>查詢</a><br>");
      out.print("<a href='Erase.jsp'>刪除</a><br>");            
      break;
    case 3:
      response.sendRedirect("./Edit.jsp");
      break;
    case 99: 
      out.print("請洽管理人員開放您的權限...<br>");
      break;
    default: 
      out.print("發生系統預料之外的情形...<br>");
  }
%>

</body>

</html>
