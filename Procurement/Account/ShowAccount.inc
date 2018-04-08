      <div align="center">
      <table border="1" width="100%">
      <%
        Field[] fields = clsAcnt.getFields();
        RowData[] row_data = clsAcnt.getRowDatas();

        int cols = fields.length;
        int rows = row_data.length;

        String outstr = "";
        %>
        <!-- 欄位名稱 //-->
        <%
          outstr = "<tr>\n";
          outstr += "\t\t\t\t  <td width=\"34\" align=\"center\">點選</td>\n";
          outstr += "\t\t\t\t  <td width=\"34\" align=\"center\">編號</td>\n";
          for (int col=0; col<cols; col++)
          {
            outstr += "\t\t\t\t  <td>" + fields[col].getCaption() + "</td>\n";
          }
          outstr += "\t\t\t  </tr>";
          out.print(outstr);
        %>
        
        <!-- 資料列 //-->
        <%
          for (int row=0; row<rows; row++)
          {
            String sRdoValue = row_data[row].getString(0);

            outstr = "<tr>\n";
            
            // RadioBox
            outstr += "\t\t\t\t  <td align=\"center\">";
            outstr += "<input type=\"radio\" name=\"rdoOption\" value=\"" + sRdoValue + "\">";
            outstr += "</td>\n";
            
            // 編號（流水號）
            outstr += "\t\t\t\t  <td align=\"center\">" + (row+1) + "</td>\n";
            
            // 帳號名稱
            String strName = "txtName_" + row_data[row].getString(0);
            String strValue = row_data[row].getString(0);
            outstr += "<td>\n";
            outstr += "<input type=\"hidden\" name=\""+strName+"\" value=\""+strValue+"\">";
            outstr += strValue;
            outstr += "</td>\n";
            
            
            // 密碼
            strName = "txtPswd_" + row_data[row].getString(0);
            strValue = row_data[row].getString(1);
            outstr += "\t\t\t\t  <td>";
            outstr += "<input type=\"text\" name=\"" + strName + "\" value=\"" + strValue + "\">";
            outstr += "</td>\n";
            
            // 部門名稱
            strName = "txtUnit_" + row_data[row].getString(0);
            strValue = row_data[row].getString(2);
            outstr += "\t\t\t\t  <td>";
            outstr += "<SELECT name=\"" + strName + "\" size=\"1\">\n";
            
            String strSelect = "";
            strSelect = ((strValue == null) || (strValue.equals("一般部門"))) ? "selected" : "";
	        outstr += "<OPTION value=\"一般部門\"" + strSelect + ">一般部門</OPTION>\n";

            strSelect = ((strValue != null) && (strValue.equals("預算管理"))) ? "selected" : "";
	        outstr += "<OPTION value=\"預算管理\"" + strSelect + ">預算管理</OPTION>\n";
	        
	        strSelect = ((strValue != null) && (strValue.equals("資訊管理"))) ? "selected" : "";
	        outstr += "<OPTION value=\"資訊管理\"" + strSelect + ">資訊管理</OPTION>\n";

            strSelect = ((strValue != null) && (strValue.equals("公文管理"))) ? "selected" : "";
	        outstr += "<OPTION value=\"公文管理\"" + strSelect + ">公文管理</OPTION>\n";
	        outstr += "</SELECT>\n";
	        outstr += "\t\t\t</td>\n";
            
            // 角色權限
            strName = "txtRole_" + row_data[row].getString(0);
            strValue = row_data[row].getString(3);
            outstr += "\t\t\t\t  <td>";
            outstr += "<SELECT name=\"" + strName + "\" size=\"1\">\n";
            
	        strSelect = ((strValue == null) || (strValue.equals("使用者"))) ? "selected" : "";
	        outstr += "<OPTION value=\"使用者\"" + strSelect + ">使用者</OPTION>\n";
	        
	        strSelect = ((strValue != null) && (strValue.equals("管理者"))) ? "selected" : "";
	        outstr += "<OPTION value=\"管理者\"" + strSelect + ">管理者</OPTION>\n";
	        outstr += "</SELECT>\n";
            outstr += "</td>\n";

            outstr += "\t\t\t\t</tr>";
            out.print(outstr);
          }
        %>
      </table>
