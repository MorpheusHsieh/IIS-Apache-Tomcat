<%@ page contentType="text/html; charset=Big5"%>
<html>

<head>
<title>���o�����ؿ����۹�Ϻи��|</title>
</head>

<body>

<center>
  <font size="5" color="blue">���o�����ؿ����۹�Ϻи��|</font>
</center>
<hr>
 <p></p>
 Web���x�D�ؿ���m��
 <font size="4" color="red"><%=request.getRealPath("/")%>
 </font><br>
  
 JSP�����Ҧb�ؿ���m
 <font size="4" color="red"><%=request.getRealPath("/jsp/getRealPath.jsp")%>
 </font><br>
 
 JSP�����Ҧb�ؿ��W�@�h�ؿ�����m
 <font size="4" color="red"><%=request.getRealPath(".")%>
 </font><br>
 
</body>

</html>
