<%@ page language="java"%>
<%@ page contentType="text/html;charset=Big5"%>
<%@ page import="JdbcConnection, Examine, Split"%>
<%
  int sz = 10, score = 0;
  String msg, ans_name;
  String odbc_name = "�����ҷӴ�����D";
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>�p�����</title>
</head>

<body>

<script>
  function frmReset(array)
  {
    for(var i=0; i<array.length; i++)
      array[i].value = "";
  }
</script>

<form name="score" method="get" action="ErrorTitle.jsp">

  <h1 size="6">�ڬO�p����ƪ�����</h1>
  <%
    String tf_title_num = request.getParameter("tf_TitleNum");
    String opt_title_num = request.getParameter("opt_TitleNum");
    
    
    Split sp = new Split(tf_title_num);
    int title_num[] = sp.toArray();
    
    String sqlstr = "select * from trueFalseTest";
    Examine exam = new Examine(sz);
    exam.OdbcName(odbc_name);
    exam.getResults(sqlstr, title_num);
  %>

  �O�D�D
  <table border="1">
   <tr>
   <%
     out.print("<td>�D�ظ��X</td>");
     for (int i=1; i<=sz; i++)
     {
       int err_title_num = exam.TitleNum(i);
       String click_data = "TF_ErrorTitle[" + (i-1) + "].value='" + err_title_num +"';";
   %>   
       <td>
        <A href="javascript:void(0)" onclick="<%=click_data%>"><%=i%></A>
        <input type="hidden" name="TF_ErrorTitle">
       </td>
   <%
     }  
   %>   
   </tr>
   <tr>
    <td>�A�����סG</td>
    <%
      int tf_ans[] = new int[sz+1];
      for (int i=1; i<=sz; i++)
      {
        ans_name = "tf_" + i;
        tf_ans[i] = Integer.parseInt(request.getParameter(ans_name));
        msg = (tf_ans[i] == 0) ? "O" : "X";
        out.print("<td>" + msg + "</td>");
      }
    %>
   </tr>
   <tr>
    <td>���T���סG</td>
    <%
      for (int i=1; i<=sz; i++)
      {
        msg = (exam.Answer(i) == 0) ? "O" : "X";
        out.print("<td>" + msg + "</td>");
      }
      score = exam.Score(tf_ans);
      
    %>
   </tr>
  </table>
  �O�D�D�o���G<%=score%>

  <% 
    sp = new Split(opt_title_num);
    title_num = sp.toArray();
    
    sqlstr = "select * from OptionTest";
    exam.OdbcName(odbc_name);
    exam.getResults(sqlstr, title_num);
  %>

  <br><br>����D
  <table border="1">
   <tr>
   <%
     out.print("<td>�D�ظ��X</td>");
     for (int i=1; i<=sz; i++)
     {
       int err_title_num = exam.TitleNum(i);
       String click_data = "OptErrorTitle[" + (i-1) + "].value='" + err_title_num +"';";
   %>   
       <td>
        <A href="javascript:void(0)" onclick="<%=click_data%>"><%=i%></A>
        <input type="hidden" name="OptErrorTitle">
       </td>
   <%
     }  
   %>   
   </tr>
   <tr>
    <td>�A�����סG</td>
    <%
      int opt_ans[] = new int[sz+1];
      for (int i=1; i<=sz; i++)
      {
        ans_name = "opt_" + i;
        opt_ans[i] = Integer.parseInt(request.getParameter(ans_name));
        out.print("<td>" + opt_ans[i] + "</td>");
      }
    %>
   </tr>
   <tr>
    <td>���T���סG</td>
    <%
      for (int i=1; i<=sz; i++)
        out.print("<td>" + exam.Answer(i) + "</td>");
      score = exam.Score(opt_ans);
    %>
   </tr>
  </table> 
  ����D�o���G<%=score%>
  <p>�@
  <hr>
  <div align="center">
   <input type="submit" name="Submit" value="�ڭn�ݵ������D��">
   <input type="reset" name="Reset" value="���@�@��" onclick="frmReset(OptErrorTitle)">
  </div>
  
</form>

</body>
