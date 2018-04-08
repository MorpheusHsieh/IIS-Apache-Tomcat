  <!--
    function DataCheck()
    {
      // 判斷帳號是否為空白
      if (frmLogin.selUserName.value == "")
      {
        window.alert("您必須完成帳號名稱的輸入...");
        document.frmLogin.elements[0].focus();
        return;
      }    
    
      // 判斷密碼是否為空白
      if (frmLogin.txtPasswd.value == "")
      {
        window.alert("您必須完成密碼的輸入...");
        document.frmLogin.elements[1].focus();
        return;
      }
      
      document.frmLogin.submit();
    }
  
  //-->
