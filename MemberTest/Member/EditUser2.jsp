<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>
<%
  String ini_file = request.getRealPath("/") + "MemberTest\\" + "Account01.ini";

  String workno = request.getParameter("WorkNo");
  if (workno == null)
    response.sendRedirect("Edit.jsp");

  String old_passwd = request.getParameter("OldPasswd");
  String new_passwd = request.getParameter("NewPasswd");
  String sRolecode = request.getParameter("RoleCode");
  String ques = request.getParameter("Question");
  String ans = request.getParameter("Answer");
  
  Account01 ac = new Account01(ini_file);
  int result = -1;

  result = ac.ChangePassword(workno, old_passwd, new_passwd);
  if (result > 0)
    out.print("�K�X�ק令�\....");
  else
    out.print("�K�X�ק異��....");
  out.print("<br>");
  
  if (sRolecode != null)
  {
    int rolecode = Integer.parseInt(sRolecode);
    result = ac.UpdateRoleCode(workno, rolecode);
    if (result > 0)
      out.print("�����v���ק令�\....");
    else
      out.print("�����v���ק異��....");
    out.print("<br>");    
  }
    
  result = ac.UpdateQuestion(workno, ques);
  if (result > 0)
    out.print("���D�ק令�\....");
  else
    out.print("���D�ק異��....");
  out.print("<br>");    
    
  result = ac.UpdateAnswer(workno, ans);
  if (result > 0)
    out.print("���׭ק令�\....");
  else
    out.print("���׭ק異��....");    
  out.print("<br>");    

  ac.CloseConnection();
%>

