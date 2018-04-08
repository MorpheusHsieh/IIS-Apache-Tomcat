<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="java.util.*"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>SetCookies.jsp</title>
  <base target="main">
</head>

<body>

  設定 Cookies 中...<br><br>

  <%
    int expireTime = 15 * 60;  // 900 sec.
    String strSubPath = "Procurement";

    // 設定網站的根目錄
    String strRootPath = new String(request.getRealPath("/") + strSubPath);
    Cookie tmpCookie = new Cookie("RootPath", strRootPath);
    tmpCookie.setMaxAge(expireTime);
    response.addCookie(tmpCookie);

    // 設定登入網站的時間
    Date Now = new Date();
    tmpCookie = new Cookie("LoginDate", String.valueOf(Now.getTime()));
    response.addCookie(tmpCookie);
    
    tmpCookie = null;
  %>
  
  <Script Language="JavaScript">
  <!--
    parent.frames[1].document.location.href = "../Utility/ResetSession.jsp";
  //-->  
  </Script>

</body>

</html>