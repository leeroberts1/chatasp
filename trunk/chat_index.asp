<!--#include file="chat_conecta.asp"-->
<!--#include file="chat_funcoes.asp"-->
<!-- #include file="captcha/CAPTCHA_setup.asp" -->
<%

application("site")="super bareta"
site="super bareta"
id=session.SessionID
response.write verificauser()
sql="delete * from chat_users where session_id="&id
conn.execute(sql)

if request.querystring("act")=1 then
%>
<!-- #include file="CAPTCHA/CAPTCHA_process_form.asp" -->
<%
If blnCAPTCHAcodeCorrect Then 
apelido=request.form("apelido")

if apelido="" then
response.Redirect("chat_index.asp?e=1")
response.end()
end if

apelido=replace(Server.HTMLEncode(apelido),"'"," ")



cor=request.form("cor")
sql="select * from chat_users where apelido='"&apelido&"'"
set rs=conn.execute(sql)
if rs.eof then
sql="insert into chat_users (session_id,apelido,hora_s,cor,hora_ent) values ("&id&",'"&apelido&"',"
sql=sql&"#"&fun_hora&"#,'"&cor&"',#"&data2(now)&"#)"
conn.execute(sql)
reservado=-1
sql="insert into chat_msg (de_user,cor_de,para_user,cor_para,act,msg,hora,reservado) values ('"&site&"','"&cor&"','Todos','ff0000','comunica','<font color="&cor&">"&apelido&"</font> entrou na sala',#"&data2(now)&"#,"&reservado&")"
conn.execute(sql)


%>
<script language="JavaScript" type="text/JavaScript">
<!--

window.open('chat_jan.asp?apelido=<%=apelido%>&cor=<%=cor%>','chat','width=750,height=500');

//-->
</script>
<%

else
response.write alerta("O apelido selecionado ja está em uso")
end if
rs.close
set rs=nothing

end if

end if
%>
<title><%=site%> - Bate Papo</title>
<link href="chat_css.css" rel="stylesheet" type="text/css">

<body background="imagens/fundoadm.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="middle">
	<form name="entrar"  method="post" action="chat_index.asp?act=1">
        <table width="240" border="0" cellspacing="0" cellpadding="0" class="tabelas">
          <tr valign="middle"> 
            <td width="76"> <div align="right"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Apelido 
                :</font></div></td>
            <td width="164" height="25"> <input type="text" name="apelido" class="inputbusca"><br>
              <strong><font color="#FF0000" size="2" face="Arial, Helvetica, sans-serif">
              <% if request.QueryString("e")=1 then
response.write "Digite um apelido"
end if
%>
              </font></strong></td>
          </tr>
          <tr valign="middle"> 
            <td> <div align="right"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Cor 
                :</font></div></td>
            <td height="25"> <select name="cor" style="width: 100px;">
                <%
Dim vCores, vCor, vX, vY, vZ, vColor
vCores="00,33,66,99,CC,FF"
vCor=split(vCores,",")
for vX = 0 to 5
for vY = 0 to 5
for vZ = 0 to 5
vColor = vCor(vX) & vCor(vY) & vCor(vZ) 
With Response
.Write "<option style='background-color:" & vColor & "' value='" & vColor & "'>"
.Write ""
.Write "</option>"
End With
next 
next
next
%>
              </select> </td>
          </tr>
          <tr> 
            <td height="12" colspan="2"> <div align="center">
			<!--#include file="CAPTCHA/CAPTCHA_form_inc.asp" -->
			</div></td>
          </tr>
          <tr>
            <td height="12" colspan="2"><div align="center">
                <input type="submit" name="Submit" value="Enviar" class="inputbusca">
              </div></td>
          </tr>
          <tr> 
            <td colspan="2"><div align="center"><strong><font color="#FF0000" size="1" face="Arial, Helvetica, sans-serif"><%=online%></font></strong></div></td>
          </tr>
        </table>
	  </form>
    </td>
  </tr>
</table>
<!--#include file="chat_close.asp"-->