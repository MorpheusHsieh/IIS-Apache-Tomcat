<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>
<%
  String ini_file = request.getRealPath("/") + "MemberTest\\" + "Account01.ini";

  String WorkNo = request.getParameter("WorkNo");
  String Passwd = request.getParameter("Passwd");
  String Ques = request.getParameter("Question");
  String Ans = request.getParameter("Answer");
  
  if (WorkNo == null)
    response.sendRedirect("NewAccount.htm");
  
  Account01 ac = new Account01(ini_file);
  int result = ac.NewAccount(WorkNo, Passwd, Ques, Ans);
  if (result > 0)
    out.print("新增使用者成功....");
  else
    out.print("新增使用者失敗....");
  ac.CloseConnection();    

  
  String sRolecode = (String)session.getAttribute("RoleCode");
  if (sRolecode != null)
  {
    int nRoleCode = Integer.parseInt(sRolecode);
    if (nRoleCode < 3)
      out.print("<center><a href='./Menu.jsp'>回編輯個人資料</a></center>");
  }
  out.print("<center><a href='../Title.jsp'>回主題頁</a></center>");  
%>
