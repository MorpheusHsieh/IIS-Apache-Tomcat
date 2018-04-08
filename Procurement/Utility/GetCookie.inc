<%
  String RootPath = "";

  Cookie[] cookies = request.getCookies();
  int cookielen = cookies.length;
  for (int i=0; i<cookielen; i++)
  {
    Cookie tmp = cookies[i];
    if (tmp.getName().equals("RootPath"))
      RootPath = tmp.getValue();
  }
%>
