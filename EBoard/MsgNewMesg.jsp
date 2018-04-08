<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01, MyDir2, java.util.*"%>

<%
  // 基本參數設定
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
  String strMySelf = "MsgNewMesg.jsp";
 
  String sUserName = (String)session.getAttribute("UserName");
  String sDepartment = (String)session.getAttribute("Department");
  String sRoleCode = (String)session.getAttribute("RoleCode");
  int iRoleCode = Integer.parseInt(sRoleCode);
%>

<%
  String sd_code = request.getParameter("SunDayCode");
  if (sd_code == null)
  {
    MsgBoard01 mb01 = new MsgBoard01(ini_file);
    mb01.OpenConnection();
    sd_code = mb01.getNewSunDayCode();
    mb01.CloseConnection();
  }
%>

<%
  //判斷程序為新增、刪除或修改
  String send = request.getParameter("Send");
  if (send != null && send.length()>0)
  {
    String title = request.getParameter("txtTitle");
    String content = request.getParameter("txtContent");
    if (send.equals("發佈新訊息"))
    {
      MsgBoard01 mb01 = new MsgBoard01(ini_file);
      mb01.OpenConnection();
      int result = mb01.NewMessage(title, content, sUserName);
      mb01.CloseConnection();
      if (result >0)
        out.print("發佈新訊息成功...");
      else  
        out.print("發佈新訊息失敗...");
      response.sendRedirect("MsgBoard.jsp");  
    }
  }
%>

<html>
<head>
  <title>發佈新訊息</title>
  <script type="text/javascript" language="javascript" src="window.js"></script>
</head>

<body>

<p>我是<font color="#0000FF">發佈新訊息</font>的頁面...</p>

<form name="frmNewMesg" method="post" action="<%=strMySelf%>">
  <input type="hidden" name="AffixFileName" value="">
  <div align="center">
    <table border="1">
      <tr>
        <td>太陽曆流水號：</td><td><%=sd_code%></td>
      </tr>
      <tr>
        <td>發佈人：</td><td><%=sUserName%></td>
      </tr>
      <%
        String strNow = new Date().toString();
      %>      
      <tr>
        <td>現在系統時間：</td><td><%=strNow%></td>
      </tr>
      <tr>
        <td>主旨：</td><td><input type="text" name="txtTitle" size="90"></td>
      </tr>
      <tr>
        <td valign="top">內容：</td>
        <td>
          <textarea name="txtContent" rows="16" cols="88"></textarea>
        </td>
      </tr>
      <tr align="center">
        <td colspan="2">
          <input type="submit" name="Send" value="發佈新訊息">&nbsp&nbsp
        </td>
      </tr>      
    </table>
  </div>
</form>

</body>

</html>
