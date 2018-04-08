<%@page contentType="text/html;charset=Big5"%>

<html>

<head><title>errorPage</title></head>

<body>

 <br><br>
 <center>
  <h1><blink><%=request.getParameter("errMsg")%></blink>
    <a href="javascript:history.back()">Back</a> 
  </h1> 
 </center>     
 
</body> 
 
</html> 
