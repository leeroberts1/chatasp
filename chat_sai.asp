<!--#include file="chat_conecta.asp" -->
<%
dim apelido,cor
apelido=request.Cookies("apelido")
cor=request.Cookies("cor")
	saida apelido,cor
	response.write alerta("","chat_index.asp")
%>
<!--#include file="chat_close.asp" -->