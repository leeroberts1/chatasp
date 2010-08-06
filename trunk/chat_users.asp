<!--#include file="chat_conecta.asp"-->
<%
response.write verificauser()

Response.Charset = "ISO-8859-1"

dim sql
dim rs
dim style
dim users
dim meuid
meuid=request.Cookies("sessionid")


sql="select * from chat_users where session_id<>"&meuid'session.SessionID
set rs=conn.execute(sql)
if not rs.eof then
	while not rs.eof 
		'style=style&".user"&rs("id")&" {font-weight: bold;color: #"&rs("cor")&";text-decoration: none;}"&chr(13)
		'style=style&".user"&rs("id")&":hover {font-weight: bold;color: #"&rs("cor")&";text-decoration: none;}"&chr(13)

		users=users&"<li class=""tfirst"">"
		users=users&"<a class=""user"&rs("id")&""" href=""javascript:void(0);"" onClick=""troca_target('"&replace(rs("apelido")," ","&nbsp;")&"','"&rs("cor")&"');"" style=""font-weight: bold;color: #"&rs("cor")&";text-decoration: none;"">- "&rs("apelido")&"</a>"
		users=users&"</li>"
   
	rs.movenext
	wend
end if
rs.close
set rs=nothing

	'<style>
		'.user{font-weight:bold;color:#FF0000;text-decoration: none;}
		'.user:hover{font-weight:bold;color:#FF0000;text-decoration: none;}
		'<%=style% >
	'</style>
%>	
	<div class="chataspusers">
		<ul>
			<li class="tfirst">	
				<a class="user" href="javascript:void(0);" onClick="troca_target('Todos','FF0000');">- Todos</a>
			</li>	
			<%=users%>
		</ul>
	</div>
<%users=""%>
<!--#include file="chat_close.asp"-->