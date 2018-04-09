<!-- #include file="GetDB.inc" -->
<!-- #include file="ShowOnePage.inc" -->

<%
  MySelf = Request.ServerVariables("PATH_INGFO")

  Dim FileName, SQLstr, rsAction
  FileName = "EBook.mdb"
  SQLstr = "select * from FieldDay"
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>新網頁1</title>
</head>

<body BackGround="images/bg001.gif">

  <form action="Action.asp" method=post name="action2">
  <%
    ActNo = CInt(Request("ActNo"))
    Set rsAction = GetAccessDBStaticRecordset(FileName, SQLstr)
    rsAction.AbsolutePosition = ActNo

    For i=0 to rsAction.Fields.Count-1
      If i<>rsAction.Fields.Count-1 Then
        Response.Write rsAction.Fields(i).Name & "："
        Response.Write rsAction.Fields(i).Value & "<br>"
      Else
        imgPath = "images/picact-img/" & rsAction.Fields(i).Value
        Response.Write "<img src=" & imgPath & ">"
      End if  
    Next
  %>

  </form>
  
</body>

</html>
