<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript">
  <!--
    function DataCheck()
    {
      // �P�_�u�ʮ׽s���v�O�_���ť�
      if (frmNewPurchase.txtData01.value == "")
      {
        window.alert("�u�ʮ׽s���v���i�H�O�ť�...");
        document.frmNewPurchase.elements[1].focus();
        return;
      }

      // �P�_�u�������v�O�_���ť�
      if (frmNewPurchase.txtData02.value == "")
      {
        window.alert("�u�������v���i�H�O�ť�...");
        document.frmNewPurchase.elements[2].focus();
        return;
      }

      // �P�_�u�ʮצW�١v�O�_���ť�
      if (frmNewPurchase.txtData03.value == "")
      {
        window.alert("�u�ʮצW�١v���i�H�O�ť�...");
        document.frmNewPurchase.elements[3].focus();
        return;
      }

      // �P�_�u�w���ءv�O�_���ť�
      if (frmNewPurchase.txtData04.value == "")
      {
        window.alert("�u�w���ءv���i�H�O�ť�...");
        document.frmNewPurchase.elements[4].focus();
        return;
      }

      // �P�_�u���ʳ��v�O�_���ť�
      if (frmNewPurchase.txtData05.value == "")
      {
        window.alert("�u���ʳ��v���i�H�O�ť�...");
        document.frmNewPurchase.elements[5].focus();
        return;
      }

      // �P�_�u�ӿ�H�v�O�_���ť�
      if (frmNewPurchase.txtData06.value == "")
      {
        window.alert("�u�ӿ�H�v���i�H�O�ť�...");
        document.frmNewPurchase.elements[6].focus();
        return;
      }

      // �P�_�u�p�e���B�v�O�_���ť�
      if (frmNewPurchase.txtData07.value == "")
      {
        window.alert("�u�p�e���B�v���i�H�O�ť�...");
        document.frmNewPurchase.elements[7].focus();
        return;
      }

      // �P�_�u�p�e���B�v���ݤ��� -2^31 < txtData05 < 2^31-1
      if ((frmNewPurchase.txtData07.value < 0) || (frmNewPurchase.txtData07.value > Math.pow(2,31)) )
      {
        window.alert("�u�p�e���B�v���i�p�󢯩Τj�� 2147483648(2^31)...");
        document.frmNewPurchase.elements[7].focus();
        return;
      }

      // �P�_�u���ʪ��B�v�O�_���ť�
      if (frmNewPurchase.txtData08.value == "")
      {
        window.alert("�u���ʪ��B�v���i�H�O�ť�...");
        document.frmNewPurchase.elements[8].focus();
        return;
      }

      // �P�_�u���ʪ��B�v���ݤ��� -2^31 < txtData05 < 2^31-1
      if ((frmNewPurchase.txtData08.value < 0) || (frmNewPurchase.txtData08.value > Math.pow(2,31)) )
      {
        window.alert("�u���ʪ��B�v���i�p�󢯩Τj�� 2147483648(2^31)...");
        document.frmNewPurchase.elements[8].focus();
        return;
      }

      // �P�_�u�M�Ъ��B�v�O�_���ť�
      if (frmNewPurchase.txtData09.value == "")
      {
        window.alert("�u�M�Ъ��B�v���i�H�O�ť�...");
        document.frmNewPurchase.elements[9].focus();
        return;
      }

      // �P�_�u�M�Ъ��B�v���ݤ��� -2^31 < txtData05 < 2^31-1
      if ((frmNewPurchase.txtData09.value < 0) || (frmNewPurchase.txtData09.value > Math.pow(2,31)) )
      {
        window.alert("�u�M�Ъ��B�v���i�p�󢯩Τj�� 2147483648(2^31)...");
        document.frmNewPurchase.elements[9].focus();
        return;
      }

      // �P�_�u��Ϊ��B�v�O�_���ť�
      if (frmNewPurchase.txtData10.value == "")
      {
        window.alert("�u��Ϊ��B�v���i�H�O�ť�...");
        document.frmNewPurchase.elements[10].focus();
        return;
      }

      // �P�_�u��Ϊ��B�v���ݤ��� -2^31 < txtData05 < 2^31-1
      if ((frmNewPurchase.txtData10.value < 0) || (frmNewPurchase.txtData10.value > Math.pow(2,31)) )
      {
        window.alert("�u��Ϊ��B�v���i�p�󢯩Τj�� 2147483648(2^31)...");
        document.frmNewPurchase.elements[10].focus();
        return;
      }
      
      // �P�_�u��f�Ѽơv�O�_���ť�
      if (frmNewPurchase.txtData11.value == "")
      {
        window.alert("�u��f�Ѽơv���i�H�O�ť�...");
        document.frmNewPurchase.elements[11].focus();
        return;
      }
      
      // �P�_�u�֩w�v�d�v�O�_���ť�
      if (frmNewPurchase.txtData12.value == "")
      {
        window.alert("�u�֩w�v�d�v���i�H�O�ť�...");
        document.frmNewPurchase.elements[12].focus();
        return;
      }
      
      // �P�_�u���ʳ~�|�v�O�_���ť�
      if (frmNewPurchase.txtData13.value == "")
      {
        window.alert("�u���ʳ~�|�v���i�H�O�ť�...");
        document.frmNewPurchase.elements[13].focus();
        return;
      }
      
      // �P�_�u���ʳ��v�O�_���ť�
      if (frmNewPurchase.txtData14.value == "")
      {
        window.alert("�u���ʳ��v���i�H�O�ť�...");
        document.frmNewPurchase.elements[14].focus();
        return;
      }
      
      // �P�_�u�ۼФ覡�v�O�_���ť�
      if (frmNewPurchase.txtData15.value == "")
      {
        window.alert("�u�ۼФѼơv���i�H�O�ť�...");
        document.frmNewPurchase.elements[15].focus();
        return;
      }

      document.frmNewPurchase.BtnSend.value = "�s�W�ʮ�";
      document.frmNewPurchase.submit();
    }
  //-->
  </script>
  <title>�s�W�p�e��</title>
</head>

<body>

<form name="frmNewPurchase" method="post" action="NewPurchase-1.jsp"> 

  <input type="hidden" name="BtnSend" value="">
  <p>�ڬO<font color="#0000FF">�s�W�ʮ�</font>������...</p>

  <div align="center">
    <table border="0" id="table1">
  	  <tr align="center">
		<td align="right">�ʮ׽s���G</td>
		<td align="left"><input type="text" name="txtData01" size="20" value=""></td>
	  </tr>
	  <tr align="center">
	 	<td align="right">�������G</td>
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
		<td align="right">�ʮצW�١G</td>
		<td align="left"><input type="text" name="txtData03" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">�w���ءG</td>
		<td align="left"><input type="text" name="txtData04" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">�ӽг��G</td>
		<td align="left"><input type="text" name="txtData05" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">�ӿ�H�G</td>
		<td align="left"><input type="text" name="txtData06" size="20" value=""></td>
	  </tr>
	  <tr align="center">
		<td align="right">�p�e���B�G</td>
	 	<td align="left"><input type="text" name="txtData07" size="10" value="0">��</td>
	  </tr>
	  <tr align="center">
		<td align="right">���ʪ��B�G</td>
	 	<td align="left"><input type="text" name="txtData08" size="10" value="0">��</td>
	  </tr>
	  <tr align="center">
		<td align="right">�M�Ъ��B�G</td>
	 	<td align="left"><input type="text" name="txtData09" size="10" value="0">��</td>
	  </tr>
	  <tr align="center">
		<td align="right">��Ϊ��B�G</td>
	 	<td align="left"><input type="text" name="txtData10" size="10" value="0">��</td>
	  </tr>
	  <tr align="center">
		<td align="right">��f�ѼơG</td>
	 	<td align="left"><input type="text" name="txtData11" size="10" value="0">��</td>
	  </tr>
	  <tr align="center">
		<td align="right">�֩w�v�d�G</td>
	 	<td align="left">
	 	  <SELECT name="txtData12" size="1">
			<OPTION value="�����">�����</OPTION>
			<OPTION value="�W�ų��">�W�ų��</OPTION>
	 	  </SELECT>
	 	</td>
	  </tr>
	  <tr align="center">
		<td align="right">���ʳ~�|�G</td>
	 	<td align="left">
	 	  <SELECT name="txtData13" size="1">
			<OPTION value="����" selected>����</OPTION>
	 	  </SELECT>
	 	</td>
	  </tr>
	  <tr align="center">
		<td align="right">���ʳ��G</td>
	 	<td align="left">
	 	  <SELECT name="txtData14" size="1">
			<OPTION value="���ʲ�" selected>���ʲ�</OPTION>
	 	  </SELECT>
	 	</td>
	  </tr>
	  <tr align="center">
		<td align="right">�ۼФ覡�G</td>
	 	<td align="left">
	 	  <SELECT name="txtData15" size="1">
			<OPTION value="�p�B����" selected>�p�B����</OPTION>
			<OPTION value="�@�P����">�@�P����</OPTION>
			<OPTION value="���}�x�D">���}�x�D</OPTION>
			<OPTION value="�e�s">�e�s</OPTION>
	 	  </SELECT>
	 	</td>
	  </tr>
  	  <tr align="center">
		<td align="right">�֩w����G</td>
		<td align="left"><input type="text" name="txtData16" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">�}�Ф���G</td>
		<td align="left"><input type="text" name="txtData17" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">ñ������G</td>
		<td align="left"><input type="text" name="txtData18" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">��f����G</td>
		<td align="left"><input type="text" name="txtData19" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">�禬����G</td>
		<td align="left"><input type="text" name="txtData20" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">�־P����G</td>
		<td align="left"><input type="text" name="txtData21" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">���פ���G</td>
		<td align="left"><input type="text" name="txtData22" size="20" value=""></td>
	  </tr>
	</table>
	<br>
	<p align="center">
      <input type="button" name="button1" value="�s�W�ʮ�" onclick="DataCheck()">
	</p>
  </div>	

</form>  

</body>

</html>
