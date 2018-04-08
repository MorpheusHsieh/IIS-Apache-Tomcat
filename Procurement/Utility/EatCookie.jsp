<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>刪除所有的 Cookies </title>
  <base target="main">
</head>

<body>

  我是刪除 Cookies 的網頁...<br><br>

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
        tmpCookie.setMaxAge(0);
        out.print(strName + "=" + strValue + "已經從 Cookie 中刪除...<br>");
        
      }
    } else {
      out.print("Cookies is null...");
    }
  %>

</body>

</html>
