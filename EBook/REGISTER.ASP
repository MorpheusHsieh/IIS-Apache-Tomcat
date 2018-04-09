<!-- #include file="GetDB.inc" -->
<%
  FileName = "EBook.mdb"
  userid = Request.Cookies("UserName")
  called_name = Application("CalledName")

  '更改家長密碼
  SQLstr = "SELECT * FROM Userdom WHERE UserID='" & userid & "'"
  set rsUsrdom = GetAccessDBRecordset(FileName,SQLstr)
  If Not rsUsrdom.EOF Then 
    n_Passwd = Request("r_passwd")
    SQLstr = "UPDATE Userdom SET Passwd='" & n_passwd & "'"
    SQLstr = SQLstr & " where UserID='" & userid & "'"
    set rsUsrdom = GetAccessDBRecordset(FileName,SQLstr)
  Else
    Response.Write(userid & "不存在於資料庫表單中")
  End if

  '更改家長基本資料
  SQLstr = "SELECT * FROM Customer where UserID='" & userid & "'"
  set rsCust = GetAccessDBRecordset(FileName,SQLstr)
  If Not rsCust.EOF Then 
    n_name = Request("name")
    n_sex = Request("sex")
    n_work = Request("work")
    n_tel1 = Request("tel_area")
    n_tel2 = Request("tel_num")
    n_tel3 = Request("tel_ext")
    n_bbcall = Request("bbcall")
    n_mobil = Request("mobil")
    n_addr = Request("addr")
    n_email = Request("email")
    SQLstr = "UPDATE Customer SET UserName='" & n_name
    SQLstr = SQLstr & "', Sex='" & n_sex
    SQLstr = SQLstr & "', 職業='" & n_work
    SQLstr = SQLstr & "', Tel_Area='" & n_tel1
    SQLstr = SQLstr & "', Tel_Num='" & n_tel2
    SQLstr = SQLstr & "', Tel_Ext='" & n_tel3
    SQLstr = SQLstr & "', BBCall='" & n_bbcall
    SQLstr = SQLstr & "', Mobil='" & n_mobil
    SQLstr = SQLstr & "', Addr='" & n_addr
    SQLstr = SQLstr & "', EMail='" & n_email        
    SQLstr = SQLstr & "' WHERE UserID='" & userid & "'"
    Set rs = GetAccessDBRecordset(FileName,SQLstr)
  Else
    Response.Write(userid & "不存在於資料庫表單中")
  End if
  
  '新增寶寶資料
  n_babyid = Request("babyid")
  n_babyname = Request("babyname")
  n_babytype = Request("babytype")
  n_clstype = Request("clstype")

  If Not n_babyid=Empty Then 
    SQLstr = "SELECT * FROM Baby where BabyID='" & n_babyid & "'"
    Set rsBaby = GetAccessDBRecordset(FielName,SQLstr)
  
    If rsBaby.EOF Then 
      SQlstr = "INSERT INTO baby VALUES('" & n_babyid
      SQLstr = SQLstr & "','" & n_babyname
      SQLstr = SQLstr & "','" & n_babytype
      SQlstr = SQLstr & "','" & n_clstype 
      SQLstr = SQLstr & "','" & "0" 
      SQLstr = SQLstr & "','" & userid & "')"
      Set rsBaby = GetAccessDBRecordset(FielName,SQLstr)
    Else
      Response.Write("<body background=""images/bg001.gif"">")
      Response.Write(n_babyid & "寶寶 ID 重複，請回到上一頁重新輸入")
    End if
  End if

  Response.Redirect "Menu.asp"
%>  

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>使用者資料修改</title>
</head>

<body background="images/bg001.gif">
  <form method=post name="register">

  </form>
</body>

</html>






