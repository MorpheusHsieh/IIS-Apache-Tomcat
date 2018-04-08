<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
%>

<html>
<head><title>網站管理目錄</title>
<base target="main">
</head>
<body>

<table border="1" align="right" width="150" height="57">
  <tr>
    <td align="center" height="19">
    <font size="1" face="標楷體">
    <% out.print("<a href='login.htm'>登入</a>");%>
    </font>
    </td>
    <td align="center" height="19">
      <font size="1" face="標楷體">
      <%
        if (workno == null)
          out.print("<a href='Member/New.htm'>註冊</a>");
        else
          out.print("<a href='ResetSession.'>登出</a>");
      %>
      </font>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center" height="19">
    <font size="1" face="標楷體">
      <% out.print("<a href='Member/Menu.jsp'>編輯個人資料</a>");%>
    </font>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center" height="19">
      <font size="1" face="標楷體">
      <%
        if (workno == null)
          out.print("您尚未登入系統...");
        else
          out.print("歡迎 " + workno + " 光臨...");
      %>
      </font>    
    </td>
  </tr>
</table>


