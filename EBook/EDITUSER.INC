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
          If rs("BabyType")="�Юv" Then result = False
        case 100
          If rs("BabyType")<>"�Юv" Then result = False
        case 1000
          If rs("BabyType")<>"��F�޲z" Then result = False
      End Select

      If result Then
        RecNo = RecNo + 1
        If RecNo=1 Then
          Response.Write "�z�b�餺���_�_���G"
          Response.Write "<tr BGCOLOR=#00FFFF>"
          Response.Write "<td>����</td>" 
          Response.Write "<td>�_�_�����Ҹ�</td>"
          Response.Write "<td>�_�_�m�W</td>"
          Response.Write "<td>�Z�@�@��</td>"
          Response.Write "<td>�Z�@�@�O</td>"
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
          Response.Write "�z�b�餺�S�������_�_<br>"
        Case 10
          Response.Write "�z���Z�W�S�������_�_<br>"
        Case 100
          Response.Write "�z���餺�S������Ѯv<br>"
      End Select
    End if   
    ShowBaby = CalledName

  End Function  


  Function UserGrade(rs)
    grade = 0
    If rs("�t�κ޲z") Then grade = grade + 1000
    If rs("��F�޲z") Then grade = grade + 100
    If rs("�Юv") Then grade = grade + 10
    If rs("�a��") Then grade = grade + 1
    UserGrade = grade
  End Function
%>