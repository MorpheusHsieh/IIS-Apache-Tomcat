<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>

<%
  String ini_file = request.getRealPath("./") + "Account01.ini";
//  out.print("�պA�]�w�ɦ�� " + ini_file + "<br>"); 
%>

<html>
<head><title>�|���n�J�ˬd�{��</title></head>
<body>

<%
  String workno = request.getParameter("WorkNo");
  String passwd = request.getParameter("Password");
  if (workno == null || passwd == null)
    response.sendRedirect("login.htm");
    
  Account01 ac = new Account01(ini_file);

  // �K�X����
  int result = ac.CheckPassword(workno, passwd);
  int nRoleCode = -1;
  String strCheckLogin = null;
  switch(result)
  {
    case -1:
      strCheckLogin = "�L���b��";
      out.print(strCheckLogin + "<p></p>");
      out.print("<center>");
      out.print("<a href='./Member/New.htm'>���U</a>");
      out.print("�@�@");
      out.print("<a href='index.htm'>�^����</a>");
      out.print("</center>");      
      break;
    case  0:
      strCheckLogin = "�K�X���~";
      out.print(strCheckLogin + "<p></p>");
      out.print("<center><a href='index.htm'>�^����</a></center>");
      break;
    case  1:
      strCheckLogin = "�K�X���T";
      nRoleCode = ac.RoleCode(workno);  // ���X�����v��
      session.setAttribute("WorkNo", workno);                       // �N�b���s�� session ����
      session.setAttribute("RoleCode", String.valueOf(nRoleCode));  // �N�����v���s�� session ����
      response.sendRedirect("Message.jsp");
      break;
    default:
      out.print("�o�͹w�����~�����p...");
  }
  ac.CloseConnection();
%>
</html>