<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01"%>

<%
  String sd_code = request.getParameter("txtSunDayCode");
  String title = request.getParameter("txtTitle");
  String content = request.getParameter("txtContent");
  
  out.print("太陽曆流水號：" + sd_code);
  out.print("標題：" + title);
  out.print("發佈內容：" + content);
%>
<html>
<head>
  <title>更新公佈訊息</title>
</head>

<body>

</body>

</html>
