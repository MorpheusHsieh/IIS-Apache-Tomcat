<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>�R���Ҧ��� Cookies </title>
  <base target="main">
</head>

<body>

  �ڬO�R�� Cookies ������...<br><br>

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
        out.print(strName + "=" + strValue + "�w�g�q Cookie ���R��...<br>");
        
      }
    } else {
      out.print("Cookies is null...");
    }
  %>

</body>

</html>
