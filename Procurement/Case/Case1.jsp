<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>購案呈核</title>
</head>

<body>

<form name="frmSendDoc" method="post" action="Case1-1.jsp">

  <p>我是<font color="#0000ff">購案呈核</font>的頁面...</p>
  <input type="hidden" value="20062740001" name="txtAutoNum">
  <input type="hidden" value="黃小中" name="txtSender">
  <input type="hidden" value="部門一" name="txtDeptName">
  <div align="left">
    <table border="0" id="table1">
	  <tr>
		<td align="right">編號：</td>
		<td>200610010001</td>
	  </tr>
	  <tr>
		<td align="right">姓名：</td>
		<td>黃小中</td>
	  </tr>
	  <tr>
		<td align="right">單位：</td>
		<td>部門 一</td>
	  </tr>
	  <tr>
	 	<td align="right">承辦人：</td>
		<td><input value="黃小中" name="txtEditor" size="10"></td>
	  </tr>
	  <tr>
		<td align="right">主旨：</td>
		<td><input size="80" name="txtTitle" value="電腦主板等12項"></td>
	  </tr>
	  <tr>
		<td align="right">奉核等級：</td>
		<td><input type="radio" CHECKED value="老三" name="txtPermit">老三 
	     	<input type="radio" value="老二" name="txtPermit">老二 
		 	<input type="radio" value="老大" name="txtPermit">老大 
	 	</td>
	  </tr>
	</table>
  </div>
　<div align="center">
    <input type="submit" value="購案登錄" name="BtnSend"> 
  </div>
  <div align="center">
	<hr>
	<!-- 設定分頁所需變數 //--><!-- 依據上張網頁傳送過來的訊息, 決定要新增、刪除、查詢或修改 //-->
    <p>底下是您預備要呈核但是還未登錄的購案...
  </div>  
  
</form>

</body>

</html>
