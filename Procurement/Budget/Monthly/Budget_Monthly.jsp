<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Morpheus.dx.database.*"%>
<%@page import="Procurement.Budget_Monthly"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "Budget_Monthly.jsp";
  Budget_Monthly clsMonthlyBudget = new Budget_Monthly();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <title>收入預算</title>
</head>

<body>


<form name="frmBudgetMonthly" method="post" action="<%=strMySelf%>"> 

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
          if (isExecuteQuery)
          {
            nRowsCount = clsMonthlyBudget.QueryInsideOfColumns(strQuery);
          }
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
          out.print("進入「修改月分配」的程序...<br>");

          if (strRadio != null)
          {
            String strData01 = request.getParameter("txtData01_" + strRadio);
            String strData02 = request.getParameter("txtData02_" + strRadio);
            String strData03 = request.getParameter("txtData03_" + strRadio);
          
            if (isDebug) {
              out.print(strData01 + ", " + strData02 + ", " + strData03 + "<br>");
            }
          
            request.setAttribute("BtnSend", strSend);
            request.setAttribute("txtData01", strData01);
            request.setAttribute("txtData02", strData02);
            request.setAttribute("txtData03", strData03);
            %>
            <jsp:forward page="EditMonthlyBudget.jsp" />
            <%
          }
          else
          {
            out.print("您尚未選擇任何要修改的月分配項目...<br>");
            %>
            <div align="center">
              <a href="../Monthly/Budget_Monthly.jsp">回「收入月分配」頁面</a>
            </div>  
            <%
          }
        }
        else if (strSend.equals("刪除月分配"))
        {
          if (isDebug) out.print("進入「刪除月分配」的程序...<br>");
          %>
          <!-- 我是刪除月分配的程式段... //-->
          <%@include file="../Monthly/DelMonthlyBudget.inc"%>
          <%
        }
        else if (strSend.equals("顯示全部"))
        {
          nRowsCount = clsMonthlyBudget.QueryForAllRows();
        }
      } else if (strSend == null) {
        nRowsCount = clsMonthlyBudget.QueryForAllRows();
      }
    %> 
   
    <!-- 根據上面的判斷程序顯示已登錄的預算紀錄 //-->
    <%
      if ((strSend == null) && (nRowsCount == 0))
      {
        %>
        <br>
        <div align="center">
          <table border="0" width="100%">
            <tr>
              <td align="center"><input type="submit" name="BtnSend" value="收入月分配"></td>
            </tr>
          </table>
        </div>      
        <%
      }
      else if (nRowsCount > 0)
      {
      
        Field[] fields = clsMonthlyBudget.getFields();
        RowData[] row_data = clsMonthlyBudget.getRowDatas();

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
