<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01, java.util.*"%>
<%@include file="MsgReply.inc"%>

<%
  // �򥻳]�w
  String strMySelf = "MsgReply.jsp";
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";

  // �x�s�� Session ������ϥΪ̪��T��
  String sUserName = (String)session.getAttribute("UserName");
  String sDept = (String)session.getAttribute("Department");  
  String sRoleCode = (String)session.getAttribute("RoleCode");
  int iRoleCode = Integer.parseInt(sRoleCode);

//  out.print("�ϥΪ̦W�١G"+UserName+"<br>");
//  out.print("�����W�١G"+sDept+"<br>");
//  out.print("�v���N���G"+iRoleCode+"<br>");
%>

<%
  String sd_code = request.getParameter("SunDayCode");  // �^���T�����Ӷ���s��
  String sReplyContent = "";                            // �x�s�^���T��
  
  // ���P�_�O�_�w�g�^��
  MsgBoard01 mb01 = new MsgBoard01(ini_file);
  mb01.OpenConnection();
  boolean replied = mb01.getReplyStatus(sd_code, sUserName);
  mb01.CloseConnection();


  //�P�_�{�Ǭ��s�W�B�R���έק�
  String send = request.getParameter("Send");
  if (send != null && send.length()>0)
  {
    String user = request.getParameter("txtRP_UserName");
    String content = request.getParameter("txtRP_Content");
    out.print("Send: " + send + "<br>");
    if (send.equals("�s�@�@�W"))
    {
      int result = AddNewReplyMessage(ini_file, sd_code, user, content);
    }  
    else if (send.equals("�ס@�@��"))
    {
      mb01.OpenConnection();
      int result = mb01.UpdateReplyContent(sd_code, sUserName, content);
      mb01.CloseConnection();
    }
    else if (send.equals("�R���^��"))
    {
      mb01.OpenConnection();
      int result = mb01.DeleteReplyContent(sd_code, sUserName);
      mb01.CloseConnection();    
    }    
    response.sendRedirect("MsgBoard.jsp");
  }  

  if (replied)
  {
    mb01.OpenConnection();
    sReplyContent = mb01.getReplyContent(sd_code, sUserName);
    mb01.CloseConnection();
  }
%>

<html>

<head>
  <title>�U���^���T��</title>
</head>

<body>

<p>�ڬO<font color="#0000FF">�U���^���T��</font>������...</p>

<form name="frmMsgReply" method="post" action="<%=strMySelf%>">
  <input type="hidden" name="SunDayCode" value="<%=sd_code%>">
  
  <div align="center">
  <table border="1">
    <tr>
      <td valign="middle" align="left">�^���H���G</td>
      <td valign="middle" align="left"><%=sUserName%></td>
     </tr>
     <tr>
     <%
       String strNow = new Date().toString();
     %>
     <td valign="middle" align="left">�^���ɶ��G</td>
     <td><%=strNow%></td>
    </tr>   
    <tr>
      <td valign="top" align="left">�^�����e�G</td>
      <td valign="top" align="left"><textarea name="txtRP_Content" rows="15" cols="90"><%=sReplyContent%></textarea></td>
    </tr>
  </table><br>
  <input type="hidden" name="txtRP_UserName" value="<%=sUserName%>">
  <%                        
    if (replied)
      out.print("<input type=\"submit\" name=\"Send\" value=\"�ס@�@��\">&nbsp;&nbsp");
    else
      out.print("<input type=\"submit\" name=\"Send\" value=\"�s�@�@�W\">&nbsp;&nbsp");
  %>    
  <input type="submit" name="Send" value="�R���^��">      
  </div>
</form>  

</body>
</html>
