<%
  String sPage_no = "";
  sPage_no = request.getParameter("PageNo");
  if (sPage_no == null)
    iPageNo = 1;
  else if (sPage_no != null)
  {   
    if (sPage_no.length() == 0)
      sPage_no = request.getParameter("txtPageNo");

    try {
      iPageNo = Integer.parseInt(sPage_no);
    } 
    catch(Exception e) {
      iPageNo = 1;
    }    
  }  
    
  iPageNo = (iPageNo < 1) ? 1 : iPageNo;
  iPageNo = (iPageNo > iTotalPage) ? iTotalPage : iPageNo;
  
  int nPagesPerShow = 5;                                       // 每次顯示多少頁
  int start_page = (((iPageNo-1)/nPagesPerShow)*nPagesPerShow)+1;   // 開始頁碼
  int end_page = start_page + nPagesPerShow - 1;
  end_page = (end_page > iTotalPage) ? iTotalPage : end_page;        // 結束頁碼
%>  
<table width="100%">
  <tr>   
    <%
      String sTotalPage = Integer.toString(iTotalPage);
      int txt_len = sTotalPage.length();
    %>  
    <td align="left">
    <%
      // 如果頁碼大於每次顯次的頁數，則顯示 "<<"
      if (start_page >= nPagesPerShow)
      {
        %>
        <a href="<%=strMySelf%>?PageNo=<%=(iPageNo-nPagesPerShow)%>"><<</a>
        <%  
        out.print(" ");
      }

      // 如果頁碼大於 1，則顯示 "<"
      if (iPageNo > 1)
      {
        %>
        <a href="<%=strMySelf%>?PageNo=<%=(iPageNo-1)%>"><</a>
        <%  
        out.print(" ");      
      }
      
      // 如果開始頁碼不為 1，則顯示 "1..."
      if (start_page != 1)
      {
        %>
        <a href="<%=strMySelf%>?PageNo=1">1</a>
        <%  
        out.print("... ");
      }
     
      // 顯示現在頁數區間頁碼
      for (int i=start_page; i<=end_page; i++)
      {
        String msg = "";
        if (i == iPageNo)
          msg = "[" + i + "]";
        else
          msg = "<a href=" + strMySelf + "?PageNo=" + i + ">" + i + "</a>";
        out.print(msg + " ");  
      }
      
      // 如果結束頁碼不是最後一頁，則顯示 "[最後一頁]..."
      if (end_page != iTotalPage)
      {
        out.print("...");
        %>
        <a href="<%=strMySelf%>?PageNo=<%=iTotalPage%>"><%=iTotalPage%></a>
        <%  
      }
            // 如果頁碼小於最後一頁，則顯示 ">"
      if (iPageNo < iTotalPage)
      {
        %>
        <a href="<%=strMySelf%>?PageNo=<%=(iPageNo+1)%>">></a>
        <%  
        out.print(" ");      
      }
     
      // 如果頁碼小於 (最大頁數-每次顯示的頁數)，則顯示 ">>"
      if (end_page < iTotalPage)
      {
        %>
        <a href="<%=strMySelf%>?PageNo=<%=(iPageNo+nPagesPerShow)%>">>></a>
        <%  
        out.print(" ");
      }
    %>
    </td>
  </tr>  
  <tr>
    <td align="left">
      共&nbsp<%=iTotalRecs%>&nbsp筆資料∕每頁&nbsp<%=iRecsPerPage%>&nbsp筆∕
      第&nbsp<input type="text" name="txtPageNo" value="<%=iPageNo%>" size="<%=txt_len%>">∕<%=iTotalPage%>&nbsp頁
    </td>
    <td align="right">
      快速跳到
      <select size="1" name="PageNo">
        <option></option>
        <%
          for (int i=1; i<=iTotalPage; i++)
            out.print("<option>"+i+"</option>");
        %>
      </select>頁 <input type="submit" value="快速跳頁">
    </td>    
  </tr>
</table>  
    









































































