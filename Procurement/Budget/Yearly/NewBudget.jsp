<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<%
  String strMySelf = "NewBudget.jsp";
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="NewBudget.js"></script>
  <title>�n���w����</title>
</head>

<body>

<form name="frmNewBdg" method="post" action="NewBudget-1.jsp">

  <input type="hidden" name="BtnSend" value="">

  <p>�ڬO<font color="#0000ff">�n���w����</font>������...</p>

  <div align="center">
    <table border="0" id="table1">
  	  <tr align="center">
		<td align="right">�w���ءG</td>
		<td align="left"><input type="text" name="txtData01" size="20" value=""></td>
	  </tr>
	  <tr align="center">
	 	<td align="right">�w��W�١G</td>
		<td align="left"><input type="text" name="txtData02" size="50" value=""></td>
	  </tr>
	  <tr align="center">
		<td align="right">���B�G</td>
	 	<td align="left"><input type="text" name="txtData03" size="10">��</td>
	  </tr>
	</table>
	<br>
	<p align="center">
      <input type="button" name="button1" value="�n���w��" onclick="DataCheck()">
	</p>
  </div>	
  
  
</form>  


</body>

</html>