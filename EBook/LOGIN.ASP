<!-- #include file="GetDB.inc" -->
<% 
  Response.Cookies("UserName")=Request("UserID") 

  dim userid, passwd, babyname
  userid = Request("userid")
  passwd = Request("passwd")
  babyname = Request("babyname")
  
  '�ˬd�_�_�W�r�O�_�b�餤
  Dim FileName, SQLstr, result
  result = Flase
  FileName = "EBook.mdb"

  SQLstr = "select * from Baby where BabyName='" & babyname & "'"
  set rs = GetAccessDBRecordset(FileName,SQLstr)
  If rs.EOF Then 
    Response.Write("<h1>")
    Response.Write(babyname & "�_�_���b�餤")
    Response.Write("</h1><hr>")
  Elseif Not rs.EOF Then
    If rs("Exist") Then 
      result = True    
    Elseif Not rs("Exist") Then
      Response.Write("<h1>")
      Response.Write(babyname & "�_�_�w�g�b�餤�A���٥������n�O")
      Response.Write("</h1><hr>")
    End if  
  End if
  
  If result Then
    '�w�T�w�_�_�b�餤�A�ˬd�a���O�_�w�g�n�����
    If len(rs("UserID"))<=0 Then                                '�a���|���n�J���
   
      '�ˬd�a���ʺ٬O�_����
      SQLstr = "select * from Baby where UserID='" & userid & "'"
      set rs1 = GetAccessDBRecordset(FileName,SQLstr)
  
      If Not rs1.EOF Then
        Response.Write("<h1><hr>")
        Response.Write(babyname & "�_�_���a���z�n<br>")
        Response.Write("�z�O�Ĥ@���n���A�� " & userid & " �w�g���H�ϥΡA�Ц^�e�@�����ʺ�")
        Response.Write("</center>")
        Response.Write("</h1><hr>")
      Elseif rs1.EOF Then
        '�a���|���n����ơA�N baby ���檺�a���ʺ٧令���e��J�� userid
        SQLstr = "UPDATE baby set UserID='" & userid & "'"
        SQLstr = SQLstr & " where BabyName='" & babyname & "'"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
      
        '���� Customer ��ƪ��O�_�s�b�a���ʺ١A�p�G���h�R���᭫�s�إ�
        SQlstr = "SELECT UserID FROM Customer WHERE UserId='" & userid & "'"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
        If Not rs2.EOF Then
          SQlstr = "Delete from Customer where UserId='" & userid & "'"
          set rs3 = GetAccessDBRecordset(FileName,SQLstr)
        End if

        SQLstr = "INSERT INTO Customer(UserID) Values('" & userid & "')"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
        If rs2 Is Nothing Then
          Response.Write "�s�W " & userid & "�ʺ٨� Customer ��ƪ�����"
        End if  

        '���� Userdom ����O�_�s�b�a���ʺ١A�p�G���h�R���᭫�s�إ�
        SQlstr = "SELECT UserID FROM Userdom WHERE UserId='" & userid & "'"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
        If Not rs2.EOF Then 
          SQLstr = "DELETE from Userdom where UserId='" & userid & "'"
          set rs3 = GetAccessDBRecordset(FileName,SQLstr)
        End if
        
        SQLstr = "INSERT INTO Userdom(Userid,Passwd,�a��) VALUES('" & userid 
        SQLstr = SQLstr & "','" & passwd & "','" & "-1" & "')"
        set rs2 = GetAccessDBRecordset(FileName,SQLstr)
        If rs2 Is Nothing Then 
          Response.Write "�s�W " & userid & "�ʺ٨� Userdom ��ƪ�����"
        End if
        Response.Redirect "Menu.asp"
      End if    
    Elseif rs("UserID")=userid Then                             '�_�_�b�餤�A�B�a���ʺ٬۲šA�ˬd�K�X
      SQLstr = "SELECT * FROM Userdom WHERE UserID='" & userid 
      SQLstr = SQLstr & "' and Passwd='" & passwd & "'"
      set rs1 = GetAccessDBRecordset(FileName,SQLstr)
      If Not rs1.EOF Then
        Response.Redirect "Menu.asp"
      Elseif rs1.EOF Then
        Response.Write("<h1><hr>")
        Response.Write("�u�ϥΪ̦W�١v�Ρu�K�X�v�L�k�t�X")
        Response.Write("</center>")
        Response.Write("</h1><hr>")
      End if 
    Elseif rs("UserID")<>userid Then
      Response.Write("<h1><hr>")
      Response.Write(babyname & "�_�_���O�z���a�I�I")
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
<title>�n�J�K�X����</title>
</head>


<body background="images/bg001.gif">

<form method=post name=check>


</form>

</body>

</html>