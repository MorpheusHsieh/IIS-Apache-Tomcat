<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>新網頁1</title>
</head>

<body>

<%
  String strText = "test1...\r\ntest2...\r\ntest3...\r\n";
  
  out.print(strText + "<br>" + strText.length()+"<br>");
  
    String[] strPara = null;

    // 計算內容共有幾個段落
    int iParaNum = 0, iEndPosi = -1, posi = -1;
    String strTmp = strText, strSearch = "\r\n";
    do {
      iEndPosi = strTmp.length();
      posi = strTmp.indexOf(strSearch);
      if (posi != -1)
      {
        posi = (posi+2 < iEndPosi) ? (posi+2) : iEndPosi;
        strTmp = strTmp.substring(posi, iEndPosi);
      }  
      iParaNum++;
    } while(posi>0);
    strPara = new String[iParaNum];
    out.print("Para num: " +iParaNum + "<br>");
    
    //將字串分段放入陣列中
    iParaNum = 0;
    strTmp = strText;
    do {
      iEndPosi = strTmp.length();    
      posi = strTmp.indexOf(strSearch);

      if (posi != -1)
      {
        strPara[iParaNum] = strTmp.substring(0,posi);
        posi = (posi+2 < iEndPosi) ? (posi+2) : iEndPosi;
        strTmp = strTmp.substring(posi, iEndPosi);
      }  
      else
        strPara[iParaNum] = strTmp.substring(0, iEndPosi);      
      iParaNum++;
    } while(posi>0);
    
    
    for (int i=0; i<strPara.length; i++)
      out.print("'" + strPara[i] + "'<br>");
%>

</body>

</html>
