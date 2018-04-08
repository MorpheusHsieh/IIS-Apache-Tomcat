<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>

<%@include file="../Test.jsp"%>
  
<%
  String workno = (String)session.getAttribute("WorkNo");
  String ini_file = request.getRealPath("/") + "MemberTest\\" + "Account01.ini";
  Account01 ac = new Account01(ini_file);

  // 查詢使用者資料
  String[] user_data = ac.Query(workno);
  String sWorkNo = user_data[0];
  String sPasswd = user_data[1];
  String sQues = user_data[3];
  String sAns = user_data[4];
  ac.CloseConnection();
%>

<html>
<head><title>修改個人基本資料</title></head>
<body>

<form action="EditUser2.jsp" name="EditUser" method="post">
<input type="hidden" name="OldPasswd" value="<%=sPasswd%>">

<p>我是修改個人基本資料的網頁...</p>
  <table border="1" width="100%" height="124">
    <tr>
      <td width="31%" height="26">
        <font face="標楷體" color="#FF0000">工作代號：</font>
      </td>
      <td width="69%" height="26">
        <input type="text" name="WorkNo" size="20" value="<%=sWorkNo%>">
      </td>
    </tr>
    <tr>
      <td width="31%" height="20">
        <font face="標楷體" color="#FF0000">密碼：</font>
      </td>
      <td width="69%" height="20">
        <input type="password" name="NewPasswd" size="20" value="<%=sPasswd%>">
      </td>
    </tr>
    <tr>
      <td width="31%" height="20">
        <font face="標楷體" color="#FF0000">確認密碼：</font>
      </td>
      <td width="69%" height="20">
        <input type="password" name="RePasswd" size="20">
      </td>
    </tr>
    <tr>
      <td align="center" width="31%" height="34">
        <p align="left"><font face="標楷體">問題：</font>
      </td>
      <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Question" size="50" value="<%=sQues%>">
      </td>
    </tr>
    <tr>
      <td align="center" width="31%" height="34">
        <p align="left"><font face="標楷體">答案：</font></p>
      </td>
      <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Answer" size="50" value="<%=sAns%>">
      </td>
    </tr>
    <tr>
      <td align="center" width="100%" height="34" colspan="2">
        <input type="submit" value="我要修改">
        <input type="reset" value="清除">
      </td>
    </tr>
  </table>

</body>
</html>

