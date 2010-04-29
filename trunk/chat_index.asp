<!--#include file="chat_conecta.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<title>CHATASP - Bate Papo</title>
	<link href="chat_css.css" rel="stylesheet" type="text/css">
	<script src="js/mask.js" language="javascript"></script>
<%
dim id,act,sql
id=session.SessionID
response.write verificauser()
act=request.QueryString("act")

sql="delete * from chat_users where session_id="&id
conn.execute(sql)

if act=1 then
	dim apelido,cor,rs
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
		sql="insert into chat_msg (de_user,cor_de,para_user,cor_para,act,msg,hora,reservado) values ('"&site&"','"&cor&"','Todos','ff0000','comunica','<font color=#"&cor&">"&apelido&"</font> entrou na sala',#"&data2(now)&"#,true)"
		conn.execute(sql)
		response.redirect "chat_jan.asp?apelido="&apelido&"&cor="&cor
	else
		response.write alerta("O apelido selecionado ja está em uso")
	end if
	rs.close
	set rs=nothing
end if
%>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="middle">
	<form name="entrar"  method="post" action="chat_index.asp?act=1">
        <table width="450" border="0" cellspacing="0" cellpadding="0" class="tabelas">
          <tr valign="middle">
            <td width="76" rowspan="6" class="texto"><img src="imagens/pmb_topo_logo.png" width="200" height="80"><br> </td>
            <td height="5" colspan="2" class="texto"></td>
          </tr>
          <tr valign="middle">
            <td width="76" class="texto"> <div align="right">Apelido :</div></td>
            <td width="164" height="25"> <input name="apelido" type="text" class="inputbusca" onKeyPress="return formatar(this, 'MMMMMMMMMMMMMMM',event)" size="20" maxlength="15"><br>
              
              <span class="texto_online">
              <%if request.QueryString("e")=1 then response.write "* Digite um apelido"%> 
              </span>
			  
			</td>
          </tr>
          <tr valign="middle">
            <td class="texto"> <div align="right">Cor :</div></td>
            <td height="25"> 
	<select name="cor" style="width: 100px;">
                <%
	Dim vCores, vCor, vX, vY, vZ, vColor
	vCores="00,33,66,99,CC,FF"
	vCor=split(vCores,",")
	for vX = 0 to 5
		for vY = 0 to 5
			for vZ = 0 to 5
				vColor = vCor(vX) & vCor(vY) & vCor(vZ) 
				With Response
					.Write "<option style='background-color:#"&vColor&"' value='"&vColor&"'>"
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
            <td height="12" colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td height="12" colspan="2"><div align="center">
              <input type="submit" name="Submit" value="Entrar" class="inputbusca">
          </div></td>
          </tr>
          <tr> 
            <td colspan="2"><div align="center" class="texto_online"><%=online%></div></td>
          </tr>
        </table>
	  </form>
    </td>
  </tr>
</table>
</body>
</html>
<!--#include file="chat_close.asp"-->