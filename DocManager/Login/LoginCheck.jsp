<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="myJava.dx.Database.*"%>
<%@page import="DocManager.login.Account"%>


<%
  String ini_file = new String(request.getRealPath("/") + "DocManager\\config.ini");

  String send = request.getParameter("BtnSend");
  String id = request.getParameter("txtID").toUpperCase();
  String pswd = request.getParameter("txtPswd");
  String name = "";
  String role_name = "";
  
  Account acnt = new Account(ini_file);
  
  String strLoginState = "";
  int login_state = acnt.CheckPassword(id, pswd);
  switch(login_state)
  {
    case -2:
      strLoginState = (id + " ���b���ä��s�b, �Э��s�n�J...");
      break;
    case -1:  
      strLoginState = ("�K�X���~, �Э��s�n�J...");
      break;
    case 1:
    case 2:  
    case 7:  
    case 8:  
    case 9:  
      name = acnt.Name();
      role_name = acnt.RoleName();

      // �N�ӤH��T�g�J session
      session.setAttribute("ID", id);
      session.setAttribute("UserName", name);
      session.setAttribute("RoleCode", Integer.toString(login_state));

      if (login_state == 8)
        strLoginState = ("�w�� " + name + " �i�J���t��, �z�{�b���v���O " + role_name + ".");
      else if (login_state == 9)
        strLoginState = ("�w�� " + name + " �i�J���t��, �Ь��B��Ƕ}�ұz���v��...");
      break;
    default:  
      strLoginState = ("�o�͵{���]�p�H���w�����~�����p, �гq���{���]�p�H��...");
  }
  out.print(strLoginState + "<br>");
%>

<html>
<head>
  <title>�ڬO�b���ˬd������</title>
  <Script type="text/javascript" language="JavaScript">
  <!--
    parent.frames[0].document.location.reload();
  //-->  
  </Script>
</head>
<body>
</body>
</html>