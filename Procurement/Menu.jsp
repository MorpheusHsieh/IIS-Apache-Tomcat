<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String sName = (String)session.getAttribute("UserName");
%>


<html>

<head>
  <title>����^�ֺި�t�Ϊ��\����</title>
  <base target="main">
</head>

<body>

<form name="frmMenu" method="post" action="Menu.jsp">
  
  <font size="2" face="�з���">�n�J�G<%=((sName != null) ? sName : "NoName")%></font><br><br>

  <font face="�з���">
  <%
    String outstr = "";
    if (sName == null)
      outstr = "<a href=\"./Utility/SetCookie.jsp\">�n�J</a>";
    else
      out.print("<a href=\"./Utility/ResetSession.jsp\">�n�X</a>");
    out.print(outstr);  
  %>
    <br>�D�x�d��
    <br>�@<a href="Manager/Manager-1.jsp">�~�׭p�e�d��</a>
    <br>�@<a href="Manager/Manager-2.jsp">�~���ʮ׬d��</a>
    <br>�ʮ׺޲z
    <br>�@<a href="Shopping/Plane/Main_Plane.jsp">�p�e�׺޲z</a>
    <br>�@<a href="Shopping/Purchase/Main_Purchase.jsp">�ʮ׺޲z</a>
    <br>�w��޲z
    <br>�@<a href="Budget/Yearly/BudgetMng.jsp">�n���w��</a>
    <br>�@<a href="Budget/Monthly/Budget_Monthly.jsp">����t�޲z</a>
    <br>�t�άy�{
    <br>�@<a href="Flowchar/Flowchar_001.htm">�w��y�{��</a>
    <p>
    <br>�t�κ޲z
    <br>�@<a href="Account/AcntManager.jsp">�b���޲z</a>

  </a>

  </font>
  
	</p>
  
</form>

</body>

</html>