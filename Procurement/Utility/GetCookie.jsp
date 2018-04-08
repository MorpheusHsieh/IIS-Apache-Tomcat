<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>顯示所有的 Cookies </title>
  <base target="main">
</head>

<body>

  我是顯示 Cookies 內容值的網頁...<br><br>

  <%
    Cookie[] allcookies = request.getCookies();
    if (allcookies != null)
    {
      int cookielen = allcookies.length;
      out.print("Cookie num: " + cookielen + "<br>");
      for (int i=0; i<cookielen; i++)
      {
        Cookie tmpCookie = allcookies[i];
        String strName = tmpCookie.getName();
        String strValue = tmpCookie.getValue();
        out.print(strName + ": " + strValue + "<br>");
      }
    } else {
      out.print("Cookies is null...");
    }
  %>

</body>

</html>
