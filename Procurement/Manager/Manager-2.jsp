<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%@page import="Morpheus.dx.database.*"%>
<%@page import="Procurement.Manager"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = true;
  String strMySelf = "Manager01.jsp";
  Manager clsManager = new Manager();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=big5">
  <title>年度購案管制</title>
</head>

<body>


<form name="frmManager01" method="post" action="<%=strMySelf%>"> 

  <p>我是<font color="#0000FF">年度購案管制</font>的頁面...</p>

  <div align="center">

    <!-- 根據上面的判斷程序顯示已登錄的預算紀錄 //-->
    <%
      int nRowsCount = -1;
      String strMessage = "";
      boolean isActiveHyperlink = true;
      String strSend = request.getParameter("BtnSend");

      if ((strSend != null) && (strSend.length() > 0)) {
        nRowsCount = clsManager.QueryForBudget(strSend);
        isActiveHyperlink = false;
	  } else if (strSend == null) {
        nRowsCount = clsManager.QueryForYearlyBudget();
        isActiveHyperlink = true;
      }

      if (nRowsCount > 0)
      {
      
        Field[] fields = clsManager.getFields();
        RowData[] row_data = clsManager.getRowDatas();

        int cols = fields.length;
        int rows = row_data.length;

        String outstr = "";
        %>
  
		<table border="1" width="100%">
	
		  <!-- 資料表 //-->
		  <tr>
		    <%
		  	  for (int col=0; col<cols; col++) {
		 	    outstr += "<td>" + fields[col].getCaption() + "</td>\n";
			  }
			  out.print(outstr);
		    %>
		  </tr>
		  <%
		    for (int row=0 ;row<rows; row++)
		    {
		      outstr = "<tr>";
		      for (int col=0; col<cols; col++)
		      {
		        outstr += "<td align=\"center\">";
                String strValue = row_data[row].getString(col);
                strValue = (strValue == null) ? "" : strValue;

		        if (col == 0 && isActiveHyperlink)
		        {
		          outstr += "<a href=\"Manager-2.jsp?BtnSend=" + strValue + "\">" + strValue + "</a>";
		        } else {
	  	          outstr += strValue;
	  	        }  
		        outstr += "</td>";
		      }
		      outstr += "</tr>";
		      out.print(outstr);
		    }
		  %>
	    </table>
	    <%
      } else if (nRowsCount == 0) {
        if (strSend != null)
          strMessage = "您選擇了預算科目 '" + strSend + "' ，但是沒有查到任何資料...";
        else if (strSend == null)
          strMessage = "目前「年度計畫案資料表」中沒有任何紀錄...";
      } else if (nRowsCount == -1) {
        strMessage = "您點選了 '" + strSend + "' 項目, 但是沒有任何作用...";
      }
      out.print(strMessage);
	%>
  
  </div>

</form>  

</body>

</html>
