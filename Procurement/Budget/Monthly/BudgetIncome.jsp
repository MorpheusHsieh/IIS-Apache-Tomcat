<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Morpheus.dx.database.*"%>
<%@page import="Procurement.BudgetIncome"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "BudgetIncome.jsp";
  BudgetIncome clsBudgetIncome = new BudgetIncome();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=big5">
  <title>收入預算</title>
</head>

<body>


<form name="frmBudgetIncome" method="post" action="<%=strMySelf%>"> 

  <input type="hidden" name="btnSend" value="">
  <p>我是<font color="#0000FF">收入預算</font>的頁面...</p>

  <div align="center">

    <!-- 顯示名詞搜尋 //-->
    <%@include file="../../Utility/TxtQuery.inc"%>
    <br>

    <!-- 依據上張網頁傳送過來的訊息, 決定是要查詢哪些資訊 //-->
    <%
      int nRowsCount = -1;
      String strMessage = "";
      String strSend = request.getParameter("BtnSend");
      String strRadio = request.getParameter("rdoOption");
 
      if (isDebug) 
      {
        out.print("Send: " + strSend + "<br>");
        out.print("Radio Value: " + strRadio + "<br>");
      }  

      if (strSend != null && strSend.length()>0)
      {
        if (isDebug) out.print("您選擇了 '"+strSend+"' 的功能...<br>");

        if (strSend.equals("查　　詢"))
        {
        }
        else if (strSend.equals("收入月分配"))
        {
          %>
          <Script type="text/javascript" language="JavaScript">
          <!--
            parent.frames[1].document.location.href = "NewMonthlyBudget.jsp";
          //-->  
          </Script>
          <%
        }
        else if (strSend.equals("修改月分配"))
        {
        }
        else if (strSend.equals("刪除月分配"))
        {
        }
        else if (strSend.equals("顯示全部"))
        {
        }
        else if (strSend == null) {
          nRowsCount = clsBudgetIncome.QueryForAllRows();
        }
      }
    %> 
   
    <!-- 根據上面的判斷程序顯示已登錄的預算紀錄 //-->
    <%
      if (nRowsCount > 0)
      {
      
        Field[] fields = clsBudgetIncome.getFields();
        RowData[] row_data = clsBudgetIncome.getRowDatas();

        int cols = fields.length;
        int rows = row_data.length;

        String outstr = "";
        %>
        
        <!-- 我是顯示預算紀錄的程式段 //-->
        <%@include file="ShowAllRows.inc"%>

        <%
      } else if (nRowsCount == 0) {
        if (strSend != null)
          strMessage = "您按下了 '" + strSend + "' 鍵，但是沒有查到任何資料...";
        else if (strSend == null)
          strMessage = "目前「收入預算資料表」中沒有任何紀錄...";
      } else if (nRowsCount == -1) {
        strMessage = "您點選了 '" + strSend + "' 項目, 但是沒有任何作用...";
      }
      out.print(strMessage);
    %>
    

  </div>  

</form>

</body>

</html>
