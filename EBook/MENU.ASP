<!-- #include file="GetDB.inc" -->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>功能選擇</title>
</head>

<body background="images/bg001.gif">

  <% 
    If Request.cookies("UserName")=Empty Then
      Response.Redirect"Login.htm"
    End if
    
    FileName = "EBook.mdb"
    userid = Request.Cookies("UserName")
    SQLstr = "SELECT * FROM Userdom Where UserID='" & userid & "'"
    Set rsUsr = GetAccessDBRecordset(FileName,SQLstr)
    
    grade = 0
    If rsUsr("系統管理") Then grade = grade + 1000
    If rsUsr("行政管理") Then grade = grade + 100
    If rsUsr("教師")     Then grade = grade + 10
    If rsUsr("家長")     Then grade = grade + 1
    Application("UserGrade") = grade
  %>

  <form method="post" name="menu">  
   
    <img src="images/Redball.gif" width="14" height="14"> 
    <A HREF="EditUser.asp">家長基本資料修改</A>  
    <br>  
   
    <img src="images/Redball.gif" width="14" height="14">    
    <A HREF="MsgBoard.asp">留言給教師</A>  
    <br>  
   
    <img src="images/Redball.gif" width="14" height="14">    
    <A HREF="menu3.htm">閱讀留言</A>  
    <br>  
   
    <img src="images/Redball.gif" width="14" height="14">    
    <A HREF="menu4.htm">幼兒評量</A>  
    <br>  
   
    <img src="images/Redball.gif" width="14" height="14">    
    <A HREF="menu5.htm">幼兒作品發表及活動照片</A>  
    <br>  
  
  </form>  
  
</body>  
  
</html>  
