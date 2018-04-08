<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="JdbcConnection, Examine, TrueFalseTest"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>JDBC測試（使用Servlet）</title>
</head>

<body>

<%
  int max_test_size = 10;
  String odbc_name = "丙級證照測驗試題";
  String user = "";
  String passwd = "";
  String SQLstr = "select * from TrueFalseTest";

  TrueFalseTest tft = new TrueFalseTest(max_test_size);
  tft.OdbcName(odbc_name);
  tft.getResults(SQLstr);

  out.println("測試二");
  out.println("你看得到我嗎？我偷偷告訴你一個秘密，我叫中文");
%>

  <TABLE bgcolor=DodgerBlue>
   <TR bgcolor=SkyBlue>
    <TD><B>答案</B></TD><TD><B>題目</B></TD>
   </TR>
   <%   
     String msg;
     int sz = tft.Size();
     for (int i=1; i<=sz; i++)
     {
       out.println("<TR bgcolor=LightGoldenrodYellow>");
       out.println("<TD>"+tft.Answer(i)+"</TD>");
       out.println("<TD>"+tft.Title(i)+"</TD>");
       out.println("</TR>");
     }
   %>
  </TABLE>
  
</body>

</html>
