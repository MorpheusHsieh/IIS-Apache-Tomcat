<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="MyDir2"%>

<%
  // �򥻰ѼƳ]�w
  //String ini_file = request.getRealPath("/") + "EBoard\\EBoard.ini";
  String strMySelf = "AffixFile.jsp";
%>

<html>

<head>
  <title>�����ɮ�</title>
  <script type="text/javascript" language="javascript" src="window.js"></script>
</head>

<%
  // �y�{�P�_
  String send = request.getParameter("Send");
  if (send != null && send.length()>0)
  {
    if (send.equals("�W�[���[�ɮ�"))
    {
      out.print("�W�[���[�ɮ�");
      %>
      <Script Language="JavaScript">
      <!--
        document.write(msgWin.frmAffixFile.txtFileName.value);
        CloseWin();
      //-->
      </Script>
      <%
    }
    else if (send.equals("�R�����[�ɮ�"))
    {
    }
  }
%>

<body>
<p>�ڬO<font color="#0000FF">�W�[�����ɮ�</font>������...</p>

<form name="ftmAffixFile" method="post" action="<%=strMySelf%>">
  <div align="center">
  <table border="1">
    <tr>
      <td>�п�J�ɮצW�١G</td>
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
        <input type="submit" name="Send" value="�W�[���[�ɮ�">
        <input type="submit" name="Send" value="�R�����[�ɮ�">
      </td>  
    </tr>
  </table>
  </div>
</form>

</body>
</html>
