<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Plane"%>

<!-- 判斷 Session 是否有登入資訊 //-->
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
    out.print("計畫編號: " + strData01 + "<br>");
    out.print("執行月份: " + strData02 + "<br>");
    out.print("計畫名稱: " + strData03 + "<br>");
    out.print("預算科目: " + strData04 + "<br>");
    out.print("申請單位: " + strData05 + "<br>");
    out.print("承 辦 人: " + strData06 + "<br>");
    out.print("計畫金額: " + strData07 + "<br>");
    out.print("核定日期: " + strData08 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>將計畫案寫入資料庫</title>
</head>

<body>

<form name="frmAddPlane" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="Message" value="">

  <p>我是<font color="#0000ff">將計畫案寫入資料庫</font>的頁面...</p>
  
  <%
    if (isDebug) out.print("您選擇了「" + strSend + "」的功能...");

    if (strSend != null && strSend.equals("新增計畫案"))
    {
      String strMessage = "";
  
      long nData07 = (strData07 != null) ? (long)Long.parseLong(strData07) : 0;
      int result = clsPlane.NewPlane(strData01, strData02, strData03, strData04,
                                     strData05, strData06,   nData07, strData08);
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
    <a href="Main_Plane.jsp">返回「計畫案管理」頁面</a>
  </div>  
    
</form>  

</body>

</html>