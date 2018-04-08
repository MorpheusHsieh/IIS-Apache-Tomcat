<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page import="avatar.dx.database.*"%>
<%@page import="Procurement.Purchase"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "Main_Purchase.jsp";
  Purchase clsPurchase = new Purchase();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=big5">
  <title>�����ʮ�</title>
</head>

<body>

<form name="frmMainPurchase" method="post" action="<%=strMySelf%>"> 

  <input type="hidden" name="btnSend" value="">
  <p>�ڬO<font color="#0000FF">�p�e���ʮ�</font>���޲z����...</p>

  <div align="center">

    <!-- ��ܦW���j�M //-->
    <%@include file="../../Utility/TxtQuery.inc"%>
    <br>

    <!-- �̾ڤW�i�����ǰe�L�Ӫ��T��, �M�w�O�n�d�߭��Ǹ�T //-->
    <%
      int nRowsCount = -1;
      String strMessage = "";
      String strSend = request.getParameter("BtnSend");
      String strRadio = request.getParameter("rdoOption");

      if (strSend != null && strSend.length()>0)
      {
        if (isDebug) out.print("�z��ܤF '"+strSend+"' ���\��...<br>");

        if (strSend.equals("�d�@�@��"))
        {
          if (isExecuteQuery)
          {
            nRowsCount = clsPurchase.QueryInsideOfColumns(strQuery);
          }
        }
        else if (strSend.equals("�s�W�ʮ�"))
        {
          %>
          <Script type="text/javascript" language="JavaScript">
          <!--
            parent.frames[1].document.location.href = "NewPurchase.jsp";
          //-->  
          </Script>
          <%
        }
        else if (strSend.equals("�ק��ʮ�"))
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
            out.print("�z�|����ܥ���n�ק諸�p�e��...<br>");
            %>
            <div align="center">
              <a href="Main_Purchase.jsp">�^�u�p�e�׺޲z�v����</a>
            </div>  
            <%
          }
        }
        else if (strSend.equals("�R���ʮ�"))
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
              strMesg += ("�ʮ׽s���G" + strData01 + "<br>");
              strMesg += ("����Ƥw�g�R��...<br>");
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
              <a href="Main_Purchase.jsp">�^�u�ʮ׺޲z�v����</a>
            </p>  
            <%
          }
        }
        else if (strSend.equals("�d�ߥ���")) 
        {
		  nRowsCount = clsPurchase.QueryForTopSixthColumns();
  	    }	  
      } else if (strSend == null) {
		nRowsCount = clsPurchase.QueryForTopSixthColumns();
	  }
    %>  
    
    <!-- �ھڤW�����P�_�{����ܤw�n�����w����� //-->
    <%
      if ((strSend == null) && (nRowsCount == 0))
      {
        %>
        <br>
        <div align="center">
          <table border="0" width="100%">
            <tr>
              <td align="center"><input type="submit" name="BtnSend" value="�s�W�ʮ�"></td>
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

        <!-- �ڬO��ܹw��������{���q //-->
        <%@include file="ShowAllRows.inc"%>

        <%
      } else if (nRowsCount == 0) {
        if (strSend != null)
          strMessage = "�z���U�F '" + strSend + "' ��A���O�S���d�������...";
        else if (strSend == null)
          strMessage = "�ثe�u���J�w���ƪ�v���S���������...";
      } else if (nRowsCount == -1) {
        strMessage = "�z�I��F '" + strSend + "' ����, ���O�S������@��...";
      }
      out.print(strMessage);
    %>
    
  </div>   

</form>

</body>

</html>
