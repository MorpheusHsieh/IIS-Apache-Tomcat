<%@ page language="java"%>
<%@ page contentType="text/html;charset=Big5"%>
<%@ page import="JdbcConnection, Examine"%>
<%
  int max_test_size = 10;
  String odbc_name = "�����ҷӴ�����D";
  String user = "";
  String passwd = "";
  String sqlstr = "";
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>���ųn�����δ���</title>

</head>

<body>

<form name="login" method="post" action="score.jsp">

  <div align="center">
   <font size="5">���ųn�����μ�������</font><br>
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
    out.print("<p>�@�B�O�D�D�w�@�� " + recs + " ���D�ءA�H�üƨ��X " + sz + " �D�]"+msg+"�^<br><br>");
    
    String radio_name = "";
    out.print("<table>");
    for (int i=1; i<=sz; i++)
    {
      radio_name = "tf_" + i;
      msg  = "<tr align='left' valign='top'>";
      msg +=  "<td width=20></td>";
      msg +=  "<td align='right'>" + i + ".</tr>";
      msg +=  "<td><input type='radio' name='" + radio_name + "' value='0' checked>��</td>";
      msg +=  "<td><input type='radio' name='" + radio_name + "' value='1'>��</td>";
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
    out.print("<p>�G�B����D�w�@�� " + recs + " ���D�ءA�H�üƨ��X " + sz + "�D�]"+msg+"�^<br><br>");    out.print("<table>");

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
    <input type=Submit value="�g�n�p��">�@�@ 
    <input type=Reset value="�ڭn���g">   
  </center>
    
</form>

</body>

</html>
