<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01, java.util.*"%>

<%
  // �򥻰ѼƳ]�w
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
  String strMySelf = "MsgNewMessage.jsp";
 
  String sUserName = (String)session.getAttribute("UserName");
  String sDepartment = (String)session.getAttribute("Department");
  String sRoleCode = (String)session.getAttribute("RoleCode");
  int iRoleCode = Integer.parseInt(sRoleCode);
%>

<%
  //�P�_�{�Ǭ��s�W�B�R���έק�
  String send = request.getParameter("Send");
  if (send != null && send.length()>0)
  {
    String title = request.getParameter("txtTitle");
    String content = request.getParameter("txtContent");
    if (send.equals("�o�G�s�T��"))
    {
      MsgBoard01 mb01 = new MsgBoard01(ini_file);
      mb01.OpenConnection();
      int result = mb01.NewMessage(title, content, sUserName);
      mb01.CloseConnection();
      if (result >0)
        out.print("�o�G�s�T�����\...");
      else  
        out.print("�o�G�s�T������...");
      response.sendRedirect("MsgBoard.jsp");  
    }  
  }
%>

<%
  MsgBoard01 mb01 = new MsgBoard01(ini_file);
  mb01.OpenConnection();
  String sd_code = mb01.getNewSunDayCode();
  mb01.CloseConnection();
%>

<html>
<head>
  <title>�o�G�s�T��</title>
</head>

<body>

<p>�ڬO<font color="#0000FF">�o�G�s�T��</font>������...</p>

<form name="frmNewMesg" method="post" action="MsgNewMessage.jsp">
  <div align="center">
    <table border="1">
      <tr>
        <td>�Ӷ���y�����G</td><td><%=sd_code%></td>
      </tr>
      <tr>
        <td>�o�G�H�G</td><td><%=sUserName%></td>
      </tr>
      <%
        String strNow = new Date().toString();
      %>      
      <tr>
        <td>�{�b�t�ήɶ��G</td><td><%=strNow%></td>
      </tr>
      <tr>
        <td>�D���G</td><td><input type="text" name="txtTitle" size="90"></td>
      </tr>
      <tr>
        <td valign="top">���e�G</td>
        <td>
          <textarea name="txtContent" rows="16" cols="88"></textarea>
        </td>
      </tr>
      <tr align="center">
        <td colspan="2">
          <input type="submit" name="Send" value="�o�G�s�T��">&nbsp&nbsp
          <input type="submit" name="Send" value="���J���[�ɮ�">
        </td>
      </tr>      
    </table>
  </div>
</form>

</body>

</html>