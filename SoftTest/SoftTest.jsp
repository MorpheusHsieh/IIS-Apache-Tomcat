<%@ page language="java"%>
<%@ page contentType="text/html;charset=Big5"%>
<%@ page import="JdbcConnection, Examine"%>
<%
  int max_test_size = 10;
  String odbc_name = "丙級證照測驗試題";
  String user = "";
  String passwd = "";
  String sqlstr = "";
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>丙級軟體應用測試</title>

</head>

<body>

<form name="login" method="post" action="score.jsp">

  <div align="center">
   <font size="5">丙級軟體應用模擬測驗</font><br>
  </div> 
  <hr>
  <%
    sqlstr = "select * from TrueFalseTest";
    Examine tf_exam = new Examine(max_test_size);
    tf_exam.OdbcName(odbc_name);
    tf_exam.getResults(sqlstr);

    String msg;
    int sz = tf_exam.Size();
    int fields = tf_exam.Fields();
    int recs = tf_exam.TotalRecords();

    msg = "";    
    for (int i=1; i<=sz; i++)
    {
      msg += tf_exam.TitleNum(i);
      msg += (i != sz) ? ", " : "";
    }
    out.print("<input type=hidden name='tf_TitleNum' value='" + msg + "'>");  
    out.print("<p>一、是非題庫共有 " + recs + " 條題目，以亂數取出 " + sz + " 題（"+msg+"）<br><br>");
    
    String radio_name = "";
    out.print("<table>");
    for (int i=1; i<=sz; i++)
    {
      radio_name = "tf_" + i;
      msg  = "<tr align='left' valign='top'>";
      msg +=  "<td width=20></td>";
      msg +=  "<td align='right'>" + i + ".</tr>";
      msg +=  "<td><input type='radio' name='" + radio_name + "' value='0' checked>對</td>";
      msg +=  "<td><input type='radio' name='" + radio_name + "' value='1'>錯</td>";
      msg +=  "<td><b>" + tf_exam.Title(i) + "</b></td>";
      msg += "</tr>";
      out.println(msg);
    }
    out.print("</table>");
  %>
  
  <%
    sqlstr = "select * from OptionTest";

    Examine opt_exam = new Examine(max_test_size);
    opt_exam.OdbcName(odbc_name);
    opt_exam.getResults(sqlstr);
   
    sz = opt_exam.Size();
    recs = opt_exam.TotalRecords();

    msg = "";
    for (int i=1; i<=sz; i++)
    {
      msg += opt_exam.TitleNum(i);
      msg += (i != sz) ? ", " : "";
    }      
    out.print("<input type=hidden name='opt_TitleNum' value='" + msg + "'>");  
    out.print("<p>二、選擇題庫共有 " + recs + " 條題目，以亂數取出 " + sz + "題（"+msg+"）<br><br>");    out.print("<table>");

    for (int i=1; i<=sz; i++)
    {
      radio_name = "opt_" + i;
      msg  = "<tr align='left' valign='top'>";
      msg +=  "<td width=20></td>";
      msg +=  "<td align='right'>" + i + ".</td>";
      msg +=  "<td colspan=2><b>" + opt_exam.Title(i) + "</b></td>";
      msg += "</tr>";
      msg += "<tr>";
      msg +=  "<td colspan='2'></td>";
      msg +=  "<td><input type=radio name='"+radio_name+"' value='1' checked>" + opt_exam.Data(4,i) +"</td>";
      msg +=  "<td><input type=radio name='"+radio_name+"' value='2'>" + opt_exam.Data(5,i) +"</td>";
      msg += "</tr>";
      msg += "<tr>";
      msg +=  "<td colspan='2'></td>";
      msg +=  "<td><input type=radio name='"+radio_name+"' value='3'>" + opt_exam.Data(6,i) +"</td>";
      msg +=  "<td><input type=radio name='"+radio_name+"' value='4'>" + opt_exam.Data(7,i) +"</td>";
      msg += "</tr>";
      out.println(msg);
    }
    out.print("</table>");
  %>
  <hr>
  <br> 
  <center> 
    <input type=Submit value="寫好計分">　　 
    <input type=Reset value="我要重寫">   
  </center>
    
</form>

</body>

</html>
