  <!--
    function DataCheck()
    {
      // 判斷帳號是否為空白
      if (frmNewAcnt.txtID.value == "")
      {
        window.alert("帳號不可以是空白...");
        document.frmNewAcnt.elements[1].focus();
        return;
      }
      
      // 判斷密碼是否為空白
      if (frmNewAcnt.txtPswd.value == "")
      {
        window.alert("密碼不可以是空白...");
        document.frmNewAcnt.elements[3].focus();
        return;
      }
      
      // 判斷密碼再確認是否為空白
      if (frmNewAcnt.txtRePswd.value == "")
      {
        window.alert("密碼再確認不可以是空白...");
        document.frmNewAcnt.elements[4].focus();
        return;
      }

      // 判斷密碼確認是否正確
      if (frmNewAcnt.txtPswd.value != frmNewAcnt.txtRePswd.value)
      {
        window.alert("密碼不相符...");
        document.frmNewAcnt.elements[4].focus();
        return;
      }

      // 判斷姓名是否為空白
      if (frmNewAcnt.txtName.value == "")
      {
        window.alert("姓名不可以是空白...");
        document.frmNewAcnt.elements[5].focus();
        return;
      }

      // 判斷單位是否為空白
      if (frmNewAcnt.selDept.value == "")
      {
        window.alert("單位不可以是空白...");
        document.frmNewAcnt.elements[6].focus();
        return;
      }    

      document.frmNewAcnt.BtnSend.value = "新建帳號";
      document.frmNewAcnt.submit();
    }    
  //-->