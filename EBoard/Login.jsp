<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Accnt_EBoard"%>

<%
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
  Accnt_EBoard ae = new Accnt_EBoard(ini_file);
  ae.OpenConnection();
  String[] user_list = ae.getAllUserName();
  ae.CloseConnection();
%>

<html>
<head>
  <title>��F�Ǥ��i�t��</title>
  <script type="text/javascript" language="javascript" src="login.js"></script>
</head>

<body>

<form name="frmLogin" method="post" action="LoginCheck.jsp">

  <p align="center">
  <font size="5" face="�з���" color="#0000FF">��F�Ǥ��i�T���t�δ��ժ� 
  beta 1.0</font>

  <p align="center">
  �@
  <table border="1">
    <tr>
      <td>�b���G</td>
      <td>
        <select size="1" name="selUserName">
          <option value="" selected></option>
        <%
          for (int i=0; i<user_list.length; i++)
            out.print("<option value='"+user_list[i]+"'>"+user_list[i]+"</option>");
        %>
        </select>
      </td>
    </tr>
    <tr>
      <td>�K�X�G</td>
      <td>
        <input type="password" name="txtPasswd" size="20">
      </td>
    </tr>
  </table>
  <br>
  <input type="button" value="�e�X���" name="Send" onClick="DataCheck()">
  <input type="reset" value="���s�]�w" name="Reset">  
</form>

</body>
</html>
