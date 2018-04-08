<%@ page contentType="text/html; charset=Big5"%>
<html>

<head>
<title>取得虛擬目錄的相對磁碟路徑</title>
</head>

<body>

<center>
  <font size="5" color="blue">取得虛擬目錄的相對磁碟路徑</font>
</center>
<hr>
 <p></p>
 Web站台主目錄位置為
 <font size="4" color="red"><%=request.getRealPath("/")%>
 </font><br>
  
 JSP網頁所在目錄位置
 <font size="4" color="red"><%=request.getRealPath("/jsp/getRealPath.jsp")%>
 </font><br>
 
 JSP網頁所在目錄上一層目錄的位置
 <font size="4" color="red"><%=request.getRealPath(".")%>
 </font><br>
 
</body>

</html>
