<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="NewMonthlyBudget.js"></script>
  <title>�s�W����t</title>
</head>

<body>

<form name="frmMonthlyBdg" method="post" action="NewMonthlyBudget-1.jsp"> 

  <input type="hidden" name="BtnSend" value="">
  <p>�ڬO<font color="#0000FF">�s�W����t</font>������...</p>

  <div align="center">
    <table border="0" id="table1">
  	  <tr align="center">
		<td align="right">�w���ءG</td>
		<td align="left"><input type="text" name="txtData01" size="20" value=""></td>
	  </tr>
	  <tr align="center">
	 	<td align="right">����t����G</td>
		<td align="left">
		  <SELECT name="txtData02" size="1">
			<OPTION value="�@��">�@��</OPTION>
			<OPTION value="�G��">�G��</OPTION>
			<OPTION value="�T��">�T��</OPTION>
			<OPTION value="�|��">�|��</OPTION>
			<OPTION value="����">����</OPTION>
			<OPTION value="����">����</OPTION>
			<OPTION value="�C��">�C��</OPTION>
			<OPTION value="�K��">�K��</OPTION>
			<OPTION value="�E��">�E��</OPTION>
			<OPTION value="�Q��">�Q��</OPTION>
			<OPTION value="�Q�@��">�Q�@��</OPTION>
			<OPTION value="�Q�G��">�Q�G��</OPTION>
		  </SELECT>
		</td>
	  </tr>
	  <tr align="center">
		<td align="right">����t���B�G</td>
	 	<td align="left"><input type="text" name="txtData03" size="10">��</td>
	  </tr>
	</table>
	<br>
	<p align="center">
      <input type="button" name="button1" value="���J����t" onclick="DataCheck()">
	</p>
  </div>	

</form>  

</body>

</html>
