  <!--
    function DataCheck()
    {
      // �P�_�b���O�_���ť�
      if (frmLogin.selUserName.value == "")
      {
        window.alert("�z���������b���W�٪���J...");
        document.frmLogin.elements[0].focus();
        return;
      }    
    
      // �P�_�K�X�O�_���ť�
      if (frmLogin.txtPasswd.value == "")
      {
        window.alert("�z���������K�X����J...");
        document.frmLogin.elements[1].focus();
        return;
      }
      
      document.frmLogin.submit();
    }
  
  //-->
