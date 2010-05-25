<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<title>CHATASP - Bate Papo</title>
	<link href="css/chat_css.css" rel="stylesheet" type="text/css">
</head>	
<%
apelido=replace(request.querystring("apelido")," ","&nbsp;")
cor=server.urlencode(request.querystring("cor"))
%>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F4F4F4">
  <tr> 
    <td height="80" colspan="2">
	
	<table width="100%" height="80" border="0" cellpadding="0" cellspacing="0" class="tabelas"> 
		<tr>
			<td width="205">
				<div align="center"><img src="imagens/pmb_topo_logo.png" width="200" height="80"></div>
			</td>
		    <td width="430">
				<div align="center">BANNER</div>
			</td>
			<td width="116">
				<div align="center" class="texto_simples">
					<input name="rolar" id="rolar" type="checkbox" checked><br>Rolagem Automatica<br>
				</div>
			</td>
		</tr>
	</table> 
	
    </td>
  </tr>
  <tr> 
    <td width="84%" height="100%" rowspan="2" valign="top"> <iframe frameborder="0" width="100%" height="100%" scrolling="yes" src="chat_msgs.asp" name="meio" id="meio" allowtransparency="true"></iframe> 
    </td>
    <td width="170" height="100%"> 
      <iframe frameborder="0" width="100%" height="100%" scrolling="yes" src="chat_users.asp?apelido=<%=apelido%>&cor=<%=cor%>" name="users" id="users" allowtransparency="true"></iframe> 
    </td>
  </tr>
  <tr>
    <td valign="top"> 
      <iframe frameborder="0" width="0" height="0" scrolling="no" src="chat_acao.asp" name="acao" id="acao" allowtransparency="true"></iframe> 
	</td>
  </tr>
  <tr> 
    <td height="90" colspan="2"> <iframe frameborder="0" width="100%" height="100%" scrolling="no" src="chat_menu.asp?apelido=<%=apelido%>&cor=<%=cor%>" name="menu" id="menu" allowtransparency="true"></iframe> 
    </td>
  </tr>
</table>
</body>
</html>