<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MsgBoard01"%>

<%
  // �򥻰ѼƳ]�w
  String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
  String strMySelf = "MsgBoard.jsp";
 
  String sUserName = (String)session.getAttribute("UserName");
  String sDepartment = (String)session.getAttribute("Department");
  String sRoleCode = (String)session.getAttribute("RoleCode");
  int iRoleCode = Integer.parseInt(sRoleCode);
  int iShowTitleLen = 20;

  //out.print("�b���G" + UserName + "<br>");
  //out.print("����s�եN���G" + iRoleCode + "<br>");  
%>

<%
  // �����B�z�{��
  MsgBoard01 mb01 = new MsgBoard01(ini_file);
  mb01.setRecordsPerPage(10);
  mb01.OpenConnection();
  int iMesgCount = mb01.QueryAllMessage();
  mb01.CloseConnection();
  
  int iPageNo = -1;
  int iTotalRecs = mb01.getRecords();
  int iRecsPerPage = mb01.getRecordsPerPage();
  int iTotalPage = mb01.getTotalPages();
%>

<html>
<head>
  <title>�ڬO���i�t�Ϊ��D�e��</title>
  <script type="text/javascript" language="javascript" src="window.js"></script>  
</head>

<body>

<p>�ڬO<font color="#0000FF">���i�t�Ϊ��D�e��</font>...</p>

<form name="frmMsgBoard" method="post" action="<%=strMySelf%>">

<%
 if (iMesgCount > 0)
 {
  %>
  <table border="1" width="100%">
    <tr>
    <%
      String ClickData = "PopupWin('./ChangePswd.jsp',480, 240)";
    %>
    <td align="left">[<a href="JavaScript:void[0]" onClick="<%=ClickData%>">���ӤH�K�X</a>]&nbsp&nbsp
    <%
      if (sDepartment.equals("��F��") || iRoleCode == 1)
        out.print("[<a href=\"MsgNewMesg.jsp\">�o�G�T��</a>]");
    %>
    </td>
    <tr>
      <td>
        <%@ include file="ShowPageTitle.inc"%>
      </td>    
    </tr>
    <tr>
      <td>
        <table border="1" width="100%">
          <tr>
            <td>����</td></td><td>���D</td><td>�^����</td><td>�o�G�H</td><td>�o�G�ɶ�</td>
          </tr>
          <%
            mb01.GotoPage(iPageNo);
            String[][] data = mb01.getOnePageRecord();
            int rows = data.length;
            if (rows > 0)
            {
              for (int i=0; i<rows; i++)
              {
                out.print("<tr>");
                out.print("  <td align=\"right\" width=\"24\">");
                out.print(     ((iPageNo-1)*iRecsPerPage)+i+1);
                out.print("  </td>");
                
                // �p�G���D�����פj�� iShowTitleLen �ܼ�, �h�� iShowTitleLen ���ת����D
                String strTitle = null;
                if (data[i][1].length() > iShowTitleLen)
                  strTitle = data[i][1].substring(0,iShowTitleLen) + "...";
                else
                  strTitle = data[i][1];
                out.print("  <td align=\"left\">");
                out.print("    <a href=\"MsgContent.jsp?SunDayCode="+data[i][0]+"\">"+strTitle+"</a>");
                out.print("  </td>");
                out.print("  <td align=\"right\" width=\"60\">");
                out.print(     data[i][4]);
                out.print("  </td>");
                out.print("  <td align=\"left\" width=\"100\">");
                out.print(     data[i][2]);
                out.print("  </td>");
                out.print("  <td align=\"left\" width=\"160\">");
                out.print(     data[i][3]);
                out.print("  </td>");                            
                out.print("</tr>");
              }
            }
          %>
        </table>
      </td>  
    </tr>
  </table>
  <%
 }
 else
 {
   out.print("�|�L���󤽧i�T��...<br>");
   if (sDepartment.equals("��F��") || iRoleCode == 1)
      out.print("<div align=\"center\"><a href=\"MsgNewMesg.jsp\">�ڭn�o�G�s�T��</a></div>");
 }     
 out.print("<p><div align=\"center\"><a href=\"Login.jsp\">�^�n�J����</a></div></p>");
%>
  
</form>
</body>

















































































