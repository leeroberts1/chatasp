<!--#include file="chat_conecta.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="refresh" content="30">
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<title>CHATASP - Bate Papo</title>
	<link href="chat_css.css" rel="stylesheet" type="text/css">
	<script src="js/users.js" type="text/javascript"></script>
</head>
<%
dim apelido,cor1
response.write verificauser()
apelido=replace(request.querystring("apelido")," ","&nbsp;")
cor1=request.querystring("cor")
%>

<body style="background-color:transparent">
<table width="100%" height="100% "border="0" align="right" cellpadding="0" cellspacing="0" class="tabelas">
	<tr>
		<td valign="top">
		

<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="15" valign="middle" class="tabela_linha_baixa"><div class="texto_online">Usuarios Ativos:</div></td>
  </tr>
  <tr> 
    <td height="20" valign="middle"> <a class="user" href="javascript:void(0);" onClick="troca_target('<%=apelido%>','Todos','<%=cor1%>','FF0000');">- Todos</a></td>
  </tr>
  <%
  dim sql,rs,i,cor

  sql="select * from chat_users where session_id<>"&session.SessionID
  set rs=conn.execute(sql)
  if not rs.eof then
  i = 0 
  
  while not rs.eof 
  %>
  <style type="text/css">
<!--
.user<%=rs("id")%> {
	font-weight: bold;
	color: #<%=rs("cor")%>;
	text-decoration: none;
}
.user<%=rs("id")%>:hover {
	font-weight: bold;
	color: #<%=cor1%>;
	text-decoration: none;
}
-->
</style>
<%
if i mod 2<>0 then
cor = "#F4F4F4"
else
cor = "#e1e1e1"
end if 
  %>
  <tr> 
    <td height="20" valign="middle" bgcolor="<%=cor%>">
	<a class="user<%=rs("id")%>" href="javascript:void(0);" onClick="troca_target('<%=apelido%>','<%=replace(rs("apelido")," ","&nbsp;")%>','<%=cor1%>','<%=rs("cor")%>');">- <%=rs("apelido")%></a>
	</td>
  </tr>
  <% 
   i = i+1
  rs.movenext
  wend
  end if
  rs.close
  set rs=nothing
  %>
</table>

	  </td>
	</tr>
</table>

</body>
</html>
<!--#include file="chat_close.asp"-->