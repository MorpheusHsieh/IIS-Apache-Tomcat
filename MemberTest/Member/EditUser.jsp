<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>

<%@include file="../Test.jsp"%>
  
<%
  String workno = (String)session.getAttribute("WorkNo");
  String ini_file = request.getRealPath("/") + "MemberTest\\" + "Account01.ini";
  Account01 ac = new Account01(ini_file);

  // �d�ߨϥΪ̸��
  String[] user_data = ac.Query(workno);
  String sWorkNo = user_data[0];
  String sPasswd = user_data[1];
  String sQues = user_data[3];
  String sAns = user_data[4];
  ac.CloseConnection();
%>

<html>
<head><title>�ק�ӤH�򥻸��</title></head>
<body>

<form action="EditUser2.jsp" name="EditUser" method="post">
<input type="hidden" name="OldPasswd" value="<%=sPasswd%>">

<p>�ڬO�ק�ӤH�򥻸�ƪ�����...</p>
  <table border="1" width="100%" height="124">
    <tr>
      <td width="31%" height="26">
        <font face="�з���" color="#FF0000">�u�@�N���G</font>
      </td>
      <td width="69%" height="26">
        <input type="text" name="WorkNo" size="20" value="<%=sWorkNo%>">
      </td>
    </tr>
    <tr>
      <td width="31%" height="20">
        <font face="�з���" color="#FF0000">�K�X�G</font>
      </td>
      <td width="69%" height="20">
        <input type="password" name="NewPasswd" size="20" value="<%=sPasswd%>">
      </td>
    </tr>
    <tr>
      <td width="31%" height="20">
        <font face="�з���" color="#FF0000">�T�{�K�X�G</font>
      </td>
      <td width="69%" height="20">
        <input type="password" name="RePasswd" size="20">
      </td>
    </tr>
    <tr>
      <td align="center" width="31%" height="34">
        <p align="left"><font face="�з���">���D�G</font>
      </td>
      <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Question" size="50" value="<%=sQues%>">
      </td>
    </tr>
    <tr>
      <td align="center" width="31%" height="34">
        <p align="left"><font face="�з���">���סG</font></p>
      </td>
      <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Answer" size="50" value="<%=sAns%>">
      </td>
    </tr>
    <tr>
      <td align="center" width="100%" height="34" colspan="2">
        <input type="submit" value="�ڭn�ק�">
        <input type="reset" value="�M��">
      </td>
    </tr>
  </table>

</body>
</html>

