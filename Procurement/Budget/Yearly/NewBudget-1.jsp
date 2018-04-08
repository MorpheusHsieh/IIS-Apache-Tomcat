<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Budget"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<%
  boolean isDebug = false;
  String strMySelf = "NewBudget-1.jsp";
  Budget clsBdg = new Budget();
%>

<%
  String strSend = request.getParameter("BtnSend");
  String strData01 = request.getParameter("txtData01").trim();
  String strData02 = request.getParameter("txtData02").trim();
  String strData03 = request.getParameter("txtData03").trim();
  
  if (isDebug) 
  {
    out.print("BtnSend: " + strSend + "<br>");
    out.print("預算科目: " + strData01 + "<br>");
    out.print("預算名稱: " + strData02 + "<br>");
    out.print("金　　額: " + strData03 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>登錄預算科目結果</title>
</head>

<body>

<form name="frmProcQuery" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <p>我是<font color="#0000ff">登錄預算</font>的頁面...</p>
  
  <%
    if (strSend != null && strSend.equals("登錄預算"))
    {
      String strNewAcntState = "";
      if (isDebug) out.print("您選擇了「登錄預算」的功能...");
  
      long nData03 = (strData03 != null) ? (long)Long.parseLong(strData03) : 0;
      int result = clsBdg.NewBudget(strData01, strData02, nData03);
      switch(result)
      {
        case -2:
          strNewAcntState = "預算重複登錄...";
          break;
        case -1:
          strNewAcntState = "資料庫連線失敗...";
          break;
        case 0:
          strNewAcntState = "登錄預算失敗...";
          break;
        case 1:
          strNewAcntState = "登錄預算成功...";
          break;
        default:  
          strNewAcntState = ("發生程式設計人員預期之外的狀況, 請通知程式設計人員...");
      }
      out.print("<br>" + strNewAcntState + "<br>");
      
    }
  %>    
  </p>
  <div align="center">
    <a href="BudgetMng.jsp">返回「登錄預算」頁面</a>
  </div>  
    
</form>  

</body>

</html>