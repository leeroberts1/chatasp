<!--#include file="chat_conecta.asp"-->
<!--#include file="chat_funcoes.asp" -->
<%

if request.querystring("x")=1 then

sql="update chat_users set hora_s=#"&fun_hora&"# where session_id="&session.SessionID
conn.execute(sql)


apelido=trim(replace(request.QueryString("apelido"),"'","''"))
apelido=replace(apelido,"&nbsp;"," ")
cor=trim(replace(request.QueryString("cor"),"'","''"))
cor2=trim(replace(request.QueryString("cor2"),"'","''"))
if cor2="" then
cor2="ff0000"
end if
pra=trim(replace(request.querystring("vpara"),"'","''"))
pra=replace(pra,"&nbsp;"," ")
if len(pra)=0 then
pra="Todos"
end if


res=replace(request.querystring("reservado"),"'","''")
if res="" then
res=0
end if

msg=request.querystring("msg")

if msg<>"" then msg=replace(msg,"'","''")

msg=server.HTMLEncode(msg)

act=request.querystring("act")
if act="" then
act="fala para"
end if

if msg<>"" then
sql="insert into chat_msg (de_user,cor_de,para_user,cor_para,act,msg,hora,reservado) values ('"&apelido&"','"&cor&"','"&pra&"','"&cor2&"','"&act&"','"&msg&"',#"&data2(now)&"#,"&res&")"
conn.execute(sql)
end if



end if
%>
<!--#include file="chat_close.asp"-->