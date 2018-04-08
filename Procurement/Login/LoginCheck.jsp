<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Account"%>

<!-- 建立新物件  //-->
<%
  Account acnt = new Account();
%>

<!-- 從前一頁取得的參數  -->
<%
  String send = request.getParameter("BtnSend");
  String strName = request.getParameter("txtName");
  String strPswd = request.getParameter("txtPswd");
%>

<%  
  String strLoginState = "";
  int login_state = acnt.CheckPassword(strName, strPswd);
  switch(login_state)
  {
    case -2:
    case -1:  
      strLoginState = ("您所輸入的帳號與密碼無法對應...");
      break;
    case 1:
    case 8:  
    case 9:  
      String sName = acnt.getName();
      String sRoleName = acnt.getRoleName();
      String sUnitName = acnt.getUnitName();

      // 將個人資訊寫入 session
      session.setAttribute("UserName", sName);
      session.setAttribute("UnitName", sUnitName);
      session.setAttribute("RoleName", sRoleName);

      strLoginState = ("歡迎 " + sName + " 使用本系統, 您的身分是 " + sRoleName + ", 隸屬於 " + sUnitName +  ".");
      break;
    default:  
      strLoginState = ("發生程式設計人員預期之外的狀況, 請通知程式設計人員...");
  }
  out.print(strLoginState);
  
%>

<html>
<head>
  <title>我是帳號檢查的頁面</title>
  <meta http-equiv="Content-Language" content="zh-tw">
  <Script type="text/javascript" language="JavaScript">
  <!--
    parent.frames[0].document.location.reload();
  //-->  
  </Script>
</head>
<body>

</body>
</html>