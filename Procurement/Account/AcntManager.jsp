<%@page language="Java"%>
<%@page contentType="text/html;charset=Big5"%>
<%@page import="Procurement.Account"%>
<%@page import="avatar.dx.database.*"%>

<!-- 判斷 Session 是否有登入資訊 //-->
<%@include file="../Utility/CheckSession.inc"%>


<!-- 建立新物件  //-->
<%
  boolean isDebug = false;
  String strMySelf = "AcntManager.jsp";
  Account clsAcnt = new Account();
%>  

<html>

<head>
  <meta http-equiv="Content-Language" content="zh-tw">
  <script type="text/javascript" language="javascript" src="../Utility/Window.js"></script>
  <title>帳號管理</title>
</head>

<body>

<form name="frmAcntMgn" method="post" action="<%=strMySelf%>">
  
  <input type="hidden" name="btnSend" value="">
  <p>我是<font color="#0000FF">帳號管理</font>的頁面...</p>

  <!-- 顯示名詞搜尋 //-->
  <%@include file="../Utility/TxtQuery.inc"%>
  <br>
  
  <!-- 設定分頁所需變數 //-->
  <%
    int iRows = -1;
  %>  
  
  <!-- 依據上張網頁傳送過來的訊息, 決定要新增、刪除、查詢或修改 //-->
  <%
    String strMessage = "";
    String strSend = request.getParameter("BtnSend");
    String strRadio = request.getParameter("rdoOption");

    if (isDebug)  {
      out.print("Send: " + strSend + "<br>");
      out.print("Radio: " + strRadio + "<br>");
    }  

    if (strSend != null && strSend.length()>0)
    {
      if (isDebug) out.print("您選擇了 '"+strSend+"'<br>");
      if (strSend.equals("新增帳號"))
      {
        %>
        <Script type="text/javascript" language="JavaScript">
        <!--
          parent.frames[1].document.location.href = "NewAccount.jsp";
        //-->  
        </Script>
        <%
      }
      else if (strSend.equals("刪除帳號"))
      {
        %>
        <!-- 我是刪除帳號的程式段... //-->
        <%@include file="../Account/DelAccount.inc"%>
        <%
      }
      else if (strSend.equals("修改帳號"))
      {
        if (strRadio != null)
        {
          String strName = request.getParameter("txtName_" + strRadio);
          String strPswd = request.getParameter("txtPswd_" + strRadio);
          String strUnit = request.getParameter("txtUnit_" + strRadio);
          String strRole = request.getParameter("txtRole_" + strRadio);
          
          if (isDebug)
          {
            out.print(strName + ", " + strPswd + ", " + strUnit + ", " + strRole);
          }
          
          request.setAttribute("BtnSend", strSend);
          request.setAttribute("txtName", strName);
          request.setAttribute("txtPswd", strPswd);
          request.setAttribute("selUnit", strUnit);
          request.setAttribute("selRole", strRole);
          %>
          <jsp:forward page="EditAccount.jsp" />
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
      }
      else if (strSend.equals("查　　詢"))
      {
        if (isDebug) out.print("您選擇了 '"+strSend+"'<br>");
        if (isExecuteQuery)
        {
          iRows = clsAcnt.QueryInsideOfColumns(strQuery);
        }
      
      }
      else if (strSend.equals("顯示全部帳號"))
      {
        iRows = clsAcnt.QueryForAllRows();
      }
    }  
    else if (strSend == null) {
      iRows = clsAcnt.QueryForAllRows();
    }
  %>  
  
  <!-- 顯示帳號清單 //-->
  <%
    if ((strSend == null) && (iRows == 0))
    {
      %>
      <br>
      <div align="center">
        <table border="0" width="100%">
          <tr>
            <td align="center"><input type="submit" name="BtnSend" value="新增帳號"></td>
          </tr>
        </table>
      </div>      
      <%
    }
    else if (iRows > 0)
    {
      %>
      
      <!-- 顯示帳號 //-->
      <%@include file="../Account/ShowAccount.inc"%>
      <br>
      <div align="center">
        <table border="0" width="100%">
          <tr>
            <td align="center"><input type="submit" name="BtnSend" value="新增帳號"></td>
            <td align="center"><input type="submit" name="BtnSend" value="刪除帳號"></td>
            <td align="center"><input type="submit" name="BtnSend" value="修改帳號"></td>
            <td align="center"><input type="submit" name="BtnSend" value="顯示全部帳號"></td>
          </tr>
        </table>    
      </div>  
      <%
      
    } 
    else if ((strSend == null) && (iRows == 0)) 
    {
      strMessage = "您按下了 '" + strSend + "' 鍵，但是沒有查到任何資料...";
    } 
    else if (iRows == -1) 
    {
      strMessage = "您點選了 '" + strSend + "' 項目, 但是沒有任何作用...";
    }
    out.print(strMessage);
    %>

  </form>

</body>




