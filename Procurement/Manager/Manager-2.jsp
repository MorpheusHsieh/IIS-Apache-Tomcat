<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%@page import="Morpheus.dx.database.*"%>
<%@page import="Procurement.Manager"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = true;
  String strMySelf = "Manager01.jsp";
  Manager clsManager = new Manager();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=big5">
  <title>�~���ʮ׺ި�</title>
</head>

<body>


<form name="frmManager01" method="post" action="<%=strMySelf%>"> 

  <p>�ڬO<font color="#0000FF">�~���ʮ׺ި�</font>������...</p>

  <div align="center">

    <!-- �ھڤW�����P�_�{����ܤw�n�����w����� //-->
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
	
		  <!-- ��ƪ� //-->
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
          strMessage = "�z��ܤF�w���� '" + strSend + "' �A���O�S���d�������...";
        else if (strSend == null)
          strMessage = "�ثe�u�~�׭p�e�׸�ƪ�v���S���������...";
      } else if (nRowsCount == -1) {
        strMessage = "�z�I��F '" + strSend + "' ����, ���O�S������@��...";
      }
      out.print(strMessage);
	%>
  
  </div>

</form>  

</body>

</html>
