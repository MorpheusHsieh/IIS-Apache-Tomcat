  <!--
    function DataCheck()
    {
      // �P�_�u�w���ءv�O�_���ť�
      if (frmNewBdg.txtData01.value == "")
      {
        window.alert("�u�w���ءv���i�H�O�ť�...");
        document.frmNewBdg.elements[1].focus();
        return;
      }

      // �P�_�u�w��W�١v�O�_���ť�
      if (frmNewBdg.txtData02.value == "")
      {
        window.alert("�u�w��W�١v���i�H�O�ťժ�...");
        document.frmNewBdg.elements[2].focus();
        return;
      }

      // �P�_�u���B�v�O�_���ť�
      if (frmNewBdg.txtData03.value == "")
      {
        window.alert("�u���B�v���i�H�O�ťժ�...");
        document.frmNewBdg.elements[3].focus();
        return;
      }
      
      // �P�_�u���B�v���ݤ��� -2^31 < txtData05 < 2^31-1
      if (frmNewBdg.txtData03.value > Math.pow(2,31))
      {
        window.alert("�u���B�v���i�j�� 2147483648(2^31)...");
        document.frmNewBdg.elements[3].focus();
        return;
      }
      

      document.frmNewBdg.BtnSend.value = "�n���w��";
      document.frmNewBdg.submit();
    }
  //-->
