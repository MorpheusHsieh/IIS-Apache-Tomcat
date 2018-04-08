<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Accnt_EBoard"%>

<%
  String strMySelf = "ChangePswd.jsp";
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
%>

<%
  // 程序判斷
  String send = request.getParameter("Send");
  
  if (send != null && send.length() > 0)
  {
    if (send.equals("我要修改密碼"))
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
          window.alert("密碼修改成功...");
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
          window.alert("密碼修改失敗...");
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
  <title>更換密碼的頁面</title>
  <script type="text/javascript" language="javascript" src="ChangePswd.js"></script>
</head>

<body>

<p>我是<font color="#0000FF">更換密碼</font>的頁面...</p>

<form name="frmChangePswd" method="post" action="ChangePswd.jsp">
  <input type="hidden" name="Send" value="">
  <div align="center">
  <table border="1">
    <tr>
      <td>舊密碼</td>
      <td><input type="password" name="txtOldPswd" size="20"></td>
    </tr>
    <tr>
      <td>新密碼</td>
      <td><input type="password" name="txtNewPswd" size="20"></td>
    </tr>
    <tr>
      <td>密碼確認</td>
      <td><input type="password" name="txtNewPswdCheck" size="20"></td>
    </tr>
  </table>
  <br>
  <input type="button" value="我要修改密碼" onClick="DataCheck()">
  </div>
</form>  

</body>

</html>














