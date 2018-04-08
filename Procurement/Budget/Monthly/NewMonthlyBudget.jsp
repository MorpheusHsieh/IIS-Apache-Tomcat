<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="NewMonthlyBudget.js"></script>
  <title>新增月分配</title>
</head>

<body>

<form name="frmMonthlyBdg" method="post" action="NewMonthlyBudget-1.jsp"> 

  <input type="hidden" name="BtnSend" value="">
  <p>我是<font color="#0000FF">新增月分配</font>的頁面...</p>

  <div align="center">
    <table border="0" id="table1">
  	  <tr align="center">
		<td align="right">預算科目：</td>
		<td align="left"><input type="text" name="txtData01" size="20" value=""></td>
	  </tr>
	  <tr align="center">
	 	<td align="right">月分配月份：</td>
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
		<td align="right">月分配金額：</td>
	 	<td align="left"><input type="text" name="txtData03" size="10">元</td>
	  </tr>
	</table>
	<br>
	<p align="center">
      <input type="button" name="button1" value="收入月分配" onclick="DataCheck()">
	</p>
  </div>	

</form>  

</body>

</html>
