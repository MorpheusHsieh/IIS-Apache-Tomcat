<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<%
  String strMySelf = "NewBudget.jsp";
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="NewBudget.js"></script>
  <title>登錄預算科目</title>
</head>

<body>

<form name="frmNewBdg" method="post" action="NewBudget-1.jsp">

  <input type="hidden" name="BtnSend" value="">

  <p>我是<font color="#0000ff">登錄預算科目</font>的頁面...</p>

  <div align="center">
    <table border="0" id="table1">
  	  <tr align="center">
		<td align="right">預算科目：</td>
		<td align="left"><input type="text" name="txtData01" size="20" value=""></td>
	  </tr>
	  <tr align="center">
	 	<td align="right">預算名稱：</td>
		<td align="left"><input type="text" name="txtData02" size="50" value=""></td>
	  </tr>
	  <tr align="center">
		<td align="right">金額：</td>
	 	<td align="left"><input type="text" name="txtData03" size="10">元</td>
	  </tr>
	</table>
	<br>
	<p align="center">
      <input type="button" name="button1" value="登錄預算" onclick="DataCheck()">
	</p>
  </div>	
  
  
</form>  


</body>

</html>