<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Morpheus.dx.database.*"%>
<%@page import="Procurement.BudgetIncome"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "BudgetIncome.jsp";
  BudgetIncome clsBudgetIncome = new BudgetIncome();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=big5">
  <title>���J�w��</title>
</head>

<body>


<form name="frmBudgetIncome" method="post" action="<%=strMySelf%>"> 

  <input type="hidden" name="btnSend" value="">
  <p>�ڬO<font color="#0000FF">���J�w��</font>������...</p>

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
 
      if (isDebug) 
      {
        out.print("Send: " + strSend + "<br>");
        out.print("Radio Value: " + strRadio + "<br>");
      }  

      if (strSend != null && strSend.length()>0)
      {
        if (isDebug) out.print("�z��ܤF '"+strSend+"' ���\��...<br>");

        if (strSend.equals("�d�@�@��"))
        {
        }
        else if (strSend.equals("���J����t"))
        {
          %>
          <Script type="text/javascript" language="JavaScript">
          <!--
            parent.frames[1].document.location.href = "NewMonthlyBudget.jsp";
          //-->  
          </Script>
          <%
        }
        else if (strSend.equals("�ק����t"))
        {
        }
        else if (strSend.equals("�R������t"))
        {
        }
        else if (strSend.equals("��ܥ���"))
        {
        }
        else if (strSend == null) {
          nRowsCount = clsBudgetIncome.QueryForAllRows();
        }
      }
    %> 
   
    <!-- �ھڤW�����P�_�{����ܤw�n�����w����� //-->
    <%
      if (nRowsCount > 0)
      {
      
        Field[] fields = clsBudgetIncome.getFields();
        RowData[] row_data = clsBudgetIncome.getRowDatas();

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
