<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Morpheus.dx.database.*"%>
<%@page import="Procurement.Budget_Monthly"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "Budget_Monthly.jsp";
  Budget_Monthly clsMonthlyBudget = new Budget_Monthly();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <title>���J�w��</title>
</head>

<body>


<form name="frmBudgetMonthly" method="post" action="<%=strMySelf%>"> 

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
          if (isExecuteQuery)
          {
            nRowsCount = clsMonthlyBudget.QueryInsideOfColumns(strQuery);
          }
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
          out.print("�i�J�u�ק����t�v���{��...<br>");

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
            out.print("�z�|����ܥ���n�ק諸����t����...<br>");
            %>
            <div align="center">
              <a href="../Monthly/Budget_Monthly.jsp">�^�u���J����t�v����</a>
            </div>  
            <%
          }
        }
        else if (strSend.equals("�R������t"))
        {
          if (isDebug) out.print("�i�J�u�R������t�v���{��...<br>");
          %>
          <!-- �ڬO�R������t���{���q... //-->
          <%@include file="../Monthly/DelMonthlyBudget.inc"%>
          <%
        }
        else if (strSend.equals("��ܥ���"))
        {
          nRowsCount = clsMonthlyBudget.QueryForAllRows();
        }
      } else if (strSend == null) {
        nRowsCount = clsMonthlyBudget.QueryForAllRows();
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
              <td align="center"><input type="submit" name="BtnSend" value="���J����t"></td>
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
