<%
  String strQuery = request.getParameter("txtQuery");
  boolean isExecuteQuery = ((strQuery != null) && (strQuery.length() > 0));
%>
<table border="0" width="100%">
  <tr>
    <td align="center">
      <%
        if (!isExecuteQuery) strQuery = "";

        out.print("<input type=\"text\" name=\"txtQuery\" size=\"40\" value=\""+strQuery+"\">");
        out.print("<input type=\"submit\" name=\"BtnSend\" value=\"¬d¡@¡@¸ß\">");
      %>
    </td>
  </tr>
</table>
