<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="myJava.dx.Database.*"%>
<%@page import="DocManager.login.Account"%>
<%@page import="java.io.File"%>

<%
  String ini_file = new String(request.getRealPath("/") + "DocManager\\config.ini");
  File f = new File(ini_file);
//  out.print("ini file:" + ini_file + " is " + f.exists() + "<br>");

  String send = request.getParameter("BtnSend");
  String id =  request.getParameter("txtID");
  String pswd =  request.getParameter("txtPswd");
  String name =  request.getParameter("txtName");
  String dept =  request.getParameter("selDept");
%>

<html>

<head>
  <title>NewAccount.jsp</title>
  <script type="text/javascript" language="javascript" src="/DocManager/Utility/Window.js"></script>  
  <Script type="text/javascript" language="javascript">
  <!--
    function getID()
    {
      retuen document.frmNewAcnt.txtID.value;
    }
  //-->
  </script>  
</head>

<%
  if (send.equals("�s�رb��"))
  {
    Account acnt = new Account(ini_file);
    int role_code = acnt.NewAccount(id, name, pswd);
    String role_name = acnt.RoleName();

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
        strNewAcntState = "�b�� " + id + "�w�g�إߦ��\...";
        break;
      default:  
        strNewAcntState = ("�o�͵{���]�p�H���w�����~�����p, �гq���{���]�p�H��...");
    }
    out.print("<br>" + strNewAcntState + "<br>");
  }
  else if (send.equals("�b���d��"))
  {
    Account acnt = new Account(ini_file);
    boolean isExist = acnt.exists(id);
    if (isExist)
    {
      %>
      <Script language="javascript">
      <!--
        var width = 360;
        var height = 240;
        var id = getID();
        PopupEmptyWin(width, height);
        msgWin.document.write(id + " �b���w�g���H�ϥΤF...");
      //-->  
      </script> 
      <% 
    }
  }

%>

<body>

<form name="frmNewAcnt" method="post" action="NewAccount.jsp">

  <input type="hidden" name="BtnSend" value="">

  <p>�ڬO<font color="#0000FF"><u>�ӽбb��</u></font>������...</p>
  <p>�@</p>
  
  <div align="center">
  <table border="1">
    <tr>
      <td>�b��</td>
      <td><input type="text" name="txtID" value="<%=id%>" size="12"></td>
      <td><input type="button" name="button2" value="�d��" onClick="CheckAcnt()"></td>
    </tr>
    <tr>
      <td>�K�X</td>
      <td colspan="2"><input type="password" name="txtPswd" size="12"></td>
    </tr>
    <tr>
      <td>�K�X�A�T�{</td>
      <td colspan="2"><input type="password" name="txtRePswd" size="12"></td>
    </tr>
    <tr>
      <td>�m�W</td>
      <td colspan="2"><input type="text" name="txtName" value="<%=name%>" size="12"></td>
    </tr>
    <tr>
      <td>���</td>
      <td colspan="2">
        <select name="selDept">
          <option value="2070000" selected></option>
          <option value="�B���">�B���</option>
          <option value="��ޫ�">��ޫ�</option>
        </select>
      </td>
    </tr>
  </table>
  <p />
  <input type="button" name="button1" value="�ڭn�ӽбb��" onClick="DataCheck()">
  </div>

</form>

</body>

</html>