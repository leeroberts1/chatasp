<!--#include file="chat_conecta.asp" -->
<%
dim apelido,cor
apelido=request.querystring("apelido")
cor=request.querystring("cor")


	saida apelido,cor
	response.write "<script>"
	response.write "window.close();"
	response.write "</script>"
	response.end
	
%>
<!--#include file="chat_close.asp" -->