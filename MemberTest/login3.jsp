<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>

<%
  String ini_file = request.getRealPath("./") + "Account01.ini";
//  out.print("�պA�]�w�ɦ�� " + ini_file + "<br>"); 

  String workno = request.getParameter("WorkNo");
  String passwd = request.getParameter("Password");
  if (workno == null || passwd == null)
    out.print("�K�X�αb���䤤���@�ӬO�ť�...");
  
  Account01 ac = new Account01(ini_file);
  int result = ac.CheckPassword(workno, passwd);  // �K�X����

  int nRoleCode = -1;
  String strCheckLogin = null;  
  switch(result)
  {
    case -1:
      strCheckLogin = "�L���b���H��~~�{�ҥ��ѡI";
      break;
    case  0:
      strCheckLogin = "�K�X���~�H��~~�{�ҥ��ѡI";
      break;
    case  1:
      strCheckLogin = "�K�X���T";
      nRoleCode = ac.RoleCode(workno);  // ���X�����v��
      session.setAttribute("WorkNo", workno);                       // �N�b���s�� session ����
      session.setAttribute("RoleCode", String.valueOf(nRoleCode));  // �N�����v���s�� session ����
      break;
    default:
      out.print("�o�͹w�����~�����p...");
  }
  ac.CloseConnection();  
%>


<html>
<head><title>�|���n�J�ˬd�{��</title></head>
<body>

<center>
  <table border="0" cellpadding="5" class="error">
    <tr> 
      <td>
      <fieldset style="width:260">
      <legend class="title"><%=strCheckLogin%></legend>
        <ol>
          <li>���٨S�������U�A�ڭn <a href="Member/register.htm">���U</a>
          <li>�u�O���I<a href=".htm">�ڧѤF�K�X</a>
          <li>�ᣬ����ӧ֤F�A<a href="#" onClick='window.history.back()' >�^�W��</a>
        </ol>
      </fieldset>
      </td>
    </tr>
  </table>
</center>
     
<Script Language="JavaScript">
  //document.write("Self: " + self.name+"<br>");
  //win_opener = window.opener;
  //document.write("Opener: " + win_opener.name+"<br>");

  window.close();
  window.opener.document.location.reload();
</Script>

</body>
</html>







