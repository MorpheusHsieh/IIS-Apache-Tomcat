<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
%>

<html>
<head><title>�����޲z�ؿ�</title>
<base target="main">
</head>
<body>

<table border="1" align="right" width="150" height="57">
  <tr>
    <td align="center" height="19">
    <font size="1" face="�з���">
    <% out.print("<a href='login.htm'>�n�J</a>");%>
    </font>
    </td>
    <td align="center" height="19">
      <font size="1" face="�з���">
      <%
        if (workno == null)
          out.print("<a href='Member/New.htm'>���U</a>");
        else
          out.print("<a href='ResetSession.'>�n�X</a>");
      %>
      </font>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center" height="19">
    <font size="1" face="�з���">
      <% out.print("<a href='Member/Menu.jsp'>�s��ӤH���</a>");%>
    </font>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center" height="19">
      <font size="1" face="�з���">
      <%
        if (workno == null)
          out.print("�z�|���n�J�t��...");
        else
          out.print("�w�� " + workno + " ���{...");
      %>
      </font>    
    </td>
  </tr>
</table>


