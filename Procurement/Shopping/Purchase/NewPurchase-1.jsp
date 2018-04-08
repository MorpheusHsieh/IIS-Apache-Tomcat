<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Purchase"%>

<!-- 判斷 Session 是否有登入資訊 //-->
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
    out.print("購畫編號: " + strData01 + "<br>");
    out.print("執行月份: " + strData02 + "<br>");
    out.print("購案名稱: " + strData03 + "<br>");
    out.print("預算科目: " + strData04 + "<br>");
    out.print("申請單位: " + strData05 + "<br>");
    out.print("承 辦 人: " + strData06 + "<br>");
    out.print("計畫金額: " + strData07 + "<br>");
    out.print("申購金額: " + strData08 + "<br>");
    out.print("決標金額: " + strData09 + "<br>");
    out.print("支用金額: " + strData10 + "<br>");
    out.print("交貨天數: " + strData11 + "<br>");
    out.print("核定權責: " + strData12 + "<br>");
    out.print("採購途徑: " + strData13 + "<br>");
    out.print("採購單位: " + strData14 + "<br>");
    out.print("招標方式: " + strData15 + "<br>");
    out.print("核定日期: " + strData16 + "<br>");
    out.print("開標日期: " + strData17 + "<br>");
    out.print("簽約日期: " + strData18 + "<br>");
    out.print("交貨日期: " + strData19 + "<br>");
    out.print("驗收日期: " + strData20 + "<br>");
    out.print("核銷日期: " + strData21 + "<br>");
    out.print("結案日期: " + strData22 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>將購案寫入資料庫</title>
</head>

<body>

<form name="frmAddPurchase" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <p>我是<font color="#0000ff">將購案寫入資料庫</font>的頁面...</p>
  
  <%
    if (isDebug) out.print("您選擇了「" + strSend + "」的功能...");

    if (strSend != null && strSend.equals("新增購案"))
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
          strMessage = "計畫編號重複...";
          break;
        case -1:
          strMessage = "資料庫連線失敗...";
          break;
        case 0:
          strMessage = "新增計畫案失敗...";
          break;
        case 1:
          strMessage = "新增計畫案成功...";
          break;
        default:  
          strMessage = ("發生程式設計人員預期之外的狀況, 請通知程式設計人員...");
      }
      out.print("<br>" + strMessage + "<br>");
    }
  %>    
  </p>
  <div align="center">
    <a href="Main_Purchase.jsp">返回「購案管理」頁面</a>
  </div>  
    
</form>  

</body>

</html>