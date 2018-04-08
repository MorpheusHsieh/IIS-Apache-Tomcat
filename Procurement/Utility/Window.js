  function PopupWin(click_data, imgW, imgH)
  {
    var sw = screen.width;
    var sh = screen.height;
    var top = (sh - imgH - 250)/2;
    var left = (sw - imgW)/2;    
    msgWin = window.open("","NewWin", "width=" + imgW + " ,height=" + imgH 
           + ", left=" + left + ", top=" + top 
           + ", toolbar=no, menubar=no, resizable=yes, scrollbars=yes");
    msgWin.location.href = click_data;            
  }
  
  function PopupEmptyWin(imgW, imgH)
  {
    var sw = screen.width;
    var sh = screen.height;
    var top = (sh - imgH - 250)/2;
    var left = (sw - imgW)/2;    
    msgWin = window.open("","NewWin", "width=" + imgW + " ,height=" + imgH 
          + ", left=" + left + ", top=" + top 
          + ", toolbar=no, menubar=no, resizable=yes, scrollbars=yes");
  }
  
  function PopupWindow(imgW, imgH, tool, menu, resize, scrollbar)
  {
    var sw = screen.width;
    var sh = screen.height;
    var top = (sh - imgH - 250)/2;
    var left = (sw - imgW)/2;    
    msgWin = window.open("","NewWin", "width=" + imgW + " ,height=" + imgH 
          + ", left=" + left + ", top=" + top 
          + ", toolbar=" + tool
          + ", menubar=" + menu
          + ", resizable=" + resize
          + ", scrollbars=" + scrollbar);
  }
    
  function CloseWin()
  {
    window.close();
  }