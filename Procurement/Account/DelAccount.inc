      <%
        String strName = request.getParameter("rdoOption");
        if (strName != null)
        {
          String strMesg = "";
          String strTxtName = "txtName_" + strName;
          String strUserName = request.getParameter(strTxtName);
          
          int result = clsAcnt.DeleteAccount(strUserName);
          if (result > 0)
            strMesg += (strName + " 已經刪除...<br>");

          iRows = clsAcnt.QueryForAllRows();
          if (strMesg != null && strMesg.length() > 0)
          {
            out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
            %>
            <script Language="JavaScript">
            <!--
              PopupWindow(240, 160, "no", "no", "no", "yes");
              msgWin.document.write(document.frmAcntMgn.Message.value);
            //-->
            </Script>
           <%
          }
        } else {
          out.print("您尚未選擇任何要刪除的帳號名稱...<br>");
          %>
          <div align="center">
            <a href="../Account/AcntManager.jsp">回帳號管理頁面</a>
          </div>  
          <%
        }
      %>  
