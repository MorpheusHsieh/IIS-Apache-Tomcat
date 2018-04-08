<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>新增網頁1</title>
</head>

<body>

<%
  String strBtnSend = request.getParameter("BtnSend");
  if (strBtnSend != null && strBtnSend.length()>0)
  {
    if (strBtnSend.equals("購案呈核"))
    {
      %>
      <Script Language="JavaScript">
      <!--
        parent.frames[1].document.location.href = "Case1-1.jsp";
      //-->  
      </Script>
      <%
    }
    else if (strBtnSend.equals("我不送了"))
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
	<p>我是<font color="#0000ff">送文</font>的頁面...</p>
	<input type="hidden" value="200610010001" name="txtAutoNum">
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
		<input onclick="DataCheck()" type="button" value="購案呈核" name="send"> 
	</div>
	<div align="center">
　</div>
	<div align="center">
		<hr><!-- 設定分頁所需變數 //--><!-- 依據上張網頁傳送過來的訊息, 決定要新增、刪除、查詢或修改 //-->
		<p>底下是您預備要呈核但是還未登錄的購案...</p>
		<div align="center">
			<table width="100%" border="1" id="table2">
				<tr>
					<td width="34">點選</td>
					<td>自動編號</td>
					<td>主旨</td>
					<td>承辦人</td>
					<td>部門名稱</td>
					<td>奉核等級</td>
				</tr>
				<tr>
					<td align="middle">
					<input type="checkbox" value="20062740001" name="chkOption"></td>
					<td>20061001001</td>
					<td>電腦主板等12項</td>
					<td>黃小中</td>
					<td>部門一</td>
					<td>老三</td>
				</tr>
			</table>
		</div>
		<!-- 顯示按鈕選單 //--><br>
　<div align="center">
			<table width="100%" border="0" id="table3">
				<tr>
					<td align="middle">
					<input type="submit" value="我不送了" name="BtnSend"></td>
				</tr>
			</table>
		</div>
		<p>　</div>
</form>

</body>

</html>