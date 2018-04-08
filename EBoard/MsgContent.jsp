<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01, MyDir2"%>
<%@include file="MsgContent.inc"%>

<%
  // �򥻳]�w
  String strMySelf = "MsgContent.jsp";
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";

  // �x�s�� Session ������ϥΪ̪��T��
  String sUser = (String)session.getAttribute("UserName");
  String sDept = (String)session.getAttribute("Department");  
  String sRoleCode = (String)session.getAttribute("RoleCode");
  int iRoleCode = Integer.parseInt(sRoleCode);
  boolean bReplied = false;
%>

<%
  String sd_code = request.getParameter("SunDayCode");
  //out.print("�Ǹ��G" + sundaycode);

  // �y�{�P�_
  String send = request.getParameter("Send");
  if (send != null && send.length()>0)
  {
    String strTitle = request.getParameter("txtTitle");
    String strContent = request.getParameter("txtContent");
    if (send.equals("��s���G�T�����e"))
    {
      int result = MsgEditor(ini_file, sd_code, strTitle, strContent);
      response.sendRedirect("MsgBoard.jsp");      
    }
    else if (send.equals("�R�������i�T��"))
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
      if (send.equals("���J���[�ɮ�"))
      {
        //out.print("�A��ܤF���J���[�ɮ�("+filename + ")...");
        
        MsgBoard01 mb01 = new MsgBoard01(ini_file);
        mb01.OpenConnection();
        mb01.AddAffixFile(sd_code, filename);
        mb01.CloseConnection();
      }
      else if (send.equals("�R�����[�ɮ�"))
      {
        //out.print("�A��ܤF�R�����[�ɮ�("+filename + ")...");    

        MsgBoard01 mb01 = new MsgBoard01(ini_file); 
        mb01.OpenConnection();
        mb01.DeleteAffixFile(sd_code, filename);
        mb01.CloseConnection();        
      }
    }
  }

  // �����B�z�{��
  MsgBoard01 mb01 = new MsgBoard01(ini_file);
  mb01.OpenConnection();
  String[] data = mb01.QuerySingleMessage(sd_code);
  String[][] ReplyUsers = mb01.getReplyUser();
  String[] AffixFiles = mb01.getAffixFileList();
  mb01.CloseConnection();  
%>

<html>
<head>
  <title>�ڬO�i�ܰT�����e������</title>
  <script type="text/javascript" language="javascript" src="MsgContent.js"></script>
</head>

<body>

<p>�ڬO<font color="#0000FF">�i�ܰT�����e</font>������...</p>


<form name="frmMsgContent" method="post" action="<%=strMySelf%>">
  <input type="hidden" name="SunDayCode" value="<%=data[0]%>">
  <div align="center">
  <table border="1">
   <tr>
     <td colspan="2" valign="middle">�s���G<%=data[0]%></td>
   </tr>
   <tr>
     <td colspan="2" valign="middle">�ϥΪ̡G<%=sUser%></td>
   </tr>
   <tr>
     <%
       String strTitle = ((data[1] == null) ? "���D�ť�..." : data[1].trim());        // ��Ʀ�m�MSQL�d�ߩR�O����...
       
       // ���v���M�w�O�_�i���ʼ��D,�i���ʮɨϥ� text, ���i���ʮɨϥ� label 
       String outstr = "";
       if (sDept.equals("��F��") || (iRoleCode == 1))
         outstr = "<input type=\"text\" name=\"txtTitle\" value=\""+strTitle+"\" size=\"90\">";
       else
         outstr = strTitle;       
     %>   
     <td colspan="2" valign="middle">�D���G<%=outstr%></td>
   </tr>
   <tr valign="top">
     <%
       String strContent = ((data[2] == null) ? "�|���o���e..." : data[2].trim()); // ��Ʀ�m�MSQL�d�ߩR�O����...
     %>
     <td valign="top">���e�G</td>
     <%
       if (sDept.equals("��F��") || (iRoleCode == 1))
         outstr = "<textarea name=\"txtContent\" rows=\"16\" cols=\"88\">"+strContent+"</textarea>";
       else
         outstr = strContent;
     %>    
     <td valign="top" width="640" height="240"><%=outstr%></td>
   </tr>   
   <%
     if (sDept.equals("��F��") || iRoleCode == 1)
     {
       %>
       <tr>
         <td valign="top">��ܪ��[�ɮסG</td>
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
           <input type="submit" name="Send" value="���J���[�ɮ�">
           <input type="submit" name="Send" value="�R�����[�ɮ�">
         </td>
       </tr>
       <%
     }  
   %>    
   <tr>
     <%
       int len = ((AffixFiles != null) && (AffixFiles.length > 0)) ? AffixFiles.length : 0;
     %>
     <td colspan="2">���[�ɮסG[<%=len%>]&nbsp&nbsp
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
     <td colspan="2">�^�����G[<%=len%>]<br>
     <%
       String msg = "";
       for (int i=0; i<len; i++)
       {
         String user = ReplyUsers[i][1];
         if (sUser.equals(user)) bReplied = true;  // �P�_�ϥΪ̬O�_�w�g�^���L�F
         
         // �p��T�����e�i�H�����X�Ӭq��
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
    if (sDept.equals("��F��") || iRoleCode == 100 || iRoleCode == 1 )
    {
      out.print("<input type=\"submit\" name=\"Send\" value=\"��s���G�T�����e\">&nbsp&nbsp");
      out.print("<input type=\"submit\" name=\"Send\" value=\"�R�������i�T��\">");
    }  
    else
    {
      if (bReplied)
        out.print("<a href=\"MsgReply.jsp?SunDayCode="+sd_code+"\">�ڭn�ק�^��</a>");
      else
        out.print("<a href=\"MsgReply.jsp?SunDayCode="+sd_code+"\">�ڭn�^��</a>");
    }
  %>
  </div>
  <hr>
  <center>
    <a href="MsgBoard.jsp">�^���i�t�έ���</a>&nbsp&nbsp<a href="Login.jsp">�^�n�J����</a>
  </center>  
  
  
</form>


</body>

</html>
