<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Accnt_EBoard"%>

<%
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
  Accnt_EBoard ae = new Accnt_EBoard(ini_file);
  ae.OpenConnection();  
%>

<html>
<head>
  <title>我是登入檢查程式</title>
</head>

<body>

<p>我是<font color="#0000FF">登入檢查</font>程式...</p>

<%
  String user = request.getParameter("selUserName");
  String pswd = request.getParameter("txtPasswd");

  boolean result = false;
  if (user != null  && pswd != null)
  {
    ae.Query(user);  
    result = (ae.CheckPassword(user, pswd) == 1) ? true : false;
    //out.print("密碼檢查結果："+result +"<br>");
  }
  
  if (result)
  {
    int iRoleCode = ae.getRoleCode();
    String sRoleName = ae.getRoleGroupName();
    String sDept = ae.getDepartment();
    //out.print("角色群組代碼：" + iRoleCode+"<br>");
    //out.print("角色群組名稱：" + sRoleName+"<br>");
    //out.print("部門名稱：" + sDept+"<br>");
    
    session.setAttribute("UserName", user);                        // 將帳號存到 session 物件中
    session.setAttribute("RoleCode", Integer.toString(iRoleCode)); // 將角色群組代號存到 session 物中
    session.setAttribute("Department", sDept);                     // 將部門名稱存到 session 物中    
    response.sendRedirect("MsgBoard.jsp");  
  }
  else
  {
    out.print("密碼錯誤...<br>");
    out.print("<div align=\"center\"><a href=\"Login.jsp\">回登入頁面</a></div>");
  }
  ae.CloseConnection();
%>

</body>
</html>
