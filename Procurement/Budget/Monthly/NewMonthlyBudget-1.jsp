<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Budget_Monthly"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<%
  boolean isDebug = false;
  String strMySelf = "NewMonthlyBudget-1.jsp";
  Budget_Monthly clsMonthlyBdg = new Budget_Monthly();
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
    out.print("����t���: " + strData02 + "<br>");
    out.print("����t���B: " + strData03 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>���J����t</title>
</head>

<body>

<form name="frmAddMonthlyBdg" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <p>�ڬO<font color="#0000ff">���J����t</font>������...</p>
  
  <%
    if (strSend != null && strSend.equals("���J����t"))
    {
      String strMessage = "";
      if (isDebug) out.print("�z��ܤF�u���J����t�v���\��...");
  
      long nData03 = (strData03 != null) ? (long)Long.parseLong(strData03) : 0;
      int result = clsMonthlyBdg.NewMonthlyBudget(strData01, strData02, nData03);
      switch(result)
      {
        case -2:
          strMessage = "����t���Ʀ��J...";
          break;
        case -1:
          strMessage = "��Ʈw�s�u����...";
          break;
        case 0:
          strMessage = "���J����t����...";
          break;
        case 1:
          strMessage = "���J����t���\...";
          break;
        default:  
          strMessage = ("�o�͵{���]�p�H���w�����~�����p, �гq���{���]�p�H��...");
      }
      out.print("<br>" + strMessage + "<br>");
      
    }
  %>    
  </p>
  <div align="center">
    <a href="../Monthly/Budget_Monthly.jsp">��^�u������t�v����</a>
  </div>  
    
</form>  

</body>

</html>