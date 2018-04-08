<%
  out.print("<table width='100%'");
  out.print(" <tr>");
  out.print("  <td align="+locate+">");
  out.print("¦@" + page_num + "/" + pages + "­¶ ");
  
  if (page_num >= nPagesPerShow)
    out.print("<a href="+strMySelf+"?Page="+(page_num-nPagesPerShow)+"><<</a>");
  out.print(" ");

  if (page_num != 1)
    out.print("<a href="+strMySelf+"?Page=" + (page_num-1) + "><</a>");
  out.print(" ");
  
  start_page = ((page_num-1)/nPagesPerShow)*nPagesPerShow;
  end_page = start_page + nPagesPerShow;
  end_page = (end_page > pages) ? pages : end_page;
  for (int i=start_page; i<end_page; i++)
  {
    String msg = "";
    if ((i+1) == page_num)
      msg = "[" + (i+1) + "]";
    else
      msg = "<a href="+strMySelf+"?Page="+(i+1)+">"+(i+1)+"</a>";
    out.print(msg + " ");
  }

  if (page_num != pages)
    out.print("<a href="+strMySelf+"?Page=" + (page_num+1) + ">></a>");
  out.print(" ");

  if (page_num < pages-nPagesPerShow)
    out.print("<a href="+strMySelf+"?Page="+(page_num+nPagesPerShow)+">>></a>");
  out.print(" ");

  out.print(" </td>");
  out.print(" </tr>");
  out.print("</table>");
%>