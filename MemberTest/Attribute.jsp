<%
  String workno = (String)session.getAttribute("WorkNo");
  if(workno == null)
    out.print("您尚未登入本系統...");
%>

<html>
<head><title>權限管理</title></head>
<body>

<script language="javascript">
  // document.write(window.parent.frames[1].name);
</script>

</body>
</html>
  
