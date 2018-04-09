<%
  Sub ShowInfoPage(rs,Page)

    rs.AbsolutePage = Page
    For iPage = 1 to rs.PageSize
      RecNo = (Page-1)*rs.PageSize+iPage

      Response.Write "<tr><td colspan=4 height=20></td></tr>"
      Response.Write "<tr>"
      Response.Write "<td width=30 height=20>編號</td>"
      Response.Write "<td width=70 height=20 bgcolor=#ff6666 align=center><font color=#ffffff size=2>演出內容</font></td>"
      Response.Write "<td width=3 height=20></td>"
      Response.Write "<td width=320 height=20 colspan=2 bgcolor=#ffcccc align=left><a href=infopage.asp?infoname="
      Response.Write rs.Fields(0).Value & ">"& rs.Fields(0).Value & "</a></td>"
      Response.Write "</tr>"
      Response.Write "<tr>"
      Response.Write "<td width=30 height=20 colspan=3>" & RecNo & "</td>"
     
      Response.Write "<td width=160 height=26><font color=#990033>" & rs.Fields(1).Value & "</font></td>"
      Response.Write "<td width=200 height=26><font color=#990033>" & rs.Fields(2).Value & "</font></td>"
      Response.Write "</tr>"
      rs.Movenext
      If rs.EOF Then Exit For
    Next

  End Sub  
%>
