<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  // �p�G Session ���O�s���A�N�NSession�]���L��
  if (! session.isNew())
  {
    session.invalidate();
    out.print("�� Session ����D�s�W������A�w�g�j��_...");
  }
  else
    out.print("�� Session ���󬰷s�W������.");
  response.sendRedirect("Message.jsp");  
%>
