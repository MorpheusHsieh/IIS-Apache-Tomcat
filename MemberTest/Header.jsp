<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="java.util.Date"%>

<html>

<head><title>主功能選單</title></head>

<Script Language="javascript">
<!--
  function OpenWin()
  {
    myWin = window.open("","NewWin",
            "width=480,height=240,toolbar=no,menubar=no,left=100,top=100,resizable=yes");
    myWin.location.href = "login.jsp";        
  }
  
  function CloseWin()
  {
    window.close();
  }
-->
</script>

<body topmargin="0">

<form name="MenuBar">
  <table border="1" width="100%" cellspacing="0" cellpadding="0">
   <tr>
    <td width="12%" align="center">
      <a href="javascript:void[0]" onclick="OpenWin()">
      <font size="1">登入</font>
      </a>
    </td>
    <td width="12%" align="center">
      <a href="Member/New.htm" target="main">
      <font size="1">會員註冊</font>
      </a>
    </td>
    <td width="12%" align="center">
      <a href="Manager/Menu.jsp" target="main">
      <font size="1">管理中心</font>
      </a>
    </td>
    <td width="12%" align="center">
      <font size="1">會員列表</font>
    </td>
    <td width="12%" align="center">
      <font size="1">網站搜尋</font>
    </td>
    <td width="13%" align="center">
      <font size="1">常見問題</font>
    </td>
    <td width="13%" align="center">
      <a href="ResetSession.jsp" target="header">
      <font size="1">登出論壇</font>
      </a>
    </td>
    <td width="13%" align="center">
      <font size="1"><a href="Title.htm" target="main">回主題頁</a></font>
    </td>
   </tr>
   <tr height="40">
    <td colspan="5">
      <font size="1" face="標楷體">
      </font>
    </td>
    <td colspan="3" align="right">
      <font size="1" face="標楷體">
      <%
        String msg = null;
        String workno = (String)session.getAttribute("WorkNo");

        if (workno == null)
          msg = "您尚未登入本網站...<br>";
        else
        {
          msg = "歡迎 <font color='blue'>" + workno + "</font> 蒞臨本站<br>";
          msg += "您此次上站時間為";
          msg += "<font color=blue>";
          msg +=   new Date(session.getCreationTime());
          msg += "</font>";
        }  
        out.print(msg);  
      %>
      </font>
    </td>  
   </tr>   
  </table>
</form>

</body>

</html>
