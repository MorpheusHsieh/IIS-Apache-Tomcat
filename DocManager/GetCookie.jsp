<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <title>This is a gets a cookie stored on your computer</title>
</head>

<body>

<%
  Cookie[] cookies = request.getCookies();
  int cookielen = cookies.length;
  if (cookielen != 0)
  {
    for (int i=0; i<cookielen; i++)
    {
      Cookie temp = cookies[i];
      String outstr = "[" + i + "]: " + temp.getName() + "=" + temp.getValue() + ", ";
      out.print(outstr+"<br>");
    }
  }
%>  

</body>

</html>