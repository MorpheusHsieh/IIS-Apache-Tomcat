<%!
  int MsgEditor(String ini_file, String sd_code, String title, String content)
  {
    int result = -1;
    MsgBoard01 mb01 = new MsgBoard01(ini_file);
    mb01.OpenConnection();
    result = mb01.UpdateContent(sd_code, title, content);
    mb01.CloseConnection();
    return result;
  }
  
  String[] StringToParagraph(String strText)
  {    
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
    
    return strPara;
  }
%>
