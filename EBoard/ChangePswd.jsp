<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Accnt_EBoard"%>

<%
  String strMySelf = "ChangePswd.jsp";
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
%>

<%
  // �{�ǧP�_
  String send = request.getParameter("Send");
  
  if (send != null && send.length() > 0)
  {
    if (send.equals("�ڭn�ק�K�X"))
    {
      String sUserName = (String)session.getAttribute("UserName");
      String sOldPswd = request.getParameter("txtOldPswd");
      String sNewPswd = request.getParameter("txtNewPswd");
    
      Accnt_EBoard ae = new Accnt_EBoard(ini_file);
      ae.OpenConnection();
      int result = ae.UpdatePassword(sUserName, sOldPswd, sNewPswd);
      ae.CloseConnection();
      if (result == 1)
      {
        %>
        <Script Language="JavaScript">        
        <!--
          window.alert("�K�X�ק令�\...");
          window.close();          
        //-->
        </Script>
        <%
      }
      else
      {
        %>
        <Script Language="JavaScript">
        <!--
          window.alert("�K�X�ק異��...");
          window.close();
        //-->
        </Script>
        <%      
      }
    }
  }
%>

<html>
<head>
  <title>�󴫱K�X������</title>
  <script type="text/javascript" language="javascript" src="ChangePswd.js"></script>
</head>

<body>

<p>�ڬO<font color="#0000FF">�󴫱K�X</font>������...</p>

<form name="frmChangePswd" method="post" action="ChangePswd.jsp">
  <input type="hidden" name="Send" value="">
  <div align="center">
  <table border="1">
    <tr>
      <td>�±K�X</td>
      <td><input type="password" name="txtOldPswd" size="20"></td>
    </tr>
    <tr>
      <td>�s�K�X</td>
      <td><input type="password" name="txtNewPswd" size="20"></td>
    </tr>
    <tr>
      <td>�K�X�T�{</td>
      <td><input type="password" name="txtNewPswdCheck" size="20"></td>
    </tr>
  </table>
  <br>
  <input type="button" value="�ڭn�ק�K�X" onClick="DataCheck()">
  </div>
</form>  

</body>

</html>














