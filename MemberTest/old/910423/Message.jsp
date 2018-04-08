<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="java.util.Date"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
%>

<html>

<head><title>網站訊息</title></head>

<body topmargin="0">

<table border="0" width="100%">
  <tr>
    <td width="65%">
      <font size="1" face="標楷體">
      </font>
    </td>
    <td width="35%">
      <font size="1" face="標楷體">
      <%
        String msg = null;
        if (workno == null)
          msg = "您尚未登入本網站...<br>";
        else
        {
          msg = "歡迎 <font color='blue'>" + workno + "</font> 蒞臨本站<br>";
          msg += "您此次上站時間為";
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
