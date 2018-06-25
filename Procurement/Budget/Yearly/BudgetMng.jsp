<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Budget"%>
<%@page import="Morpheus.dx.database.*"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "BudgetMng.jsp";
  Budget clsBudget = new Budget();
%>  

<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=big5">
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <title>�d�߹w��</title>
</head>

<body>

<form name="frmBudgetMng" method="post" action="<%=strMySelf%>"> 

  <input type="hidden" name="btnSend" value="">
  <p>�ڬO<font color="#0000FF">�n���w��</font>������...</p>

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
            nRowsCount = clsBudget.QueryInsideOfColumns(strQuery);
          }
        }
        else if (strSend.equals("�s�W�w��"))
        {
          %>
          <Script type="text/javascript" language="JavaScript">
          <!--
            parent.frames[1].document.location.href = "NewBudget.jsp";
          //-->  
          </Script>
          <%
        }
        else if (strSend.equals("�ק�w��"))
        {
          out.print("�i�J�u�ק�w��v���{��...<br>");

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
            <jsp:forward page="EditBudget.jsp" />
            <%
          }
          else
          {
            out.print("�z�|����ܥ���n�ק諸�b���W��...<br>");
            %>
            <div align="center">
              <a href="../Yearly/Budget/BudgetMng.jsp">�^�u�n���w��v����</a>
            </div>  
            <%
          }
            
        }
        else if (strSend.equals("�R���w��"))
        {
          if (isDebug) out.print("�i�J�u�R���w��v���{��...<br>");
          %>
          <!-- �ڬO�R���w�⪺�{���q... //-->
          <%@include file="../Yearly/DelBudget.inc"%>
          <%
        }
        else if (strSend.equals("��ܥ���"))
        {
          nRowsCount = clsBudget.QueryForAllRows();
        }
      }
      else if (strSend == null) {
        nRowsCount = clsBudget.QueryForAllRows();
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
              <td align="center"><input type="submit" name="BtnSend" value="�s�W�w��"></td>
            </tr>
          </table>
        </div>      
        <%
      }
      else if (nRowsCount > 0)
      {
      
        Field[] fields = clsBudget.getFields();
        RowData[] row_data = clsBudget.getRowDatas();

        int cols = fields.length;
        int rows = row_data.length;

        String outstr = "";
        %>
        
        <!-- �ڬO��ܹw��������{���q //-->
        <%@include file="../Yearly/ShowAllRows.inc"%>

        <%
      } else if (nRowsCount == 0) {
        if (strSend != null)
          strMessage = "�z���U�F '" + strSend + "' ��A���O�S���d�������...";
        else if (strSend == null)
          strMessage = "�ثe�u�w���ƪ�v���S���������...";
      } else if (nRowsCount == -1) {
        strMessage = "�z�I��F '" + strSend + "' ����, ���O�S������@��...";
      }
      out.print(strMessage);
    %>
    
  </div>

</form>

</body>

</html>
