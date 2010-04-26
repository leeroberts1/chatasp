<!--#include file="chat_conecta.asp" -->
<!--#include file="chat_funcoes.asp" -->
<meta http-equiv="refresh" content="5">


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="background-color:transparent">
<p>
  <style type="text/css">
<!--
.reservado {
	background-color: #c1c1c1;
}
.avisa {
	background-color: #00FF66;
}
.avisa2 {
	background-color: #FFCC00;
}
.grita {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	font-weight: bold;
}
body {
	SCROLLBAR-FACE-COLOR: #777777;
	FONT-SIZE: 10px;
	COLOR: #000000;
	font-family: Arial, Helvetica, sans-serif;
}
body	{SCROLLBAR-3DLIGHT-COLOR: #777777; }
body	{SCROLLBAR-ARROW-COLOR: white; }
body	{SCROLLBAR-TRACK-COLOR: #f5f6ed; FONT-STYLE: normal; FONT-FAMILY: Tahoma, Arial, Helvetica; }
body	{SCROLLBAR-DARKSHADOW-COLOR: #777777; }
body	{SCROLLBAR-BASE-COLOR: #777777}
-->
</style>
</p>
<p>&nbsp;</p>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="2%">&nbsp;</td>
    <td width="98%"> <font size="2" face="Arial, Helvetica, sans-serif"> 
      <%
	  response.Flush()
hora = fun_hora()
sql="select * from chat_users where session_id="&session.SessionID
set rs1=conn.execute(sql)
if not rs1.eof then
hora_ent=rs1("hora_ent")
apelido=rs1("apelido")


	
	sql="select * from chat_msg where hora between #"&cdate(FormataData(hora_ent))&"# and #"&cdate(data2(now))&"# order by hora,id desc"
	'sql="select * from chat_msg where hora < #"&hora_ent&"# or hora = #"&hora_ent&"#"
	set rs=conn.execute(sql)
	'response.write sql
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
	response.write "<font class="&x&">"&msg&"</font><br><br>"
	end if
	else
	response.write msg&"<br><br>"
	end if
	rs.movenext
	response.Flush()
	wend
	end if
	rs.close
set rs=nothing
else
response.Flush()
'response.write verifica(session.SessionID)	
response.write session.SessionID
end if
rs1.close
set rs1=nothing
response.Flush()
	%>
      </font> </td>
  </tr>
</table>
<A NAME="#MARCA"></A>
<script language="VBScript">
Sub Rolagem()
if parent(0).rolar.checked then
   window.location.href = "#MARCA"
End if
End sub

Rolagem()
</script>

<!--#include file="chat_close.asp" -->