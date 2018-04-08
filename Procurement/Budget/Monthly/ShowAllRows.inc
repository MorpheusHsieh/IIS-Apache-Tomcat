        <table border="1" width="100%">

          <!-- Aa|i|C //-->
          <tr>
            <td width="34" align="center">點選</td>
            <td width="34" align="center">編號</td>
            <%
              for (int col=0; col<cols; col++) {
                outstr += "<td>" + fields[col].getCaption() + "</td>\n";
              }
              out.print(outstr);
            %>
          </tr>
          
          <!-- 顯示所有資料列 //-->
          <%
            String strName = "";
            String strValue= "", sRdoValue = "", strSelect = "";
            
            for (int row=0; row<rows; row++)
            {
            
              sRdoValue = String.valueOf(row+1);
              %>
              <tr>
                <!-- 點選 //-->
                <td align="center"><input type="radio" name="rdoOption" value="<%=sRdoValue%>"></td>
                
                <!-- 編號 //-->
                <td align="center"><%=(row+1)%></td>

                <!-- 預算科目 //-->
                <%
                  strName = "txtData01_" + sRdoValue;
                  strValue = row_data[row].getString(0);
                %>
                <td>
                  <input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%>
                </td>

                <!-- 預算月份 //-->
                <%
                  strName = "txtData02_" + sRdoValue;
                  strValue = row_data[row].getString(1);
                %>
                <td>
                  <input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%>
                </td>

                <!-- 預算金額 //-->
                <%
                  strName = "txtData03_" + sRdoValue;
                  strValue = row_data[row].getString(2);
                %>
                <td><input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%></td>

              </tr>
              <%
            }  
          %>
        </table>
        <p align="center">
          <table border="0" width="100%">
      		  <tr>
              <td align="center"><input type="submit" name="BtnSend" value="收入月分配"></td>
              <td align="center"><input type="submit" name="BtnSend" value="修改月分配"></td>
		          <td align="center"><input type="submit" name="BtnSend" value="刪除月分配"></td>
              <td align="center"><input type="submit" name="BtnSend" value="顯示全部"></td>
              </tr>
          </table>    
        </p>  
