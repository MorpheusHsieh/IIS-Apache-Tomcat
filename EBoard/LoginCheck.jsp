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
  <title>�ڬO�n�J�ˬd�{��</title>
</head>

<body>

<p>�ڬO<font color="#0000FF">�n�J�ˬd</font>�{��...</p>

<%
  String user = request.getParameter("selUserName");
  String pswd = request.getParameter("txtPasswd");

  boolean result = false;
  if (user != null  && pswd != null)
  {
    ae.Query(user);  
    result = (ae.CheckPassword(user, pswd) == 1) ? true : false;
    //out.print("�K�X�ˬd���G�G"+result +"<br>");
  }
  
  if (result)
  {
    int iRoleCode = ae.getRoleCode();
    String sRoleName = ae.getRoleGroupName();
    String sDept = ae.getDepartment();
    //out.print("����s�եN�X�G" + iRoleCode+"<br>");
    //out.print("����s�զW�١G" + sRoleName+"<br>");
    //out.print("�����W�١G" + sDept+"<br>");
    
    session.setAttribute("UserName", user);                        // �N�b���s�� session ����
    session.setAttribute("RoleCode", Integer.toString(iRoleCode)); // �N����s�եN���s�� session ����
    session.setAttribute("Department", sDept);                     // �N�����W�٦s�� session ����    
    response.sendRedirect("MsgBoard.jsp");  
  }
  else
  {
    out.print("�K�X���~...<br>");
    out.print("<div align=\"center\"><a href=\"Login.jsp\">�^�n�J����</a></div>");
  }
  ae.CloseConnection();
%>

</body>
</html>
