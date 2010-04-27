<% OPTION EXPLICIT %>
<%
dim conn
set conn = createobject("adodb.connection")
conn.open "provider=microsoft.jet.oledb.4.0; data source=" & server.mappath("chat.mdb")

dim site
site="CHATASP - Bate Papo"
%>
<!--#include file="chat_funcoes.asp"-->