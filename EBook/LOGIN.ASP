<!-- #include file="GetDB.inc" -->
<% 
  Response.Cookies("UserName")=Request("UserID") 

  dim userid, passwd, babyname
  userid = Request("userid")
  passwd = Request("passwd")
  babyname = Request("babyname")
  
  '檢查寶寶名字是否在園中
  Dim FileName, SQLstr, result
  result = Flase
  FileName = "EBook.mdb"

  SQLstr = "select * from Baby where BabyName='" & babyname & "'"
  set rs = GetAccessDBRecordset(FileName,SQLstr)
  If rs.EOF Then 
    Response.Write("<h1>")
    Response.Write(babyname & "寶寶不在園中")
    Response.Write("</h1><hr>")
  Elseif Not rs.EOF Then
    If rs("Exist") Then 
      result = True    
    Elseif Not rs("Exist") Then
      Response.Write("<h1>")
      Response.Write(babyname & "寶寶已經在園中，但還未完成登記")
      Response.Write("</h1><hr>")
    End if  
  End if
  
  If result Then
    '已確定寶寶在園中，檢查家長是否已經登錄資料
    If len(rs("UserID"))<=0 Then                                '家長尚未登入資料
   
      '檢查家長暱稱是否重複
      SQLstr = "select * from Baby where UserID='" & userid & "'"
      set rs1 = GetAccessDBRecordset(FileName,SQLstr)
  
      If Not rs1.EOF Then
        Response.Write("<h1><hr>")
        Response.Write(babyname & "寶寶的家長您好<br>")
        Response.Write("您是第一次登錄，但 " & userid & " 已經有人使用，請回前一頁更改暱稱")
        Response.Write("</center>")
        Response.Write("</h1><hr>")
      Elseif rs1.EOF Then
        '家長尚未登錄資料，將 baby 表單的家長暱稱改成先前輸入的 userid
        SQLstr = "UPDATE baby set UserID='" & userid & "'"
        SQLstr = SQLstr & " where BabyName='" & babyname & "'"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
      
        '測試 Customer 資料表是否存在家長暱稱，如果有則刪除後重新建立
        SQlstr = "SELECT UserID FROM Customer WHERE UserId='" & userid & "'"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
        If Not rs2.EOF Then
          SQlstr = "Delete from Customer where UserId='" & userid & "'"
          set rs3 = GetAccessDBRecordset(FileName,SQLstr)
        End if

        SQLstr = "INSERT INTO Customer(UserID) Values('" & userid & "')"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
        If rs2 Is Nothing Then
          Response.Write "新增 " & userid & "暱稱到 Customer 資料表失敗"
        End if  

        '測試 Userdom 表單是否存在家長暱稱，如果有則刪除後重新建立
        SQlstr = "SELECT UserID FROM Userdom WHERE UserId='" & userid & "'"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
        If Not rs2.EOF Then 
          SQLstr = "DELETE from Userdom where UserId='" & userid & "'"
          set rs3 = GetAccessDBRecordset(FileName,SQLstr)
        End if
        
        SQLstr = "INSERT INTO Userdom(Userid,Passwd,家長) VALUES('" & userid 
        SQLstr = SQLstr & "','" & passwd & "','" & "-1" & "')"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
        If rs2 Is Nothing Then 
          Response.Write "新增 " & userid & "暱稱到 Userdom 資料表失敗"
        End if
        Response.Redirect "Menu.asp"
      End if    
    Elseif rs("UserID")=userid Then                             '寶寶在園中，且家長暱稱相符，檢查密碼
      SQLstr = "SELECT * FROM Userdom WHERE UserID='" & userid 
      SQLstr = SQLstr & "' and Passwd='" & passwd & "'"
      set rs1 = GetAccessDBRecordset(FileName,SQLstr)
      If Not rs1.EOF Then
        Response.Redirect "Menu.asp"
      Elseif rs1.EOF Then
        Response.Write("<h1><hr>")
        Response.Write("「使用者名稱」及「密碼」無法配合")
        Response.Write("</center>")
        Response.Write("</h1><hr>")
      End if 
    Elseif rs("UserID")<>userid Then
      Response.Write("<h1><hr>")
      Response.Write(babyname & "寶寶不是您的吧！！")
      Response.Write("</center>")
      Response.Write("</h1><hr>")
    End if  
  End if
  
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>登入密碼檢驗</title>
</head>


<body background="images/bg001.gif">

<form method=post name=check>


</form>

</body>

</html>
