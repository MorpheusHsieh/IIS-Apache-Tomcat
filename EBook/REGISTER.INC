<Script Language="VBScript" RunAt="Server">
  
  Sub Update_Reg()

    dim userid, n_passwd, n_name, n_sex, n_work
    dim n_tel1, n_tel2, n_tel3, n_bbcall, n_mobil, n_addr, n_email
    dim n_babyid, n_babyname, n_clstype
    dim SQlstr

    set adocon1 = Server.CreateObject("ADODB.Connection")
    adocon1.Open"EBook"

    '更改家長密碼
    userid = Request.Form("id")
    SQLstr = "select  * from Password where UserID='" & userid & "'"
    set rs1 = adocon1.Execute(SQLstr)

    If Not rs1.EOF Then 
      n_Passwd = Request.Form("r_passwd")
      SQLstr = "update password set password='" & n_passwd & "'"
      SQLstr = SQLstr & " where UserID='" & userid & "'"
      adocon1.Execute(SQLstr)
    Else
      Response.Write(userid & "不存在於 Password 表單中")
      Exit Sub
    End if

    '更改家長基本資料
    SQLstr = "select * from Register where UserID='" & userid & "'"
    set rs1 = adocon1.Execute(SQLstr)
    If Not rs1.EOF Then 
      n_name   = Request.Form("name")
      n_sex    = Request.Form("sex")
      n_work   = Request.Form("work")
      n_tel1   = Request.Form("tel_area")
      n_tel2   = Request.Form("tel_num")
      n_tel3   = Request.Form("tel_ext")
      n_bbcall = Request.Form("bbcall")
      n_mobil  = Request.Form("mobil")
      n_addr   = Request.Form("addr")
      n_email  = Request.Form("email")

      SQLstr = "update Register set UserName='" & n_name & "'"
      SQLstr = SQlstr & ",sex='" & n_sex & "'"
      SQLstr = SQlstr & ",Work='" & n_work & "'"
      SQLstr = SQlstr & ",Tel_Area='" & n_tel1 & "'"
      SQLstr = SQlstr & ",Tel_Num='" & n_tel2 & "'"
      SQLstr = SQlstr & ",Tel_Ext='" & n_tel3 & "'"
      SQLstr = SQlstr & ",BBCall='" & n_bbcall & "'"
      SQLstr = SQlstr & ",Mobil='" & n_mobil & "'"
      SQLstr = SQlstr & ",Addr='" & n_addr & "'"
      SQLstr = SQlstr & ",email='" & n_email & "'"
      SQLstr = SQLstr & " where UserID='" & userid & "'"
      adocon1.Execute(SQLstr)

    Else
      Response.Write(userid & "不存在於 Register 表單中")
      Exit Sub
    End if

    '修改寶寶是否在園中
    SQLstr = "select * from password where UserID='" & userid
    SQlstr = SQLstr & "' and SuperVisor = -1"
    set rs1 = adocon1.Execute(SQlstr)
    If Not rs1.EOF Then
      SQLstr = "select * from baby"
      set rs2 = adocon1.Execute(SQLstr)
      While Not rs2.EOF 
        SQLstr = "update baby set Exist=0"
        adocon1.Execute(SQLstr)
        rs2.Movenext
      Wend
      rs2.Close

      babys = Split(Request("exist"), ", ")
      For i=0 to UBound(babys)
        SQLstr = "update baby set Exist=-1 where BabyName='" & babys(i) & "'"
        adocon1.Execute(SQlstr)
      Next   
    End if

    '新增寶寶資料
    n_babyid = Request.Form("babyid")
    n_babyname = Request.Form("babyname")
    n_clstype = Request.Form("cls_type")

    If Not n_babyid=Empty Then 

      SQLstr = "select  * from Baby where BabyID='" & n_babyid & "'"
      set rs1 = adocon1.Execute(SQLstr)

      If rs1.EOF Then 
        SQlstr = "insert into baby values('" & n_babyid
        SQLstr = SQLstr & "','" & userid & "','" & n_babyname
        SQlstr = SQLstr & "','" & n_clstype & "','0')"
        adocon1.Execute(SQLstr)
      Else
        Response.Write("<body background=""images/marble2c.gif"">")
        Response.Write(n_babyid & "重複，請回到上一頁重新輸入")
        Exit Sub
      End if

    End if

    rs1.Close
    adocon1.Close
    Response.Redirect"menu.htm"
  
  End Sub  

</Script>