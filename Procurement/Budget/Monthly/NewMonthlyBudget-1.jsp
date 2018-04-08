<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Budget_Monthly"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<%
  boolean isDebug = false;
  String strMySelf = "NewMonthlyBudget-1.jsp";
  Budget_Monthly clsMonthlyBdg = new Budget_Monthly();
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
    out.print("月分配月份: " + strData02 + "<br>");
    out.print("月分配金額: " + strData03 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>收入月分配</title>
</head>

<body>

<form name="frmAddMonthlyBdg" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <p>我是<font color="#0000ff">收入月分配</font>的頁面...</p>
  
  <%
    if (strSend != null && strSend.equals("收入月分配"))
    {
      String strMessage = "";
      if (isDebug) out.print("您選擇了「收入月分配」的功能...");
  
      long nData03 = (strData03 != null) ? (long)Long.parseLong(strData03) : 0;
      int result = clsMonthlyBdg.NewMonthlyBudget(strData01, strData02, nData03);
      switch(result)
      {
        case -2:
          strMessage = "月分配重複收入...";
          break;
        case -1:
          strMessage = "資料庫連線失敗...";
          break;
        case 0:
          strMessage = "收入月分配失敗...";
          break;
        case 1:
          strMessage = "收入月分配成功...";
          break;
        default:  
          strMessage = ("發生程式設計人員預期之外的狀況, 請通知程式設計人員...");
      }
      out.print("<br>" + strMessage + "<br>");
      
    }
  %>    
  </p>
  <div align="center">
    <a href="../Monthly/Budget_Monthly.jsp">返回「收月分配」頁面</a>
  </div>  
    
</form>  

</body>

</html>