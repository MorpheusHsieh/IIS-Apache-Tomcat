<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>�ʮקe��</title>
</head>

<body>

<form name="frmSendDoc" method="post" action="Case1-1.jsp">

  <p>�ڬO<font color="#0000ff">�ʮקe��</font>������...</p>
  <input type="hidden" value="20062740001" name="txtAutoNum">
  <input type="hidden" value="���p��" name="txtSender">
  <input type="hidden" value="�����@" name="txtDeptName">
  <div align="left">
    <table border="0" id="table1">
	  <tr>
		<td align="right">�s���G</td>
		<td>200610010001</td>
	  </tr>
	  <tr>
		<td align="right">�m�W�G</td>
		<td>���p��</td>
	  </tr>
	  <tr>
		<td align="right">���G</td>
		<td>���� �@</td>
	  </tr>
	  <tr>
	 	<td align="right">�ӿ�H�G</td>
		<td><input value="���p��" name="txtEditor" size="10"></td>
	  </tr>
	  <tr>
		<td align="right">�D���G</td>
		<td><input size="80" name="txtTitle" value="�q���D�O��12��"></td>
	  </tr>
	  <tr>
		<td align="right">�^�ֵ��šG</td>
		<td><input type="radio" CHECKED value="�ѤT" name="txtPermit">�ѤT 
	     	<input type="radio" value="�ѤG" name="txtPermit">�ѤG 
		 	<input type="radio" value="�Ѥj" name="txtPermit">�Ѥj 
	 	</td>
	  </tr>
	</table>
  </div>
�@<div align="center">
    <input type="submit" value="�ʮ׵n��" name="BtnSend"> 
  </div>
  <div align="center">
	<hr>
	<!-- �]�w�����һ��ܼ� //--><!-- �̾ڤW�i�����ǰe�L�Ӫ��T��, �M�w�n�s�W�B�R���B�d�ߩέק� //-->
    <p>���U�O�z�w�ƭn�e�֦��O�٥��n�����ʮ�...
  </div>  
  
</form>

</body>

</html>
