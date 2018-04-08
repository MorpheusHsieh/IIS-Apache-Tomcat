<%@page language="Java"%>
<%@page contentType="text/html;charset=big5"%>
<%@page import="Procurement.Account"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "EditAccount.jsp";
  Account clsAcnt = new Account();

  String strSend= "", strName="", strPswd ="", strUnit="", strRole="";

  request.setCharacterEncoding("big5");
  strSend = (String)request.getAttribute("BtnSend");
  if (strSend != null && strSend.equals("修改帳號"))
  {
    strName = (String)request.getAttribute("txtName");
    strPswd = (String)request.getAttribute("txtPswd");;
    strUnit = (String)request.getAttribute("selUnit");
    strRole = (String)request.getAttribute("selRole");
  } else {
    strSend = (String)request.getParameter("BtnSend");
    strName = (String)request.getParameter("txtName");
    strPswd = (String)request.getParameter("txtPswd");;
    strUnit = (String)request.getParameter("selUnit");
    strRole = (String)request.getParameter("selRole");
  }

  if (isDebug)
  {
    out.print("Send: " + strSend + "<br>");
    out.print("Name: " + strName + "<br>");
    out.print("Pswd: " + strPswd + "<br>");
    out.print("Unit: " + strUnit + "<br>");
    out.print("Role: " + strRole + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="../Utility/Window.js"></script>
  <script type="text/javascript" language="javascript" src="EditAccount.js"></script>
  <title>修改帳號</title>
</head>

<body>


<form name="frmEditAcnt" method="post" action="<%=strMySelf%>">

  <p>我是<font color="#0000FF">修改帳號</font>的頁面...</p>
  <input type="hidden" name="BtnSend" value="">

  <%
    String strMesg = "";
    
    if (strSend != null && strSend.equals("確定修改"))
    {
      if (isDebug) out.print("您選擇了修改帳號功能...");
  
      int result = clsAcnt.UpdateAllColumns(strName, strPswd, strUnit, strRole);

      if (result > 0)
        strMesg += (strName + " 的資料修改完畢...<br>");
      else
        strMesg += (strName + " 的資料修改失敗...<br>");

      if (strMesg != null && strMesg.length() > 0)
      {
        out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
        %>
        <script Language="JavaScript">
        <!--
          PopupWindow(240, 160, "no", "no", "no", "yes");
          msgWin.document.write(document.frmEditAcnt.Message.value);
        //-->
        </Script>

        <div align="center">
          <a href="AcntManager.jsp">回帳號管理頁面</a>
        </div>  
        <%
      }
      
    } else {
    %>
      <!-- 顯示修改預算所需要的欄位... .//-->
      <%@include file="../Account/EditAccount_frm.htm"%>
    <%
    }
  %>  


</form>

</body>

</html>
