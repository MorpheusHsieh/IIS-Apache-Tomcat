<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01"%>

<%
  String sd_code = request.getParameter("txtSunDayCode");
  String title = request.getParameter("txtTitle");
  String content = request.getParameter("txtContent");
  
  out.print("�Ӷ���y�����G" + sd_code);
  out.print("���D�G" + title);
  out.print("�o�G���e�G" + content);
%>
<html>
<head>
  <title>��s���G�T��</title>
</head>

<body>

</body>

</html>
