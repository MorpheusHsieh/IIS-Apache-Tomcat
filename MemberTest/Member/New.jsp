<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>

<%
  String workno = (String)session.getAttribute("WorkNo");
  String rolecode = (String)session.getAttribute("RoleCode");
  if (workno != null && !(rolecode.equals("1") || rolecode.equals("2")))
    out.print("�A�w�g�� " + workno + "���W�ٵn�J�L�F�A�ҥH���i�H���U...");
  else
  {
%>
    <html>
    <head><title>�ӽзs�b��</title></head>

    <Script Language="JavaScript">
    <!--
      function datacheck()
      {
    
        if (NewAccount.WorkNo.value=="")				// �P�_ '�u�@�N��' �O�_���ť�
        {
          window.alert("�u�@�N�����i�H�ť�...");
          NewAccount.elements(0).focus();
        }  
        else if (NewAccount.Passwd.value=="")			// �P�_ '�K�X' �O�_���ť�
        {
          window.alert("�K�X���i�H�ť�...");
          NewAccount.elements(1).focus();      
        }      
        else if (NewAccount.RePasswd.value != NewAccount.Passwd.value)	// �P�_ '�T�{�K�X' �O�_���ť�
        {
          window.alert("�T�{�K�X���۲�...");
          NewAccount.elements(2).focus();      
        }  
        else
          NewAccount.submit();
      } 
    -->
    </Script>

    <body>
    <center><font face="�з���">�s�b���ӽТw�Х��񧴤U�C���</font></center>
    <hr>

    <form action="../Member/New2.jsp" name="NewAccount" method="post">
     <table border="1" width="100%" height="124">
      <tr>
       <td width="31%" height="26"><font face="�з���" color="#FF0000">�u�@�N���G</font>
       </td>
       <td width="69%" height="26"><input type="text" name="WorkNo" size="20"></td>
      </tr>
      <tr>
       <td width="31%" height="20"><font face="�з���" color="#FF0000">�K�X�G</font></td>
       <td width="69%" height="20"><input type="password" name="Passwd" size="20"></td>
      </tr>
      <tr>
       <td width="31%" height="20"><font face="�з���" color="#FF0000">�T�{�K�X�G</font></td>
       <td width="69%" height="20"><input type="password" name="RePasswd" size="20"></td>
      </tr>
      <tr>
       <td align="center" width="31%" height="34">
        <p align="left"><font face="�з���">���D�G</font>
       </td>
       <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Question" size="50">
       </td>
      </tr>
      <tr>
       <td align="center" width="31%" height="34">
        <p align="left"><font face="�з���">���סG</font></p>
       </td>
       <td align="center" width="69%" height="34">
        <p align="left"><input type="text" name="Answer" size="50">
       </td>
      </tr>
      <tr>
       <td align="center" width="100%" height="34" colspan="2">
        <input type="button" value="�ڭn���U�s�b��" onclick="datacheck()">
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
