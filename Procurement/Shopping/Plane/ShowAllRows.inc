		<table border="1" width="100%">

		<!-- 資料表 //-->
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

	              <!-- 計畫編號 //-->
	              <%
				strName = "txtData01_" + sRdoValue;
				strValue = row_data[row].getString(0);
			  %>
			  <td>
				<input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%>
			  </td>

			  <!-- 執行月份 //-->
			  <%
			    strName = "txtData02_" + sRdoValue;
			    strValue = row_data[row].getString(1);
			  %>
			  <td>
			    <input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%>
			  </td>

			  <!-- 計畫名稱 //-->
			  <%
			    strName = "txtData03_" + sRdoValue;
			    strValue = row_data[row].getString(2);
			  %>
			  <td><input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%></td>

			  <!-- 預算科目 //-->
			  <%
			    strName = "txtData04_" + sRdoValue;
			    strValue = row_data[row].getString(3);
			  %>
			  <td><input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%></td>

			  <!-- 申請單位 //-->
			  <%
			    strName = "txtData05_" + sRdoValue;
			    strValue = row_data[row].getString(4);
			  %>
			  <td><input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%></td>

			  <!-- 承辦人 //-->
			  <%
			    strName = "txtData06_" + sRdoValue;
			    strValue = row_data[row].getString(5);
			  %>
			  <td><input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%></td>

			  <!-- 計畫金額 //-->
			  <%
			    strName = "txtData07_" + sRdoValue;
			    strValue = row_data[row].getString(6);
			  %>
			  <td><input type="hidden" name="<%=strName%>" value="<%=strValue%>"><%=strValue%></td>

			  <!-- 核定日期 //-->
			  <%
			    strName = "txtData08_" + sRdoValue;
			    strValue = row_data[row].getString(7);

			    if (strValue != null)
			    {
				  String strCheckDate = strValue.replace('-','/');
				  Date myDate = DateFormat.getDateInstance().parse(strCheckDate); 
				  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd", Locale.TAIWAN);
				  strValue = sdf.format(myDate);
			    }
			    strValue = (strValue == null) ? "" : strValue;
			    
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
              <td align="center"><input type="submit" name="BtnSend" value="新增計畫案"></td>
              <td align="center"><input type="submit" name="BtnSend" value="修改計畫案"></td>
			  <td align="center"><input type="submit" name="BtnSend" value="刪除計畫案"></td>
			  <td align="center"><input type="submit" name="BtnSend" value="轉移計畫案"></td>
              <td align="center"><input type="submit" name="BtnSend" value="顯示全部"></td>
              </tr>
          </table>    
        </p>  
