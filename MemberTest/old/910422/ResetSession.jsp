<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="java.util.Date"%>

<html>

<head><title>Reset Session</title></head>

<body>

  <%
    if (!session.isNew())  // �P�_ Session �O�_���s��
    {
      session.invalidate();  // �j��_ Session ����
      out.print("�� Session ����<font color=blue>�D�s�W</font>������A�w�j��_...<br>");
    }
    else
      out.print("�� Session ����<font color=red>�s�W</font>������.<br>");
      
    response.sendRedirect("./login.htm");
  %>

</body>

</html>
