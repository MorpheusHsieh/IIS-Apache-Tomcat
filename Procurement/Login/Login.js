  <!--
    function DataCheck()
    {
      // �P�_�b���O�_���ť�
      if (frmLogin.txtName.value == "")
      {
        window.alert("�b�����i�H�O�ť�...");
        document.frmLogin.elements[1].focus();
        return;
      }
      
      // �P�_�K�X�O�_���ť�
      if (frmLogin.txtPswd.value == "")
      {
        window.alert("�K�X���i�H�O�ť�...");
        document.frmLogin.elements[2].focus();
        return;
      }
      
      document.frmLogin.BtnSend.value = "�n�@�@�J";
      document.frmLogin.submit();
    }    
  //-->