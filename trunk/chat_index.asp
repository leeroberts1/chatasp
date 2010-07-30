<!--#include file="chat_conecta.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<title>CHATASP - Bate Papo</title>
	<!-- <link href="css/chat_css.css" rel="stylesheet" type="text/css">-->
	<script src="js/mask.js" language="javascript"></script>
	<script src="js/jscolor.js" language="javascript"></script>
<%
dim id,act,sql
id=session.SessionID
'response.write verificauser()
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
		sql="insert into chat_msg (de_user,cor_de,para_user,cor_para,act,msg,hora,reservado) values ('"&site&"','"&cor&"','Todos','ff0000','comunica','<font color=""#"&cor&""">"&apelido&"</font> entrou na sala',#"&data2(now)&"#,true)"
		conn.execute(sql)
		response.redirect "chat_jan.asp?apelido="&apelido&"&cor="&cor
	else
		response.write alerta("O apelido selecionado ja está em uso")
	end if
	rs.close
	set rs=nothing
end if
%>
<style>
body{
	background-image: url(imagens/fundoadm.gif);
	margin:0px;
	padding:0px;
}

#conteudo{
	width:420px;
	text-align:right;
	background-color:#f7f7f7;
	border:1px solid #cccccc;
	padding:10px;
	height:100px;
    top: 50%;
    left: 50%;  	
    margin-top: -50px;
    margin-left:-210px;
	position:absolute;
	
}
#forms{
	width:200px;
	margin-left:210px;
}

#foto{
	width:200px;
	height:100px;
	background-image: url(imagens/pmb_topo_logo.png);
	vertical-align:middle;
	background-repeat:no-repeat;
	background-position:center;
}
label{
	float: left;
	width: 50px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000000;
	text-decoration: none;
	font-weight:bold;
	text-align:right;
	height:25px;
}

.inputbusca{
	font-size: 8pt;
	font-family: Verdana, Arial;
	color: #ff0000;
	background-color: #ffffff;
	background-image: url(imagens/bametalica.gif);
	border: 1px double #c0c0c0;
}
#submitform{
	text-align:center;
}
form{
	text-align:left;
}
br{
	clear: left;
}
.texto_online{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #ff0000;
	text-decoration: none;
	font-weight:bold;
	margin-top:6px;
}
</style>
</head>
<body>
<div id="conteudo">
	<div id="foto"/>
	<%
	if request.Cookies("javascript")="" then 
	%>
	<div id="forms" class="texto_online">Cookies e Javascript devem estar habilitados para visualizar o formulário ou Talvez seu Navegador seje muito antigo ou incompativel.<br>Experimente usar outro.</div>
	<%
	else
	%>
	<div id="forms">
		<form name="entrar"  method="post" action="chat_index.asp?act=1" onSubmit="return formatar();">
			<label for="user">Apelido : </label>
			<input name="apelido" type="text" class="inputbusca" id="apelido" size="20" maxlength="15" /><br />
			<%if request.QueryString("e")=1 then response.write "<div class=""texto_online"">* Digite um apelido</div>"%> 
			<label for="cor">Cor : </label>
			<input name="cor" class="color" id="cor" value="0000FF" size="10" /><br />
			<div id="submitform">
				<input type="submit" name="entrar" id="entrar" value="Entrar" class="inputbusca"/>
			</div>
		</form>
		<div class="texto_online"><%=online%></div>
	</div>
	<%
	end if
	%>
</div>
</body>
</html>
<!--#include file="chat_close.asp"-->