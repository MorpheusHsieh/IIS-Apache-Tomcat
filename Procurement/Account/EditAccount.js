  <!--
    function DataCheck()
    {
      // �P�_�K�X�O�_���ť�
      if (frmEditAcnt.txtPswd.value == "")
      {
        window.alert("�u�K�X�v���i�H�O�ť�...");
        document.frmEditAcnt.elements[2].focus();
        return;
      }

      // �P�_�K�X�A�T�{�O�_���ť�
      if (frmEditAcnt.txtRePswd.value == "")
      {
        window.alert("�u�K�X�A�T�{�v���i�H�O�ť�...");
        document.frmEditAcnt.elements[3].focus();
        return;
      }

      // �P�_�K�X�T�{�O�_���T
      if (frmEditAcnt.txtPswd.value != frmEditAcnt.txtRePswd.value)
      {
        window.alert("�K�X��J�⦸�ä��۲�...");
        document.frmEditAcnt.elements[3].focus();
        return;
      }
      
      document.frmEditAcnt.BtnSend.value = "�T�w�ק�";
      document.frmEditAcnt.submit();
    }
    
 //-->
