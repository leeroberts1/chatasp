<!--#include file="chat_conecta.asp" -->
<%
	'response.write "<div>"
	Response.Charset = "ISO-8859-1"
	
	dim hora,sql,rs1
	dim hora_ent
	dim apelido
	dim rs
	dim de,para,act
	dim x,x1,x2
	dim msg
	dim meuid
	meuid=request.Cookies("sessionid")
	if meuid="" then meuid=0
	
	hora = fun_hora()
	sql="select * from chat_users where session_id="&meuid'session.SessionID
	set rs1=conn.execute(sql)
	'response.write sql&"<br>"
	if not rs1.eof then
		hora_ent=rs1("hora_ent")
		apelido=rs1("apelido")
		sql="select * from chat_msg where hora between #"&cdate(FormataData(hora_ent))&"# and #"&cdate(data2(now))&"# order by hora,id desc"
		set rs=conn.execute(sql)
		if not rs.eof then
		while not rs.eof
			de="<font color=""#"&rs("cor_de")&""">"&rs("de_user")&"</font>"
			para="<font color=""#"&rs("cor_para")&""">"&rs("para_user")&"</font> "
			hora=right(rs("hora"),8)
			act=rs("act")
			if act="avisa" then 
				x="avisa"
			elseif act="comunica" then 
				x="avisa2"
			else
				x="reservado"
			end if
	  		if act="grita com" then 
			  x1="<font class=""grita"">"
			  x2="</font>"
	    	end if
	  		msg=x1&"("&hora&") "& de &" "&act&" "& para &": "&rs("msg")&x2
			x1=""
			x2=""
			response.write "<div id='msg'>"
			if rs("reservado")=true then
				if rs("para_user")=replace(apelido," ","&nbsp;") or rs("para_user")="Todos" or rs("de_user")=apelido then
					response.write "<div class="""&x&""">"&msg&"</div>"
				end if
			else
				response.write msg'&"</div>"&chr(13)
			end if
			response.write "</div>"&chr(13)
		rs.movenext
		response.Flush()
		wend
		end if
		rs.close
		set rs=nothing
	else
		response.write "ERROR"
	end if
	rs1.close
	set rs1=nothing
	response.Flush()
	'response.write "</br>"
	'response.write "</div>"
%>
<!--#include file="chat_close.asp" -->