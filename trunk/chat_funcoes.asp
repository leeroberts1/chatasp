<%
function alerta(txt,url)
	alerta=""
	if txt<>"" then	alerta=alerta&"alert('"&txt&"');"
	if url<>"" then alerta=alerta&"parent.location.href='"&url&"';"
	alerta="<script>"&alerta&"</script>"
end function

Function Data2(txt)
	dim ssMes,ssDia,ssHoras,ssMinutos,ssSegundos
	ssMes    = Month( txt )
	ssDia    = Day( txt )
	ssHoras    = Hour( txt )
	ssMinutos  = Minute( txt )
	ssSegundos  = Second( txt )
	If ssMes <= 9 Then ssMes = "0" & ssMes
	If ssDia <= 9 Then ssDia = "0" & ssDia
	If ssHoras <= 9 Then ssHoras = "0" & ssHoras
	If ssMinutos <= 9 Then ssMinutos = "0" & ssMinutos
	If ssSegundos <= 9 Then ssSegundos = "0" & ssSegundos
	data2 = ssDia & "/" & ssMes & "/" & Year(txt) & " " & ssHoras & ":" & ssMinutos & ":" & ssSegundos
End Function

Function FormataData(data)
	dim dd,mm,aa
	dim Horas,Minutos,Segundos
	dd = Day(data)
	mm = Month(data)
	aa = Year(data)

	if len(dd) = 1 then dd = "0" & dd
	if len(mm) = 1 then mm = "0" & mm

	Horas    = Hour( data )
	Minutos  = Minute( data )
	Segundos  = Second( data )
	If Horas <= 9 Then Horas = "0" & Horas
	If Minutos <= 9 Then Minutos = "0" & Minutos
	If Segundos <= 9 Then Segundos = "0" & Segundos
 
	FormataData = CStr( mm & "/" &dd & "/" & aa & " " & Horas & ":" & Minutos & ":" & Segundos)
end function

Function Fun_Hora()
	dim hora,minutos,segundos
	hora = hour(now)
	minutos = minute(now)
	segundos =second(now)
	if len(hora) = 1 or hora < 10 or hora = 0 then
 		hora = "0" + CStr(hora)
	end if
	if len(minutos) = 1 or minutos < 10 then
		 minutos = "0" + CStr(minutos)
	end if
	if len(segundos) = 1 or segundos < 10 then
		segundos = "0" + CStr(segundos)
	end if
	Fun_Hora = CStr(hora) + ":" + CStr(minutos) + ":" + CStr(segundos)
End Function

function verificauser()
	dim hora,sql,sai
	hora = DATEADD("n", -5, fun_hora())
	sql="SELECT chat_users.id, chat_users.session_id, chat_users.apelido, chat_users.hora_s, chat_users.cor, chat_users.hora_ent FROM chat_users WHERE (((chat_users.hora_ent)<Now()) AND ((DateDiff(""n"",[hora_s],Time()))>5 Or (DateDiff(""n"",[hora_s],Time()))<-5))"
	set sai=conn.execute(sql)
	if not sai.eof then
		while not sai.eof
			saida sai("apelido"),sai("cor")
			sql="delete * from chat_users where id="&sai("id")
			conn.execute(sql) 			
		sai.movenext
		wend
	end if
	sai.close
	set sai=nothing
	
end function

Sub saida(apelido,cor)
	dim sql
	sql="insert into chat_msg (de_user,cor_de,para_user,cor_para,act,msg,hora,reservado) values ('"&site&"','"&cor&"','Todos','"&cor&"','avisa','<font color=""#"&cor&""">"&apelido&"</font> saiu da sala',#"&Data2(now)&"#,true)"
	conn.execute(sql)
end sub

function verifica(sessao)
	verificauser()
	sql="select * from chat_users where session_id="&sessao
	set tm=conn.execute(sql)
	if tm.eof then
		response.write alerta("Você ficou muito tempo parado agora terá que se conectar de novo","chat_sai.asp")
	end if
	tm.close
	set tm=nothing
end function

function online()
	dim user
	sql="select count(*) as total from chat_users"
	set user=conn.execute(sql)
	if not user.eof then
		online=user("total")
	else
		online=0
	end if
	user.close
	set user=nothing
	online=online &" Usuarios ativos"
end function
%>