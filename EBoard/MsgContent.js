  <!--
    var myWin = null;
    function OpenWindow(dept, sReplyMsg, dtime)
    {
      
      myWin = window.open("", "myWindow","top=200,left=300,width=480,height=200");
      myWin.document.write("<form>");
      myWin.document.write("<table width=\"100%\" border=\"1\">");
      myWin.document.write("  <tr>");
      myWin.document.write("    <td align=\"left\">"+dept+"�G</td>");
      myWin.document.write("    <td align=\"right\">�^���ɶ��G"+dtime+"</td>");
      myWin.document.write("  </tr>");
      myWin.document.write("  <tr>");
      myWin.document.write("    <td colspan=\"2\" height=\"140\" align=\"left\" valign=\"top\">")
      myWin.document.write("      ���e�G<br>&nbsp&nbsp&nbsp&nbsp" + sReplyMsg);
      myWin.document.write("    </td>");
      myWin.document.write("  </tr>");      
      myWin.document.write("</table>");
      myWin.document.write("</form>");
    }
    
    function CloseWin()
    {
      myWin.close();
    }    
  //-->
