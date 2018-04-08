        <%
          if (isDebug) out.print("Radio Value: " + strRadio + "<br>");
          
          if (strRadio != null)
          {
            String strMesg = "", strTxtName = "";

            strTxtName = "txtData01_" + strRadio;
            String strData01 = request.getParameter(strTxtName);
            if (isDebug) out.print("1: " + strTxtName + ", " + strData01 + "<br>");

            strTxtName = "txtData02_" + strRadio;
            String strData02 = request.getParameter(strTxtName);
            if (isDebug) out.print("2: " + strTxtName + ", " + strData02 + "<br>");
          
            int result = clsBudget.DeleteBudget(strData01);
            if (result > 0) 
            {
              strMesg += ("預算科目：" + strData01 + "<br>");
              strMesg += ("預算名稱：" + strData02 + "<br>");
              strMesg += ("的資料已經刪除...<br>");
			}              

            nRowsCount = clsBudget.QueryForAllRows();
            if (strMesg != null && strMesg.length() > 0)
            {
              out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
              %>
              <script Language="JavaScript">
              <!--
                PopupWindow(240, 160, "no", "no", "no", "yes");
                msgWin.document.write(document.frmBudgetMng.Message.value);
              //-->
              </Script>
             <%
            }
          } else {
            %>
            <p>
              <a href="../Budget/BudgetMng.jsp">回預算管理頁面</a>
            </p>  
            <%
          }
        %>  
