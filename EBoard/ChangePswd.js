  <!--
    function DataCheck()
    {
      // �ˬd�±K�X�O�_���ť�
      if (frmChangePswd.txtOldPswd.value == "")
      {
        window.alert("�z���������±K�X����J...");
        document.frmChangePswd.elements[1].focus();
        return;
      }
      
      // �ˬd�s�K�X�O�_���ť�
      if (frmChangePswd.txtNewPswd.value == "")
      {
        window.alert("�z���������s�K�X����J...");
        document.frmChangePswd.elements[2].focus();
        return;
      }      
      
      // �P�_�s�K�X�T�{�O�_�����T
      if (frmChangePswd.txtNewPswdCheck.value == "")
      {
        window.alert("�z���������T�{�K�X����J...");
        document.frmChangePswd.elements[3].focus();
        return;
      }
      else if (frmChangePswd.txtNewPswdCheck.value != frmChangePswd.txtNewPswd.value)
      {
        window.alert("�T�{�K�X���۲�, �Э��s��J...");
        document.frmChangePswd.elements[3].focus();
        return;
      
      }
    
      document.frmChangePswd.Send.value = "�ڭn�ק�K�X";
      document.frmChangePswd.submit();
    }  
  //-->