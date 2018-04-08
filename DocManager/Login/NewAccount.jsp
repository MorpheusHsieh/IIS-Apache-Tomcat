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
  if (send.equals("新建帳號"))
  {
    Account acnt = new Account(ini_file);
    int role_code = acnt.NewAccount(id, name, pswd);
    String role_name = acnt.RoleName();

    String strNewAcntState = "";
    switch(role_code)
    {
      case -2:
        strNewAcntState = "帳號重複...";
        break;
      case -1:
        strNewAcntState = "資料庫連線失敗...";
        break;
      case 0:
        strNewAcntState = "新增帳號失敗...";
        break;
      case 1:
        strNewAcntState = "帳號 " + id + "已經建立成功...";
        break;
      default:  
        strNewAcntState = ("發生程式設計人員預期之外的狀況, 請通知程式設計人員...");
    }
    out.print("<br>" + strNewAcntState + "<br>");
  }
  else if (send.equals("帳號查詢"))
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
        msgWin.document.write(id + " 帳號已經有人使用了...");
      //-->  
      </script> 
      <% 
    }
  }

%>

<body>

<form name="frmNewAcnt" method="post" action="NewAccount.jsp">

  <input type="hidden" name="BtnSend" value="">

  <p>我是<font color="#0000FF"><u>申請帳號</u></font>的網頁...</p>
  <p>　</p>
  
  <div align="center">
  <table border="1">
    <tr>
      <td>帳號</td>
      <td><input type="text" name="txtID" value="<%=id%>" size="12"></td>
      <td><input type="button" name="button2" value="查詢" onClick="CheckAcnt()"></td>
    </tr>
    <tr>
      <td>密碼</td>
      <td colspan="2"><input type="password" name="txtPswd" size="12"></td>
    </tr>
    <tr>
      <td>密碼再確認</td>
      <td colspan="2"><input type="password" name="txtRePswd" size="12"></td>
    </tr>
    <tr>
      <td>姓名</td>
      <td colspan="2"><input type="text" name="txtName" value="<%=name%>" size="12"></td>
    </tr>
    <tr>
      <td>單位</td>
      <td colspan="2">
        <select name="selDept">
          <option value="2070000" selected></option>
          <option value="處辦室">處辦室</option>
          <option value="資管室">資管室</option>
        </select>
      </td>
    </tr>
  </table>
  <p />
  <input type="button" name="button1" value="我要申請帳號" onClick="DataCheck()">
  </div>

</form>

</body>

</html>