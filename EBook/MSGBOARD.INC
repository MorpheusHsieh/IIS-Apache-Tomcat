<%
  Sub Add_Comment()
    FileName = "EBook.mdb"
    n_target = Request("msgTarget")
    n_title = Request("msgTitle")
    n_date = Request("msgDate")
    n_time = Request("msgTime")
    n_email = Request("msgEmail")
    n_memo = Request("msgMemo")
    
    SQLstr = "INSERT INTO MsgData VALUES('" & userid
    SQLstr = SQLstr & "','" & n_target & "','" & n_title
    SQLstr = SQLstr & "','" & n_date   & "','" & n_time
    SQLstr = SQLstr & "','" & n_email  & "','" & n_memo & "')"
    Set rsMsg = GetAccessDBRecordset(FileName,SQLstr)
  
    red_str = "<img src='images\redball.gif'>"
    Response.Write "<h2>"
    Response.Write "���U�O <i>" & userid & "</i> �d�U����ơG"
    Response.Write "</h2>"
    Response.Write "<left><h3>"
    Response.Write red_str & "�С@�@�D�G" & n_title & "<br>"
    Response.Write red_str & "�d����H�G" & n_target & "<br>"
    Response.Write red_str & "�d������G" & n_date & "<br>"
    Response.Write red_str & "�d���ɶ��G" & n_time & "<br>"
    Response.Write red_str & "�q�l�H�c�G" & n_email & "<br>"
    Response.Write red_str & "�d�����e�G" & n_memo & "<p>"
    Response.Write "</h3></left><hr>"
  End Sub  
 

  Function Adjust_SQLstr(adj_str)
    Dim final_str, i
    adj_str = Trim(adj_str)
    final_str = ""
    If Len(adj_str) > 0 Then
      For i = 1 To Len(adj_str)
        Select Case Mid(adj_str, i, 1)
          Case Chr(13):  '�Y��Carriage Return
            final_str = final_str & ""
          Case Chr(10):  '�Y��Line Feed
            final_str = final_str & " "
          Case Else:     '�Y����L�r��
            final_str = final_str & Mid(adj_str, i, 1)
        End Select
      Next
    End If
    Adjust_note = final_str 
  End Function


  Function Display_Comment(FirstRec, search)
    Dim FileName, red_str, SQLstr, Curstr
    FileName = "EBook.mdb"

    CurRec = 1
    SQLstr = "SELECT * FROM MsgData Where Target='" & search & "'"
    Set rsMsg = GetAccessDBRecordset(FileName,SQLstr)
  
    Do While CurRec < FirstRec
      If Not rsMsg.EOF Then
        rsMsg.Movenext
        CurRec = CurRec + 1
      Else
        Exit Do
      End if
    Loop
  
    Do While CurRec<(FirstRec+10)
      If Not rsMsg.EOF Then
        n_userid = rsMsg("UserID")
        n_target = rsMsg("Target")
        n_title = rsMsg("Title")
        n_date = rsMsg("MsgDate")
        n_time = rsMsg("MsgTime")
        n_email = rsMsg("Email")
        n_memo = rsMsg("Message")
        red_str = "<img src='images\redball.gif'>"
      
        Response.Write CurRec & "."
        Response.Write "���U�O <i>" & n_userid & "</i> �d�U����ơG"
        Response.Write "<p><left>" & vbCRLf
        Response.Write red_str & "�С@�@�D�G" & n_title & "<br>" & vbCRLf
        Response.Write red_str & "�d����H�G" & n_target & "<br>" & vbCRLf
        Response.Write red_str & "�d������G" & n_date & "<br>" & vbCRLf
        Response.Write red_str & "�d���ɶ��G" & n_time & "<br>" & vbCRLf
        Response.Write red_str & "�q�l�H�c�G" & n_email & "<br>" & vbCRLf
        Response.Write red_str & "�d�����e�G" & n_memo & "<br>" & vbCRLf
        Response.Write "</left><hr>" & vbCRLf
        rsMsg.Movenext
        CurRec = CurRec + 1
      Else
        Exit Do
      End if
    Loop
    Display_Comment = CurRec
End Function 

%>