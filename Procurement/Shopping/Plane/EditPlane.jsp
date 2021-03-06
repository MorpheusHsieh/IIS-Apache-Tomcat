<%@page language="Java"%>
<%@page contentType="text/html;charset=big5"%>
<%@page import="Procurement.Plane"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "EditPlane.jsp";
  Plane clsPlane = new Plane();

  String strSend= "";
  String strData01 = "", strData02 = "", strData03 = "";
  String strData04 = "", strData05 = "", strData06 = "";
  String strData07 = "", strData08 = "";

  request.setCharacterEncoding("big5");
  strSend = (String)request.getAttribute("BtnSend");
  if (strSend != null && strSend.equals("修改計畫案"))
  {
    strData01 = (String)request.getAttribute("txtData01");
    strData02 = (String)request.getAttribute("txtData02");
    strData03 = (String)request.getAttribute("txtData03");
    strData04 = (String)request.getAttribute("txtData04");
    strData05 = (String)request.getAttribute("txtData05");
    strData06 = (String)request.getAttribute("txtData06");
    strData07 = (String)request.getAttribute("txtData07");
    strData08 = (String)request.getAttribute("txtData08");
  } else {
    strSend = (String)request.getParameter("BtnSend").trim();

    strData01 = (String)request.getParameter("txtData01").trim();
    strData02 = (String)request.getParameter("txtData02").trim();
    strData03 = (String)request.getParameter("txtData03").trim();
    strData04 = (String)request.getParameter("txtData04").trim();
    strData05 = (String)request.getParameter("txtData05").trim();
    strData06 = (String)request.getParameter("txtData06").trim();
    strData07 = (String)request.getParameter("txtData07").trim();
    strData08 = (String)request.getParameter("txtData08").trim();
  }

  if (isDebug)
  {
    out.print("Send: " + strSend + "<br>");
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
  <script type="text/javascript" language="javascript" src="/Procurement/Utility/Window.js"></script>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>修改計畫案</title>
</head>

<body>

<form name="frmEditPlane" method="post" action="<%=strMySelf%>">

  <p>我是<font color="#0000ff">修改計畫案</font>的頁面...</p>

  <%
    String strMesg = "";
    
    if (strSend != null && strSend.equals("確認修改計畫案"))
    {
      if (isDebug) out.print("您選擇了「" + strSend + "」的功能...");
  
      long lData07 = (strData07 != null) ? Long.parseLong(strData07) : 0;
      int result = clsPlane.UpdateAllColumns(strData01, strData02, strData03,
                   strData04, strData05, strData06, lData07, strData08);

      if (result > 0)
      {
        strMesg += ("預算編號：" + strData01 + "<br>");
        strMesg += ("資料修改完畢...<br>");
      }  
      else {
        strMesg += ("預算編號：" + strData01 + "<br>");
        strMesg += ("資料修改失敗...<br>");
      }  

      if (strMesg != null && strMesg.length() > 0)
      {
        out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
        %>
        <script Language="JavaScript">
        <!--
          PopupWindow(240, 160, "no", "no", "no", "yes");
          msgWin.document.write(document.frmEditPlane.Message.value);
        //-->
        </Script>

        <div align="center">
          <a href="Main_Plane.jsp">回「計畫案管理」頁面</a>
        </div>  
        <%
      }
    } else {
	  %>  
	  <div align="center">
	    <table>
	      <tr>
			<td>計畫編號：</td>
			<td><%=strData01%><input type="hidden" name="txtData01" value="<%=strData01%>"></td>
		  </tr>
	      <tr>
			<td>執行月份：</td>
			<td>
			  <SELECT name="txtData02" size="1">
				<%
				  String strSelect = "";				
				  strSelect = ((strData02 != null) && (strData02.equals("一月"))) ? "selected" : "";
				%>
				<OPTION value="一月" <%=strSelect%>>一月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("二月"))) ? "selected" : "";%>
				<OPTION value="二月" <%=strSelect%>>二月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("三月"))) ? "selected" : "";%>
				<OPTION value="三月" <%=strSelect%>>三月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("四月"))) ? "selected" : "";%>
				<OPTION value="四月" <%=strSelect%>>四月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("五月"))) ? "selected" : "";%>
				<OPTION value="五月" <%=strSelect%>>五月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("六月"))) ? "selected" : "";%>
				<OPTION value="六月" <%=strSelect%>>六月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("七月"))) ? "selected" : "";%>
				<OPTION value="七月" <%=strSelect%>>七月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("八月"))) ? "selected" : "";%>
				<OPTION value="八月" <%=strSelect%>>八月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("九月"))) ? "selected" : "";%>
				<OPTION value="九月" <%=strSelect%>>九月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("十月"))) ? "selected" : "";%>
				<OPTION value="十月" <%=strSelect%>>十月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("十一月"))) ? "selected" : "";%>
				<OPTION value="十一月" <%=strSelect%>>十一月</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("十二月"))) ? "selected" : "";%>
				<OPTION value="十二月" <%=strSelect%>>十二月</OPTION>
			  </SELECT>  
			</td>
		  </tr>
	      <tr>
			<td>計畫名稱：</td>
			<td><input type="text" name="txtData03" value="<%=strData03%>"></td>
		  </tr>
	      <tr>
			<td>預算科目：</td>
			<td><input type="text" name="txtData04" value="<%=strData04%>"></td>
		  </tr>
	      <tr>
			<td>申請單位：</td>
			<td><input type="text" name="txtData05" value="<%=strData05%>"></td>
		  </tr>
	      <tr>
			<td>承 辦 人：</td>
			<td><input type="text" name="txtData06" value="<%=strData06%>"></td>
		  </tr>
	      <tr>
			<td>計畫金額：</td>
			<td><input type="text" name="txtData07" value="<%=strData07%>"></td>
		  </tr>
	      <tr>
			<td>核定日期：</td>
			<td><input type="text" name="txtData08" value="<%=strData08%>"></td>
		  </tr>
		</table>
		<p align="center">
		  <table border="0" width="100%">
			<tr>
			  <td align="center"><input type="submit" name="BtnSend" value="確認修改計畫案"></td>
			</tr>
		  </table>
		</p>  
	  </div>      
      <%
    }
    %>  
    
</form>  

</body>

</html>
