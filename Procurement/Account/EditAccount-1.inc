          if (isDebug)
          {
            out.print("Name: " + strName + "<br>");
            out.print("Password: " + strPswd + "<br>");
            out.print("Unit: " + strUnit + "<br>");
            out.print("Role: " + strRole + "<br>");
          }
          
     	  String strSelect = "";
          String outstr = "<div align=\"center\">\n";
          outstr += "<table border=\"1\">\n";

          // 顯示帳號資訊
          outstr += "<tr>\n";
          outstr += "  <td>帳號：</td>\n";
          outstr += "  <td><input type=\"text\" name=\"txtName\" value=\""+ strName+ "\"></td>\n";
          outstr += "</tr>\n";

          // 顯示密碼資訊
          outstr += "<tr>\n";
          outstr += "  <td>密碼：</td>\n";
          outstr += "  <td><input type=\"password\" name=\"txtPswd\" value=\"" + strPswd + "\"></td>\n";
          outstr += "</tr>\n";

          // 顯示密碼再確認資訊
          outstr += "<tr>\n";
          outstr += "  <td>密碼再確認：</td>\n";
          outstr += "  <td><input type=\"password\" name=\"txtRePswd\"></td>\n";
          outstr += "</tr>\n";

          // 顯示部門資訊
          outstr += "<tr>\n";
          outstr += "  <td>部門：</td>\n";
          outstr += "<td>\n";
          outstr += "<SELECT name=\"selUnit\" size=\"1\">\n";

          strSelect = ((strUnit == null) || (strUnit.equals("一般部門"))) ? "selected" : "";
		  outstr += "<OPTION value=\"一般部門\" " + strSelect + ">一般部門</OPTION>\n";
		  
          strSelect = ((strUnit != null) && (strUnit.equals("預算管理"))) ? "selected" : "";
		  outstr += "<OPTION value=\"預算管理\" " + strSelect + ">預算管理</OPTION>\n";

          strSelect = ((strUnit != null) && (strUnit.equals("資訊管理"))) ? "selected" : "";
		  outstr += "<OPTION value=\"資訊管理\" " + strSelect + ">資訊管理</OPTION>\n";

          strSelect = ((strUnit != null) && (strUnit.equals("公文管理"))) ? "selected" : "";
		  outstr += "<OPTION value=\"公文管理\" " + strSelect + ">公文管理</OPTION>\n";
  	 	  outstr += "</SELECT>\n";
          outstr += "</td>\n";
          outstr += "</tr>\n";
          
          // 顯示部門資訊
          outstr += "<tr>\n";
          outstr += "  <td>角色權限：</td>\n";
          outstr += "  <td><input type=\"text\" name=\"txtRole\" value=\"" + strRole + "\"></td>\n";
          outstr += "</tr>\n";
          %>
          <p/>
          <input type="button" name="button1" value="新增帳號" onClick="DataCheck()">
          <%  
          outstr += "</table>\n";
          outstr += "</div>\n"; 
          out.print(outstr);
