<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%
  String nickname = (String)session.getAttribute("WorkNo");
  if (nickname == null)
    response.sendRedirect("index.htm");
  int nRolecode = Integer.parseInt((String)session.getAttribute("RoleCode"));
%>

<html>

<head>
<title>首頁</title>
</head>

<body>

<p>我是主題頁面...</p>

<table border="1" width="100%" height="515">
  <tr>
    <td width="78%" height="62">標題預留區</td>
    <td width="22%" height="62">
      <table border="1" width="100%" height="69">
        <tr>
          <td width="37%" align="center" height="17">
            <p align="center">
             <font face="標楷體" size="2">
              <a href="index.htm">登出</a>
             </font>
            </p>
          </td>
          <td width="31%" align="center" height="17">
           <font size="2" face="標楷體"><a href="ResetSession.jsp">登入</a></font>
          </td>
          <td width="32%" align="center" heiht="17">
           <font size="2" face="標楷體">註冊</font>
          </td>
        </tr>
        <tr>
          <td width="101%" align="center" height="17" colspan="3">
           <font size="2" face="標楷體">
            <a href="Member/Menu.jsp">編輯個人資料</a>
           </font>
          </td>
        </tr>
        <tr>
          <td width="100%" colspan="3" align="center" height="17"><font size="2" face="標楷體"><%=nickname%>您好，歡迎</font></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="355" colspan="2">
      <p align="left">主題區</td>
  </tr>
  <tr>
    <td width="100%" height="82" colspan="2">製作群資料預留區</td>
  </tr>
</table>

</body>

</html>
