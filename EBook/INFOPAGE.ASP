<!-- #include file="GetDB.inc" -->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>★☆★愛愛的電子聯絡簿---幼兒活動照片★☆★</title>
<style>
body { background-color:#CCCCFF;
       font-size:12pt;
       text-align:left;
       color:#800080
     }
</style>
</head>

<body>

<%
  FileName = "EBook.mdb"
  ActName =Request("infoname")
  SQLstr = "SELECT * FROM FieldInfo Where 活動演出名稱='" & ActName & "'"
  Set rsAct = GetAccessDBRecordset(FileName, SQLstr)
  
  If rsAct Is Nothing Then 
    Response.Write "開啟資料庫失敗"
  Elseif Not rsAct.EOF Then 
    n_ActName = rsAct.Fields(0).Value    
    n_ActDate = rsAct.Fields(1).Value
    n_ActPosi = rsAct.Fields(2).Value
    n_ActUnit = rsAct.Fields(3).Value
    n_ActTel  = rsAct.Fields(4).Value    
    n_ActTicket = rsAct.Fields(5).Value    
    
    Response.Write "活動演出名稱：" & n_ActName & "<br>"
    Response.Write "演出日期時間：" & n_ActDate & "<br>"
    Response.Write "活動演出地點：" & n_ActPosi & "<br><hr>"

    SQLstr = "SELECT * FROM FieldInfoImg Where 活動演出名稱='" & ActName & "'"
    Set rsAct = GetAccessDBRecordset(FileName, SQLstr)

    Do Until rsAct.EOF
      imgPath = "images/FieldImg/" & rsAct.Fields(rsAct.Fields.Count-1).Value
      Response.Write "<img src=" & imgPath & " width=480 height=320><br>"
      Response.Write rsAct("演出內容說明") & "<br><hr>"
      rsAct.Movenext
    Loop
    
    Response.Write "主辦單位：" & n_ActUnit & "<br>"
    Response.Write "聯絡電話：" & n_ActTel & "<br>"
    Response.Write "票價：" & n_ActTicket & "<br>"
  End if  
%>

  
</body>

</html>
