<%!
  int AddNewReplyMessage(String ini_file, String sd_code, String user, String content)
  {
    int result = -1;
    MsgBoard01 mb01 = new MsgBoard01(ini_file);
    mb01.OpenConnection();
    result = mb01.AddReplyMessage(sd_code, user, content);
    mb01.CloseConnection();
    return result;
  }
%>
