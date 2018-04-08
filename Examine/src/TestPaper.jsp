<%@page language="java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="TrueFalse, MultiChoice, myMath"%>
<%
  String nickname = request.getParameter("txtName");
  String ini_file = request.getRealPath("./") + "Examine.ini";
%>

<html>

<head><title>試題作答</title></head>

<body>
  <%
    // 從是非題 Table 中取出題目
    String sqlstr = "select * From TrueFalse Order By Title";
    TrueFalse tf = new TrueFalse(ini_file);
    tf.RecordsPerPage(20);  // 取出20題
    int result = tf.getResults(sqlstr);

    // 先以亂數取題
    myMath mm = new myMath();
    int range = tf.Records();       // 取題的範圍不可以超過資料表的最大紀錄筆數
    int rows = tf.RecordsPerPage();
    int[] array = mm.getRandomNumber(range, rows);
    mm.BubbleSort(array);
    String[][] data = tf.getData(array);
    tf.CloseConnection();
  %>
  <form action="Score.jsp" name="frmTestPaper" method="post">
    <center><font face="標楷體" size="5">丙級軟體應用學科模擬測驗</font></center>
    <font face="標楷體" size="4">姓名：<%=nickname%></font><hr>

    <table border="0">
      <tr><td colspan="5" align="left">一、是非題</td></tr>
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
         <input type="radio" name="<%=strTF%>" value='1' checked>對
       </td>
       <td valign="top" align="left">
         <input type="radio" name="<%=strTF%>" value='0'>錯
       </td>
       <td valign="top" align="left"><%=data[i][1]%></td>
      </tr> 
      <%  
        }
      %>
    </table>

  <%
    // 從選擇題 Table 中取出題目
    sqlstr = "select * From MultiChoice Order By Title";
    MultiChoice mc = new MultiChoice(ini_file);
    mc.RecordsPerPage(20);
    result = mc.getResults(sqlstr);

    // 先以亂數取題
    range = mc.Records();       // 取題的範圍不可以超過資料表的最大紀錄筆數
    rows = mc.RecordsPerPage();
    array = mm.getRandomNumber(range, rows);
    mm.BubbleSort(array);
    data = mc.getData(array);
    mc.CloseConnection();
  %>  
    <table border="0">
      <tr><td colspan="6" align="left">二、選擇題</td></tr>
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
     <input type="submit" name="Send" value="寫好計分">
     <input type="reset" name="Reset" value="我要重寫">
    </center>
  </form>
  
</body>

</html>
