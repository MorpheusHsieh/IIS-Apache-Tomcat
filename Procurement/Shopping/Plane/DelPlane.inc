        <%
          if (isDebug) out.print("Radio Value: " + strRadio + "<br>");
          
          if (strRadio != null)
          {
            String strMesg = "", strTxtName = "";

            strTxtName = "txtData01_" + strRadio;
            String strData01 = request.getParameter(strTxtName);
            if (isDebug) out.print("1: " + strTxtName + ", " + strData01 + "<br>");

            int result = clsPlane.DeletePlane(strData01);
            if (result > 0) 
            {
              strMesg += ("計畫編號：" + strData01 + "<br>");
              strMesg += ("的資料已經刪除...<br>");
			}              

            nRowsCount = clsPlane.QueryForAllRows();
            if (strMesg != null && strMesg.length() > 0)
            {
              out.print("<input type=\"hidden\" name=\"Message\" value=\""+strMesg+"\">");
              %>
              <script Language="JavaScript">
              <!--
                PopupWindow(240, 160, "no", "no", "no", "yes");
                msgWin.document.write(document.frmMainPlane.Message.value);
              //-->
              </Script>
             <%
            }
          } else {
            %>
            <p>
              <a href="Main_Plane.jsp">回「計畫案管理」頁面</a>
            </p>  
            <%
          }
        %>