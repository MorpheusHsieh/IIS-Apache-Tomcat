      <%
        if (strRadio != null)
        {
          String strMesg = "";
          String strName = request.getParameter("txtName_" + strRadio);
          String strPswd = request.getParameter("txtPswd_" + strRadio);
          String strUnit = request.getParameter("txtUnit_" + strRadio);
          String strRole = request.getParameter("txtRole_" + strRadio);

          if (isDebug)
          {
            out.print("Radio: " + strRadio + "<br>");
            out.print("Name: " + strName + "<br>");
            out.print("Password: " + strPswd + "<br>");
            out.print("Unit: " + strUnit + "<br>");
            out.print("Role: " + strRole + "<br>");
          }
          %>
          <div align="center">
            <table>
              <tr>
                <td></td>
              </tr>
            </table>
          </div>
          <%  
        }
        else
        {
          out.print("您尚未選擇任何要修改的帳號名稱...<br>");
          %>
          <div align="center">
            <a href="../Account/AcntManager.jsp">回帳號管理頁面</a>
          </div>  
          <%
        }
      %>