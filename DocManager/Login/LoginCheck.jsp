<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="myJava.dx.Database.*"%>
<%@page import="DocManager.login.Account"%>


<%
  String ini_file = new String(request.getRealPath("/") + "DocManager\\config.ini");

  String send = request.getParameter("BtnSend");
  String id = request.getParameter("txtID").toUpperCase();
  String pswd = request.getParameter("txtPswd");
  String name = "";
  String role_name = "";
  
  Account acnt = new Account(ini_file);
  
  String strLoginState = "";
  int login_state = acnt.CheckPassword(id, pswd);
  switch(login_state)
  {
    case -2:
      strLoginState = (id + " 的帳號並不存在, 請重新登入...");
      break;
    case -1:  
      strLoginState = ("密碼錯誤, 請重新登入...");
      break;
    case 1:
    case 2:  
    case 7:  
    case 8:  
    case 9:  
      name = acnt.Name();
      role_name = acnt.RoleName();

      // 將個人資訊寫入 session
      session.setAttribute("ID", id);
      session.setAttribute("UserName", name);
      session.setAttribute("RoleCode", Integer.toString(login_state));

      if (login_state == 8)
        strLoginState = ("歡迎 " + name + " 進入本系統, 您現在的權限是 " + role_name + ".");
      else if (login_state == 9)
        strLoginState = ("歡迎 " + name + " 進入本系統, 請洽處辦室開啟您的權限...");
      break;
    default:  
      strLoginState = ("發生程式設計人員預期之外的狀況, 請通知程式設計人員...");
  }
  out.print(strLoginState + "<br>");
%>

<html>
<head>
  <title>我是帳號檢查的頁面</title>
  <Script type="text/javascript" language="JavaScript">
  <!--
    parent.frames[0].document.location.reload();
  //-->  
  </Script>
</head>
<body>
</body>
</html>