<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="java.util.Date"%>

<html>

<head><title>�D�\����</title></head>

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
      <font size="1">�n�J</font>
      </a>
    </td>
    <td width="12%" align="center">
      <a href="Member/New.htm" target="main">
      <font size="1">�|�����U</font>
      </a>
    </td>
    <td width="12%" align="center">
      <a href="Manager/Menu.jsp" target="main">
      <font size="1">�޲z����</font>
      </a>
    </td>
    <td width="12%" align="center">
      <font size="1">�|���C��</font>
    </td>
    <td width="12%" align="center">
      <font size="1">�����j�M</font>
    </td>
    <td width="13%" align="center">
      <font size="1">�`�����D</font>
    </td>
    <td width="13%" align="center">
      <a href="ResetSession.jsp" target="header">
      <font size="1">�n�X�׾�</font>
      </a>
    </td>
    <td width="13%" align="center">
      <font size="1"><a href="Title.htm" target="main">�^�D�D��</a></font>
    </td>
   </tr>
   <tr height="40">
    <td colspan="5">
      <font size="1" face="�з���">
      </font>
    </td>
    <td colspan="3" align="right">
      <font size="1" face="�з���">
      <%
        String msg = null;
        String workno = (String)session.getAttribute("WorkNo");

        if (workno == null)
          msg = "�z�|���n�J������...<br>";
        else
        {
          msg = "�w�� <font color='blue'>" + workno + "</font> �Y�{����<br>";
          msg += "�z�����W���ɶ���";
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
