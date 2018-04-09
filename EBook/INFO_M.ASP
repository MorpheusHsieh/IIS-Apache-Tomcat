<!-- #include file="GetDB.inc" -->
<!-- #include file="ShowInfoPage.inc" -->

<%
  MySelf = Request.ServerVariables("PATH_INGFO")

  Dim FileName, SQLstr, rsAction
  FileName = "EBook.mdb"
  SQLstr = "select * from FieldInfo"
  Set rsAction = GetAccessDBStaticRecordset(FileName, SQLstr)
%>

<html>

<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>★☆★愛愛的電子聯絡簿---幼兒活動照片★☆★</title>
<link rel=stylesheet type="text/css" href="index_1.css">
</head>

<body topmargin="0" leftmargin="0">
<div align="left" style="width: 600; height: 812">


  <table border="0" width="528" vspace="0" hspace="0" cellspacing="0" cellpadding="0" height="1" class="bg">


    <tr>       


      <td width="105" height="1"><img src="../images/top_left.gif" alt="top_left.gif" width="60" height="30"></td>      


      <td width="420" height="1"><img src="../images/top.gif" alt="top.gif" width="516" height="30"></td>      


      <td width="122" height="1"><img src="../images/top_right.gif" alt="top_right" width="24" height="30"></td>    


    </tr>


    <tr>      


      <td width="60" height="655" rowspan="2"><img src="../images/left.gif" width="60" height="700" alt="left.gif"></td>      





      <td width="420" height="1" valign="top"> 


        　 


        <div align="center">


        <table width="510" border="0" cellpadding="16" height="1">


          <tr>


            <td width="462" height="1" align="left">
              <div align="center">
                <table border="0" width="450" cellspacing="0" cellpadding="0" height="88">
                  <tr>
                    <td width="151" valign="top" align="center" height="88"><img border="0" src="images/info-1.jpg" alt="藝文活動" width="144" height="88"></td>
                    <td width="94" valign="top" align="center" height="88"><img border="0" src="images/info-2.jpg" alt="藝文活動" width="130" height="88"></td>
                    <td width="205" valign="top" align="center"><img border="0" src="images/info-3.jpg" alt="藝文活動" width="176" height="88"></td>
                  </tr>
                </table>
              </div>
            </td>


          </tr>


          <tr> 


            <td width="462" height="1" align="left">
                   
                              
                                  
                                    
            <div align="center">
      <table border="0" width="450" cellspacing="0" cellpadding="0" height="93">
            
<form action="info_m.asp" method=post name="Action">

   <%
    rsAction.PageSize = 6

    Page = CLng(Request("Page"))
    If Page < 1 Then Page = 1
    If Page > rsAction.PageCount Then Page = rsAction.PageCount
    
    ShowInfoPage rsAction, Page

    If Page<> 1 Then '如果不是位於第一頁
  %>   

 
                <tr>
                 
                  <td width="450" valign="middle" align="left" height="17" colspan=5></td></tr>       
                  
                                  
                <tr>                                      
                  <td width="450" valign="middle" align="left" height="1" colspan=5>   
                  <A HREF=<%=MySelf%>?Page=1 target="_self">第一頁</a>&nbsp;&nbsp;&nbsp;    
                  <A HREF=<%=MySelf%>?Page=<%=(Page-1)%> target="_self">上一頁</a>&nbsp;&nbsp;&nbsp;             
                            
 <%              
    End if              
    If Page <> rsAction.PageCount Then '如果不是位於最後一頁              
  %>             
             
                  <A HREF=<%=MySelf%>?Page=<%=(Page+1)%> target="_self">下一頁</a>&nbsp;&nbsp;&nbsp;             
                  <A HREF=<%=MySelf%>?Page=<%=rsAction.PageCount%> target="_self">最後一頁</a>&nbsp;&nbsp;&nbsp;          
 <%                
    End if                  
  %>                               
                  輸入頁數：<input type=text name=Page Size=5>&nbsp;&nbsp;&nbsp;             
                  共有頁數：<%=Page%>/<%=rsAction.PageCount%></td>                                             
                </tr>                                             
                                        
              </table>                                            
            </div>  
            </td>                           
                           
                           
          </tr>                           
                           
                           
        </table>                                                               
                                                               
                                                               
        </div>                                                               
                                                               
                                                               
  <center>                                      
                                      
        </center>                                      
                                      
        <td width="24" height="655" rowspan="2"><img src="../images/right.gif" width="24" height="700" alt="right.gif"></td>                                                                 
                                                              
        </tr>                                                               
                                                              
    <tr>                                                                      
                                                              
      <td width="510" STYLE="text-align: CENTER"><a href="../Activate/index.asp" target="_parent">一顆教育的心一段愛愛的情</a>│<a href="../Hardware/index.asp" target="_parent">愛愛裡任意遊走生活的驚喜</a>│<a href="../Software/index.asp" target="_parent">創造與傳承的愛愛之旅</a><br>                              
        <a href="../Activity/index.asp" target="_parent">愛愛遊戲樂園之活動哈燒站</a>│<a href="../Parenthood/index.asp" target="_parent">綿延地閃現愛與成長的繆思</a></td>                                                               
                                                              
    </tr>                                                     
                                                              
    <tr>                                                                      
                                                              
      <td width="105" height="1"><img src="../images/down_left.gif" alt="down_left" width="60" height="41"></td>                                                               
                                                             
      <td width="420" height="1"><img src="../images/down.gif" alt="down.gif" width="516" height="41"></td>                                                               
                                                              
      <td width="122" height="1"><img src="../images/down_right.gif" alt="down_right" width="24" height="41"></td>                                                                   
                                                             
    </tr>                         
                                                           
   </table>                                                       
<p class="link">Copyright(c) 2000 Designed &amp; Produced by <a href="mailto:nicel309@ms43.hinet.net"><b>joyce</b></a>                                                                
and <a href="mailto:hhhsich1@ms37.hinet.net"><b>Avatar.</b></a></p>                                                     
</form>          
</div> 
</body>                                                   
                                                   
 
