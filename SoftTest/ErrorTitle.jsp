<%@ page language="java"%>
<%@ page contentType="text/html;charset=Big5"%>
<%@ page import="JdbcConnection, Examine"%>
<%
  String odbc_name = "丙級證照測驗試題";
%>
<html>

<head><title>複習作答錯誤的題目</title></head>

<body>

  一、是非題 
  <%
    int sz, err_title[] = null, err_num[] = null;
    String title, msg;

    String titles[] = request.getParameterValues("TF_ErrorTitle");

    sz = 0;
    for (int i=0; i<titles.length; i++)
    {
      title = titles[i].trim();
      if (title.length() != 0)
        sz++;
    }

    err_num = new int [sz];
    err_title = new int[sz];

    sz = 0;
    for (int i=0; i<titles.length; i++)
    {
      title = titles[i].trim();
      if (title.length() != 0)
      {
        err_num[sz] = i;
        err_title[sz++] = Integer.parseInt(title);
      }
    }

    String sqlstr = "select * from trueFalseTest";
    Examine exam = new Examine(sz);
    exam.OdbcName(odbc_name);
    exam.getResults(sqlstr, err_title);
  %>
  
  <table>
  <%  
    for (int i=1; i<=sz; i++)
    {
      msg  = "<tr align='left' valign='top'>";
      msg += "<td>(" + ((exam.Answer(i) == 0) ? "O" : "X") + ")</td>";
      msg += "<td align='right'>" + (err_num[i-1]+1) + ".</td>";
      msg += "<td>" + exam.Title(i) + "</td>";
      msg += "</tr>";
      out.print(msg);
    }
  %>  
  </table> 

  <br>二、選擇題 
<%
  titles = request.getParameterValues("OptErrorTitle");

  sz = 0;
  for (int i=0; i<titles.length; i++)
  {
    title = titles[i].trim();
    if (title.length() != 0)
      sz++;
  }

  err_num = new int [sz];
  err_title = new int[sz];

  sz = 0;
  for (int i=0; i<titles.length; i++)
  {
    title = titles[i].trim();
    if (title.length() != 0)
    {
      err_num[sz] = i;
      err_title[sz++] = Integer.parseInt(title);
    }
  }

  sqlstr = "select * from OptionTest";
  exam = new Examine(sz);
  exam.OdbcName(odbc_name);
  exam.getResults(sqlstr, err_title);
%>
  <table>
  <%  
    for (int i=1; i<=sz; i++)
    {
      msg  = "<tr align='left' valign='top'>";
      msg +=  "<td>(" + exam.Answer(i) + ")</td>";
      msg +=  "<td align='right'>" + (err_num[i-1]+1) + ".</td>";
      msg +=  "<td colspan='2'>" + exam.Title(i) + "</td>";
      msg += "</tr>";
      msg += "<tr>";
      msg += "<td colspan='2'></td>";
      msg +=  "<td>" + exam.Data(4,i) + "</td>";
      msg +=  "<td>" + exam.Data(5,i) + "</td>";
      msg += "</tr>";
      msg += "<tr>";
      msg += "<td colspan='2'></td>";
      msg +=  "<td>" + exam.Data(6,i) + "</td>";
      msg +=  "<td>" + exam.Data(7,i) + "</td>";
      msg += "</tr>";
      out.print(msg);
    }
  %>  
  </table>
  <br><br>
  <div align="center">
   <A href="SoftTest.jsp">重新測驗</A>
  </div> 
  
</body>

</html>
