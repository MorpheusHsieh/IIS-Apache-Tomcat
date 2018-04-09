<%
  Sub ShowOnePage(rs,Page)
    
    Response.Write "<Center><Table Border=1>"
    Response.Write "<TR BGColor=#00ffff>"
    Response.Write "<td>編號</td>"
    For i=0 to rs.Fields.Count-1
      Response.Write "<td>" & rs.Fields(i).Name & "</td>"
    Next 
    Response.Write "</tr>"
    
    rs.AbsolutePage = Page
    For iPage = 1 to rs.PageSize  
      If iPage/2=Int(iPage/2) Then 
        Response.Write "<tr BGColor=#ff00ff>"
      Else
        Response.Write "<tr>"
      End if
      RecNo = (Page-1)*rs.PageSize + iPage
      Response.Write "<td>" & RecNo & "</td>"

      '顯示照片以外的欄位
      For i=0 to rs.Fields.Count-2
        If i=0 Then 
          Response.Write "<td><A HREF=Action2.ASP?ActNo="
          Response.Write RecNo & ">"
          Response.Write rs.Fields(0).Value & "</A></td>"
        Else
          Response.Write"<td>" & rs.Fields(i).Value & "</td>"
        End if
      Next
      '顯示照片
      imgPath = "images/picact-img/" & rs.Fields(rs.Fields.Count-1).Value
      Response.Write "<td><img src=" & imgPath & " width=160 height=80></td>"
 
      Response.Write "</tr>"
      rs.Movenext
      If rs.EOF Then Exit For
    Next 
    Response.Write "</table></center><br>"
  End Sub  
%>
