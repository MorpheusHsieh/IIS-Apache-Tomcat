<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Purchase"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<%
  boolean isDebug = false;
  String strMySelf = "NewPurchase-1.jsp";
  Purchase clsPurchase = new Purchase();
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
  String strData09 = request.getParameter("txtData09").trim();
  String strData10 = request.getParameter("txtData10").trim();
  String strData11 = request.getParameter("txtData11").trim();
  String strData12 = request.getParameter("txtData12").trim();
  String strData13 = request.getParameter("txtData13").trim();
  String strData14 = request.getParameter("txtData14").trim();
  String strData15 = request.getParameter("txtData15").trim();
  String strData16 = request.getParameter("txtData16").trim();
  String strData17 = request.getParameter("txtData17").trim();
  String strData18 = request.getParameter("txtData18").trim();
  String strData19 = request.getParameter("txtData19").trim();
  String strData20 = request.getParameter("txtData20").trim();
  String strData21 = request.getParameter("txtData21").trim();
  String strData22 = request.getParameter("txtData22").trim();
  
  if (isDebug) 
  {
    out.print("BtnSend: " + strSend + "<br>");
    out.print("�ʵe�s��: " + strData01 + "<br>");
    out.print("������: " + strData02 + "<br>");
    out.print("�ʮצW��: " + strData03 + "<br>");
    out.print("�w����: " + strData04 + "<br>");
    out.print("�ӽг��: " + strData05 + "<br>");
    out.print("�� �� �H: " + strData06 + "<br>");
    out.print("�p�e���B: " + strData07 + "<br>");
    out.print("���ʪ��B: " + strData08 + "<br>");
    out.print("�M�Ъ��B: " + strData09 + "<br>");
    out.print("��Ϊ��B: " + strData10 + "<br>");
    out.print("��f�Ѽ�: " + strData11 + "<br>");
    out.print("�֩w�v�d: " + strData12 + "<br>");
    out.print("���ʳ~�|: " + strData13 + "<br>");
    out.print("���ʳ��: " + strData14 + "<br>");
    out.print("�ۼФ覡: " + strData15 + "<br>");
    out.print("�֩w���: " + strData16 + "<br>");
    out.print("�}�Ф��: " + strData17 + "<br>");
    out.print("ñ�����: " + strData18 + "<br>");
    out.print("��f���: " + strData19 + "<br>");
    out.print("�禬���: " + strData20 + "<br>");
    out.print("�־P���: " + strData21 + "<br>");
    out.print("���פ��: " + strData22 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>�N�ʮ׼g�J��Ʈw</title>
</head>

<body>

<form name="frmAddPurchase" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <p>�ڬO<font color="#0000ff">�N�ʮ׼g�J��Ʈw</font>������...</p>
  
  <%
    if (isDebug) out.print("�z��ܤF�u" + strSend + "�v���\��...");

    if (strSend != null && strSend.equals("�s�W�ʮ�"))
    {
      String strMessage = "";
  
      long lData07 = (strData07 != null) ? (long)Long.parseLong(strData07) : 0;
      long lData08 = (strData08 != null) ? (long)Long.parseLong(strData08) : 0;
      long lData09 = (strData09 != null) ? (long)Long.parseLong(strData09) : 0;
      long lData10 = (strData10 != null) ? (long)Long.parseLong(strData10) : 0;
      int result = clsPurchase.NewRecord(strData01, strData02, strData03, strData04, strData05, 
      									 strData06,   lData07,   lData08,   lData09,   lData10,
										 strData11, strData12, strData13, strData14, strData15,
										 strData16, strData17, strData18, strData19, strData20,
										 strData21, strData22);
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
    <a href="Main_Purchase.jsp">��^�u�ʮ׺޲z�v����</a>
  </div>  
    
</form>  

</body>

</html>