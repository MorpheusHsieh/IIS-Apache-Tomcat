  <!--
    function DataCheck()
    {
      // 判斷「預算科目」是否為空白
      if (frmMonthlyBdg.txtData01.value == "")
      {
        window.alert("「預算科目」不可以是空白...");
        document.frmMonthlyBdg.elements[1].focus();
        return;
      }

      // 判斷「月分配金額」是否為空白
      if (frmMonthlyBdg.txtData03.value == "")
      {
        window.alert("「月分配金額」不可以是空白的...");
        document.frmMonthlyBdg.elements[3].focus();
        return;
      }
      
      // 判斷「月分配金額」必需介於 -2^31 < txtData05 < 2^31-1
      if (frmMonthlyBdg.txtData03.value > Math.pow(2,31))
      {
        window.alert("「月分配金額」不可大於 2147483648(2^31)...");
        document.frmMonthlyBdg.elements[3].focus();
        return;
      }
      

      document.frmMonthlyBdg.BtnSend.value = "收入月分配";
      document.frmMonthlyBdg.submit();
    }
  //-->
