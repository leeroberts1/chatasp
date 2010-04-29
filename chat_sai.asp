<!--#include file="chat_conecta.asp" -->
<%
dim apelido,cor
apelido=request.querystring("apelido")
cor=request.querystring("cor")


	saida apelido,cor
	response.write "<script>"
	response.write "parent.location.href='chat_index.asp';"
	response.write "</script>"
	response.end
	
%>
<!--#include file="chat_close.asp" -->