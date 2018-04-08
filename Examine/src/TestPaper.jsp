<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="TrueFalse, MultiChoice, myMath"%>
<%
  String nickname = request.getParameter("txtName");
  String ini_file = request.getRealPath("./") + "Examine.ini";
%>

<html>

<head><title>���D�@��</title></head>

<body>
  <%
    // �q�O�D�D Table �����X�D��
    String sqlstr = "select * From TrueFalse Order By Title";
    TrueFalse tf = new TrueFalse(ini_file);
    tf.RecordsPerPage(20);  // ���X20�D
    int result = tf.getResults(sqlstr);

    // ���H�üƨ��D
    myMath mm = new myMath();
    int range = tf.Records();       // ���D���d�򤣥i�H�W�L��ƪ��̤j��������
    int rows = tf.RecordsPerPage();
    int[] array = mm.getRandomNumber(range, rows);
    mm.BubbleSort(array);
    String[][] data = tf.getData(array);
    tf.CloseConnection();
  %>
  <form action="Score.jsp" name="frmTestPaper" method="post">
    <center><font face="�з���" size="5">���ųn�����ξǬ��������</font></center>
    <font face="�з���" size="4">�m�W�G<%=nickname%></font><hr>

    <table border="0">
      <tr><td colspan="5" align="left">�@�B�O�D�D</td></tr>
      <%
        String strTF = "";
        for (int i=0; i<rows; i++)
        {
          strTF = "TF_" + array[i];
          out.print("<input type='hidden' name='TF_Qus' value='" + array[i] + "'>");
        
      %>
      <tr>
       <td width="36"></td>
       <td valign="top" align="right"><%=i+1%>.</td>
       <td valign="top" align="left">
         <input type="radio" name="<%=strTF%>" value='1' checked>��
       </td>
       <td valign="top" align="left">
         <input type="radio" name="<%=strTF%>" value='0'>��
       </td>
       <td valign="top" align="left"><%=data[i][1]%></td>
      </tr> 
      <%  
        }
      %>
    </table>

  <%
    // �q����D Table �����X�D��
    sqlstr = "select * From MultiChoice Order By Title";
    MultiChoice mc = new MultiChoice(ini_file);
    mc.RecordsPerPage(20);
    result = mc.getResults(sqlstr);

    // ���H�üƨ��D
    range = mc.Records();       // ���D���d�򤣥i�H�W�L��ƪ��̤j��������
    rows = mc.RecordsPerPage();
    array = mm.getRandomNumber(range, rows);
    mm.BubbleSort(array);
    data = mc.getData(array);
    mc.CloseConnection();
  %>  
    <table border="0">
      <tr><td colspan="6" align="left">�G�B����D</td></tr>
      <%
        String strMC = "";
        for (int i=0; i<rows; i++)
        {
          strMC = "MC_" + array[i];
          out.print("<input type='hidden' name='MC_Qus' value='" + array[i] + "'>");          
          
      %>
      <tr>
       <td width="36"></td>
       <td valign="top" align="right"><%=i+1%>.</td>
       <td colspan="4" valign="top" align="left"><%=data[i][1]%></td>
      </tr> 
      <tr>
       <td colspan="2" width="36"></td>
       <td><input type="radio" name="<%=strMC%>" value='1' checked></td>
       <td valign="top" align="left"><%=data[i][2]%></td>
       <td><input type="radio" name="<%=strMC%>" value='2'></td>
       <td valign="top" align="left"><%=data[i][3]%></td>
      </tr>
      <tr>
       <td colspan="2" width="36"></td>
       <td><input type="radio" name="<%=strMC%>" value='3'></td>
       <td valign="top" align="left"><%=data[i][4]%></td>
       <td><input type="radio" name="<%=strMC%>" value='4'></td>
       <td valign="top" align="left"><%=data[i][5]%></td>
      </tr>
    <%  
      }
    %>
    </table>
    <hr>
    <center>
     <input type="submit" name="Send" value="�g�n�p��">
     <input type="reset" name="Reset" value="�ڭn���g">
    </center>
  </form>
  
</body>

</html>
