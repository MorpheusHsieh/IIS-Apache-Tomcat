<!-- 判斷是否已經登入 //-->
<%
  String strUser = (String)session.getAttribute("UserName");
  String strRoleName = (String)session.getAttribute("RoleName");

  if (strUser == null || strUser.length() <= 0)
  {
    String strMesg = "您尚未登入本系統, 請不要試圖以非法方式連結網頁...";
    strMesg = java.net.URLEncoder.encode(strMesg);
    response.sendRedirect("/Procurement/NoLogin.jsp?Mesg="+strMesg);
  }  
%>