<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="java.util.Date"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
%>

<html>

<head><title>�����T��</title></head>

<body topmargin="0">

<table border="0" width="100%">
  <tr>
    <td width="65%">
      <font size="1" face="�з���">
      </font>
    </td>
    <td width="35%">
      <font size="1" face="�з���">
      <%
        String msg = null;
        if (workno == null)
          msg = "�z�|���n�J������...<br>";
        else
        {
          msg = "�w�� <font color='blue'>" + workno + "</font> �Y�{����<br>";
          msg += "�z�����W���ɶ���";
          msg += "<font color=blue>";
          msg +=   new Date(session.getCreationTime());
          msg += "</font>";
        }  
        out.print(msg);  
      %>
      </font>
    </td>  
  </tr>
</table>

</body>

</html>
