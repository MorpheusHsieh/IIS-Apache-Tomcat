<%@page language="Java"%>
<%@page contentType="text/html;charset=big5"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page import="Procurement.Purchase"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
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
  if (strSend != null && strSend.equals("�ק��ʮ�"))
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
  <script type="text/javascript" language="javascript" src="/Procurement/Utility/Window.js"></script>
  <meta http-equiv="Content-Language" content="zh-tw">
  <title>�ק��ʮ�</title>
</head>

<body>

<form name="frmEditPurchase" method="post" action="<%=strMySelf%>">

  <p>�ڬO<font color="#0000ff">�ק��ʮ�</font>������...</p>

  <%
    String strMesg = "";
    
    if (isDebug) out.print("�z��ܤF�u" + strSend + "�v���\��...");

    if (strSend != null && strSend.equals("�T�{�ק��ʮ�"))
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
        strMesg += ("�ʮ׽s���G" + strData01 + "<br>");
        strMesg += ("��ƭק粒��...<br>");
      }  
      else {
        strMesg += ("�ʮ׽s���G" + strData01 + "<br>");
        strMesg += ("��ƭק異��...<br>");
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
          �H�U�O�ק�᪺���e...<br><br>
          <table>
            <tr><td>�ʵe�s��:</td><td><%=strData01%></td></tr>
			<tr><td>������:</td><td><%=strData02%></td></tr>
			<tr><td>�ʮצW��:</td><td><%=strData03%></td></tr>
			<tr><td>�w����:</td><td><%=strData04%></td></tr>
			<tr><td>�ӽг��:</td><td><%=strData05%></td></tr>
			<tr><td>�� �� �H:</td><td><%=strData06%></td></tr>
			<tr><td>�p�e���B:</td><td><%=strData07%></td></tr>
			<tr><td>���ʪ��B:</td><td><%=strData08%></td></tr>
			<tr><td>�M�Ъ��B:</td><td><%=strData09%></td></tr>
			<tr><td>��Ϊ��B:</td><td><%=strData10%></td></tr>
			<tr><td>��f�Ѽ�:</td><td><%=strData11%></td></tr>
			<tr><td>�֩w�v�d:</td><td><%=strData12%></td></tr>
			<tr><td>���ʳ~�|:</td><td><%=strData13%></td></tr>
			<tr><td>���ʳ��:</td><td><%=strData14%></td></tr>
			<tr><td>�ۼФ覡:</td><td><%=strData15%></td></tr>
			<tr><td>�֩w���:</td><td><%=strData16%></td></tr>
			<tr><td>�}�Ф��:</td><td><%=strData17%></td></tr>
			<tr><td>ñ�����:</td><td><%=strData18%></td></tr>
			<tr><td>��f���:</td><td><%=strData19%></td></tr>
			<tr><td>�禬���:</td><td><%=strData20%></td></tr>
			<tr><td>�־P���:</td><td><%=strData21%></td></tr>
			<tr><td>���פ��:</td><td><%=strData22%></td></tr>
          </table>
          <br>  
          <a href="Main_Purchase.jsp">�^�u�ʮ׺޲z�v����</a>
        </div>  
        <%
      }
    } else {
	  %>  
	  <div align="center">
	    <table>
	      <tr>
			<td>�ʮ׽s���G</td>
			<td><%=strData01%><input type="hidden" name="txtData01" value="<%=strData01%>"></td>
		  </tr>
	      <tr>
			<td>�������G</td>
			<td>
			  <SELECT name="txtData02" size="1">
				<%
				  String strSelect = "";				
				  strSelect = ((strData02 != null) && (strData02.equals("�@��"))) ? "selected" : "";
				%>
				<OPTION value="�@��" <%=strSelect%>>�@��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�G��"))) ? "selected" : "";%>
				<OPTION value="�G��" <%=strSelect%>>�G��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�T��"))) ? "selected" : "";%>
				<OPTION value="�T��" <%=strSelect%>>�T��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�|��"))) ? "selected" : "";%>
				<OPTION value="�|��" <%=strSelect%>>�|��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("����"))) ? "selected" : "";%>
				<OPTION value="����" <%=strSelect%>>����</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("����"))) ? "selected" : "";%>
				<OPTION value="����" <%=strSelect%>>����</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�C��"))) ? "selected" : "";%>
				<OPTION value="�C��" <%=strSelect%>>�C��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�K��"))) ? "selected" : "";%>
				<OPTION value="�K��" <%=strSelect%>>�K��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�E��"))) ? "selected" : "";%>
				<OPTION value="�E��" <%=strSelect%>>�E��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�Q��"))) ? "selected" : "";%>
				<OPTION value="�Q��" <%=strSelect%>>�Q��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�Q�@��"))) ? "selected" : "";%>
				<OPTION value="�Q�@��" <%=strSelect%>>�Q�@��</OPTION>
				<%strSelect = ((strData02 != null) && (strData02.equals("�Q�G��"))) ? "selected" : "";%>
				<OPTION value="�Q�G��" <%=strSelect%>>�Q�G��</OPTION>
			  </SELECT>  
			</td>
		  </tr>
	      <tr>
			<td>�ʮצW�١G</td>
			<td><input type="text" name="txtData03" value="<%=strData03%>"></td>
		  </tr>
	      <tr>
			<td>�w���ءG</td>
			<td><input type="text" name="txtData04" value="<%=strData04%>"></td>
		  </tr>
	      <tr>
			<td>���ʳ��G</td>
			<td><input type="text" name="txtData05" value="<%=strData05%>"></td>
		  </tr>
	      <tr>
			<td>�� �� �H�G</td>
			<td><input type="text" name="txtData06" value="<%=strData06%>"></td>
		  </tr>
	      <tr>
			<td>�p�e���B�G</td>
			<td><input type="text" name="txtData07" value="<%=strData07%>">��</td>
		  </tr>
	      <tr>
			<td>���ʪ��B�G</td>
			<td><input type="text" name="txtData08" value="<%=strData08%>">��</td>
		  </tr>
	      <tr>
			<td>�M�Ъ��B�G</td>
			<td><input type="text" name="txtData09" value="<%=strData09%>">��</td>
		  </tr>
	      <tr>
			<td>��Ϊ��B�G</td>
			<td><input type="text" name="txtData10" value="<%=strData10%>">��</td>
		  </tr>
		  <tr align="center">
			<td align="right">��f�ѼơG</td>
		 	<td align="left"><input type="text" name="txtData11" size="10" value="<%=strData11%>"></td>
		  </tr>
		  <tr align="center">
			<td align="right">�֩w�v�d�G</td>
		 	<td align="left">
		 	  <SELECT name="txtData12" size="1">
				<%strSelect = ((strData12 != null) && (strData12.equals("�����"))) ? "selected" : "";%>
				<OPTION value="�����" <%=strSelect%>>�����</OPTION>
				<%strSelect = ((strData12 != null) && (strData12.equals("�W�ų��"))) ? "selected" : "";%>
				<OPTION value="�W�ų��" <%=strSelect%>>�W�ų��</OPTION>
		 	  </SELECT>
		 	</td>
		  </tr>
		  <tr align="center">
			<td align="right">���ʳ~�|�G</td>
		 	<td align="left">
		 	  <SELECT name="txtData13" size="1">
				<%strSelect = ((strData13 != null) && (strData13.equals("����"))) ? "selected" : "";%>
				<OPTION value="����" <%=strSelect%>>����</OPTION>
		 	  </SELECT>
		 	</td>
		  </tr>
		  <tr align="center">
			<td align="right">���ʳ��G</td>
		 	<td align="left">
		 	  <SELECT name="txtData14" size="1">
				<%strSelect = ((strData14 != null) && (strData14.equals("���ʲ�"))) ? "selected" : "";%>
				<OPTION value="���ʲ�" <%=strSelect%>>���ʲ�</OPTION>
		 	  </SELECT>
		 	</td>
		  </tr>
		  <tr align="center">
			<td align="right">�ۼФ覡�G</td>
		 	<td align="left">
		 	  <SELECT name="txtData15" size="1">
				<%strSelect = ((strData15 != null) && (strData15.equals("�p�B����"))) ? "selected" : "";%>
				<OPTION value="�p�B����" <%=strSelect%>>�p�B����</OPTION>
				<%strSelect = ((strData15 != null) && (strData15.equals("�@�P����"))) ? "selected" : "";%>
				<OPTION value="�@�P����" <%=strSelect%>>�@�P����</OPTION>
				<%strSelect = ((strData15 != null) && (strData15.equals("���}�x�D"))) ? "selected" : "";%>
				<OPTION value="���}�x�D" <%=strSelect%>>���}�x�D</OPTION>
				<%strSelect = ((strData15 != null) && (strData15.equals("�e�s"))) ? "selected" : "";%>
				<OPTION value="�e�s" <%=strSelect%>>�e�s</OPTION>
		 	  </SELECT>
		 	</td>
		  </tr>
	  	  <tr align="center">
			<td align="right">�֩w����G</td>
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
			<td align="right">�}�Ф���G</td>
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
			<td align="right">ñ������G</td>
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
			<td align="right">��f����G</td>
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
			<td align="right">�禬����G</td>
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
			<td align="right">�־P����G</td>
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
			<td align="right">���פ���G</td>
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
			  <td align="center"><input type="submit" name="BtnSend" value="�T�{�ק��ʮ�"></td>
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
