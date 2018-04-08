<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Account01"%>

<%
  String ini_file = request.getRealPath("./") + "Account01.ini";
//  out.print("組態設定檔位於 " + ini_file + "<br>"); 

  String workno = request.getParameter("WorkNo");
  String passwd = request.getParameter("Password");
  if (workno == null || passwd == null)
    out.print("密碼或帳號其中有一個是空白...");
  
  Account01 ac = new Account01(ini_file);
  int result = ac.CheckPassword(workno, passwd);  // 密碼驗證

  int nRoleCode = -1;
  String strCheckLogin = null;  
  switch(result)
  {
    case -1:
      strCheckLogin = "無此帳號？嗚~~認證失敗！";
      break;
    case  0:
      strCheckLogin = "密碼錯誤？嗚~~認證失敗！";
      break;
    case  1:
      strCheckLogin = "密碼正確";
      nRoleCode = ac.RoleCode(workno);  // 取出角色權限
      session.setAttribute("WorkNo", workno);                       // 將帳號存到 session 物件中
      session.setAttribute("RoleCode", String.valueOf(nRoleCode));  // 將角色權限存到 session 物件中
      break;
    default:
      out.print("發生預期之外的狀況...");
  }
  ac.CloseConnection();  
%>


<html>
<head><title>會員登入檢查程式</title></head>
<body>

<Script Language="javascript">
<!--
  function CloseWin()
  {
    window.close();
  }
-->
</script>


<%
  if (result > 0)
  {
%>
    <Script Language="JavaScript">
      window.close();
      window.opener.document.location.reload();
    </Script>
<%
  }
  else
  {
%>
    <center>
     <table border="0" cellpadding="5" class="error">
      <tr> 
       <td>
        <fieldset style="width:260">
         <legend class="title"><%=strCheckLogin%></legend>
          <ol>
           <li>我還沒完成註冊，我要<a href="Member/new.jsp" target="main" onclick="CloseWin()">註冊</a>
           <li>真是的！<a href="ForgetPasswd.htm" target="main" onclick="CloseWin()">我忘了密碼</a>
           <li>喔ㄛ～按太快了，<a href="#" onClick='window.history.back()' >回上頁</a>
          </ol>
        </fieldset>
       </td>
      </tr>
     </table>
    </center>
<%
  }
%>
     
</body>
</html>







