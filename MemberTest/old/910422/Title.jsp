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
<title>����</title>
</head>

<body>

<p>�ڬO�D�D����...</p>

<table border="1" width="100%" height="515">
  <tr>
    <td width="78%" height="62">���D�w�d��</td>
    <td width="22%" height="62">
      <table border="1" width="100%" height="69">
        <tr>
          <td width="37%" align="center" height="17">
            <p align="center">
             <font face="�з���" size="2">
              <a href="index.htm">�n�X</a>
             </font>
            </p>
          </td>
          <td width="31%" align="center" height="17">
           <font size="2" face="�з���"><a href="ResetSession.jsp">�n�J</a></font>
          </td>
          <td width="32%" align="center" heiht="17">
           <font size="2" face="�з���">���U</font>
          </td>
        </tr>
        <tr>
          <td width="101%" align="center" height="17" colspan="3">
           <font size="2" face="�з���">
            <a href="Member/Menu.jsp">�s��ӤH���</a>
           </font>
          </td>
        </tr>
        <tr>
          <td width="100%" colspan="3" align="center" height="17"><font size="2" face="�з���"><%=nickname%>�z�n�A�w��</font></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="355" colspan="2">
      <p align="left">�D�D��</td>
  </tr>
  <tr>
    <td width="100%" height="82" colspan="2">�s�@�s��ƹw�d��</td>
  </tr>
</table>

</body>

</html>
