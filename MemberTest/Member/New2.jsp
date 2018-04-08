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
    out.print("新增使用者成功....");
    session.setAttribute("WorkNo", workno);                       // 將帳號存到 session 物件中
    session.setAttribute("RoleCode", String.valueOf("99"));		  // 將角色權限存到 session 物件中
  }  
  else
    out.print("新增使用者失敗....");
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
<head><title>將新帳號寫入資料庫</title></head>
<body>
<Script Language="javascript">
  window.parent.frames[0].document.location.reload();

  // 找出框架父視窗的方法
  document.write("<br>Test: "+ parent.frames[0].name );
  document.write("<br>Test: "+ window.parent.frames[0].name );
  
  document.write("<br>Test: "+ parent.document.title );
</Script>
</body>
</html>

