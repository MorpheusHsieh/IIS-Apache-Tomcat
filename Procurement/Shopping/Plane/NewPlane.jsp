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
      // �P�_�u�p�e�s���v�O�_���ť�
      if (frmNewPlane.txtData01.value == "")
      {
        window.alert("�u�p�e�s���v���i�H�O�ť�...");
        document.frmNewPlane.elements[1].focus();
        return;
      }

      // �P�_�u�������v�O�_���ť�
      if (frmNewPlane.txtData02.value == "")
      {
        window.alert("�u�������v���i�H�O�ť�...");
        document.frmNewPlane.elements[2].focus();
        return;
      }

      // �P�_�u�p�e�W�١v�O�_���ť�
      if (frmNewPlane.txtData03.value == "")
      {
        window.alert("�u�p�e�W�١v���i�H�O�ť�...");
        document.frmNewPlane.elements[3].focus();
        return;
      }

      // �P�_�u�w���ءv�O�_���ť�
      if (frmNewPlane.txtData04.value == "")
      {
        window.alert("�u�w���ءv���i�H�O�ť�...");
        document.frmNewPlane.elements[4].focus();
        return;
      }

      // �P�_�u�ӽг��v�O�_���ť�
      if (frmNewPlane.txtData05.value == "")
      {
        window.alert("�u�ӽг��v���i�H�O�ť�...");
        document.frmNewPlane.elements[5].focus();
        return;
      }

      // �P�_�u�ӿ�H�v�O�_���ť�
      if (frmNewPlane.txtData06.value == "")
      {
        window.alert("�u�ӿ�H�v���i�H�O�ť�...");
        document.frmNewPlane.elements[6].focus();
        return;
      }

      // �P�_�u�p�e���B�v�O�_���ť�
      if (frmNewPlane.txtData07.value == "")
      {
        window.alert("�u�p�e���B�v���i�H�O�ť�...");
        document.frmNewPlane.elements[7].focus();
        return;
      }

      // �P�_�u�p�e���B�v���ݤ��� -2^31 < txtData05 < 2^31-1
      if ((frmNewPlane.txtData07.value < 0) || (frmNewPlane.txtData07.value > Math.pow(2,31)) )
      {
        window.alert("�u�p�e���B�v���i�p�󢯩Τj�� 2147483648(2^31)...");
        document.frmNewPlane.elements[7].focus();
        return;
      }
      
      document.frmNewPlane.BtnSend.value = "�s�W�p�e��";
      document.frmNewPlane.submit();
    }
  //-->
  </script>
  <title>�s�W�p�e��</title>
</head>

<body>

<form name="frmNewPlane" method="post" action="NewPlane-1.jsp"> 

  <input type="hidden" name="BtnSend" value="">
  <p>�ڬO<font color="#0000FF">�s�W�p�e��</font>������...</p>

  <div align="center">
    <table border="0" id="table1">
  	  <tr align="center">
		<td align="right">�p�e�s���G</td>
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
		<td align="right">�p�e�W�١G</td>
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
	 	<td align="left"><input type="text" name="txtData07" size="10">��</td>
	  </tr>
  	  <tr align="center">
		<td align="right">�֩w����G</td>
		<td align="left"><input type="text" name="txtData08" size="20" value=""></td>
	  </tr>
	</table>
	<br>
	<p align="center">
      <input type="button" name="button1" value="�s�W�p�e��" onclick="DataCheck()">
	</p>
  </div>	

</form>  

</body>

</html>
