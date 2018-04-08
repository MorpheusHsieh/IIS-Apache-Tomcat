<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript">
  <!--
    function DataCheck()
    {
      // 判斷「購案編號」是否為空白
      if (frmNewPurchase.txtData01.value == "")
      {
        window.alert("「購案編號」不可以是空白...");
        document.frmNewPurchase.elements[1].focus();
        return;
      }

      // 判斷「執行月份」是否為空白
      if (frmNewPurchase.txtData02.value == "")
      {
        window.alert("「執行月份」不可以是空白...");
        document.frmNewPurchase.elements[2].focus();
        return;
      }

      // 判斷「購案名稱」是否為空白
      if (frmNewPurchase.txtData03.value == "")
      {
        window.alert("「購案名稱」不可以是空白...");
        document.frmNewPurchase.elements[3].focus();
        return;
      }

      // 判斷「預算科目」是否為空白
      if (frmNewPurchase.txtData04.value == "")
      {
        window.alert("「預算科目」不可以是空白...");
        document.frmNewPurchase.elements[4].focus();
        return;
      }

      // 判斷「申購單位」是否為空白
      if (frmNewPurchase.txtData05.value == "")
      {
        window.alert("「申購單位」不可以是空白...");
        document.frmNewPurchase.elements[5].focus();
        return;
      }

      // 判斷「承辦人」是否為空白
      if (frmNewPurchase.txtData06.value == "")
      {
        window.alert("「承辦人」不可以是空白...");
        document.frmNewPurchase.elements[6].focus();
        return;
      }

      // 判斷「計畫金額」是否為空白
      if (frmNewPurchase.txtData07.value == "")
      {
        window.alert("「計畫金額」不可以是空白...");
        document.frmNewPurchase.elements[7].focus();
        return;
      }

      // 判斷「計畫金額」必需介於 -2^31 < txtData05 < 2^31-1
      if ((frmNewPurchase.txtData07.value < 0) || (frmNewPurchase.txtData07.value > Math.pow(2,31)) )
      {
        window.alert("「計畫金額」不可小於０或大於 2147483648(2^31)...");
        document.frmNewPurchase.elements[7].focus();
        return;
      }

      // 判斷「申購金額」是否為空白
      if (frmNewPurchase.txtData08.value == "")
      {
        window.alert("「申購金額」不可以是空白...");
        document.frmNewPurchase.elements[8].focus();
        return;
      }

      // 判斷「申購金額」必需介於 -2^31 < txtData05 < 2^31-1
      if ((frmNewPurchase.txtData08.value < 0) || (frmNewPurchase.txtData08.value > Math.pow(2,31)) )
      {
        window.alert("「申購金額」不可小於０或大於 2147483648(2^31)...");
        document.frmNewPurchase.elements[8].focus();
        return;
      }

      // 判斷「決標金額」是否為空白
      if (frmNewPurchase.txtData09.value == "")
      {
        window.alert("「決標金額」不可以是空白...");
        document.frmNewPurchase.elements[9].focus();
        return;
      }

      // 判斷「決標金額」必需介於 -2^31 < txtData05 < 2^31-1
      if ((frmNewPurchase.txtData09.value < 0) || (frmNewPurchase.txtData09.value > Math.pow(2,31)) )
      {
        window.alert("「決標金額」不可小於０或大於 2147483648(2^31)...");
        document.frmNewPurchase.elements[9].focus();
        return;
      }

      // 判斷「支用金額」是否為空白
      if (frmNewPurchase.txtData10.value == "")
      {
        window.alert("「支用金額」不可以是空白...");
        document.frmNewPurchase.elements[10].focus();
        return;
      }

      // 判斷「支用金額」必需介於 -2^31 < txtData05 < 2^31-1
      if ((frmNewPurchase.txtData10.value < 0) || (frmNewPurchase.txtData10.value > Math.pow(2,31)) )
      {
        window.alert("「支用金額」不可小於０或大於 2147483648(2^31)...");
        document.frmNewPurchase.elements[10].focus();
        return;
      }
      
      // 判斷「交貨天數」是否為空白
      if (frmNewPurchase.txtData11.value == "")
      {
        window.alert("「交貨天數」不可以是空白...");
        document.frmNewPurchase.elements[11].focus();
        return;
      }
      
      // 判斷「核定權責」是否為空白
      if (frmNewPurchase.txtData12.value == "")
      {
        window.alert("「核定權責」不可以是空白...");
        document.frmNewPurchase.elements[12].focus();
        return;
      }
      
      // 判斷「採購途徑」是否為空白
      if (frmNewPurchase.txtData13.value == "")
      {
        window.alert("「採購途徑」不可以是空白...");
        document.frmNewPurchase.elements[13].focus();
        return;
      }
      
      // 判斷「採購單位」是否為空白
      if (frmNewPurchase.txtData14.value == "")
      {
        window.alert("「採購單位」不可以是空白...");
        document.frmNewPurchase.elements[14].focus();
        return;
      }
      
      // 判斷「招標方式」是否為空白
      if (frmNewPurchase.txtData15.value == "")
      {
        window.alert("「招標天數」不可以是空白...");
        document.frmNewPurchase.elements[15].focus();
        return;
      }

      document.frmNewPurchase.BtnSend.value = "新增購案";
      document.frmNewPurchase.submit();
    }
  //-->
  </script>
  <title>新增計畫案</title>
</head>

<body>

<form name="frmNewPurchase" method="post" action="NewPurchase-1.jsp"> 

  <input type="hidden" name="BtnSend" value="">
  <p>我是<font color="#0000FF">新增購案</font>的頁面...</p>

  <div align="center">
    <table border="0" id="table1">
  	  <tr align="center">
		<td align="right">購案編號：</td>
		<td align="left"><input type="text" name="txtData01" size="20" value=""></td>
	  </tr>
	  <tr align="center">
	 	<td align="right">執行月份：</td>
		<td align="left">
		  <SELECT name="txtData02" size="1">
			<OPTION value="一月">一月</OPTION>
			<OPTION value="二月">二月</OPTION>
			<OPTION value="三月">三月</OPTION>
			<OPTION value="四月">四月</OPTION>
			<OPTION value="五月">五月</OPTION>
			<OPTION value="六月">六月</OPTION>
			<OPTION value="七月">七月</OPTION>
			<OPTION value="八月">八月</OPTION>
			<OPTION value="九月">九月</OPTION>
			<OPTION value="十月">十月</OPTION>
			<OPTION value="十一月">十一月</OPTION>
			<OPTION value="十二月">十二月</OPTION>
		  </SELECT>
		</td>
	  </tr>
  	  <tr align="center">
		<td align="right">購案名稱：</td>
		<td align="left"><input type="text" name="txtData03" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">預算科目：</td>
		<td align="left"><input type="text" name="txtData04" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">申請單位：</td>
		<td align="left"><input type="text" name="txtData05" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">承辦人：</td>
		<td align="left"><input type="text" name="txtData06" size="20" value=""></td>
	  </tr>
	  <tr align="center">
		<td align="right">計畫金額：</td>
	 	<td align="left"><input type="text" name="txtData07" size="10" value="0">元</td>
	  </tr>
	  <tr align="center">
		<td align="right">申購金額：</td>
	 	<td align="left"><input type="text" name="txtData08" size="10" value="0">元</td>
	  </tr>
	  <tr align="center">
		<td align="right">決標金額：</td>
	 	<td align="left"><input type="text" name="txtData09" size="10" value="0">元</td>
	  </tr>
	  <tr align="center">
		<td align="right">支用金額：</td>
	 	<td align="left"><input type="text" name="txtData10" size="10" value="0">元</td>
	  </tr>
	  <tr align="center">
		<td align="right">交貨天數：</td>
	 	<td align="left"><input type="text" name="txtData11" size="10" value="0">元</td>
	  </tr>
	  <tr align="center">
		<td align="right">核定權責：</td>
	 	<td align="left">
	 	  <SELECT name="txtData12" size="1">
			<OPTION value="本單位">本單位</OPTION>
			<OPTION value="上級單位">上級單位</OPTION>
	 	  </SELECT>
	 	</td>
	  </tr>
	  <tr align="center">
		<td align="right">採購途徑：</td>
	 	<td align="left">
	 	  <SELECT name="txtData13" size="1">
			<OPTION value="內購" selected>內購</OPTION>
	 	  </SELECT>
	 	</td>
	  </tr>
	  <tr align="center">
		<td align="right">採購單位：</td>
	 	<td align="left">
	 	  <SELECT name="txtData14" size="1">
			<OPTION value="採購組" selected>採購組</OPTION>
	 	  </SELECT>
	 	</td>
	  </tr>
	  <tr align="center">
		<td align="right">招標方式：</td>
	 	<td align="left">
	 	  <SELECT name="txtData15" size="1">
			<OPTION value="小額採購" selected>小額採購</OPTION>
			<OPTION value="共同供應">共同供應</OPTION>
			<OPTION value="公開徵求">公開徵求</OPTION>
			<OPTION value="委製">委製</OPTION>
	 	  </SELECT>
	 	</td>
	  </tr>
  	  <tr align="center">
		<td align="right">核定日期：</td>
		<td align="left"><input type="text" name="txtData16" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">開標日期：</td>
		<td align="left"><input type="text" name="txtData17" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">簽約日期：</td>
		<td align="left"><input type="text" name="txtData18" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">交貨日期：</td>
		<td align="left"><input type="text" name="txtData19" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">驗收日期：</td>
		<td align="left"><input type="text" name="txtData20" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">核銷日期：</td>
		<td align="left"><input type="text" name="txtData21" size="20" value=""></td>
	  </tr>
  	  <tr align="center">
		<td align="right">結案日期：</td>
		<td align="left"><input type="text" name="txtData22" size="20" value=""></td>
	  </tr>
	</table>
	<br>
	<p align="center">
      <input type="button" name="button1" value="新增購案" onclick="DataCheck()">
	</p>
  </div>	

</form>  

</body>

</html>
