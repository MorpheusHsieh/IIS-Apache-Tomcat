<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01, java.util.*"%>
<%@include file="MsgReply.inc"%>

<%
  // 基本設定
  String strMySelf = "MsgReply.jsp";
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";

  // 儲存於 Session 中關於使用者的訊息
  String sUserName = (String)session.getAttribute("UserName");
  String sDept = (String)session.getAttribute("Department");  
  String sRoleCode = (String)session.getAttribute("RoleCode");
  int iRoleCode = Integer.parseInt(sRoleCode);

//  out.print("使用者名稱："+UserName+"<br>");
//  out.print("部門名稱："+sDept+"<br>");
//  out.print("權限代號："+iRoleCode+"<br>");
%>

<%
  String sd_code = request.getParameter("SunDayCode");  // 回應訊息的太陽曆編號
  String sReplyContent = "";                            // 儲存回應訊息
  
  // 先判斷是否已經回應
  MsgBoard01 mb01 = new MsgBoard01(ini_file);
  mb01.OpenConnection();
  boolean replied = mb01.getReplyStatus(sd_code, sUserName);
  mb01.CloseConnection();


  //判斷程序為新增、刪除或修改
  String send = request.getParameter("Send");
  if (send != null && send.length()>0)
  {
    String user = request.getParameter("txtRP_UserName");
    String content = request.getParameter("txtRP_Content");
    out.print("Send: " + send + "<br>");
    if (send.equals("新　　增"))
    {
      int result = AddNewReplyMessage(ini_file, sd_code, user, content);
    }  
    else if (send.equals("修　　改"))
    {
      mb01.OpenConnection();
      int result = mb01.UpdateReplyContent(sd_code, sUserName, content);
      mb01.CloseConnection();
    }
    else if (send.equals("刪除回應"))
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
  <title>各單位回應訊息</title>
</head>

<body>

<p>我是<font color="#0000FF">各單位回應訊息</font>的頁面...</p>

<form name="frmMsgReply" method="post" action="<%=strMySelf%>">
  <input type="hidden" name="SunDayCode" value="<%=sd_code%>">
  
  <div align="center">
  <table border="1">
    <tr>
      <td valign="middle" align="left">回應人員：</td>
      <td valign="middle" align="left"><%=sUserName%></td>
     </tr>
     <tr>
     <%
       String strNow = new Date().toString();
     %>
     <td valign="middle" align="left">回應時間：</td>
     <td><%=strNow%></td>
    </tr>   
    <tr>
      <td valign="top" align="left">回應內容：</td>
      <td valign="top" align="left"><textarea name="txtRP_Content" rows="15" cols="90"><%=sReplyContent%></textarea></td>
    </tr>
  </table><br>
  <input type="hidden" name="txtRP_UserName" value="<%=sUserName%>">
  <%                        
    if (replied)
      out.print("<input type=\"submit\" name=\"Send\" value=\"修　　改\">&nbsp;&nbsp");
    else
      out.print("<input type=\"submit\" name=\"Send\" value=\"新　　增\">&nbsp;&nbsp");
  %>    
  <input type="submit" name="Send" value="刪除回應">      
  </div>
</form>  

</body>
</html>
