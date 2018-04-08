<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Account"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "NewAccount.jsp";
  Account clsAcnt = new Account();
  
  String strSend = request.getParameter("BtnSend");
  String strName = request.getParameter("txtName");
  String strPswd = request.getParameter("txtPswd");
  String strUnit = request.getParameter("selUnit");
  String strRole = request.getParameter("selRole");
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="../Utility/Window.js"></script>
  <script type="text/javascript" language="javascript" src="NewAccount.js"></script>
  </script>  
  <title>�s�W�b��</title>
</head>

<body>

<form name="frmNewAcnt" method="post" action="<%=strMySelf%>">

  <p>�ڬO<font color="#0000FF">�s�W�b��</font>������...</p>

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <%
    if (strSend != null && strSend.equals("�s�W�b��"))
    {
      if (isDebug) out.print("�z��ܤF�s�W�b���\��...");
  
      int role_code = clsAcnt.NewAccount(strName, strPswd, strUnit, strRole);

      String strNewAcntState = "";
      switch(role_code)
      {
        case -2:
          strNewAcntState = "�b������...";
          break;
        case -1:
          strNewAcntState = "��Ʈw�s�u����...";
          break;
        case 0:
          strNewAcntState = "�s�W�b������...";
          break;
        case 1:
        case 8:
          strNewAcntState = "�b���u" + strName + "�v�w�g�إߦ��\...";

          // �N�b����T�g�J session
          session.setAttribute("UserName", strName);
          session.setAttribute("UnitName", strUnit);
          session.setAttribute("RoleName", strRole);
          %>
          <Script type="text/javascript" language="JavaScript">
           <!--
             parent.frames[0].document.location.reload();
           //-->  
           </Script>
           </p>
           <div align="center">
             <a href="AcntManager.jsp">�^�b���޲z����</a>
           </div>  
          <%
          break;
        default:  
          strNewAcntState = ("�o�͵{���]�p�H���w�����~�����p, �гq���{���]�p�H��...");
      }
      out.print("<br>" + strNewAcntState + "<br>");
    }
    else if (strSend != null && strSend.equals("�b���d��"))
    {
      if (isDebug) out.print("�z��ܤF�b���d�ߥ\��...");
      
      boolean isExist = clsAcnt.exists(strName);
  
      String strExist = null;
      if (isExist)
        strExist = "<font color=blue>" + strName + "</font>" + " �w�g���H�ϥΤF...";
      else  
        strExist = "<font color=blue>" + strName + "</font>" +" �٨S���H�ϥ�...";
    
      out.print("<input type=\"hidden\" name=\"txtExist\" value=\"" + strExist + "\">");
      %>
      <script Language="JavaScript">
      <!--
        PopupWindow(240, 100, "no", "no", "no", "yes");
        msgWin.document.write("<html><head><title>�b���d�ߵ��G</title></head>");
        msgWin.document.write(document.frmNewAcnt.txtExist.value);
      //-->
      </Script>
      
      <!-- ��ܷs�W�b���һݭn�����... .//-->
      <%@include file="../Account/NewAccount_frm.htm"%>
      <%
    } 
    else 
    {
      %>
      <!-- ��ܷs�W�b���һݭn�����... .//-->
      <%@include file="../Account/NewAccount_frm.htm"%>
      <%
    }
    %>

</form>

</body>

</html>