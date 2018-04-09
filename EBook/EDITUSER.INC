<%
  Function ShowBaby(userid, user_grade, cls_type)
  
    SQLstr = "select * from Baby"
    Set rs = GetAccessDBRecordset(FielName,SQLstr)

    RecNo = 0
    CalledName = ""
    Response.Write "<table border=1>"
    Do Until rs.EOF
      result= True
      select case user_grade
        case 1
          If rs("UserId")<>userid Then result = False
        case 10
          If rs("ClassType")<>cls_type Then result = False
          If rs("BabyType")="教師" Then result = False
        case 100
          If rs("BabyType")<>"教師" Then result = False
        case 1000
          If rs("BabyType")<>"行政管理" Then result = False
      End Select

      If result Then
        RecNo = RecNo + 1
        If RecNo=1 Then
          Response.Write "您在園內的寶寶有："
          Response.Write "<tr BGCOLOR=#00FFFF>"
          Response.Write "<td>項次</td>" 
          Response.Write "<td>寶寶身份證號</td>"
          Response.Write "<td>寶寶姓名</td>"
          Response.Write "<td>班　　級</td>"
          Response.Write "<td>班　　別</td>"
          Response.Write "</tr>"
        End if 
     
        If RecNo=1 Then
          CalledName = rs("BabyName")
        Else
          CalledName = CalledName & ", " & rs("BabyName")
        End if        

        Response.Write "<tr>" 
        Response.Write "<td><cenetr>" & RecNo & "</center></td>" 
        Response.Write "<td>" & rs("BabyID") & "</td>"
        Response.Write "<td>" & rs("BabyName") & "</td>"
        Response.Write "<td>" & rs("BabyType") & "</td>"
        Response.Write "<td>" & rs("ClassType") & "</td>"
        Response.Write "</tr>"
      End if
      rs.Movenext
    Loop  
    Response.Write "</table>"

    If RecNo=0 Then 
      Select case user_grade
        case 1
          Response.Write "您在園內沒有任何寶寶<br>"
        Case 10
          Response.Write "您的班上沒有任何寶寶<br>"
        Case 100
          Response.Write "您的園內沒有任何老師<br>"
      End Select
    End if   
    ShowBaby = CalledName

  End Function  


  Function UserGrade(rs)
    grade = 0
    If rs("系統管理") Then grade = grade + 1000
    If rs("行政管理") Then grade = grade + 100
    If rs("教師") Then grade = grade + 10
    If rs("家長") Then grade = grade + 1
    UserGrade = grade
  End Function
%>