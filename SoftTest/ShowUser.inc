<script language="JavaScript">
<!--

  function GetCookie(name)
  {
    var cname= name + "="
    var dc=document.cookie
    if(dc.length > 0)
    {
      begin = dc.indexOf(cname)
      if(begin != -1)
      { 
        begin= begin + cname.length
        end = dc.indexOf(";",begin)
        if( end == -1 )  end = dc.length
        return dc.substring(begin, end)
      }
    }
    return null
  }
 
  function SetCookie(name, value, expires)
  {
    if( expires == null )
    {
      expires=""
    }  
  
    document.cookie = name + "=" + value + ";path=/" +"; expires=" + expires.toGMTString()
  }

  function DelCookie(name)
  {
    document.cookie = name + "exipires=Thu, 01-Jan-70 00:00:00 GMT" + "; path=/"
  }

  function countTimes()
  {
    var count = GetCookie('count')
    var exp = new Date()
    exp.setTime(exp.getTime()+(1000*60*60*24*31))

    if (count == null)
    {
      SetCookie('count', '1', exp)
      var now = new Date()
      return 1
    }
    else
    {
      DelCookie('count')
      count++
      SetCookie('count', count, exp)
      return count
    }
  }
  
  function when()
  {
    var rightnow = new Date()
    var exp = new Date()
    exp.setTime(exp.getTime()+(1000*60*60*24*31))

    var lasttime = GetCookie('lasttime')
    
    thistime =(rightnow.getMonth()+1) + "月" + rightnow.getDate() + "日, "
    thistime+=(rightnow.getHours()) + "時" + rightnow.getMinutes() + "分"
    
    SetCookie("lasttime", lasttime, exp)
    return lasttime
  }
  
  function Visitor()
  {
    var VisitorName = GetCookie('visitor1')
    var exp = new Date()
    exp.setTime(exp.getTime() + (1000*60*60*24*31))
    
    if (VisitorName == "null")
    {
      VisitorName = prompt("請輸入您的暱稱：")
      SetCookie('visitor1', VisitorName, exp)
      return VisitorName
    }
    else
    {
      DelCookie('visitor1')
      SetCookie('visitor1', VisitorName, exp)
      return VisitorName
    }  
  }
 
//-->
</script>