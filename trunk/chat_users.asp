<!--#include file="chat_conecta.asp"-->
<!--#include file="chat_funcoes.asp"-->
<%
response.write verificauser()
apelido=replace(request.querystring("apelido")," ","&nbsp;")
cor1=request.querystring("cor")
%>
<meta http-equiv="refresh" content="30">
<link href="chat_css.css" rel="stylesheet" type="text/css">
 <style type="text/css">
<!--
.user {
	font-weight: bold;
	color: #ff0000;
	text-decoration: none;
}
.user:hover {
	font-weight: bold;
	color: #000000;
	text-decoration: none;
}
-->
</style>
<body style="background-color:transparent" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
  <tr> 
    <td bgcolor="#000000"> <div align="center"><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><strong>Usuarios 
        Ativos:</strong></font></div></td>
  </tr>
  <tr> 
    <td bgcolor="cccccc"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif"><a class="user" href="chat_menu.asp?apelido=<%=apelido%>&vpara=Todos&cor=<%=cor1%>&cor2=ff0000" target="menu">Todos</a></font></div></td>
  </tr>
  <%
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
    <td bgcolor="<%=cor%>"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif"><a  class="user<%=rs("id")%>" href="chat_menu.asp?apelido=<%=apelido%>&vpara=<%=replace(rs("apelido")," ","&nbsp;")%>&cor=<%=cor1%>&cor2=<%=rs("cor")%>" target="menu"><%=rs("apelido")%></a></font></div></td>
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
<!--#include file="chat_close.asp"-->