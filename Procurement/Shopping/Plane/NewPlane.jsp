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
      // 判斷「計畫編號」是否為空白
      if (frmNewPlane.txtData01.value == "")
      {
        window.alert("「計畫編號」不可以是空白...");
        document.frmNewPlane.elements[1].focus();
        return;
      }

      // 判斷「執行月份」是否為空白
      if (frmNewPlane.txtData02.value == "")
      {
        window.alert("「執行月份」不可以是空白...");
        document.frmNewPlane.elements[2].focus();
        return;
      }

      // 判斷「計畫名稱」是否為空白
      if (frmNewPlane.txtData03.value == "")
      {
        window.alert("「計畫名稱」不可以是空白...");
        document.frmNewPlane.elements[3].focus();
        return;
      }

      // 判斷「預算科目」是否為空白
      if (frmNewPlane.txtData04.value == "")
      {
        window.alert("「預算科目」不可以是空白...");
        document.frmNewPlane.elements[4].focus();
        return;
      }

      // 判斷「申請單位」是否為空白
      if (frmNewPlane.txtData05.value == "")
      {
        window.alert("「申請單位」不可以是空白...");
        document.frmNewPlane.elements[5].focus();
        return;
      }

      // 判斷「承辦人」是否為空白
      if (frmNewPlane.txtData06.value == "")
      {
        window.alert("「承辦人」不可以是空白...");
        document.frmNewPlane.elements[6].focus();
        return;
      }

      // 判斷「計畫金額」是否為空白
      if (frmNewPlane.txtData07.value == "")
      {
        window.alert("「計畫金額」不可以是空白...");
        document.frmNewPlane.elements[7].focus();
        return;
      }

      // 判斷「計畫金額」必需介於 -2^31 < txtData05 < 2^31-1
      if ((frmNewPlane.txtData07.value < 0) || (frmNewPlane.txtData07.value > Math.pow(2,31)) )
      {
        window.alert("「計畫金額」不可小於０或大於 2147483648(2^31)...");
        document.frmNewPlane.elements[7].focus();
        return;
      }
      
      document.frmNewPlane.BtnSend.value = "新增計畫案";
      document.frmNewPlane.submit();
    }
  //-->
  </script>
  <title>新增計畫案</title>
</head>

<body>

<form name="frmNewPlane" method="post" action="NewPlane-1.jsp"> 

  <input type="hidden" name="BtnSend" value="">
  <p>我是<font color="#0000FF">新增計畫案</font>的頁面...</p>

  <div align="center">
    <table border="0" id="table1">
  	  <tr align="center">
		<td align="right">計畫編號：</td>
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
		<td align="right">計畫名稱：</td>
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
	 	<td align="left"><input type="text" name="txtData07" size="10">元</td>
	  </tr>
  	  <tr align="center">
		<td align="right">核定日期：</td>
		<td align="left"><input type="text" name="txtData08" size="20" value=""></td>
	  </tr>
	</table>
	<br>
	<p align="center">
      <input type="button" name="button1" value="新增計畫案" onclick="DataCheck()">
	</p>
  </div>	

</form>  

</body>

</html>
