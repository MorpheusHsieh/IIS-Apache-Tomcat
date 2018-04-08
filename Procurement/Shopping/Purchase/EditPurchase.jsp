<%@page language="Java"%>
<%@page contentType="text/html;charset=big5"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page import="Procurement.Purchase"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "EditPurchase.jsp";
  Purchase clsPurchase = new Purchase();

  String strSend= "";
  String strData01 = "", strData02 = "", strData03 = "", strData04 = "";
  String strData05 = "", strData06 = "", strData07 = "", strData08 = "";
  String strData09 = "", strData10 = "", strData11 = "", strData12 = "";
  String strData13 = "", strData14 = "", strData15 = "", strData16 = "";
  String strData17 = "", strData18 = "", strData19 = "", strData20 = "";
  String strData21 = "", strData22 = "";
  String[] strRowData = null;

  request.setCharacterEncoding("big5");
  strSend = (String)request.getAttribute("BtnSend");
  if (strSend != null && strSend.equals("修改購案"))
  {
    strData01 = (String)request.getAttribute("txtData01");

    strRowData = clsPurchase.QueryForRowData(strData01);
    if ((strRowData != null) && (strRowData.length == 22))
    {
      strData02 = ((strRowData[1]  != null) ? strRowData[1].trim() : "");
      strData03 = ((strRowData[2]  != null) ? strRowData[2].trim() : "");
      strData04 = ((strRowData[3]  != null) ? strRowData[3].trim() : "");
      strData05 = ((strRowData[4]  != null) ? strRowData[4].trim() : "");
      strData06 = ((strRowData[5]  != null) ? strRowData[5].trim() : "");
      strData07 = ((strRowData[6]  != null) ? strRowData[6].trim() : "");
      strData08 = ((strRowData[7]  != null) ? strRowData[7].trim() : "");
      strData09 = ((strRowData[8]  != null) ? strRowData[8].trim() : "");
      strData10 = ((strRowData[9]  != null) ? strRowData[9].trim() : "");
      strData11 = ((strRowData[10] != null) ? strRowData[10].trim() : "");
      strData12 = ((strRowData[11] != null) ? strRowData[11].trim() : "");
      strData13 = ((strRowData[12] != null) ? strRowData[12].trim() : "");
      strData14 = ((strRowData[13] != null) ? strRowData[13].trim() : "");
      strData15 = ((strRowData[14] != null) ? strRowData[14].trim() : "");
      strData16 = ((strRowData[15] != null) ? strRowData[15].trim() : "");
      strData17 = ((strRowData[16] != null) ? strRowData[16].trim() : "");
      strData18 = ((strRowData[17] != null) ? strRowData[17].trim() : "");
      strData19 = ((strRowData[18] != null) ? strRowData[18].trim() : "");
      strData20 = ((strRowData[19] != null) ? strRowData[19].trim() : "");
      strData21 = ((strRowData[20] != null) ? strRowData[20].trim() : "");
      strData22 = ((strRowData[21] != null) ? strRowData[21].trim() : "");
    }
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
    strData09 = (String)request.getParameter("txtData09").trim();
    strData10 = (String)request.getParameter("txtData10").trim();
    strData11 = (String)request.getParameter("txtData11").trim();
    strData12 = (String)request.getParameter("txtData12").trim();
    strData13 = (String)request.getParameter("txtData13").trim();
    strData14 = (String)request.getParameter("txtData14").trim();
    strData15 = (String)request.getParameter("txtData15").trim();
    strData16 = (String)request.getParameter("txtData16").trim();
    strData17 = (String)request.getParameter("txtData17").trim();
    strData18 = (String)request.getParameter("txtData18").trim();
    strData19 = (String)request.getParameter("txtData19").trim();
    strData20 = (String)request.getParameter("txtData20").trim();
    strData21 = (String)request.getParameter("txtData21").trim();
    strData22 = (String)request.getParameter("txtData22").trim();
  }

  if (isDebug)
  {
    out.print("Send: " + strSend + "<br>");
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
  <script type="text/javascript" language="javascript" src="/Procurement/Utility/Window.js"></script>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>修改購案</title>
</head>

<body>

<form name="frmEditPurchase" method="post" action="<%=strMySelf%>">

  <p>我是<font color="#0000ff">修改購案</font>的頁面...</p>

  <%
    String strMesg = "";
    
    if (isDebug) out.print("您選擇了「" + strSend + "」的功能...");

    if (strSend != null && strSend.equals("確認修改購案"))
    {
      long lData07 = (strData07 != null) ? Long.parseLong(strData07) : 0;
      long lData08 = (strData08 != null) ? Long.parseLong(strData08) : 0;
      long lData09 = (strData09 != null) ? Long.parseLong(strData09) : 0;
      long lData10 = (strData10 != null) ? Long.parseLong(strData10) : 0;

      int result = clsPurchase.UpdateAllColumns(
      			   strData01, strData02, strData03, strData04, strData05, 
      			   strData06,   lData07,   lData08,   lData09,   lData10, 
      			   strData11, strData12, strData13, strData14, strData15, 
      			   strData16, strData17, strData18, strData19, strData20, 
      			   strData21, strData22);
      			   
       if (isDebug) out.print("Result: " + result + "<br>");			   

      if (result > 0)
      {
        strMesg += ("購案編號：" + strData01 + "<br>");
        strMesg += ("資料修改完畢...<br>");
      }  
      else {
        strMesg += ("購案編號：" + strData01 + "<br>");
        strMesg += ("資料修改失敗...<br>");
      }  

      if (strMesg != null && strMesg.length() > 0)
      {
        out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
        %>
        <script Language="JavaScript">
        <!--
          PopupWindow(240, 160, "no", "no", "no", "yes");
          msgWin.document.write(document.frmEditPurchase.Message.value);
        //-->
        </Script>

        <div align="center">
          以下是修改後的內容...<br><br>
          <table>
            <tr><td>購畫編號:</td><td><%=strData01%></td></tr>
			<tr><td>執行月份:</td><td><%=strData02%></td></tr>
			<tr><td>購案名稱:</td><td><%=strData03%></td></tr>
			<tr><td>預算科目:</td><td><%=strData04%></td></tr>
			<tr><td>申請單位:</td><td><%=strData05%></td></tr>
			<tr><td>承 辦 人:</td><td><%=strData06%></td></tr>
			<tr><td>計畫金額:</td><td><%=strData07%></td></tr>
			<tr><td>申購金額:</td><td><%=strData08%></td></tr>
			<tr><td>決標金額:</td><td><%=strData09%></td></tr>
			<tr><td>支用金額:</td><td><%=strData10%></td></tr>
			<tr><td>交貨天數:</td><td><%=strData11%></td></tr>
			<tr><td>核定權責:</td><td><%=strData12%></td></tr>
			<tr><td>採購途徑:</td><td><%=strData13%></td></tr>
			<tr><td>採購單位:</td><td><%=strData14%></td></tr>
			<tr><td>招標方式:</td><td><%=strData15%></td></tr>
			<tr><td>核定日期:</td><td><%=strData16%></td></tr>
			<tr><td>開標日期:</td><td><%=strData17%></td></tr>
			<tr><td>簽約日期:</td><td><%=strData18%></td></tr>
			<tr><td>交貨日期:</td><td><%=strData19%></td></tr>
			<tr><td>驗收日期:</td><td><%=strData20%></td></tr>
			<tr><td>核銷日期:</td><td><%=strData21%></td></tr>
			<tr><td>結案日期:</td><td><%=strData22%></td></tr>
          </table>
          <br>  
          <a href="Main_Purchase.jsp">回「購案管理」頁面</a>
        </div>  
        <%
      }
    } else {
	  %>  
	  <div align="center">
	    <table>
	      <tr>
			<td>購案編號：</td>
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
			<td>購案名稱：</td>
			<td><input type="text" name="txtData03" value="<%=strData03%>"></td>
		  </tr>
	      <tr>
			<td>預算科目：</td>
			<td><input type="text" name="txtData04" value="<%=strData04%>"></td>
		  </tr>
	      <tr>
			<td>申購單位：</td>
			<td><input type="text" name="txtData05" value="<%=strData05%>"></td>
		  </tr>
	      <tr>
			<td>承 辦 人：</td>
			<td><input type="text" name="txtData06" value="<%=strData06%>"></td>
		  </tr>
	      <tr>
			<td>計畫金額：</td>
			<td><input type="text" name="txtData07" value="<%=strData07%>">元</td>
		  </tr>
	      <tr>
			<td>申購金額：</td>
			<td><input type="text" name="txtData08" value="<%=strData08%>">元</td>
		  </tr>
	      <tr>
			<td>決標金額：</td>
			<td><input type="text" name="txtData09" value="<%=strData09%>">元</td>
		  </tr>
	      <tr>
			<td>支用金額：</td>
			<td><input type="text" name="txtData10" value="<%=strData10%>">元</td>
		  </tr>
		  <tr align="center">
			<td align="right">交貨天數：</td>
		 	<td align="left"><input type="text" name="txtData11" size="10" value="<%=strData11%>"></td>
		  </tr>
		  <tr align="center">
			<td align="right">核定權責：</td>
		 	<td align="left">
		 	  <SELECT name="txtData12" size="1">
				<%strSelect = ((strData12 != null) && (strData12.equals("本單位"))) ? "selected" : "";%>
				<OPTION value="本單位" <%=strSelect%>>本單位</OPTION>
				<%strSelect = ((strData12 != null) && (strData12.equals("上級單位"))) ? "selected" : "";%>
				<OPTION value="上級單位" <%=strSelect%>>上級單位</OPTION>
		 	  </SELECT>
		 	</td>
		  </tr>
		  <tr align="center">
			<td align="right">採購途徑：</td>
		 	<td align="left">
		 	  <SELECT name="txtData13" size="1">
				<%strSelect = ((strData13 != null) && (strData13.equals("內購"))) ? "selected" : "";%>
				<OPTION value="內購" <%=strSelect%>>內購</OPTION>
		 	  </SELECT>
		 	</td>
		  </tr>
		  <tr align="center">
			<td align="right">採購單位：</td>
		 	<td align="left">
		 	  <SELECT name="txtData14" size="1">
				<%strSelect = ((strData14 != null) && (strData14.equals("採購組"))) ? "selected" : "";%>
				<OPTION value="採購組" <%=strSelect%>>採購組</OPTION>
		 	  </SELECT>
		 	</td>
		  </tr>
		  <tr align="center">
			<td align="right">招標方式：</td>
		 	<td align="left">
		 	  <SELECT name="txtData15" size="1">
				<%strSelect = ((strData15 != null) && (strData15.equals("小額採購"))) ? "selected" : "";%>
				<OPTION value="小額採購" <%=strSelect%>>小額採購</OPTION>
				<%strSelect = ((strData15 != null) && (strData15.equals("共同供應"))) ? "selected" : "";%>
				<OPTION value="共同供應" <%=strSelect%>>共同供應</OPTION>
				<%strSelect = ((strData15 != null) && (strData15.equals("公開徵求"))) ? "selected" : "";%>
				<OPTION value="公開徵求" <%=strSelect%>>公開徵求</OPTION>
				<%strSelect = ((strData15 != null) && (strData15.equals("委製"))) ? "selected" : "";%>
				<OPTION value="委製" <%=strSelect%>>委製</OPTION>
		 	  </SELECT>
		 	</td>
		  </tr>
	  	  <tr align="center">
			<td align="right">核定日期：</td>
			<%
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd", Locale.TAIWAN);

			  String strValue = strData16;
              if ((strValue != null) && (strValue.length() > 0))
              {
			    strValue = strValue.replace('-','/');
				Date myDate = DateFormat.getDateInstance().parse(strValue); 
				strData16 = sdf.format(myDate);
              }
			%>
			<td align="left"><input type="text" name="txtData16" size="20" value="<%=strData16%>"></td>
		  </tr>
	  	  <tr align="center">
			<td align="right">開標日期：</td>
			<%
			  strValue = strData17;
              if ((strValue != null) && (strValue.length() > 0))
              {
			    strValue = strValue.replace('-','/');
				Date myDate = DateFormat.getDateInstance().parse(strValue); 
				strData17 = sdf.format(myDate);
			  }
			%>
			<td align="left"><input type="text" name="txtData17" size="20" value="<%=strData17%>"></td>
		  </tr>
	  	  <tr align="center">
			<td align="right">簽約日期：</td>
			<%
			  strValue = strData18;
              if ((strValue != null) && (strValue.length() > 0))
              {
			    strValue = strValue.replace('-','/');
				Date myDate = DateFormat.getDateInstance().parse(strValue); 
			    strData18 = sdf.format(myDate);
			  }  
			%>
			<td align="left"><input type="text" name="txtData18" size="20" value="<%=strData18%>"></td>
		  </tr>
	  	  <tr align="center">
			<td align="right">交貨日期：</td>
			<%
			  strValue = strData19;
              if ((strValue != null) && (strValue.length() > 0))
              {
			    strValue = strValue.replace('-','/');
				Date myDate = DateFormat.getDateInstance().parse(strValue); 
				strData19 = sdf.format(myDate);
			  }	
			%>
			<td align="left"><input type="text" name="txtData19" size="20" value="<%=strData19%>"></td>
		  </tr>
	  	  <tr align="center">
			<td align="right">驗收日期：</td>
			<%
			  strValue = strData20;
              if ((strValue != null) && (strValue.length() > 0))
              {
			    strValue = strValue.replace('-','/');
				Date myDate = DateFormat.getDateInstance().parse(strValue); 
				strData20 = sdf.format(myDate);
			  }	
			%>
			<td align="left"><input type="text" name="txtData20" size="20" value="<%=strData20%>"></td>
		  </tr>
	  	  <tr align="center">
			<td align="right">核銷日期：</td>
			<%
			  strValue = strData21;
              if ((strValue != null) && (strValue.length() > 0))
              {
			    strValue = strValue.replace('-','/');
				Date myDate = DateFormat.getDateInstance().parse(strValue); 
				strData21 = sdf.format(myDate);
			  }	
			%>
			<td align="left"><input type="text" name="txtData21" size="20" value="<%=strData21%>"></td>
		  </tr>
	  	  <tr align="center">
			<td align="right">結案日期：</td>
			<%
			  strValue = strData22;
              if ((strValue != null) && (strValue.length() > 0))
              {
			    strValue = strValue.replace('-','/');
				Date myDate = DateFormat.getDateInstance().parse(strValue); 
				strData22 = sdf.format(myDate);
			  }	
			%>
			<td align="left"><input type="text" name="txtData22" size="20" value="<%=strData22%>"></td>
		  </tr>
		</table>
		<p align="center">
		  <table border="0" width="100%">
			<tr>
			  <td align="center"><input type="submit" name="BtnSend" value="確認修改購案"></td>
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
