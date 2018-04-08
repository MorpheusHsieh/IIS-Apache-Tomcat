<%@page language="Java"%>
<%@page contentType="text/html;charset=big5"%>
<%@page import="Procurement.Budget_Monthly"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "EditMonthlyBudget.jsp";
  Budget_Monthly clsMonthlyBudget = new Budget_Monthly();

  String strSend= "";
  String strData01 = "", strData02 = "", strData03 = "";
  String oldData01 = "", oldData02 = "", oldData03 = "";

  request.setCharacterEncoding("big5");
  strSend = (String)request.getAttribute("BtnSend");
  if (strSend != null && strSend.equals("�ק����t"))
  {
    strData01 = (String)request.getAttribute("txtData01");
    strData02 = (String)request.getAttribute("txtData02");
    strData03 = (String)request.getAttribute("txtData03");
  } else {
    strSend = (String)request.getParameter("BtnSend").trim();

    strData01 = (String)request.getParameter("txtData01").trim();
    strData02 = (String)request.getParameter("txtData02").trim();
    strData03 = (String)request.getParameter("txtData03").trim();
  }

  if (isDebug)
  {
    out.print("Send: " + strSend + "<br>");
    out.print("�w����: " + strData01 + "<br>");
    out.print("�w����: " + strData02 + "<br>");
    out.print("����t���B: " + strData03 + "<br>");
  }
%>

<html>

<head>
  <script type="text/javascript" language="javascript" src="/Procurement/Utility/Window.js"></script>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>�ק�w����</title>
</head>

<body>

<form name="frmEdtMonthlyBudget" method="post" action="<%=strMySelf%>">

  <p>�ڬO<font color="#0000ff">�ק����t</font>������...</p>

  <%
    String strMesg = "";
    
    if (strSend != null && strSend.equals("�T�{�ק����t"))
    {
      if (isDebug) out.print("�z��ܤF�u�T�{�ק����t�v���\��...");
  
      long lData03 = (strData03 != null) ? Long.parseLong(strData03) : 0;
      int result = clsMonthlyBudget.UpdateAllColumns(strData01, strData02, lData03);

      if (result > 0)
      {
        strMesg += ("�w���ءG" + strData01 + "<br>");
        strMesg += ("�w�����G" + strData02 + "<br>");
        strMesg += ("����t���B�G" + lData03 + "<br>");
        strMesg += ("��ƭק粒��...<br>");
      }  
      else {
        strMesg += ("�w���ءG" + strData01 + "<br>");
        strMesg += ("�w�����G" + strData02 + "<br>");
        strMesg += ("����t���B�G" + lData03 + "<br>");
        strMesg += ("��ƭק異��...<br>");
      }  

      if (strMesg != null && strMesg.length() > 0)
      {
        out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
        %>
        <script Language="JavaScript">
        <!--
          PopupWindow(240, 160, "no", "no", "no", "yes");
          msgWin.document.write(document.frmEdtMonthlyBudget.Message.value);
        //-->
        </Script>

        <div align="center">
          <a href="../Monthly/Budget_Monthly.jsp">�^�u������t�v����</a>
        </div>  
        <%
      }
    } else {
    %>
      <!-- ��ܷs�W�b���һݭn�����... .//-->
      <%@include file="../Monthly/EditMonthlyBudget_frm.htm"%>
      <%
    }
    %>  
    
</form>  

</body>

</html>
