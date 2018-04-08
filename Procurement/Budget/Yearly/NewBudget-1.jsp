<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Budget"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<%
  boolean isDebug = false;
  String strMySelf = "NewBudget-1.jsp";
  Budget clsBdg = new Budget();
%>

<%
  String strSend = request.getParameter("BtnSend");
  String strData01 = request.getParameter("txtData01").trim();
  String strData02 = request.getParameter("txtData02").trim();
  String strData03 = request.getParameter("txtData03").trim();
  
  if (isDebug) 
  {
    out.print("BtnSend: " + strSend + "<br>");
    out.print("�w����: " + strData01 + "<br>");
    out.print("�w��W��: " + strData02 + "<br>");
    out.print("���@�@�B: " + strData03 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>�n���w���ص��G</title>
</head>

<body>

<form name="frmProcQuery" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <p>�ڬO<font color="#0000ff">�n���w��</font>������...</p>
  
  <%
    if (strSend != null && strSend.equals("�n���w��"))
    {
      String strNewAcntState = "";
      if (isDebug) out.print("�z��ܤF�u�n���w��v���\��...");
  
      long nData03 = (strData03 != null) ? (long)Long.parseLong(strData03) : 0;
      int result = clsBdg.NewBudget(strData01, strData02, nData03);
      switch(result)
      {
        case -2:
          strNewAcntState = "�w�⭫�Ƶn��...";
          break;
        case -1:
          strNewAcntState = "��Ʈw�s�u����...";
          break;
        case 0:
          strNewAcntState = "�n���w�⥢��...";
          break;
        case 1:
          strNewAcntState = "�n���w�⦨�\...";
          break;
        default:  
          strNewAcntState = ("�o�͵{���]�p�H���w�����~�����p, �гq���{���]�p�H��...");
      }
      out.print("<br>" + strNewAcntState + "<br>");
      
    }
  %>    
  </p>
  <div align="center">
    <a href="BudgetMng.jsp">��^�u�n���w��v����</a>
  </div>  
    
</form>  

</body>

</html>