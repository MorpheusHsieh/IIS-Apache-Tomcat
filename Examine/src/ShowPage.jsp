<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="TrueFalse, MultiChoice"%>
<%
  String strMySelf = "ShowPage.jsp";
  String ini_file = request.getRealPath("./") + "Examine.ini";
  String strQusCls = (String)session.getValue("QusClass");
  String strTitle = (String)session.getValue("Title");
  int nPagesPerShow = 10;
%>
<html>

<head><title>�ڷ|����D�ؤ���</title></head>

<body><p>�ڷ|����D�ؤ���</p>

<%
  if (strQusCls.equals("�O�D�D"))
  {
    TrueFalse tf = new TrueFalse(ini_file);
    String sqlstr = "SELECT * FROM TrueFalse Order By Title";
    int result = tf.getResults(sqlstr);

    // �p��n��ܲĴX��
    int pages = tf.Pages();
    int rec = -1, recs = tf.Records();
    for (int i=0; i<recs; i++)
    {
      if (strTitle.equals(tf.Title(i)))
      {
        rec = i;
        break;
      }  
    }
    int page_num = -1;
    String strPage = request.getParameter("Page");
    page_num = (strPage != null) ? Integer.parseInt(strPage) : (rec/10)+1;
    page_num = (page_num < 1) ? 1 : page_num;
    page_num = (page_num > pages) ? pages : page_num;
    int[] nQues = tf.GotoPage(page_num);
    String[][] data = tf.getData(nQues);    
    tf.CloseConnection();
  
    int start_page;
    int end_page;  
%>
    <form name="frmShoPage1" method="post" action="<%=strMySelf%>">
    <%
      String locate="left";
    %>
    <%@ include file = "ShowPageTitle.inc"%>
    <table  border="1" width="100%">
    <tr>
      <td></td>
      <td align="center" valign="center">�D��</td>
      <td align="center" valign="center">����</td>
      <td align="center" valign="center">�D��</td>
    </tr> 
    <%
      int rows = data.length;
      for (int i=0; i<rows; i++)
      {
        String msg = "";
        if (strTitle.equals(data[i][1]))      
          msg = "<tr bgcolor=#ff0000>";
        else  
          msg = "<tr bgcolor=#ffff99>";        
        msg += "<td valign='top' align='center'>";
        msg +=   "<input type='radio' name='QusNum' value='" + nQues[i] + "' ";
        msg +=     (i == page_num-1) ? "checked>" : ">";
        msg += "</td>";
        msg += "<td valign='top' align='center'>" + nQues[i] + "</td>";
        msg += "<td valign='top' align='center'>";
        msg +=  (Integer.parseInt(data[i][0]) == 1) ? "O" : "X";
        msg += "</td>";
        msg += "<td valign='top' align='left'>" + data[i][1] + "</td>";
        msg += "</tr>";
        out.print(msg);
      }
    %>
    </table>
    <%
      locate="right";
    %>
    <%@ include file = "ShowPageTitle.inc"%>
    <p></p>
    </form>
<%
  }
  else if (strQusCls.equals("����D"))
  {
    MultiChoice mc = new MultiChoice(ini_file);
    String sqlstr = "SELECT * FROM MultiChoice Order By Title";
    int result = mc.getResults(sqlstr);
     
    // �p��n��ܲĴX��
    int pages = mc.Pages();
    int rec = -1, recs = mc.Records();
    for (int i=0; i<recs; i++)
    {
      if (strTitle.equals(mc.Title(i)))
      {
        rec = i;
        break;
      }  
    }
    int page_num = (rec/10)+1;
    page_num = (page_num < 1) ? 1 : page_num;
    page_num = (page_num > pages) ? pages : page_num;
      
    int[] nQues = mc.GotoPage(page_num);
    String[][] data = mc.getData(nQues);
    mc.CloseConnection();
  
    int start_page;
    int end_page;  
%>
    <form name="frmShoPage2" method="post" action="<%=strMySelf%>">
    <%
      String locate="left";
    %>
    <%@ include file = "ShowPageTitle.inc"%>
    <table  border="1" width="100%">
    <tr>
      <td></td>
      <td align="center" valign="center">�D��</td>
      <td align="center" valign="center">����</td>
      <td align="center" valign="center">�D��</td>
      <td align="center" valign="center" colspan="4">�ﶵ</td>      
    </tr> 
    <%
      int rows = data.length;
      for (int i=0; i<rows; i++)
      {
        String msg = "";
        if (strTitle.equals(data[i][1]))      
          msg = "<tr bgcolor=#ff0000>";
        else  
          msg = "<tr bgcolor=#ffff99>";
        msg +=  "<td valign='top' align='center'>";
        msg +=   "<input type='radio' name='QusNum' value='" + nQues[i] + "'";
        msg +=    (i == page_num-1) ? " checked" : "";
        msg +=   "></td>";
        msg += " <td valign='top' align='center'>" + nQues[i] + "</td>";
        msg += " <td valign='top' align='center'>" + data[i][0] + "</td>";
        msg += " <td valign='top' align='left'>" + data[i][1] + "</td>";
        msg += " <td valign='top' align='left'>" + data[i][2] + "</td>";
        msg += " <td valign='top' align='left'>" + data[i][3] + "</td>";
        msg += " <td valign='top' align='left'>" + data[i][4] + "</td>";
        msg += " <td valign='top' align='left'>" + data[i][5] + "</td>";
        msg += "</tr>";
        out.print(msg);
      }
    %>
    </table>
    <%
      locate="right";
    %>
    <%@ include file = "ShowPageTitle.inc"%>
    <p></p>
    </form>
<%  
  }
%>
    
    
  
</body>

</html>



