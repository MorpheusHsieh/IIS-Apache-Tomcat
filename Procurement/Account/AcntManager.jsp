<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Account"%>
<%@page import="avatar.dx.database.*"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../Utility/CheckSession.inc"%>


<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "AcntManager.jsp";
  Account clsAcnt = new Account();
%>  

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="../Utility/Window.js"></script>
  <title>�b���޲z</title>
</head>

<body>

<form name="frmAcntMgn" method="post" action="<%=strMySelf%>">
  
  <input type="hidden" name="btnSend" value="">
  <p>�ڬO<font color="#0000FF">�b���޲z</font>������...</p>

  <!-- ��ܦW���j�M //-->
  <%@include file="../Utility/TxtQuery.inc"%>
  <br>
  
  <!-- �]�w�����һ��ܼ� //-->
  <%
    int iRows = -1;
  %>  
  
  <!-- �̾ڤW�i�����ǰe�L�Ӫ��T��, �M�w�n�s�W�B�R���B�d�ߩέק� //-->
  <%
    String strMessage = "";
    String strSend = request.getParameter("BtnSend");
    String strRadio = request.getParameter("rdoOption");

    if (isDebug)  {
      out.print("Send: " + strSend + "<br>");
      out.print("Radio: " + strRadio + "<br>");
    }  

    if (strSend != null && strSend.length()>0)
    {
      if (isDebug) out.print("�z��ܤF '"+strSend+"'<br>");
      if (strSend.equals("�s�W�b��"))
      {
        %>
        <Script type="text/javascript" language="JavaScript">
        <!--
          parent.frames[1].document.location.href = "NewAccount.jsp";
        //-->  
        </Script>
        <%
      }
      else if (strSend.equals("�R���b��"))
      {
        %>
        <!-- �ڬO�R���b�����{���q... //-->
        <%@include file="../Account/DelAccount.inc"%>
        <%
      }
      else if (strSend.equals("�ק�b��"))
      {
        if (strRadio != null)
        {
          String strName = request.getParameter("txtName_" + strRadio);
          String strPswd = request.getParameter("txtPswd_" + strRadio);
          String strUnit = request.getParameter("txtUnit_" + strRadio);
          String strRole = request.getParameter("txtRole_" + strRadio);
          
          if (isDebug)
          {
            out.print(strName + ", " + strPswd + ", " + strUnit + ", " + strRole);
          }
          
          request.setAttribute("BtnSend", strSend);
          request.setAttribute("txtName", strName);
          request.setAttribute("txtPswd", strPswd);
          request.setAttribute("selUnit", strUnit);
          request.setAttribute("selRole", strRole);
          %>
          <jsp:forward page="EditAccount.jsp" />
          <%
        }
        else
        {
          out.print("�z�|����ܥ���n�ק諸�b���W��...<br>");
          %>
          <div align="center">
            <a href="../Account/AcntManager.jsp">�^�b���޲z����</a>
          </div>  
          <%
        }
      }
      else if (strSend.equals("�d�@�@��"))
      {
        if (isDebug) out.print("�z��ܤF '"+strSend+"'<br>");
        if (isExecuteQuery)
        {
          iRows = clsAcnt.QueryInsideOfColumns(strQuery);
        }
      
      }
      else if (strSend.equals("��ܥ����b��"))
      {
        iRows = clsAcnt.QueryForAllRows();
      }
    }  
    else if (strSend == null) {
      iRows = clsAcnt.QueryForAllRows();
    }
  %>  
  
  <!-- ��ܱb���M�� //-->
  <%
    if ((strSend == null) && (iRows == 0))
    {
      %>
      <br>
      <div align="center">
        <table border="0" width="100%">
          <tr>
            <td align="center"><input type="submit" name="BtnSend" value="�s�W�b��"></td>
          </tr>
        </table>
      </div>      
      <%
    }
    else if (iRows > 0)
    {
      %>
      
      <!-- ��ܱb�� //-->
      <%@include file="../Account/ShowAccount.inc"%>
      <br>
      <div align="center">
        <table border="0" width="100%">
          <tr>
            <td align="center"><input type="submit" name="BtnSend" value="�s�W�b��"></td>
            <td align="center"><input type="submit" name="BtnSend" value="�R���b��"></td>
            <td align="center"><input type="submit" name="BtnSend" value="�ק�b��"></td>
            <td align="center"><input type="submit" name="BtnSend" value="��ܥ����b��"></td>
          </tr>
        </table>    
      </div>  
      <%
      
    } 
    else if ((strSend == null) && (iRows == 0)) 
    {
      strMessage = "�z���U�F '" + strSend + "' ��A���O�S���d�������...";
    } 
    else if (iRows == -1) 
    {
      strMessage = "�z�I��F '" + strSend + "' ����, ���O�S������@��...";
    }
    out.print(strMessage);
    %>

  </form>

</body>




