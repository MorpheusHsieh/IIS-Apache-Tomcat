  <!--
    function DataCheck()
    {
      // �P�_�b���O�_���ť�
      if (frmNewAcnt.txtID.value == "")
      {
        window.alert("�b�����i�H�O�ť�...");
        document.frmNewAcnt.elements[1].focus();
        return;
      }
      
      // �P�_�K�X�O�_���ť�
      if (frmNewAcnt.txtPswd.value == "")
      {
        window.alert("�K�X���i�H�O�ť�...");
        document.frmNewAcnt.elements[3].focus();
        return;
      }
      
      // �P�_�K�X�A�T�{�O�_���ť�
      if (frmNewAcnt.txtRePswd.value == "")
      {
        window.alert("�K�X�A�T�{���i�H�O�ť�...");
        document.frmNewAcnt.elements[4].focus();
        return;
      }

      // �P�_�K�X�T�{�O�_���T
      if (frmNewAcnt.txtPswd.value != frmNewAcnt.txtRePswd.value)
      {
        window.alert("�K�X���۲�...");
        document.frmNewAcnt.elements[4].focus();
        return;
      }

      // �P�_�m�W�O�_���ť�
      if (frmNewAcnt.txtName.value == "")
      {
        window.alert("�m�W���i�H�O�ť�...");
        document.frmNewAcnt.elements[5].focus();
        return;
      }

      // �P�_���O�_���ť�
      if (frmNewAcnt.selDept.value == "")
      {
        window.alert("��줣�i�H�O�ť�...");
        document.frmNewAcnt.elements[6].focus();
        return;
      }    

      document.frmNewAcnt.BtnSend.value = "�s�رb��";
      document.frmNewAcnt.submit();
    }    
  //-->