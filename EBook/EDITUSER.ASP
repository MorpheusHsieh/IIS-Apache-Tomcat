<!-- #include file="GetDB.inc" -->
<!-- #include file="EditUser.inc" -->

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>個人基本資料修改</title>
</head>

<Script Language="VBScript">
<!--
  Function DataCheck()   
    If edit_user.passwd.value = Empty Then
      MsgBox "「使用者密碼」不得為空白！", 64, "Oh! no"
      focusto(0)
      Exit Function
    End if
    
    If edit_user.r_passwd.value = Empty then
      MsgBox "「密碼再確認」不得為空白！", 64, "Oh! no"
      focusto(1)
      Exit Function
    End if  
    
    If edit_user.passwd.value<>edit_user.r_passwd.value then
      MsgBox "「密碼再確認」和「使用者密碼」不同！", 64, "Oh! no"
      focusto(1)
      Exit Function
    End if  
  
    If edit_user.name.value = Empty then
      MsgBox "「家長姓名」不得為空白！", 64, "Oh! no"
      focusto(2)
      Exit Function
    End if  

    If edit_user.work.value = Empty then
      MsgBox "「職業」不得為空白！", 64, "Oh! no"
      focusto(5)
      Exit Function
    End if  

    If edit_user.tel_area.value = Empty then
      MsgBox "「區域碼」不得為空白！", 64, "Oh! no"
      focusto(6)
      Exit Function
    End if  

    If edit_user.tel_num.value = Empty then
      MsgBox "「電話號碼」不得為空白！", 64, "Oh! no"
      focusto(7)
      Exit Function
    End if  

    If edit_user.addr.value = Empty then
      MsgBox "「住址」不得為空白！", 64, "Oh! no"
      focusto(11)
      Exit Function
    End if  

    If InStr(edit_user.email.value,"@")=0 Then
      MsgBox "「電子信箱」當中需包含 '@' 字元！", 64, "Oh! no"
      focusto(12)
      Exit Function
    End if

    edit_user.Submit   
  End Function  
  

  Sub focusto(x)
    document.edit_user.elements(x).focus() 
  End Sub
  
-->     
</Script>   
 
<body background="images/bg001.gif">

  <form action="Register.asp" method="post" name="edit_user">     
  <h2>身分註冊區</h2>   
  <hr>    
     
  <%    
    Dim FileName, SQLstr, userid   
    userid = Request.cookies("UserName")
   
    FileName = "EBook.mdb"   
    SQLstr = "select * from Customer where UserID='" & userid &"'"   
    Set rsCust = GetAccessDBRecordset(FileName,SQLstr)   
    n_username = rsCust("UserName")   
    n_sex = rsCust("Sex")   
    n_work = rsCust("職業")   
    n_telarea = rsCust("Tel_Area")   
    n_telnum = rsCust("Tel_Num")   
    n_telext = rsCust("Tel_Ext")   
    n_bbcall = rsCust("bbcall")   
    n_mobil = rsCust("mobil")   
    n_addr = rsCust("Addr")   
    n_email = rsCust("email")   
  %>     
     
  <img src="images/Redball.gif" width="14" height="14">    
  使用者代號：<% =userid %>       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  使用者密碼：       
  <input type="password" name="passwd" size=8>       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  密碼再確認：       
  <input type="password" name="r_passwd" size=8>           
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  家長姓名：       
  <input type="text" name="name" size=8 value="<% =n_username %>">      
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  性別：     
  <input type="radio" name="sex" value="男性" checked>男     
  <input type="radio" name="sex" value="女性">女 
  <br>          
          
  <img src="images/Redball.gif" width="14" height="14">           
  職業：<input type="text" name="work" size=20 value="<% =n_work %>">        
  <br>          
         
  <img src="images/Redball.gif" width="14" height="14">           
  聯絡電話：<input type="text" name="tel_area" size=3 value="<% =n_telarea %>">       
   －       <input type="text" name="tel_num" size=10 value="<% =n_telnum %>">       
   分機號碼 <input type="text" name="tel_ext" size=5 value="<% =n_telext %>">       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  呼叫器：<input type="text" name="bbcall" size=10 value="<% =n_bbcall %>">       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  行動電話：<input type="text" name="mobil" size=10 value="<% =n_mobil %>">       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  聯絡地址：<input type="text" name="addr" size=60 value="<% =n_addr %>">       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  電子信箱：<input type="text" name="email" size=40 value="<% =n_email %>">       
  <br>           
  <hr>        
         
  <%      
    SQLstr = "select * from Userdom Where UserID='" & userid & "'"    
    Set rsUsrdom = GetAccessDBRecordset(FielName,SQLstr)      
    user_grade = UserGrade(rsUsrdom)    
    
    SQLstr = "select ClassType from Baby where UserID='" & userid & "'"     
    Set rsBaby = GetAccessDBRecordset(FielName,SQLstr)    
    cls_type = rsBaby("ClassType")    
    
    Application("CalledName") = ShowBaby(userid, user_grade, cls_type)

    If user_grade = 1 Then   
      Response.write "<hr>家長新增<br>"
      Response.write "<img src=images/Redball.gif width=14 height=14>"
      Response.write "寶寶身分字號：<input type=text name=babyid size=10>"
      Response.write "<br>"
  
      Response.write "<img src=images/Redball.gif width=14 height=14>"
      Response.write "寶 寶 姓 名 ：<input type=text name=babyname size=10>"
      Response.write "<br>"
  
      Response.write "<img src=images/Redball.gif width=14 height=14>"
      Response.write "寶 寶 班 級 ：<input type=text name=babytype size=10>"
      Response.write "<br>"
  
      Response.write "<img src=images/Redball.gif width=14 height=14>"
      Response.write "寶 寶 班 別 ：<input type=text name=clstype size=10>"
      Response.write "<br>"
  
    End if     
  %>   
      
  <hr>
  <A HREF="Login.htm">回首頁</A>　   
  <input type=button value="寫好送出" onclick="DataCheck"> 
  <input type=Reset value="我要重寫">           
  </form>       
   
</body>    

</html>    
           
