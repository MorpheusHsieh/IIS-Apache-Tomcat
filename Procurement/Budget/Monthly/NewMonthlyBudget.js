  <!--
    function DataCheck()
    {
      // �P�_�u�w���ءv�O�_���ť�
      if (frmMonthlyBdg.txtData01.value == "")
      {
        window.alert("�u�w���ءv���i�H�O�ť�...");
        document.frmMonthlyBdg.elements[1].focus();
        return;
      }

      // �P�_�u����t���B�v�O�_���ť�
      if (frmMonthlyBdg.txtData03.value == "")
      {
        window.alert("�u����t���B�v���i�H�O�ťժ�...");
        document.frmMonthlyBdg.elements[3].focus();
        return;
      }
      
      // �P�_�u����t���B�v���ݤ��� -2^31 < txtData05 < 2^31-1
      if (frmMonthlyBdg.txtData03.value > Math.pow(2,31))
      {
        window.alert("�u����t���B�v���i�j�� 2147483648(2^31)...");
        document.frmMonthlyBdg.elements[3].focus();
        return;
      }
      

      document.frmMonthlyBdg.BtnSend.value = "���J����t";
      document.frmMonthlyBdg.submit();
    }
  //-->
