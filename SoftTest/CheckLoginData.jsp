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
    
    if (nameLen == 0) errMsg+="�W�r";
    if (errMsg != "") {
      errMsg+="����ť�";
  %>
      <jsp:forward page="errorPage.jsp">
        <jsp:param name="errMsg" value='<%=errMsg%>' />
      </jsp:forward>
  <%
    }
    else { 

  %>
      <h1>Hello, �w����{�I<br><br>�A�]�p�^���W�r�O
        <font color="#0000ff"><%=name%></font>
      </h1>
  <%
    }
  %>
  </center>

</body>

</html>
