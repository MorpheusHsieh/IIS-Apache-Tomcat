<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="java.io.*"%>

<html>

<head><title>�ɮת��إߡB�ˬd�P�R��</title></head>

<body>

<center>
  <font size="5" color="blue">�ɮת��إߡB�ˬd�P�R��</font>
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
    out.print("<font size=4 color=red>���s�b</font>, �w����");
    out.print("<font size=4 color=red>�إ�</font>");
  } 
  else 
  { 

  }  
%>   
 
</body> 
 
</html> 
