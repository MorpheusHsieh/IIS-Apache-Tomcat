<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>
<%
  String ini_file = request.getRealPath("/") + "MemberTest\\" + "Account01.ini";
  String workno = (String)session.getAttribute("WorkNo");
  if (workno == null)
    response.sendRedirect("index.htm");
%>

<html>

<head><title>管理者使用的修改頁面</title></head>

<body>

<form action="Modify.jsp" name="frmModify" method="post">
<%  
  Account01 ac = new Account01(ini_file);
  String sqlstr = "SELECT WorkNo FROM Account";
  int user_cnt = ac.ExecuteQuery(sqlstr);
%>
  請選擇您要查詢的帳號：<SELECT name="Query_WorkNo">
  <option selected></option>
  <%
    for (int row=0; row<user_cnt; row++)
    {
      String[] data = ac.getRowData(row);
      out.print("<option>"+data[0]+"</option>");
    }
    ac.CloseConnection();
  %>
  </Select>
  <input type="submit" name="Send" value="送出帳號">
</form>

<form action="Edit2.jsp" name="frmModify2" method="post">
<%
  String query_workno = request.getParameter("Query_WorkNo");
  String send = request.getParameter("Send");

  String work_no = null;
  String passwd = null;
  String rolecode = null;
  String ques = null;
  String ans = null;  
  if (send != null && send.equals("送出帳號"))
  {
    Account01 ac01 = new Account01(ini_file);
    String[] user_data = ac01.Query(query_workno);
    work_no = user_data[0];
    passwd = user_data[1];
    rolecode = user_data[2];
    ques = user_data[3];
    ans = user_data[4];
    ac01.CloseConnection();
%>    
    <input type="hidden" name="OldPasswd" value="<%=passwd%>">
    <table border="1" width="100%" height="124">
    <tr>
      <td width="31%" height="26">
        <font face="標楷體" color="#FF0000">工作代號：</font>
      </td>
      <td width="69%" height="26">
        <input type="text" name="WorkNo" size="20" value="<%=work_no%>">
      </td>
    </tr>
    <tr>
      <td width="31%" height="20">
        <font face="標楷體" color="#FF0000">密碼：</font>
      </td>
      <td width="69%" height="20">
        <input type="text" name="NewPasswd" size="20" value="<%=passwd%>">
      </td>
    </tr>
    <tr>
      <td width="31%" height="20">
        <font face="標楷體" color="#FF0000">角色權限：</font>
      </td>
      <td width="69%" height="20">
        <input type="text" name="RoleCode" size="20" value="<%=rolecode%>">
      </td>
    </tr>    
    <tr>
      <td align="center" width="31%" height="34">
        <p align="left"><font face="標楷體">問題：</font>
      </td>
      <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Question" size="50" value="<%=ques%>">
      </td>
    </tr>
    <tr>
      <td align="center" width="31%" height="34">
        <p align="left"><font face="標楷體">答案：</font></p>
      </td>
      <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Answer" size="50" value="<%=ans%>">
      </td>
    </tr>
    <tr>
      <td align="center" width="100%" height="34" colspan="2">
        <input type="submit" value="我要修改">
        <input type="reset" value="清除">
      </td>
    </tr>
    </table>
<%
  }
%>
  
</form>

</body>

</html>
