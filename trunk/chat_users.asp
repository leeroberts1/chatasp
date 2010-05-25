<!--#include file="chat_conecta.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="refresh" content="30">
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<title>CHATASP - Bate Papo</title>
	<link href="css/chat_css.css" rel="stylesheet" type="text/css">
	<link href="css/chat_users.css" rel="stylesheet" type="text/css">
	<script src="js/users.js" type="text/javascript"></script>
</head>
<%
dim apelido,cor1
'response.write verificauser()
apelido=replace(request.querystring("apelido")," ","&nbsp;")
cor1=request.querystring("cor")
%>
<body>
	<div class="chataspusers">
		<ul>
			<li class="tfirst">	
				<a class="user" href="javascript:void(0);" onClick="troca_target('<%=apelido%>','Todos','<%=cor1%>','FF0000');">- Todos</a>
			</li>		
<%
dim sql,rs,i,cor
dim style : style=""
sql="select * from chat_users where session_id<>"&session.SessionID
set rs=conn.execute(sql)
if not rs.eof then
	while not rs.eof 
		style=style&".user"&rs("id")&" {font-weight: bold;color: #"&rs("cor")&";text-decoration: none;}"&chr(13)
		style=style&".user"&rs("id")&":hover {font-weight: bold;color: #"&rs("cor")&";text-decoration: none;}"&chr(13)
%>
			<li class="tfirst">
				<a class="user<%=rs("id")%>" href="javascript:void(0);" onClick="troca_target('<%=apelido%>','<%=replace(rs("apelido")," ","&nbsp;")%>','<%=cor1%>','<%=rs("cor")%>');">- <%=rs("apelido")%></a>
			</li>
<%   
	rs.movenext
	wend
end if
rs.close
set rs=nothing
%>
		</ul>
	</div>
	<style>
		<%=style%>
	</style>
</body>
</html>
<!--#include file="chat_close.asp"-->