  <!--
    function DataCheck()
    {
      // �P�_�b���O�_���ť�
      if (frmNewAcnt.txtName.value == "")
      {
        window.alert("�u�b���v���i�H�O�ť�...");
        document.frmNewAcnt.elements[1].focus();
        return;
      }
      
      // �P�_�K�X�O�_���ť�
      if (frmNewAcnt.txtPswd.value == "")
      {
        window.alert("�u�K�X�v���i�H�O�ť�...");
        document.frmNewAcnt.elements[3].focus();
        return;
      }

      // �P�_�K�X�A�T�{�O�_���ť�
      if (frmNewAcnt.txtRePswd.value == "")
      {
        window.alert("�u�K�X�A�T�{�v���i�H�O�ť�...");
        document.frmNewAcnt.elements[4].focus();
        return;
      }

      // �P�_�K�X�T�{�O�_���T
      if (frmNewAcnt.txtPswd.value != frmNewAcnt.txtRePswd.value)
      {
        window.alert("�K�X��J�⦸�ä��۲�...");
        document.frmNewAcnt.elements[4].focus();
        return;
      }
      

      // �P�_�����O�_���ť�
      if (frmNewAcnt.selUnit.value == "")
      {
        window.alert("�u�����v���i�H�O�ť�...");
        document.frmNewAcnt.elements[5].focus();
        return;
      }

      // �P�_�����v���O�_���ť�
      if (frmNewAcnt.selRole.value == "")
      {
        window.alert("�u�����v���v���i�H�O�ť�...");
        document.frmNewAcnt.elements[6].focus();
        return;
      }
      document.frmNewAcnt.BtnSend.value = "�s�W�b��";
      document.frmNewAcnt.submit();
    }
    
    function CheckAcnt()
    {
      document.frmNewAcnt.BtnSend.value = "�b���d��";
      document.frmNewAcnt.submit();
    }
 //-->
