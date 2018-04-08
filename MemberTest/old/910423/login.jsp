<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>

<%
  String ini_file = request.getRealPath("./") + "Account01.ini";
//  out.print("組態設定檔位於 " + ini_file + "<br>"); 
%>

<html>
<head><title>會員登入檢查程式</title></head>
<body>

<%
  String workno = request.getParameter("WorkNo");
  String passwd = request.getParameter("Password");
  if (workno == null || passwd == null)
    response.sendRedirect("login.htm");
    
  Account01 ac = new Account01(ini_file);

  // 密碼驗證
  int result = ac.CheckPassword(workno, passwd);
  int nRoleCode = -1;
  String strCheckLogin = null;
  switch(result)
  {
    case -1:
      strCheckLogin = "無此帳號";
      out.print(strCheckLogin + "<p></p>");
      out.print("<center>");
      out.print("<a href='./Member/New.htm'>註冊</a>");
      out.print("　　");
      out.print("<a href='index.htm'>回首頁</a>");
      out.print("</center>");      
      break;
    case  0:
      strCheckLogin = "密碼錯誤";
      out.print(strCheckLogin + "<p></p>");
      out.print("<center><a href='index.htm'>回首頁</a></center>");
      break;
    case  1:
      strCheckLogin = "密碼正確";
      nRoleCode = ac.RoleCode(workno);  // 取出角色權限
      session.setAttribute("WorkNo", workno);                       // 將帳號存到 session 物件中
      session.setAttribute("RoleCode", String.valueOf(nRoleCode));  // 將角色權限存到 session 物件中
      response.sendRedirect("Message.jsp");
      break;
    default:
      out.print("發生預期之外的狀況...");
  }
  ac.CloseConnection();
%>
</html>