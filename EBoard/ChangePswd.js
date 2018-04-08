  <!--
    function DataCheck()
    {
      // 檢查舊密碼是否為空白
      if (frmChangePswd.txtOldPswd.value == "")
      {
        window.alert("您必須完成舊密碼的輸入...");
        document.frmChangePswd.elements[1].focus();
        return;
      }
      
      // 檢查新密碼是否為空白
      if (frmChangePswd.txtNewPswd.value == "")
      {
        window.alert("您必須完成新密碼的輸入...");
        document.frmChangePswd.elements[2].focus();
        return;
      }      
      
      // 判斷新密碼確認是否為正確
      if (frmChangePswd.txtNewPswdCheck.value == "")
      {
        window.alert("您必須完成確認密碼的輸入...");
        document.frmChangePswd.elements[3].focus();
        return;
      }
      else if (frmChangePswd.txtNewPswdCheck.value != frmChangePswd.txtNewPswd.value)
      {
        window.alert("確認密碼不相符, 請重新輸入...");
        document.frmChangePswd.elements[3].focus();
        return;
      
      }
    
      document.frmChangePswd.Send.value = "我要修改密碼";
      document.frmChangePswd.submit();
    }  
  //-->