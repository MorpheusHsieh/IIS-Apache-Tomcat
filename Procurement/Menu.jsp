<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String sName = (String)session.getAttribute("UserName");
%>


<html>

<head>
  <title>公文奉核管制系統的功能選單</title>
  <base target="main">
</head>

<body>

<form name="frmMenu" method="post" action="Menu.jsp">
  
  <font size="2" face="標楷體">登入：<%=((sName != null) ? sName : "NoName")%></font><br><br>

  <font face="標楷體">
  <%
    String outstr = "";
    if (sName == null)
      outstr = "<a href=\"./Utility/SetCookie.jsp\">登入</a>";
    else
      out.print("<a href=\"./Utility/ResetSession.jsp\">登出</a>");
    out.print(outstr);  
  %>
    <br>主官查詢
    <br>　<a href="Manager/Manager-1.jsp">年度計畫查詢</a>
    <br>　<a href="Manager/Manager-2.jsp">年度購案查詢</a>
    <br>購案管理
    <br>　<a href="Shopping/Plane/Main_Plane.jsp">計畫案管理</a>
    <br>　<a href="Shopping/Purchase/Main_Purchase.jsp">購案管理</a>
    <br>預算管理
    <br>　<a href="Budget/Yearly/BudgetMng.jsp">登錄預算</a>
    <br>　<a href="Budget/Monthly/Budget_Monthly.jsp">月分配管理</a>
    <br>系統流程
    <br>　<a href="Flowchar/Flowchar_001.htm">預算流程圖</a>
    <p>
    <br>系統管理
    <br>　<a href="Account/AcntManager.jsp">帳號管理</a>

  </a>

  </font>
  
	</p>
  
</form>

</body>

</html>