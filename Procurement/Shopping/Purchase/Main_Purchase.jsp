<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page import="avatar.dx.database.*"%>
<%@page import="Procurement.Purchase"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "Main_Purchase.jsp";
  Purchase clsPurchase = new Purchase();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=big5">
  <title>申購購案</title>
</head>

<body>

<form name="frmMainPurchase" method="post" action="<%=strMySelf%>"> 

  <input type="hidden" name="btnSend" value="">
  <p>我是<font color="#0000FF">計畫性購案</font>的管理頁面...</p>

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

      if (strSend != null && strSend.length()>0)
      {
        if (isDebug) out.print("您選擇了 '"+strSend+"' 的功能...<br>");

        if (strSend.equals("查　　詢"))
        {
          if (isExecuteQuery)
          {
            nRowsCount = clsPurchase.QueryInsideOfColumns(strQuery);
          }
        }
        else if (strSend.equals("新增購案"))
        {
          %>
          <Script type="text/javascript" language="JavaScript">
          <!--
            parent.frames[1].document.location.href = "NewPurchase.jsp";
          //-->  
          </Script>
          <%
        }
        else if (strSend.equals("修改購案"))
        {
          if (strRadio != null)
          {
            String strData01 = request.getParameter("txtData01_" + strRadio);
          
            request.setAttribute("BtnSend", strSend);
            request.setAttribute("txtData01", strData01);
            %>
            <jsp:forward page="EditPurchase.jsp" />
            <%
          }
          else
          {
            out.print("您尚未選擇任何要修改的計畫案...<br>");
            %>
            <div align="center">
              <a href="Main_Purchase.jsp">回「計畫案管理」頁面</a>
            </div>  
            <%
          }
        }
        else if (strSend.equals("刪除購案"))
        {
          if (isDebug) out.print("Radio Value: " + strRadio + "<br>");
          
          if (strRadio != null)
          {
            String strMesg = "", strTxtName = "";

            strTxtName = "txtData01_" + strRadio;
            String strData01 = request.getParameter(strTxtName);
            if (isDebug) out.print("1: " + strTxtName + ", " + strData01 + "<br>");

            int result = clsPurchase.DeletePurchase(strData01);
            if (result > 0) 
            {
              strMesg += ("購案編號：" + strData01 + "<br>");
              strMesg += ("的資料已經刪除...<br>");
			}              

            nRowsCount = clsPurchase.QueryForTopSixthColumns();
            if (strMesg != null && strMesg.length() > 0)
            {
              out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
              %>
              <script Language="JavaScript">
              <!--
                PopupWindow(240, 160, "no", "no", "no", "yes");
                msgWin.document.write(document.frmMainPurchase.Message.value);
              //-->
              </Script>
             <%
            }
          } else {
            %>
            <p>
              <a href="Main_Purchase.jsp">回「購案管理」頁面</a>
            </p>  
            <%
          }
        }
        else if (strSend.equals("查詢全部")) 
        {
		  nRowsCount = clsPurchase.QueryForTopSixthColumns();
  	    }	  
      } else if (strSend == null) {
		nRowsCount = clsPurchase.QueryForTopSixthColumns();
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
              <td align="center"><input type="submit" name="BtnSend" value="新增購案"></td>
            </tr>
          </table>
        </div>      
        <%
      }
      else if (nRowsCount > 0)
      {
      
        Field[] fields = clsPurchase.getFields();
        RowData[] row_data = clsPurchase.getRowDatas();

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
