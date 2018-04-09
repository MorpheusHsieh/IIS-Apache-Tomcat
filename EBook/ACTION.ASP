<!-- #include file="GetDB.inc" -->
<!-- #include file="ShowOnePage.inc" -->

<%
  MySelf = Request.ServerVariables("PATH_INGFO")

  Dim FileName, SQLstr, rsAction
  FileName = "EBook.mdb"
  SQLstr = "select * from FieldDay"
  Set rsAction = GetAccessDBStaticRecordset(FileName, SQLstr)
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>課外活動</title>
</head>

<body background="images/bg001.gif">

  <form action="action.asp" method=post name="action">
  <%
    rsAction.PageSize = 10

    Page = CLng(Request("Page"))
    If Page < 1 Then Page = 1
    If Page > rsAction.PageCount Then Page = rsAction.PageCount
    
    ShowOnePage rsAction, Page

    If Page<> 1 Then '如果不是位於第一頁
  %>   
      <A HREF=<%=MySelf%>?Page=1><img src="images/FirstPage.gif"></A>
      <A HREF=<%=MySelf%>?Page=<%=(Page-1)%>><img src="images/PrePage.gif"></A>
  <%
    End if
    If Page <> rsAction.PageCount Then '如果不是位於最後一頁
  %>
      <A HREF=<%=MySelf%>?Page=<%=(Page+1)%>><img src="images/NextPage.gif"></A>
      <A HREF=<%=MySelf%>?Page=<%=rsAction.PageCount%>><img src="images/LastPage.gif"></A>
  <%  
    End if    
  %>
  　輸入頁次：<input type=text name=Page Size=4>
　　頁次：<Font Color="Blue"><%=Page%>/<%=rsAction.PageCount%></Font>
  </form>

</body>

</html>  

