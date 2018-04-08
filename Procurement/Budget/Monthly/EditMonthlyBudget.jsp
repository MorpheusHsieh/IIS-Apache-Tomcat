<%@page language="Java"%>
<%@page contentType="text/html;charset=big5"%>
<%@page import="Procurement.Budget_Monthly"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "EditMonthlyBudget.jsp";
  Budget_Monthly clsMonthlyBudget = new Budget_Monthly();

  String strSend= "";
  String strData01 = "", strData02 = "", strData03 = "";
  String oldData01 = "", oldData02 = "", oldData03 = "";

  request.setCharacterEncoding("big5");
  strSend = (String)request.getAttribute("BtnSend");
  if (strSend != null && strSend.equals("修改月分配"))
  {
    strData01 = (String)request.getAttribute("txtData01");
    strData02 = (String)request.getAttribute("txtData02");
    strData03 = (String)request.getAttribute("txtData03");
  } else {
    strSend = (String)request.getParameter("BtnSend").trim();

    strData01 = (String)request.getParameter("txtData01").trim();
    strData02 = (String)request.getParameter("txtData02").trim();
    strData03 = (String)request.getParameter("txtData03").trim();
  }

  if (isDebug)
  {
    out.print("Send: " + strSend + "<br>");
    out.print("預算科目: " + strData01 + "<br>");
    out.print("預算月份: " + strData02 + "<br>");
    out.print("月分配金額: " + strData03 + "<br>");
  }
%>

<html>

<head>
  <script type="text/javascript" language="javascript" src="/Procurement/Utility/Window.js"></script>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>修改預算科目</title>
</head>

<body>

<form name="frmEdtMonthlyBudget" method="post" action="<%=strMySelf%>">

  <p>我是<font color="#0000ff">修改月分配</font>的頁面...</p>

  <%
    String strMesg = "";
    
    if (strSend != null && strSend.equals("確認修改月分配"))
    {
      if (isDebug) out.print("您選擇了「確認修改月分配」的功能...");
  
      long lData03 = (strData03 != null) ? Long.parseLong(strData03) : 0;
      int result = clsMonthlyBudget.UpdateAllColumns(strData01, strData02, lData03);

      if (result > 0)
      {
        strMesg += ("預算科目：" + strData01 + "<br>");
        strMesg += ("預算月份：" + strData02 + "<br>");
        strMesg += ("月分配金額：" + lData03 + "<br>");
        strMesg += ("資料修改完畢...<br>");
      }  
      else {
        strMesg += ("預算科目：" + strData01 + "<br>");
        strMesg += ("預算月份：" + strData02 + "<br>");
        strMesg += ("月分配金額：" + lData03 + "<br>");
        strMesg += ("資料修改失敗...<br>");
      }  

      if (strMesg != null && strMesg.length() > 0)
      {
        out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
        %>
        <script Language="JavaScript">
        <!--
          PopupWindow(240, 160, "no", "no", "no", "yes");
          msgWin.document.write(document.frmEdtMonthlyBudget.Message.value);
        //-->
        </Script>

        <div align="center">
          <a href="../Monthly/Budget_Monthly.jsp">回「收月分配」頁面</a>
        </div>  
        <%
      }
    } else {
    %>
      <!-- 顯示新增帳號所需要的欄位... .//-->
      <%@include file="../Monthly/EditMonthlyBudget_frm.htm"%>
      <%
    }
    %>  
    
</form>  

</body>

</html>
