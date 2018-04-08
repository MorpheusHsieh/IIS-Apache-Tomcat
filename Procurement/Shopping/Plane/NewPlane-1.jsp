<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Plane"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<%
  boolean isDebug = false;
  String strMySelf = "NewPlane-1.jsp";
  Plane clsPlane = new Plane();
%>

<%
  String strSend = request.getParameter("BtnSend");
  String strData01 = request.getParameter("txtData01").trim();
  String strData02 = request.getParameter("txtData02").trim();
  String strData03 = request.getParameter("txtData03").trim();
  String strData04 = request.getParameter("txtData04").trim();
  String strData05 = request.getParameter("txtData05").trim();
  String strData06 = request.getParameter("txtData06").trim();
  String strData07 = request.getParameter("txtData07").trim();
  String strData08 = request.getParameter("txtData08").trim();
  
  if (isDebug) 
  {
    out.print("BtnSend: " + strSend + "<br>");
    out.print("�p�e�s��: " + strData01 + "<br>");
    out.print("������: " + strData02 + "<br>");
    out.print("�p�e�W��: " + strData03 + "<br>");
    out.print("�w����: " + strData04 + "<br>");
    out.print("�ӽг��: " + strData05 + "<br>");
    out.print("�� �� �H: " + strData06 + "<br>");
    out.print("�p�e���B: " + strData07 + "<br>");
    out.print("�֩w���: " + strData08 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>�N�p�e�׼g�J��Ʈw</title>
</head>

<body>

<form name="frmAddPlane" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <p>�ڬO<font color="#0000ff">�N�p�e�׼g�J��Ʈw</font>������...</p>
  
  <%
    if (isDebug) out.print("�z��ܤF�u" + strSend + "�v���\��...");

    if (strSend != null && strSend.equals("�s�W�p�e��"))
    {
      String strMessage = "";
  
      long nData07 = (strData07 != null) ? (long)Long.parseLong(strData07) : 0;
      int result = clsPlane.NewPlane(strData01, strData02, strData03, strData04,
                                     strData05, strData06,   nData07, strData08);
      switch(result)
      {
        case -2:
          strMessage = "�p�e�s������...";
          break;
        case -1:
          strMessage = "��Ʈw�s�u����...";
          break;
        case 0:
          strMessage = "�s�W�p�e�ץ���...";
          break;
        case 1:
          strMessage = "�s�W�p�e�צ��\...";
          break;
        default:  
          strMessage = ("�o�͵{���]�p�H���w�����~�����p, �гq���{���]�p�H��...");
      }
      out.print("<br>" + strMessage + "<br>");
      
    }
  %>    
  </p>
  <div align="center">
    <a href="Main_Plane.jsp">��^�u�p�e�׺޲z�v����</a>
  </div>  
    
</form>  

</body>

</html>