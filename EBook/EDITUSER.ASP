<!-- #include file="GetDB.inc" -->
<!-- #include file="EditUser.inc" -->

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>�ӤH�򥻸�ƭק�</title>
</head>

<Script Language="VBScript">
<!--
  Function DataCheck()   
    If edit_user.passwd.value = Empty Then
      MsgBox "�u�ϥΪ̱K�X�v���o���ťաI", 64, "Oh! no"
      focusto(0)
      Exit Function
    End if
    
    If edit_user.r_passwd.value = Empty then
      MsgBox "�u�K�X�A�T�{�v���o���ťաI", 64, "Oh! no"
      focusto(1)
      Exit Function
    End if  
    
    If edit_user.passwd.value<>edit_user.r_passwd.value then
      MsgBox "�u�K�X�A�T�{�v�M�u�ϥΪ̱K�X�v���P�I", 64, "Oh! no"
      focusto(1)
      Exit Function
    End if  
  
    If edit_user.name.value = Empty then
      MsgBox "�u�a���m�W�v���o���ťաI", 64, "Oh! no"
      focusto(2)
      Exit Function
    End if  

    If edit_user.work.value = Empty then
      MsgBox "�u¾�~�v���o���ťաI", 64, "Oh! no"
      focusto(5)
      Exit Function
    End if  

    If edit_user.tel_area.value = Empty then
      MsgBox "�u�ϰ�X�v���o���ťաI", 64, "Oh! no"
      focusto(6)
      Exit Function
    End if  

    If edit_user.tel_num.value = Empty then
      MsgBox "�u�q�ܸ��X�v���o���ťաI", 64, "Oh! no"
      focusto(7)
      Exit Function
    End if  

    If edit_user.addr.value = Empty then
      MsgBox "�u���}�v���o���ťաI", 64, "Oh! no"
      focusto(11)
      Exit Function
    End if  

    If InStr(edit_user.email.value,"@")=0 Then
      MsgBox "�u�q�l�H�c�v�����ݥ]�t '@' �r���I", 64, "Oh! no"
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
  <h2>�������U��</h2>   
  <hr>    
     
  <%    
    Dim FileName, SQLstr, userid   
    userid = Request.cookies("UserName")
   
    FileName = "EBook.mdb"   
    SQLstr = "select * from Customer where UserID='" & userid &"'"   
    Set rsCust = GetAccessDBRecordset(FileName,SQLstr)   
    n_username = rsCust("UserName")   
    n_sex = rsCust("Sex")   
    n_work = rsCust("¾�~")   
    n_telarea = rsCust("Tel_Area")   
    n_telnum = rsCust("Tel_Num")   
    n_telext = rsCust("Tel_Ext")   
    n_bbcall = rsCust("bbcall")   
    n_mobil = rsCust("mobil")   
    n_addr = rsCust("Addr")   
    n_email = rsCust("email")   
  %>     
     
  <img src="images/Redball.gif" width="14" height="14">    
  �ϥΪ̥N���G<% =userid %>       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  �ϥΪ̱K�X�G       
  <input type="password" name="passwd" size=8>       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  �K�X�A�T�{�G       
  <input type="password" name="r_passwd" size=8>           
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  �a���m�W�G       
  <input type="text" name="name" size=8 value="<% =n_username %>">      
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  �ʧO�G     
  <input type="radio" name="sex" value="�k��" checked>�k     
  <input type="radio" name="sex" value="�k��">�k 
  <br>          
          
  <img src="images/Redball.gif" width="14" height="14">           
  ¾�~�G<input type="text" name="work" size=20 value="<% =n_work %>">        
  <br>          
         
  <img src="images/Redball.gif" width="14" height="14">           
  �p���q�ܡG<input type="text" name="tel_area" size=3 value="<% =n_telarea %>">       
   ��       <input type="text" name="tel_num" size=10 value="<% =n_telnum %>">       
   �������X <input type="text" name="tel_ext" size=5 value="<% =n_telext %>">       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  �I�s���G<input type="text" name="bbcall" size=10 value="<% =n_bbcall %>">       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  ��ʹq�ܡG<input type="text" name="mobil" size=10 value="<% =n_mobil %>">       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  �p���a�}�G<input type="text" name="addr" size=60 value="<% =n_addr %>">       
  <br>           
          
  <img src="images/Redball.gif" width="14" height="14">           
  �q�l�H�c�G<input type="text" name="email" size=40 value="<% =n_email %>">       
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
      Response.write "<hr>�a���s�W<br>"
      Response.write "<img src=images/Redball.gif width=14 height=14>"
      Response.write "�_�_�����r���G<input type=text name=babyid size=10>"
      Response.write "<br>"
  
      Response.write "<img src=images/Redball.gif width=14 height=14>"
      Response.write "�_ �_ �m �W �G<input type=text name=babyname size=10>"
      Response.write "<br>"
  
      Response.write "<img src=images/Redball.gif width=14 height=14>"
      Response.write "�_ �_ �Z �� �G<input type=text name=babytype size=10>"
      Response.write "<br>"
  
      Response.write "<img src=images/Redball.gif width=14 height=14>"
      Response.write "�_ �_ �Z �O �G<input type=text name=clstype size=10>"
      Response.write "<br>"
  
    End if     
  %>   
      
  <hr>
  <A HREF="Login.htm">�^����</A>�@   
  <input type=button value="�g�n�e�X" onclick="DataCheck"> 
  <input type=Reset value="�ڭn���g">           
  </form>       
   
</body>    

</html>    
           