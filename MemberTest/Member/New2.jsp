<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>

<%
  String ini_file = request.getRealPath("/") + "MemberTest\\" + "Account01.ini";

  String workno = request.getParameter("WorkNo");
  String Passwd = request.getParameter("Passwd");
  String Ques = request.getParameter("Question");
  String Ans = request.getParameter("Answer");
  
  if (workno == null)
    response.sendRedirect("NewAccount.htm");
  
  Account01 ac = new Account01(ini_file);
  int result = ac.NewAccount(workno, Passwd, Ques, Ans);
  if (result > 0)
  {
    out.print("�s�W�ϥΪ̦��\....");
    session.setAttribute("WorkNo", workno);                       // �N�b���s�� session ����
    session.setAttribute("RoleCode", String.valueOf("99"));		  // �N�����v���s�� session ����
  }  
  else
    out.print("�s�W�ϥΪ̥���....");
  ac.CloseConnection();    

/*
  String sRolecode = (String)session.getAttribute("RoleCode");
  if (sRolecode != null)
  {
    int nRoleCode = Integer.parseInt(sRolecode);
  }
*/  
%>

<html>
<head><title>�N�s�b���g�J��Ʈw</title></head>
<body>
<Script Language="javascript">
  window.parent.frames[0].document.location.reload();

  // ��X�ج[����������k
  document.write("<br>Test: "+ parent.frames[0].name );
  document.write("<br>Test: "+ window.parent.frames[0].name );
  
  document.write("<br>Test: "+ parent.document.title );
</Script>
</body>
</html>

