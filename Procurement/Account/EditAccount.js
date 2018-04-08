  <!--
    function DataCheck()
    {
      // 判斷密碼是否為空白
      if (frmEditAcnt.txtPswd.value == "")
      {
        window.alert("「密碼」不可以是空白...");
        document.frmEditAcnt.elements[2].focus();
        return;
      }

      // 判斷密碼再確認是否為空白
      if (frmEditAcnt.txtRePswd.value == "")
      {
        window.alert("「密碼再確認」不可以是空白...");
        document.frmEditAcnt.elements[3].focus();
        return;
      }

      // 判斷密碼確認是否正確
      if (frmEditAcnt.txtPswd.value != frmEditAcnt.txtRePswd.value)
      {
        window.alert("密碼輸入兩次並不相符...");
        document.frmEditAcnt.elements[3].focus();
        return;
      }
      
      document.frmEditAcnt.BtnSend.value = "確定修改";
      document.frmEditAcnt.submit();
    }
    
 //-->
