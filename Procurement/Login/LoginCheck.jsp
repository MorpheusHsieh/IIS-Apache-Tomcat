<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Account"%>

<!-- �إ߷s����  //-->
<%
  Account acnt = new Account();
%>

<!-- �q�e�@�����o���Ѽ�  -->
<%
  String send = request.getParameter("BtnSend");
  String strName = request.getParameter("txtName");
  String strPswd = request.getParameter("txtPswd");
%>

<%  
  String strLoginState = "";
  int login_state = acnt.CheckPassword(strName, strPswd);
  switch(login_state)
  {
    case -2:
    case -1:  
      strLoginState = ("�z�ҿ�J���b���P�K�X�L�k����...");
      break;
    case 1:
    case 8:  
    case 9:  
      String sName = acnt.getName();
      String sRoleName = acnt.getRoleName();
      String sUnitName = acnt.getUnitName();

      // �N�ӤH��T�g�J session
      session.setAttribute("UserName", sName);
      session.setAttribute("UnitName", sUnitName);
      session.setAttribute("RoleName", sRoleName);

      strLoginState = ("�w�� " + sName + " �ϥΥ��t��, �z�������O " + sRoleName + ", ���ݩ� " + sUnitName +  ".");
      break;
    default:  
      strLoginState = ("�o�͵{���]�p�H���w�����~�����p, �гq���{���]�p�H��...");
  }
  out.print(strLoginState);
  
%>

<html>
<head>
  <title>�ڬO�b���ˬd������</title>
  <meta http-equiv="Content-Language" content="zh-tw">
  <Script type="text/javascript" language="JavaScript">
  <!--
    parent.frames[0].document.location.reload();
  //-->  
  </Script>
</head>
<body>

</body>
</html>