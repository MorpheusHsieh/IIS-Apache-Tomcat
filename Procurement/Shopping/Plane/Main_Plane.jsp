<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page import="Morpheus.dx.database.*"%>
<%@page import="Procurement.Plane"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "Main_Plane.jsp";
  Plane clsPlane = new Plane();
%>  

<html>

<head>
  <script type="text/javascript" language="javascript" src="../../Utility/Window.js"></script>
  <title>�p�e���ʮ�</title>
</head>

<body>


<form name="frmMainPlane" method="post" action="<%=strMySelf%>"> 

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
            nRowsCount = clsPlane.QueryInsideOfColumns(strQuery);
          }
        }
        else if (strSend.equals("�s�W�p�e��"))
        {
          %>
          <Script type="text/javascript" language="JavaScript">
          <!--
            parent.frames[1].document.location.href = "NewPlane.jsp";
          //-->  
          </Script>
          <%
        }
        else if (strSend.equals("�ק�p�e��"))
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
            out.print("�z�|����ܥ���n�ק諸�p�e��...<br>");
            %>
            <div align="center">
              <a href="Main_Plane.jsp">�^�u�p�e�׺޲z�v����</a>
            </div>  
            <%
          }
        }
        else if (strSend.equals("�R���p�e��"))
        {
          %>
          <!-- �ڬO�R���p�e�ת��{���q... //-->
          <%@include file="DelPlane.inc"%>
          <%
        }
        else if (strSend.equals("�ಾ�p�e��"))
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
            out.print("�z�|����ܥ���n�ಾ���ʮ׸�Ʈw���p�e��...<br>");
            %>
            <div align="center">
              <a href="Main_Plane.jsp">�^�u�p�e�׺޲z�v����</a>
            </div>  
            <%
          }
        }
        else if (strSend.equals("��ܥ���"))
        {
		  nRowsCount = clsPlane.QueryForAllRows();
        }
      } else if (strSend == null) {
		nRowsCount = clsPlane.QueryForAllRows();
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
              <td align="center"><input type="submit" name="BtnSend" value="�s�W�p�e��"></td>
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