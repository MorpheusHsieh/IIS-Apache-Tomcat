<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  int Time = 24 * 60 * 60;
  String path = "/DocManager";

  
  // 設定有效時間
  Date Now = new Date();
  String LoginDate = (Now.getYear() + 1900) + "/" + (Now.getMonth()+1) + "/" + Now.getDate();
  Cookie coLoginDate = new Cookie("LoginDate", LoginDate);
  coLoginDate.setPath(path);
  coLoginDate.setMaxAge(Time);
  response.addCookie(coLoginDate);

  // 設定網頁的根目錄
  String root_path = new String(request.getRealPath("/") + "DocManager");
  out.print("RootPath: " + root_path + "<br>");
  
  Cookie coRootPath = new Cookie("RootPath", root_path);
  coRootPath.setPath(path);
  coRootPath.setMaxAge(Time);
  response.addCookie(coRootPath);

  // 設定組態檔案的名稱
  String ini_file = new String("config.ini");
  Cookie coIniFile = new Cookie("ConfigFile", ini_file);
  coIniFile.setPath(path);
  coIniFile.setMaxAge(Time);
  response.addCookie(coIniFile);
%>

<html>

<head>
  <title>SetCookies.jsp</title>
  <Script Language="JavaScript">
  <!--
    parent.frames[1].document.location.href = "/DocManager/Login/ResetSession.jsp";
  //-->  
  </Script>
  <base target="main">
</head>

<body>

</body>

</html>