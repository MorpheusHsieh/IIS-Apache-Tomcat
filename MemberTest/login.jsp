<html>

<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>會員登入</title>
</head>

<Script Language="JavaScript">
<!--
  function datacheck()
  {
    // 判斷帳號是否為空白
    if (frmLogin.WorkNo.value=="")
    {
      window.alert("您必須完成暱稱的輸入");
      //顯示錯誤訊息
      document.frmLogin.element(0).focus();
      return;
    }

    // 判斷是否已經輸入密碼
    if (frmLogin.Password.value == "")
    {
      window.alert("您必須完成輸入密碼的輸入!!");
      document.frmLogin.element(1).focus();
      return;
    }    
      
    frmLogin.submit();
 }
-->
</Script>

<body>

  <form method="post" name="frmLogin" action="login2.jsp">
  
    <p>我是帳號登入頁面...</p>
  
    <table border="1" align="center">
      <tr>
        <td align="left"><font face="標楷體" color="#FF0000">工作代號：</font>
        </td>
        <td align="left"><input type="text" name="WorkNo" size="20"></td>
      </tr>
      <tr>
        <td align="left"><font face="標楷體" color="#FF0000">密　　碼：</font></td>
        <td align="left"><input type="password" name="Password" size="20"></td>
      </tr>
      <tr>
        <td align="left" width="100%" height="34" colspan="2">
          <p align="center">
          <input type="submit" name="Send" value="登　入" onclick="datacheck()">
          </p>
        </td>
      </tr>
    </table>

  </form>  

</body>

</html>
