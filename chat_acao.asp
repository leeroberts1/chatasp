<!--#include file="chat_conecta.asp"-->
<%
Response.Charset = "ISO-8859-1"
if request.querystring("x")=1 then

	dim sql
	dim apelido
	dim cor
	dim cor2
	dim pra
	dim res
	dim msg
	dim act
	dim meuid
	meuid=request.Cookies("sessionid")
	
	sql="update chat_users set hora_s=#"&fun_hora&"# where session_id="&meuid'session.SessionID
	conn.execute(sql)

	apelido=request.QueryString("apelido")
	apelido=trim(apelido)
	apelido=replace(apelido,"&nbsp;"," ")
	apelido=replace(apelido,"'","''")
	cor=trim(replace(request.QueryString("cor"),"'","''"))
	cor2=trim(replace(request.QueryString("cor2"),"'","''"))
	pra=trim(replace(request.querystring("pra"),"'","''"))
	pra=replace(pra,"&nbsp;"," ")
	res=replace(request.querystring("reservado"),"'","''")
	msg=request.querystring("msg")
	act=replace(request.querystring("act"),"Â","")

	if cor2="" then cor2="ff0000"
	if len(pra)=0 then pra="Todos"
	if res="" then res=0
	if act="" then act="fala para"

	if msg<>"" then
		msg=replace(msg,"'","''")
		msg=server.HTMLEncode(msg)
		sql="insert into chat_msg (de_user,cor_de,para_user,cor_para,act,msg,hora,reservado) values ('"&apelido&"','"&cor&"','"&pra&"','"&cor2&"','"&act&"','"&msg&"',#"&data2(now)&"#,"&res&")"
		conn.execute(sql)
		response.write "<span>...</span>"
	end if

end if
%>
<!--#include file="chat_close.asp"-->