<%@page language="Java"%>
<%@page contentType="text/html;charset=big5"%>
<%@page import="Procurement.Account"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "EditAccount.jsp";
  Account clsAcnt = new Account();

  String strSend= "", strName="", strPswd ="", strUnit="", strRole="";

  request.setCharacterEncoding("big5");
  strSend = (String)request.getAttribute("BtnSend");
  if (strSend != null && strSend.equals("�ק�b��"))
  {
    strName = (String)request.getAttribute("txtName");
    strPswd = (String)request.getAttribute("txtPswd");;
    strUnit = (String)request.getAttribute("selUnit");
    strRole = (String)request.getAttribute("selRole");
  } else {
    strSend = (String)request.getParameter("BtnSend");
    strName = (String)request.getParameter("txtName");
    strPswd = (String)request.getParameter("txtPswd");;
    strUnit = (String)request.getParameter("selUnit");
    strRole = (String)request.getParameter("selRole");
  }

  if (isDebug)
  {
    out.print("Send: " + strSend + "<br>");
    out.print("Name: " + strName + "<br>");
    out.print("Pswd: " + strPswd + "<br>");
    out.print("Unit: " + strUnit + "<br>");
    out.print("Role: " + strRole + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="../Utility/Window.js"></script>
  <script type="text/javascript" language="javascript" src="EditAccount.js"></script>
  <title>�ק�b��</title>
</head>

<body>


<form name="frmEditAcnt" method="post" action="<%=strMySelf%>">

  <p>�ڬO<font color="#0000FF">�ק�b��</font>������...</p>
  <input type="hidden" name="BtnSend" value="">

  <%
    String strMesg = "";
    
    if (strSend != null && strSend.equals("�T�w�ק�"))
    {
      if (isDebug) out.print("�z��ܤF�ק�b���\��...");
  
      int result = clsAcnt.UpdateAllColumns(strName, strPswd, strUnit, strRole);

      if (result > 0)
        strMesg += (strName + " ����ƭק粒��...<br>");
      else
        strMesg += (strName + " ����ƭק異��...<br>");

      if (strMesg != null && strMesg.length() > 0)
      {
        out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
        %>
        <script Language="JavaScript">
        <!--
          PopupWindow(240, 160, "no", "no", "no", "yes");
          msgWin.document.write(document.frmEditAcnt.Message.value);
        //-->
        </Script>

        <div align="center">
          <a href="AcntManager.jsp">�^�b���޲z����</a>
        </div>  
        <%
      }
      
    } else {
    %>
      <!-- ��ܭק�w��һݭn�����... .//-->
      <%@include file="../Account/EditAccount_frm.htm"%>
    <%
    }
  %>  


</form>

</body>

</html>
