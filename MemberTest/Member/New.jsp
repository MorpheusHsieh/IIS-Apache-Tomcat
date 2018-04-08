<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
  String rolecode = (String)session.getAttribute("RoleCode");
  if (workno != null && !(rolecode.equals("1") || rolecode.equals("2")))
    out.print("你已經用 " + workno + "的名稱登入過了，所以不可以註冊...");
  else
  {
%>
    <html>
    <head><title>申請新帳號</title></head>

    <Script Language="JavaScript">
    <!--
      function datacheck()
      {
    
        if (NewAccount.WorkNo.value=="")				// 判斷 '工作代號' 是否為空白
        {
          window.alert("工作代號不可以空白...");
          NewAccount.elements(0).focus();
        }  
        else if (NewAccount.Passwd.value=="")			// 判斷 '密碼' 是否為空白
        {
          window.alert("密碼不可以空白...");
          NewAccount.elements(1).focus();      
        }      
        else if (NewAccount.RePasswd.value != NewAccount.Passwd.value)	// 判斷 '確認密碼' 是否為空白
        {
          window.alert("確認密碼不相符...");
          NewAccount.elements(2).focus();      
        }  
        else
          NewAccount.submit();
      } 
    -->
    </Script>

    <body>
    <center><font face="標楷體">新帳號申請─請先填妥下列資料</font></center>
    <hr>

    <form action="../Member/New2.jsp" name="NewAccount" method="post">
     <table border="1" width="100%" height="124">
      <tr>
       <td width="31%" height="26"><font face="標楷體" color="#FF0000">工作代號：</font>
       </td>
       <td width="69%" height="26"><input type="text" name="WorkNo" size="20"></td>
      </tr>
      <tr>
       <td width="31%" height="20"><font face="標楷體" color="#FF0000">密碼：</font></td>
       <td width="69%" height="20"><input type="password" name="Passwd" size="20"></td>
      </tr>
      <tr>
       <td width="31%" height="20"><font face="標楷體" color="#FF0000">確認密碼：</font></td>
       <td width="69%" height="20"><input type="password" name="RePasswd" size="20"></td>
      </tr>
      <tr>
       <td align="center" width="31%" height="34">
        <p align="left"><font face="標楷體">問題：</font>
       </td>
       <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Question" size="50">
       </td>
      </tr>
      <tr>
       <td align="center" width="31%" height="34">
        <p align="left"><font face="標楷體">答案：</font></p>
       </td>
       <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Answer" size="50">
       </td>
      </tr>
      <tr>
       <td align="center" width="100%" height="34" colspan="2">
        <input type="button" value="我要註冊新帳號" onclick="datacheck()">
        <input type="reset">
       </td>
      </tr>
     </table>
    </form>  
    <hr>

    </body>
    </html>
<%
  }
%>    
