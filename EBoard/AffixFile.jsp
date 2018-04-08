<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MyDir2"%>

<%
  // 基本參數設定
  //String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
  String strMySelf = "AffixFile.jsp";
%>

<html>

<head>
  <title>附屬檔案</title>
  <script type="text/javascript" language="javascript" src="window.js"></script>
</head>

<%
  // 流程判斷
  String send = request.getParameter("Send");
  if (send != null && send.length()>0)
  {
    if (send.equals("增加附加檔案"))
    {
      out.print("增加附加檔案");
      %>
      <Script Language="JavaScript">
      <!--
        document.write(msgWin.frmAffixFile.txtFileName.value);
        CloseWin();
      //-->
      </Script>
      <%
    }
    else if (send.equals("刪除附加檔案"))
    {
    }
  }
%>

<body>
<p>我是<font color="#0000FF">增加附屬檔案</font>的頁面...</p>

<form name="ftmAffixFile" method="post" action="<%=strMySelf%>">
  <div align="center">
  <table border="1">
    <tr>
      <td>請輸入檔案名稱：</td>
      <td>
        <select name="txtFileName">
          <option value="" selected>
          <%
            String file_path = request.getRealPath("./Files");
            MyDir2 md = new MyDir2(file_path);
            String[] files = md.getFileList();
          
            for (int i=0; i<files.length; i++)
              out.print("<option value=\""+files[i]+"\">"+files[i]+"</option>\r\n");
          %>
        </select>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" name="Send" value="增加附加檔案">
        <input type="submit" name="Send" value="刪除附加檔案">
      </td>  
    </tr>
  </table>
  </div>
</form>

</body>
</html>
