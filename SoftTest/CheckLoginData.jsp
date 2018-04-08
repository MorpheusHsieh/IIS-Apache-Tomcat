<%@ page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<html>

<head>
</head>

<body>

  <%
    String name = request.getParameter("txtName");
  %>
  <center><br>
  <br><br>
  <%
    int nameLen = name.trim().length();
    String errMsg = "";
    
    if (nameLen == 0) errMsg+="名字";
    if (errMsg != "") {
      errMsg+="不能空白";
  %>
      <jsp:forward page="errorPage.jsp">
        <jsp:param name="errMsg" value='<%=errMsg%>' />
      </jsp:forward>
  <%
    }
    else { 

  %>
      <h1>Hello, 歡迎光臨！<br><br>你（妳）的名字是
        <font color="#0000ff"><%=name%></font>
      </h1>
  <%
    }
  %>
  </center>

</body>

</html>
