  <!--
    function DataCheck()
    {
      // 判斷「預算科目」是否為空白
      if (frmNewBdg.txtData01.value == "")
      {
        window.alert("「預算科目」不可以是空白...");
        document.frmNewBdg.elements[1].focus();
        return;
      }

      // 判斷「預算名稱」是否為空白
      if (frmNewBdg.txtData02.value == "")
      {
        window.alert("「預算名稱」不可以是空白的...");
        document.frmNewBdg.elements[2].focus();
        return;
      }

      // 判斷「金額」是否為空白
      if (frmNewBdg.txtData03.value == "")
      {
        window.alert("「金額」不可以是空白的...");
        document.frmNewBdg.elements[3].focus();
        return;
      }
      
      // 判斷「金額」必需介於 -2^31 < txtData05 < 2^31-1
      if (frmNewBdg.txtData03.value > Math.pow(2,31))
      {
        window.alert("「金額」不可大於 2147483648(2^31)...");
        document.frmNewBdg.elements[3].focus();
        return;
      }
      

      document.frmNewBdg.BtnSend.value = "登錄預算";
      document.frmNewBdg.submit();
    }
  //-->
