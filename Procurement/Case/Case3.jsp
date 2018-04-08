<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>核定購案領回</title>
</head>

<body>

<form name="frmReceiptor" method="post" action="Case3-1.jsp">
	<p>我是<font color="#0000ff">核定購案領回</font>的頁面...</p>
	<!-- 顯示名詞搜尋 //-->
	<table width="100%" border="0" id="table1">
		<tr>
			<td align="middle"><input size="40" name="txtQuery">
			<input type="submit" value="查　　詢" name="BtnSend1"> </td>
		</tr>
	</table>
	<!-- 設定分頁所需變數 //--><!-- 依據上張網頁傳送過來的訊息, 決定要新增、刪除、查詢或修改 //--><!-- 顯示分頁上選單 //-->
	<!-- 顯示資料列 //-->
	<table width="100%" border="1" id="table4">
		<tr>
			<td width="34" rowSpan="2">
			<input type="submit" value="點選" name="BtnSend2"></td>
			<td rowSpan="2">編號</td>
			<td rowSpan="2">主旨</td>
			<td rowSpan="2">承辦人</td>
			<td rowSpan="2">部門</td>
			<td rowSpan="2">批示</td>
			<td colSpan="3">
			<p align="center">核定日期</td>
		</tr>
		<tr>
			<td align="center">老三</td>
			<td align="center">老二</td>
			<td align="center">老大</td>
		</tr>
		<tr>
			<td align="middle">
			<input type="checkbox" value="20062740001" name="chkOption"></td>
			<td>20061001001</td>
			<td>電腦主機板等12項</td>
			<td>黃小中</td>
			<td>部門一</td>
			<td>老三</td>
			<td align="center">2006/10/1</td>
			<td align="center">　</td>
			<td align="center">　</td>
		</tr>
	</table>
	<!-- 顯示分頁下選單 //-->
　<div align="center">
		<table width="100%" border="0" id="table7">
			<tr>
				<td align="middle">
				<input type="submit" value="我要領文" name="BtnSend"></td>
			</tr>
		</table>
	</div>
</form>

</body>

</html>
