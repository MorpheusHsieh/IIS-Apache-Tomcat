<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>�s�W����1</title>
</head>

<body>

<%
  String strBtnSend = request.getParameter("BtnSend");
  if (strBtnSend != null && strBtnSend.length()>0)
  {
    if (strBtnSend.equals("�ʮקe��"))
    {
      %>
      <Script Language="JavaScript">
      <!--
        parent.frames[1].document.location.href = "Case1-1.jsp";
      //-->  
      </Script>
      <%
    }
    else if (strBtnSend.equals("�ڤ��e�F"))
    {
      %>
      <Script Language="JavaScript">
      <!--
        parent.frames[1].document.location.href = "Case1.jsp";
      //-->  
      </Script>
      <%
    }
  }  
%>

<form name="frmSendDoc" method="post" action="Case1-1.jsp">
	<p>�ڬO<font color="#0000ff">�e��</font>������...</p>
	<input type="hidden" value="200610010001" name="txtAutoNum">
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
		<input onclick="DataCheck()" type="button" value="�ʮקe��" name="send"> 
	</div>
	<div align="center">
�@</div>
	<div align="center">
		<hr><!-- �]�w�����һ��ܼ� //--><!-- �̾ڤW�i�����ǰe�L�Ӫ��T��, �M�w�n�s�W�B�R���B�d�ߩέק� //-->
		<p>���U�O�z�w�ƭn�e�֦��O�٥��n�����ʮ�...</p>
		<div align="center">
			<table width="100%" border="1" id="table2">
				<tr>
					<td width="34">�I��</td>
					<td>�۰ʽs��</td>
					<td>�D��</td>
					<td>�ӿ�H</td>
					<td>�����W��</td>
					<td>�^�ֵ���</td>
				</tr>
				<tr>
					<td align="middle">
					<input type="checkbox" value="20062740001" name="chkOption"></td>
					<td>20061001001</td>
					<td>�q���D�O��12��</td>
					<td>���p��</td>
					<td>�����@</td>
					<td>�ѤT</td>
				</tr>
			</table>
		</div>
		<!-- ��ܫ��s��� //--><br>
�@<div align="center">
			<table width="100%" border="0" id="table3">
				<tr>
					<td align="middle">
					<input type="submit" value="�ڤ��e�F" name="BtnSend"></td>
				</tr>
			</table>
		</div>
		<p>�@</div>
</form>

</body>

</html>