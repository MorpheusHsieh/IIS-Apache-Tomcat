<%@page language="Java"%>
<%@page contentType="text/html;charset=big5"%>
<%@page import="Procurement.Plane"%>
<%@page import="Procurement.Purchase"%>

<!-- �P�_ Session �O�_���n�J��T //-->
<%@include file="../../Utility/CheckSession.inc"%>

<!-- �إ߷s����  //-->
<%
  boolean isDebug = false;
  String strMySelf = "TransPlane.jsp";
  Purchase clsPurchase = new Purchase();

  String strSend= "";
  String strData01 = "", strData02 = "", strData03 = "";
  String strData04 = "", strData05 = "", strData06 = "";
  String strData07 = "", strData08 = "";

  request.setCharacterEncoding("big5");
  strSend = (String)request.getAttribute("BtnSend");
  if (strSend != null && strSend.equals("�ಾ�p�e��"))
  {
    strData01 = (String)request.getAttribute("txtData01");
    strData02 = (String)request.getAttribute("txtData02");
    strData03 = (String)request.getAttribute("txtData03");
    strData04 = (String)request.getAttribute("txtData04");
    strData05 = (String)request.getAttribute("txtData05");
    strData06 = (String)request.getAttribute("txtData06");
    strData07 = (String)request.getAttribute("txtData07");
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
    out.print("�p�e�s��: " + strData01 + "<br>");
    out.print("������: " + strData02 + "<br>");
    out.print("�p�e�W��: " + strData03 + "<br>");
    out.print("�w����: " + strData04 + "<br>");
    out.print("���ʳ��: " + strData05 + "<br>");
    out.print("�� �� �H: " + strData06 + "<br>");
    out.print("�p�e���B: " + strData07 + "<br>");
  }
%>

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="/Procurement/Utility/Window.js"></script>
  <script type="text/javascript" language="javascript">
    <!--
    function DataCheck()
    {
      // �P�_�u�ʮ׽s���v�O�_���ť�
      if (frmTransPlane.txtData01.value == "")
      {
        window.alert("�u�p�e�s���v���i�H�O�ť�...");
        document.frmTransPlane.elements[1].focus();
        return;
      }

      document.frmTransPlane.BtnSend.value = "�T�{�ಾ�p�e��";
      document.frmTransPlane.submit();
    }
    //-->
  </script>    
  <title>�ಾ�p�e���ʮ�</title>
</head>

<body>

<form name="frmTransPlane" method="post" action="<%=strMySelf%>">

  <input type="hidden" name="BtnSend" value="">
  <input type="hidden" name="txtData01" value="<%=strData01%>">
  
  <p>�ڬO<font color="#0000ff">�ಾ�p�e���ʮ�</font>������...</p>

  <%
    String strMesg = "";
    
    if (strSend != null && strSend.equals("�T�{�ಾ�p�e��"))
    {
      if (isDebug) out.print("�z��ܤF�u" + strSend + "�v���\��...");
  
      long lData07 = (strData07 != null) ? Long.parseLong(strData07) : 0;
      int result = clsPurchase.NewRecord(strData08, strData02, strData03,
                   strData04, strData05, strData06, lData07);
                 
      if (result > 0)
      {
        strMesg += ("�ʮ׽s���G" + strData01 + "<br>");
        strMesg += ("����ಾ����...<br>");

        Plane clsPlane = new Plane();
        result = clsPlane.DeletePlane(strData01);
        if (result > 0) {
          strMesg += ("<br>�p�e�s���G" + strData01 + "<br>");
          strMesg += ("�������w�g�R��...<br>");
        }  
      }  
      else {
        strMesg += ("�ʮ׽s���G" + strData01 + "<br>");
        strMesg += ("����ಾ����...<br>");
      }  

      if (strMesg != null && strMesg.length() > 0)
      {
        out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
        %>
        <script Language="JavaScript">
        <!--
          PopupWindow(240, 160, "no", "no", "no", "yes");
          msgWin.document.write(document.frmTransPlane.Message.value);
        //-->
        </Script>

        <div align="center">
          <a href="Main_Plane.jsp">�^�u�p�e�׺޲z�v����</a>
        </div>  
        <%
      }
    } else {
	  %>  
	  <div align="center">
	    <table>
	      <tr>
			<td>�ʮ׽s���G</td>
			<td><input type="text" name="txtData08" value="<%=strData08%>"></td>
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
			<td><input type="text" name="txtData07" value="<%=strData07%>"></td>
		  </tr>
		</table>
		<p align="center">
		  <table border="0" width="100%">
			<tr>
			  <td align="center">
			    <input type="button" name="button1" value="�T�{�ಾ�p�e��" onClick="DataCheck()">
			  </td>
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
