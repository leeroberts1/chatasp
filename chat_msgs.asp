<!--#include file="chat_conecta.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta http-equiv="refresh" content="5">
	<title>CHATASP - Bate Papo</title>
	<link href="chat_css.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color:transparent">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="2%">&nbsp;</td>
    <td width="98%"> <font size="2" face="Arial, Helvetica, sans-serif"> 
      <%
	dim hora,sql,rs1
	dim hora_ent
	dim apelido
	dim rs
	dim de,para,act
	dim x,x1,x2
	dim msg
	
	hora = fun_hora()
	sql="select * from chat_users where session_id="&session.SessionID
	set rs1=conn.execute(sql)
	if not rs1.eof then
		hora_ent=rs1("hora_ent")
		apelido=rs1("apelido")
		sql="select * from chat_msg where hora between #"&cdate(FormataData(hora_ent))&"# and #"&cdate(data2(now))&"# order by hora,id desc"
		set rs=conn.execute(sql)
		if not rs.eof then
		while not rs.eof
			de="<font color=#"&rs("cor_de")&">"&rs("de_user")&"</font>"
			para="<font color=#"&rs("cor_para")&">"&rs("para_user")&"</font> "
			hora="<font size=1 face=arial>"&right(rs("hora"),8)&"</font>"
			act=rs("act")
			if act="avisa" then 
				x="avisa"
			elseif act="comunica" then 
				x="avisa2"
			else
				x="reservado"
			end if
	  		if act="grita com" then 
			  x1="<font class=grita>"
			  x2="</font>"
	    	end if
	  		msg=x1&"("&hora&") "& de &" "&act&" "& para &": "&rs("msg")&x2
			x1=""
			x2=""
			if rs("reservado")=true then
				if rs("para_user")=replace(apelido," ","&nbsp;") or rs("para_user")="Todos" or rs("de_user")=apelido then
					response.write "<font class="&x&">"&msg&"</font><br>"
				end if
			else
				response.write msg&"<br>"
			end if
		rs.movenext
		response.Flush()
		wend
		end if
		rs.close
		set rs=nothing
	else
		response.Flush()
		response.write session.SessionID
	end if
	rs1.close
	set rs1=nothing
	response.Flush()
	%>
      </font> </td>
  </tr>
</table>
<A NAME="MARCA"></A>
<script language="javascript">
function rolagem(){
	
	if(parent.document.getElementById("rolar").checked){
  		location.hash = "MARCA"
	}
	
}
rolagem()
</script>
</body>
</html>
<!--#include file="chat_close.asp" -->