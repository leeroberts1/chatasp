
<!--#include file="chat_conecta.asp" -->
<!--#include file="chat_funcoes.asp" -->
<%
act=request.querystring("act")
if act="saiu" then
response.write saida(request.querystring("apelido"),request.querystring("cor"))
response.write "<script>"
response.write "window.opener.location.href='chat_index.asp';"
response.write "window.opener.focus();"
response.write "window.close();"
response.write "</script>"
elseif act="saiu2" then
response.write saida(request.querystring("apelido"),request.querystring("cor"))
response.write "<script>"
response.write "window.opener.close();"
response.write "window.close();"
response.write "</script>"
else
response.write "<script>"
response.write "window.opener.focus();"
response.write "window.close();"
response.write "</script>"
end if
%>
<!--#include file="chat_close.asp" -->