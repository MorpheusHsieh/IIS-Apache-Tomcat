<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01, MyDir2"%>
<%@include file="MsgContent.inc"%>

<%
  // 基本設定
  String strMySelf = "MsgContent.jsp";
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";

  // 儲存於 Session 中關於使用者的訊息
  String sUser = (String)session.getAttribute("UserName");
  String sDept = (String)session.getAttribute("Department");  
  String sRoleCode = (String)session.getAttribute("RoleCode");
  int iRoleCode = Integer.parseInt(sRoleCode);
  boolean bReplied = false;
%>

<%
  String sd_code = request.getParameter("SunDayCode");
  //out.print("序號：" + sundaycode);

  // 流程判斷
  String send = request.getParameter("Send");
  if (send != null && send.length()>0)
  {
    String strTitle = request.getParameter("txtTitle");
    String strContent = request.getParameter("txtContent");
    if (send.equals("更新公佈訊息內容"))
    {
      int result = MsgEditor(ini_file, sd_code, strTitle, strContent);
      response.sendRedirect("MsgBoard.jsp");      
    }
    else if (send.equals("刪除本公告訊息"))
    {
      MsgBoard01 mb01 = new MsgBoard01(ini_file);    
      mb01.OpenConnection();
      mb01.DeletetContent(sd_code);
      mb01.CloseConnection();    
      response.sendRedirect("MsgBoard.jsp");
    }
    else 
    {
      String filename = request.getParameter("txtFileName");
      if (send.equals("插入附加檔案"))
      {
        //out.print("你選擇了插入附加檔案("+filename + ")...");
        
        MsgBoard01 mb01 = new MsgBoard01(ini_file);
        mb01.OpenConnection();
        mb01.AddAffixFile(sd_code, filename);
        mb01.CloseConnection();
      }
      else if (send.equals("刪除附加檔案"))
      {
        //out.print("你選擇了刪除附加檔案("+filename + ")...");    

        MsgBoard01 mb01 = new MsgBoard01(ini_file); 
        mb01.OpenConnection();
        mb01.DeleteAffixFile(sd_code, filename);
        mb01.CloseConnection();        
      }
    }
  }

  // 分頁處理程序
  MsgBoard01 mb01 = new MsgBoard01(ini_file);
  mb01.OpenConnection();
  String[] data = mb01.QuerySingleMessage(sd_code);
  String[][] ReplyUsers = mb01.getReplyUser();
  String[] AffixFiles = mb01.getAffixFileList();
  mb01.CloseConnection();  
%>

<html>
<head>
  <title>我是展示訊息內容的頁面</title>
  <script type="text/javascript" language="javascript" src="MsgContent.js"></script>
</head>

<body>

<p>我是<font color="#0000FF">展示訊息內容</font>的頁面...</p>


<form name="frmMsgContent" method="post" action="<%=strMySelf%>">
  <input type="hidden" name="SunDayCode" value="<%=data[0]%>">
  <div align="center">
  <table border="1">
   <tr>
     <td colspan="2" valign="middle">編號：<%=data[0]%></td>
   </tr>
   <tr>
     <td colspan="2" valign="middle">使用者：<%=sUser%></td>
   </tr>
   <tr>
     <%
       String strTitle = ((data[1] == null) ? "標題空白..." : data[1].trim());        // 資料位置和SQL查詢命令有關...
       
       // 依權限決定是否可異動標題,可異動時使用 text, 不可異動時使用 label 
       String outstr = "";
       if (sDept.equals("行政室") || (iRoleCode == 1))
         outstr = "<input type=\"text\" name=\"txtTitle\" value=\""+strTitle+"\" size=\"90\">";
       else
         outstr = strTitle;       
     %>   
     <td colspan="2" valign="middle">主旨：<%=outstr%></td>
   </tr>
   <tr valign="top">
     <%
       String strContent = ((data[2] == null) ? "尚未發表內容..." : data[2].trim()); // 資料位置和SQL查詢命令有關...
     %>
     <td valign="top">內容：</td>
     <%
       if (sDept.equals("行政室") || (iRoleCode == 1))
         outstr = "<textarea name=\"txtContent\" rows=\"16\" cols=\"88\">"+strContent+"</textarea>";
       else
         outstr = strContent;
     %>    
     <td valign="top" width="640" height="240"><%=outstr%></td>
   </tr>   
   <%
     if (sDept.equals("行政室") || iRoleCode == 1)
     {
       %>
       <tr>
         <td valign="top">選擇附加檔案：</td>
         <td>
           <select name="txtFileName">
             <option value="" selected>
             <%
               String file_path = request.getRealPath("./Files");
               MyDir2 md = new MyDir2(file_path);
               String[] files = md.getFileList();
         
               for (int i=0; i<files.length; i++)
               {
                 out.print("<option value=\""+files[i]+"\">"+files[i]+"</option>\r\n");
               }  
             %>
           </select>
           <input type="submit" name="Send" value="插入附加檔案">
           <input type="submit" name="Send" value="刪除附加檔案">
         </td>
       </tr>
       <%
     }  
   %>    
   <tr>
     <%
       int len = ((AffixFiles != null) && (AffixFiles.length > 0)) ? AffixFiles.length : 0;
     %>
     <td colspan="2">附加檔案：[<%=len%>]&nbsp&nbsp
     <%
       for (int i=0; i<len; i++)
       {
         String ref_path = "\\EBoard\\Files\\" + AffixFiles[i];
         out.print("<a href="+ref_path+">"+AffixFiles[i]+"</a>&nbsp&nbsp");
       }         
     %>
     </td>
   </tr>
   <tr>
     <%
       len = ((ReplyUsers != null) && (ReplyUsers.length > 0)) ? ReplyUsers.length : 0;
     %>   
     <td colspan="2">回應單位：[<%=len%>]<br>
     <%
       String msg = "";
       for (int i=0; i<len; i++)
       {
         String user = ReplyUsers[i][1];
         if (sUser.equals(user)) bReplied = true;  // 判斷使用者是否已經回應過了
         
         // 計算訊息內容可以分為幾個段落
         String content = ReplyUsers[i][2];
         String[] sPara = StringToParagraph(content);
         String sReplyMsg = "";
         for (int j=0; j<sPara.length; j++)
         {
           sReplyMsg += sPara[j];
           sReplyMsg += ((j == sPara.length-1) ? "" : "<br>&nbsp&nbsp&nbsp&nbsp");
         }
         
         String dtime = ReplyUsers[i][3];
         String ClickData = "OpenWindow('" + user + "','" + sReplyMsg + "','" + dtime + "')";
         outstr = "<a href=\"javascript:void[0]\" onMouseMove=\""+ClickData+"\" onMouseOut=\"CloseWin()\">"
                +  ReplyUsers[i][1] + "</a>&nbsp&nbsp\r\n";
         out.print(outstr);
       }
     %>
     </td>
   </tr>
  </table>
  <br>
  <%
    if (sDept.equals("行政室") || iRoleCode == 100 || iRoleCode == 1 )
    {
      out.print("<input type=\"submit\" name=\"Send\" value=\"更新公佈訊息內容\">&nbsp&nbsp");
      out.print("<input type=\"submit\" name=\"Send\" value=\"刪除本公告訊息\">");
    }  
    else
    {
      if (bReplied)
        out.print("<a href=\"MsgReply.jsp?SunDayCode="+sd_code+"\">我要修改回應</a>");
      else
        out.print("<a href=\"MsgReply.jsp?SunDayCode="+sd_code+"\">我要回應</a>");
    }
  %>
  </div>
  <hr>
  <center>
    <a href="MsgBoard.jsp">回公告系統首頁</a>&nbsp&nbsp<a href="Login.jsp">回登入頁面</a>
  </center>  
  
  
</form>


</body>

</html>
