  <!--
    function DataCheck()
    {
      // 判斷帳號是否為空白
      if (frmNewAcnt.txtName.value == "")
      {
        window.alert("「帳號」不可以是空白...");
        document.frmNewAcnt.elements[1].focus();
        return;
      }
      
      // 判斷密碼是否為空白
      if (frmNewAcnt.txtPswd.value == "")
      {
        window.alert("「密碼」不可以是空白...");
        document.frmNewAcnt.elements[3].focus();
        return;
      }

      // 判斷密碼再確認是否為空白
      if (frmNewAcnt.txtRePswd.value == "")
      {
        window.alert("「密碼再確認」不可以是空白...");
        document.frmNewAcnt.elements[4].focus();
        return;
      }

      // 判斷密碼確認是否正確
      if (frmNewAcnt.txtPswd.value != frmNewAcnt.txtRePswd.value)
      {
        window.alert("密碼輸入兩次並不相符...");
        document.frmNewAcnt.elements[4].focus();
        return;
      }
      

      // 判斷部門是否為空白
      if (frmNewAcnt.selUnit.value == "")
      {
        window.alert("「部門」不可以是空白...");
        document.frmNewAcnt.elements[5].focus();
        return;
      }

      // 判斷角色權限是否為空白
      if (frmNewAcnt.selRole.value == "")
      {
        window.alert("「角色權限」不可以是空白...");
        document.frmNewAcnt.elements[6].focus();
        return;
      }
      document.frmNewAcnt.BtnSend.value = "新增帳號";
      document.frmNewAcnt.submit();
    }
    
    function CheckAcnt()
    {
      document.frmNewAcnt.BtnSend.value = "帳號查詢";
      document.frmNewAcnt.submit();
    }
 //-->
