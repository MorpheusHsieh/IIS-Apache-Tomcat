<!-- #include file="GetDB.inc" -->
<!-- #include file="msgboard.inc"  -->
<%
  If Request("FirstRec")="0" Then 
    Application("TargetName") = Request("Teacher")
  End if  
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>�i�����d���O</title>
</head>

<Script Language="VBScript"> 
<!-- 
  
  Sub DataCheck()
    If msgboard1.msgTitle.value=Empty Then
      focusto(1)
      Exit Sub
    End if
    
    If msgboard1.msgMemo.value=Empty Then
      focusto(2)
      Exit Sub
    End if

    msgboard1.Submit
  End Sub  
    
  Sub focusto(x) 
    document.msgboard1.elements(x).focus() 
  End Sub 
   
-->   
</Script>

<body background="images/bg001.gif">

  <form action="msgboard.asp" method="post" name="msgboard"> 
  <input type=hidden name=FirstRec value="0"> 
  <% 
    If Request.Cookies("UserName")=Empty Then 
      Response.Redirect "Login.htm" 
    End if   
   
    Dim userid, user_grade, Title, SQLstr, FileName 
    FileName = "EBook.mdb" 
    userid = Request.Cookies("UserName") 
    usr_grade = Application("UserGrade") 
 
    If usr_grade=1 Then 
      Title = "�z�n�d��������Ѯv�G" 
    Else 
      Title = "�z�n�d���������_�_���a���G" 
    End if 
  %>
    <img src=images/REDBALL.GIF width=14 height=14>
    <%=Title%><select name=teacher>
  <%    
    '���X�Ѯv�ήa���W�r 
    If usr_grade=1 Then  
      SQLstr = "SELECT * FROM Baby Where BabyType='�Юv'" 
    Elseif usr_grade=10 Then    
      SQLstr = "SELECT * FROM Baby Where UserID='" & userid & "'" 
      Set rstmp = GetAccessDBRecordset(FileName,SQLstr) 
      clstype = rstmp("ClassType") 
      SQLstr = "SELECT * FROM Baby Where ClassType='" & clstype & "'" 
    Elseif usr_grade>10 Then 
      SQLstr = "SELECT * FROM Baby"
    End if   
    Set rsBaby = GetAccessDBRecordset(FileName,SQLstr) 
   
    AllName = "" 
    Do Until rsBaby.EOF 
      If AllName="" Then  
        AllName = rsBaby("BabyName") 
      Else 
        AllName = AllName & ", " & rsBaby("BabyName") 
      End if 
      rsBaby.Movenext     
    Loop 
     
    NameList = Split(AllName, ", ") 
    For i=0 to UBound(NameList) 
      Response.Write "<option>" & NameList(i) & "</option>" 
    Next 
  %>  
    </select>
    <input type=Submit value='�T�@�w'><hr>
  </form> 
 
  <form action="msgboard.asp" method="post" name="msgboard1">
  <input type=hidden name=FirstRec value="-1">
  <%
    If Request("FirstRec")="0" Then
    
      Dim msgEmail, mesg
      SQLstr = "SELECT * FROM Customer WHERE UserId='" & userid & "'"
      Set rsCust = GetAccessDBRecordset(FileName,SQLstr)
      n_email = rsCust("EMail")
      If usr_grade=1 Then 
        mesg = " �Ѯv" 
      Else 
        mesg = " �a��" 
      End if          
  %>     
      <img src=images/REDBALL.GIF width=14 height=14>
      �z���ʺ١G<%=userid%><br>                                                                 
                                                                 
      <img src=images/REDBALL.GIF width=14 height=14>                                                                 
      �С@�@�D�G<input type=text name=msgTitle size=40>
      <br> 
 
      <% n_target = Request("Teacher") %>
      <input type=hidden name=msgTarget value="<%=n_target%>">     
      <img src=images/REDBALL.GIF width=14 height=14>        
      �z�n�d�����G<%=n_target%><%=mesg%><br>                                                                  
                                                                
      <% n_Date = DateValue(Now) %>     
      <input type=hidden name=msgDate value="<%=n_Date%>">        
      <img src=images/REDBALL.GIF width=14 height=14>             
      �d������G<%=n_Date%>           
      <br>             
                                                                
      <% n_Time = TimeValue(Now) %>     
      <input type=hidden name=msgTime value="<%=n_Time%>">     
      <img src=images/REDBALL.GIF width=14 height=14>     
      �d���ɶ��G<%=n_Time%>     
      <br>                                                                  
                                                                  
      <input type=hidden name=msgEMail value="<%=n_email%>">     
      <img src=images/REDBALL.GIF width=14 height=14>     
      �q�l�H�c�G<%=n_email%>     
      <br>                                                                  
                                                                  
      <img src=images/REDBALL.GIF width=14 height=14>                                                                  
      �d�����e�G<br>&nbsp;&nbsp;&nbsp;                                                                  
      <textarea rows=10 name=msgMemo cols=62></textarea>                                                                  
      <br><br>                                                                  
                       
      <input type=button value="�ڭn�d��" onclick="DataCheck">                       
      <input type=Reset value="�o������">                       
      <hr>                       
  <%                       
    End if                                                                  
  %>                                                                  
  </form>                                                                  
                                                                  
  <form action="msgboard.asp" method="post" name="msgboard2">                                                                   
  <%                                                                   
    search = Application("TargetName")                               
    FirstRec=CInt(Request("FirstRec"))                                                                   
    If FirstRec<>0 Then                                                                   
      Dim FirstRec, CurRec                                                                   
      If FirstRec = -1 Then                                                                   
        Call Add_Comment()                                                            
      Else                                                                   
        If FirstRec > 10 Then                                                                   
          CurRec = FirstRec - 10                                                                   
          Response.Write "<Script Language='VBScript'>" & vbCRLF                                                                   
          Response.Write "<!--" & vbCRLF                                                                   
          Response.Write "  Sub Send_Data()" & vbCRLF                                                                   
          Response.Write "    msgboard.FirstRec.Value=" & CurRec & vbCRLF                                                                   
          Response.Write "    msgboard.Submit" & vbCRLF                                                                   
          Response.Write "  End Sub" & vbCRLF                                                                   
          Response.Write "-->" & vbCRLF                                                                   
          Response.Write "</Script" & vbCRLF                                                                   
          Response.Write "value='" & CurRec & "'>" & vbCRLF                                                                       
        End if                                                  
        CurRec = Display_Comment(FirstRec,search)                                                    
        Response.Write "<form name=msgboard.asp method=post action='"                                                                       
        Response.Write Request.ServerVariables("SCRIPT_NAME")                                                                       
        Response.Write "'>"                                                                       
        Response.Write "<input type=hidden name=FirstRec "                                                                       
        Response.Write "value='" & CurRec & "'>" & vbCRLF                                                                       
        If CurRec = (FirstRec+10) Then                                                        
          Response.Write "<input type=Submit value='�s����Q���d��'>" & vbCRLF                                                          
        End if                                                         
        If FirstRec > 10 Then                                                                       
          FirstRec = FirstRec - 10                                                                       
          Response.Write "<input type=button value='�s���e�Q���d��'" & vbCRLF                                                          
          Response.Write " onclick='Send_Data()'" & vbCRLF                                                                       
        End if                                                                       
        Response.Write "</form>" & vbCRLF                                                                       
      End if                                                         
    End if                                                                       
  %>                                                                       
  </form>                                                                    
                                                                       
  <form action="msgboard.asp" method="post" name="msgboard3">                                                                       
  <input type=hidden name=FirstRec value="1">                                                                       
  <input type=submit value='�\Ū�d��'>                   
  �@<A HREF="MsgBoard.Asp">�^��d����</A>                   
  �@<A HREF="Menu.Asp">�^����</A>                      
  �@<A HREF="Login.htm">�^�쭺��</A>                   
  </form>                   
                                                                      
</body>                                                                     
</html>                                                                     