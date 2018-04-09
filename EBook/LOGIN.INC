<Script Language="VBScript" RunAt="Server">

Function Check_Pass()
  
  dim FileName, SQLstr, userid, passwd, babyname
  FileName = "EBook.mdb"
  userid = Request("userid")
  passwd = Request("passwd")
  babyname = Request("babyname")
  
  '先檢查是否為教職員帳號
  SQlstr = "Select UserID,ClassType from Baby where UserID='" & userid & "'"
  Set rs = OpenAccessDB(FileName,SQLstr)
  If rs("ClassType")="教職員" Then
    Response.Write "歡迎 " & rs("BabyName") & " 老師使用本系統"
  Else
    SQLstr = "Select BabyName from Baby where UserID='" & userid & "'"
    Set rs = OpenAccessDB(FileName,SQLstr)
    If rs.EOF Then
      Response.Write babyname & "寶寶不在園中"
      Exit Function
    Else
      Response.Write "找到了" & babyname & "寶寶"
    End if
  End if
End Function  

</Script>
