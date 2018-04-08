<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Account"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "NewAccount.jsp";
  Account clsAcnt = new Account();
  
  String strSend = request.getParameter("BtnSend");
  String strName = request.getParameter("txtName");
  String strPswd = request.getParameter("txtPswd");
  String strUnit = request.getParameter("selUnit");
  String strRole = request.getParameter("selRole");
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="../Utility/Window.js"></script>
  <script type="text/javascript" language="javascript" src="NewAccount.js"></script>
  </script>  
  <title>新增帳號</title>
</head>

<body>

<form name="frmNewAcnt" method="post" action="<%=strMySelf%>">

  <p>我是<font color="#0000FF">新增帳號</font>的頁面...</p>

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <%
    if (strSend != null && strSend.equals("新增帳號"))
    {
      if (isDebug) out.print("您選擇了新增帳號功能...");
  
      int role_code = clsAcnt.NewAccount(strName, strPswd, strUnit, strRole);

      String strNewAcntState = "";
      switch(role_code)
      {
        case -2:
          strNewAcntState = "帳號重複...";
          break;
        case -1:
          strNewAcntState = "資料庫連線失敗...";
          break;
        case 0:
          strNewAcntState = "新增帳號失敗...";
          break;
        case 1:
        case 8:
          strNewAcntState = "帳號「" + strName + "」已經建立成功...";

          // 將帳號資訊寫入 session
          session.setAttribute("UserName", strName);
          session.setAttribute("UnitName", strUnit);
          session.setAttribute("RoleName", strRole);
          %>
          <Script type="text/javascript" language="JavaScript">
           <!--
             parent.frames[0].document.location.reload();
           //-->  
           </Script>
           </p>
           <div align="center">
             <a href="AcntManager.jsp">回帳號管理頁面</a>
           </div>  
          <%
          break;
        default:  
          strNewAcntState = ("發生程式設計人員預期之外的狀況, 請通知程式設計人員...");
      }
      out.print("<br>" + strNewAcntState + "<br>");
    }
    else if (strSend != null && strSend.equals("帳號查詢"))
    {
      if (isDebug) out.print("您選擇了帳號查詢功能...");
      
      boolean isExist = clsAcnt.exists(strName);
  
      String strExist = null;
      if (isExist)
        strExist = "<font color=blue>" + strName + "</font>" + " 已經有人使用了...";
      else  
        strExist = "<font color=blue>" + strName + "</font>" +" 還沒有人使用...";
    
      out.print("<input type=\"hidden\" name=\"txtExist\" value=\"" + strExist + "\">");
      %>
      <script Language="JavaScript">
      <!--
        PopupWindow(240, 100, "no", "no", "no", "yes");
        msgWin.document.write("<html><head><title>帳號查詢結果</title></head>");
        msgWin.document.write(document.frmNewAcnt.txtExist.value);
      //-->
      </Script>
      
      <!-- 顯示新增帳號所需要的欄位... .//-->
      <%@include file="../Account/NewAccount_frm.htm"%>
      <%
    } 
    else 
    {
      %>
      <!-- 顯示新增帳號所需要的欄位... .//-->
      <%@include file="../Account/NewAccount_frm.htm"%>
      <%
    }
    %>

</form>

</body>

</html>