<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
<meta http-equiv="Content-Language" content="zh-tw">
<title>奉核進度查詢</title>
</head>

<body>

<form name="frmProcQuery" method="post" action="Case2.jsp">
	<p>我是<font color="#0000ff">奉核進度查詢</font>的頁面...</p>
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
			<td rowSpan="2">編號</td>
			<td rowSpan="2">主旨</td>
			<td rowSpan="2">承辦人</td>
			<td rowSpan="2">部門名稱</td>
			<td rowSpan="2">預定奉核</td>
			<td rowSpan="2">接收者</td>
			<td colSpan="4">奉核情形</td>
		</tr>
		<tr>
			<td>老三</td>
			<td>老二</td>
			<td>老大</td>
			<td>覆閱</td>
		</tr>
		<tr>
			<td>200610010001</td>
			<td>電腦主機板等12項</td>
			<td>黃小中</td>
			<td>部門一</td>
			<td>老三</td>
			<td>老三僕人</td>
			<td>　</td>
			<td>　</td>
			<td>　</td>
			<td>否</td>
		</tr>
	</table>
	<!-- 顯示分頁下選單 //-->
　<div align="center">
		<table width="100%" border="0" id="table7">
			<tr>
				<td align="middle">
				<input type="submit" value="顯示全部公文" name="BtnSend"></td>
			</tr>
		</table>
	</div>
</form>

</body>

</html>
