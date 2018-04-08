<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="TrueFalse, MultiChoice, myMath"%>
<%
  // ���X�O�D�D���D�ؽs��
  String[] strTFQus = request.getParameterValues("TF_Qus");
  String[] strMCQus = request.getParameterValues("MC_Qus");

  // �]�w ini �ɪ���m
  String ini_file = request.getRealPath("./") + "Examine.ini";
%>  

<html>
<head><title>�ڬO�p����ƪ�����</title></head>

<body>

<script language="javascript">
<!--
  function OpenWindow(msg)
  {
    mywin = window.open("", "myWindow","top=300,left=300,width=480,height=200");
    mywin.document.write(msg);
  }  
    
//-->
</script>

  <form action="errTitle.jsp" name="frmScore" method="post">
  <p>�ڬO�p����ƪ�����...</p>
  <%
    String sqlstr = "select * From TrueFalse Order By Title";
    TrueFalse tf = new TrueFalse(ini_file);
    int result = tf.getResults(sqlstr);

    int rows = strTFQus.length;                    // �����D���h�ֵ��O��
    int[] nQues = new int[rows];                   // �x�s�üƿ��D���D�ؽs��
    for (int i=0; i<rows; i++) 
      nQues[i] = Integer.parseInt(strTFQus[i]);    

    String[][] strQues = tf.getData(nQues);        // �̾��D�ؽs�����X���שM�D��
  %>
  
  �O�D�D<br>
  <table border="1">
    <tr>
      <td>�D�ظ��X</td>
      <%
        for (int i=0; i<rows; i++) 
        {
          String msg = "(";
          msg += (strQues[i][0].trim().equals("1")) ? "O" : "X";
          msg += ") " + strQues[i][1].trim();
          String click_data = "OpenWindow('" + msg + "')";
      %>
          <td width="20" align="center">
            <a href="javascript:void[0]" onclick="<%=click_data%>"><%=(i+1)%></a>
          </td>
      <%  
        }  
      %>
    </tr>
    <tr>
      <td>���T����</td>
      <%
        for (int i=0; i<rows; i++)
        {
          String msg = "";      
          int ans = Integer.parseInt(strQues[i][0]);
          msg = (ans == 1) ? "O" : "X";
          out.print("<td align='center'>"+msg+"</td>");
        }
      %>
    </tr>
    <tr>
      <td>�A������</td>
      <%
        int[] your_ans = new int[rows];
        for (int i=0; i<rows; i++)
        {
          String msg = "";
          your_ans[i] = Integer.parseInt(request.getParameter("TF_"+strTFQus[i]));
          msg = (your_ans[i] == 1) ? "O" : "X";
          out.print("<td align='center'>"+msg+"</td>");
        }
        int score1 = tf.getScore(nQues, your_ans);
      %>
    </tr>    
  </table>
  <br>�A���o���G<%=score1%><hr>
  
  <%
    tf.CloseConnection();
  %>
  
  <%
    sqlstr = "select * From MultiChoice Order By Title";
    MultiChoice mc = new MultiChoice(ini_file);
    result = mc.getResults(sqlstr);

    rows = strMCQus.length;                        // �����D���h�ֵ��O��
    nQues = new int[rows];                         // �x�s�üƿ��D���D�ؽs��
    for (int i=0; i<rows; i++) 
      nQues[i] = Integer.parseInt(strMCQus[i]);    

    strQues = mc.getData(nQues);        // �̾��D�ؽs�����X���שM�D��
  %>
  
  ����D<br>
  <table border="1">
    <tr>
      <td>�D�ظ��X</td>
      <%
        for (int i=0; i<rows; i++) 
        {
          String msg = "(" + strQues[i][0] + ") " + strQues[i][1] + "<br><br>";
          msg += "�@�@" + strQues[i][2] + "<br>";
          msg += "�@�@" + strQues[i][3] + "<br>";
          msg += "�@�@" + strQues[i][4] + "<br>";
          msg += "�@�@" + strQues[i][5];
          String click_data = "OpenWindow('" + msg + "')";
      %>
          <td width="20" align="center">
            <a href="javascript:void[0]" onclick="<%=click_data%>"><%=(i+1)%></a>
          </td>
      <%  
        }  
      %>
    </tr>
    <tr>
      <td>���T����</td>
      <%
        for (int i=0; i<rows; i++)
        {
          String msg = "";      
          int ans = Integer.parseInt(strQues[i][0]);
          out.print("<td align='center'>" + ans + "</td>");
        }
      %>
    </tr>
    <tr>
      <td>�A������</td>
      <%
        your_ans = new int[rows];
        for (int i=0; i<rows; i++)
        {
          String msg = "";
          your_ans[i] = Integer.parseInt(request.getParameter("MC_"+strMCQus[i]));
          out.print("<td align='center'>" + your_ans[i] + "</td>");
        }
        int score2 = mc.getScore(nQues, your_ans);
      %>
    </tr>    
  </table>
  <br>�A���o���G<%=score2%>
  <%
    mc.CloseConnection();
  %>
  <hr>
  �`���G<%=score1+score2%>

  </form>

</body>

</html>

























