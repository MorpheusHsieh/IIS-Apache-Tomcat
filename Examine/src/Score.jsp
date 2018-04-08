<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="TrueFalse, MultiChoice, myMath"%>
<%
  // 取出是非題的題目編號
  String[] strTFQus = request.getParameterValues("TF_Qus");
  String[] strMCQus = request.getParameterValues("MC_Qus");

  // 設定 ini 檔的位置
  String ini_file = request.getRealPath("./") + "Examine.ini";
%>  

<html>
<head><title>我是計算分數的網頁</title></head>

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
  <p>我是計算分數的網頁...</p>
  <%
    String sqlstr = "select * From TrueFalse Order By Title";
    TrueFalse tf = new TrueFalse(ini_file);
    int result = tf.getResults(sqlstr);

    int rows = strTFQus.length;                    // 先知道有多少筆記錄
    int[] nQues = new int[rows];                   // 儲存亂數選題的題目編號
    for (int i=0; i<rows; i++) 
      nQues[i] = Integer.parseInt(strTFQus[i]);    

    String[][] strQues = tf.getData(nQues);        // 依據題目編號取出答案和題目
  %>
  
  是非題<br>
  <table border="1">
    <tr>
      <td>題目號碼</td>
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
      <td>正確答案</td>
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
      <td>你的答案</td>
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
  <br>你的得分：<%=score1%><hr>
  
  <%
    tf.CloseConnection();
  %>
  
  <%
    sqlstr = "select * From MultiChoice Order By Title";
    MultiChoice mc = new MultiChoice(ini_file);
    result = mc.getResults(sqlstr);

    rows = strMCQus.length;                        // 先知道有多少筆記錄
    nQues = new int[rows];                         // 儲存亂數選題的題目編號
    for (int i=0; i<rows; i++) 
      nQues[i] = Integer.parseInt(strMCQus[i]);    

    strQues = mc.getData(nQues);        // 依據題目編號取出答案和題目
  %>
  
  選擇題<br>
  <table border="1">
    <tr>
      <td>題目號碼</td>
      <%
        for (int i=0; i<rows; i++) 
        {
          String msg = "(" + strQues[i][0] + ") " + strQues[i][1] + "<br><br>";
          msg += "　　" + strQues[i][2] + "<br>";
          msg += "　　" + strQues[i][3] + "<br>";
          msg += "　　" + strQues[i][4] + "<br>";
          msg += "　　" + strQues[i][5];
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
      <td>正確答案</td>
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
      <td>你的答案</td>
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
  <br>你的得分：<%=score2%>
  <%
    mc.CloseConnection();
  %>
  <hr>
  總分：<%=score1+score2%>

  </form>

</body>

</html>

























