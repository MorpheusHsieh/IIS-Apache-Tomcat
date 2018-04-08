<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="java.io.*"%>

<html>

<head><title>檔案的建立、檢查與刪除</title></head>

<body>

<center>
  <font size="5" color="blue">檔案的建立、檢查與刪除</font>
</center>
<hr>
<p></p>

<%
  String path = request.getRealPath(".");

  File f = new File (path, "/conf/system.ini");

  if (!f.exists())
  {
    f.createNewFile(); 
    out.println(path + "jsp\\File.txt"); 
    out.print("<font size=4 color=red>不存在</font>, 已完成");
    out.print("<font size=4 color=red>建立</font>");
  } 
  else 
  { 

  }  
%>   
 
</body> 
 
</html> 
