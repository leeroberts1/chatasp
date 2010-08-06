<% OPTION EXPLICIT %>
<%
Session.LCID = 1046
response.Clear()

Response.AddHeader "Cache-control", "private" 
Response.AddHeader "pragma", "no-cache" 
Response.AddHeader "Cache-Control", "must-revalidate" 
Response.AddHeader "Cache-Control", "no-cache" 
Response.Addheader "Last-Modified:", Now()-1 
Response.Expires=0
Response.ExpiresAbsolute = Now() - 1
Response.CacheControl = "no-cache"

dim conn
set conn = createobject("adodb.connection")
conn.open "provider=microsoft.jet.oledb.4.0; data source=" & server.mappath("chat.mdb")

dim site
site="CHATASP - Bate Papo"
%>
<!--#include file="chat_funcoes.asp"-->