<%
  Function GetAccessDBRecordset(FileName, SQLstr)
    Set GetAccessDBRecordset = OpenAccessDB(FileName,SQLstr,2)
  End Function


  Function GetAccessDBStaticRecordset(FileName, SQLstr)
    Set GetAccessDBStaticRecordset = OpenAccessDB(FileName,SQLstr,3)
  End Function


  Function OpenAccessDB(FileName, SQLstr, Cursor)

    On Error Resume Next
    Set OpenAccessDB = Nothing
    
    Dim adocon
    Set adocon=ConnectionByOLEDB(FileName)
    If adocon Is Nothing Then 
      Response.Write "�H OLE DB �s����Ʈw����...<br>"
      Set adocon=ConnectionByODBC(FileName)
      If adocon Is Nothing Then 
        Response.Write "�H ODBC �s����Ʈw����...<br>"
        Exit Function
      End if  
    End if

    Set rs=Server.CreateObject("ADODB.Recordset")
    If Err.Number <> 0 Then 
      Response.Write "��Ʈw�s�����\�A���إ� Recordset ���󥢱�...<br>"
      Exit Function
    End if  

    rs.Open SQLstr, adocon, Cursor, 2
    If Err.Number <> 0 Then 
      Response.Write "��Ʈw�s�����\�A����ƪ��}�ҥ���...<br>"
      Exit Function
    End if  
    Set OpenAccessDB = rs
  
  End Function


  Function ConnectionByOLEDB(FileName)

    On Error Resume Next
    Set ConnectionByOLEDB = Nothing

    Dim ConnectionString
    ConnectionString = SetConnectionString(OLEDB)
    If Err.Number<>0 Then
      Response.Write "OLE DB �s�u�ѼƳ]�w����...<br>"
      Response.Write ConnectionString & "<br>"
      Exit Function
    End if

    Set oledb_con=GetConnection(ConnectionString)
    If Err.Number<>0 Then
      Response.Write "�H OLE DB �P��Ʈw�s������...<br>"
      Exit Function
    End if  
    Set ConnectionByOLEDB = oledb_con
      
  End Function


  Function ConnectionByODBC(FileName)

    On Error Resume Next
    Set ConnectionByODBC = Nothing

    Dim ConnectionString
    ConnectionString = SetConnectionString(ODBC)
    If Err.Number<>0 Then
      Response.Write "ODBC �s�u�ѼƳ]�w����...<br>"
      Exit Function
    End if

    Set odbc_con=GetConnection(ConnectionString)
    If Err.Number<>0 Then
      Response.Write "�H ODBC �P��Ʈw�s������...<br>"
      Exit Function
    End if  
    Set ConnectionByODBC = odbc_con

  End Function


  Function SetConnectionString(Conn_Class)

    Dim Provider, DBPath
    If Conn_Class=OLEDB Then
      Provider="Provider=Microsoft.Jet.OLEDB.4.0;"
      DBPath="Data Source=" & Server.MapPath(FileName)
    Elseif Conn_Class=ODBC Then 
      Provider="Driver={Microsoft Access Driver(*.mdb)};"
      DBPath="DBQ=" & Server.MapPath(FileName)
    End if
    SetConnectionString = Provider & DBPath

  End Function


  Function GetConnection(Param)
    On Error Resume Next
    Set GetConnection = Nothing
    Set conn=Server.CreateObject("ADODB.Connection")
    If Err.Number<>0 Then
      Response.Write "�H ADODB �Ұ� Connection ���󥢱�...<br>"
      Exit Function
    End if
    
    conn.Open Param
    If Err.Number<>0 Then 
      Response.Write "�w�g�Ұ� ADODB.Connection ����A���s���Ѽƿ��~...<br>"
      Exit Function
    End if  
    Set GetConnection = conn
  End Function
%>