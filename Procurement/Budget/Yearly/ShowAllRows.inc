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
            
              sRdoValue = row_data[row].getString(0);
              %>
              <tr>
                <!-- 點選 //-->
                <td align="center"><input type="radio" name="rdoOption" value="<%=sRdoValue%>"></td>
                
                <!-- 編號 //-->
                <td align="center"><%=(row+1)%></td>

                <!-- 預算科目 //-->
                <%
                  strName = "txtData01_" + row_data[row].getString(0);
                  strValue = row_data[row].getString(0);
                %>
                <td><input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%></td>

                <!-- 預算名稱 //-->
                <%
                  strName = "txtData02_" + row_data[row].getString(0);
                  strValue = row_data[row].getString(1);
                %>
                <td><input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%></td>

                <!-- 預算金額 //-->
                <%
                  strName = "txtData03_" + row_data[row].getString(0);
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
              <td align="center"><input type="submit" name="BtnSend" value="新增預算"></td>
              <td align="center"><input type="submit" name="BtnSend" value="修改預算"></td>
		          <td align="center"><input type="submit" name="BtnSend" value="刪除預算"></td>
              <td align="center"><input type="submit" name="BtnSend" value="顯示全部"></td>
              </tr>
          </table>    
        </p>  
