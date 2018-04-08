  <!--
    function DataCheck()
    {
      // 判斷帳號是否為空白
      if (frmLogin.txtName.value == "")
      {
        window.alert("帳號不可以是空白...");
        document.frmLogin.elements[1].focus();
        return;
      }
      
      // 判斷密碼是否為空白
      if (frmLogin.txtPswd.value == "")
      {
        window.alert("密碼不可以是空白...");
        document.frmLogin.elements[2].focus();
        return;
      }
      
      document.frmLogin.BtnSend.value = "登　　入";
      document.frmLogin.submit();
    }    
  //-->