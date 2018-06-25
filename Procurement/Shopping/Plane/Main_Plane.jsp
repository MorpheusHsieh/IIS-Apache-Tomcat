<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page import="Morpheus.dx.database.*"%>
<%@page import="Procurement.Plane"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "Main_Plane.jsp";
  Plane clsPlane = new Plane();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <title>計畫性購案</title>
</head>

<body>


<form name="frmMainPlane" method="post" action="<%=strMySelf%>"> 

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
            nRowsCount = clsPlane.QueryInsideOfColumns(strQuery);
          }
        }
        else if (strSend.equals("新增計畫案"))
        {
          %>
          <Script type="text/javascript" language="JavaScript">
          <!--
            parent.frames[1].document.location.href = "NewPlane.jsp";
          //-->  
          </Script>
          <%
        }
        else if (strSend.equals("修改計畫案"))
        {
          if (strRadio != null)
          {
            String strData01 = request.getParameter("txtData01_" + strRadio);
            String strData02 = request.getParameter("txtData02_" + strRadio);
            String strData03 = request.getParameter("txtData03_" + strRadio);
            String strData04 = request.getParameter("txtData04_" + strRadio);
            String strData05 = request.getParameter("txtData05_" + strRadio);
            String strData06 = request.getParameter("txtData06_" + strRadio);
            String strData07 = request.getParameter("txtData07_" + strRadio);
            String strData08 = request.getParameter("txtData08_" + strRadio);
          
            request.setAttribute("BtnSend", strSend);
            request.setAttribute("txtData01", strData01);
            request.setAttribute("txtData02", strData02);
            request.setAttribute("txtData03", strData03);
            request.setAttribute("txtData04", strData04);
            request.setAttribute("txtData05", strData05);
            request.setAttribute("txtData06", strData06);
            request.setAttribute("txtData07", strData07);
            request.setAttribute("txtData08", strData08);
            %>
            <jsp:forward page="EditPlane.jsp" />
            <%
          }
          else
          {
            out.print("您尚未選擇任何要修改的計畫案...<br>");
            %>
            <div align="center">
              <a href="Main_Plane.jsp">回「計畫案管理」頁面</a>
            </div>  
            <%
          }
        }
        else if (strSend.equals("刪除計畫案"))
        {
          %>
          <!-- 我是刪除計畫案的程式段... //-->
          <%@include file="DelPlane.inc"%>
          <%
        }
        else if (strSend.equals("轉移計畫案"))
        {
          if (strRadio != null)
          {
            String strData01 = request.getParameter("txtData01_" + strRadio);
            String strData02 = request.getParameter("txtData02_" + strRadio);
            String strData03 = request.getParameter("txtData03_" + strRadio);
            String strData04 = request.getParameter("txtData04_" + strRadio);
            String strData05 = request.getParameter("txtData05_" + strRadio);
            String strData06 = request.getParameter("txtData06_" + strRadio);
            String strData07 = request.getParameter("txtData07_" + strRadio);
          
            request.setAttribute("BtnSend", strSend);
            request.setAttribute("txtData01", strData01);
            request.setAttribute("txtData02", strData02);
            request.setAttribute("txtData03", strData03);
            request.setAttribute("txtData04", strData04);
            request.setAttribute("txtData05", strData05);
            request.setAttribute("txtData06", strData06);
            request.setAttribute("txtData07", strData07);
            %>
            <jsp:forward page="TransPlane.jsp" />
            <%
          }
          else
          {
            out.print("您尚未選擇任何要轉移到購案資料庫的計畫案...<br>");
            %>
            <div align="center">
              <a href="Main_Plane.jsp">回「計畫案管理」頁面</a>
            </div>  
            <%
          }
        }
        else if (strSend.equals("顯示全部"))
        {
		  nRowsCount = clsPlane.QueryForAllRows();
        }
      } else if (strSend == null) {
		nRowsCount = clsPlane.QueryForAllRows();
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
              <td align="center"><input type="submit" name="BtnSend" value="新增計畫案"></td>
            </tr>
          </table>
        </div>      
        <%
      }
      else if (nRowsCount > 0)
      {
      
        Field[] fields = clsPlane.getFields();
        RowData[] row_data = clsPlane.getRowDatas();

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