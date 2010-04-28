<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<title>CHATASP - Bate Papo</title>
	<link href="chat_css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function keypresed() {
alert('Todos os direitos reservados a <%=titulo%>');
} 
document.onkeydown=keypresed;
//-->
</script>
</head>	
<%
apelido=replace(request.querystring("apelido")," ","&nbsp;")
cor=server.urlencode(request.querystring("cor"))
%>
<body onUnload="MM_openBrWindow('chat_sai.asp?act=saiu2&apelido=<%=apelido%>&cor=<%=cor%>','xx','width=100,height=100')">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F4F4F4">
  <tr> 
    <td height="80" colspan="2"><!--#include file="chat_topo.asp" -->
    </td>
  </tr>
  <tr> 
    <td width="83%" height="100%" rowspan="2" valign="top"> <iframe frameborder="0" width="100%" height="100%" scrolling="auto" src="chat_msgs.asp" name="meio" id="meio" allowtransparency="true"></iframe> 
    </td>
    <td width="140" height="100%"> 
      <iframe frameborder="0" width="100%" height="100%" scrolling="auto" src="chat_users.asp?apelido=<%=apelido%>&cor=<%=cor%>" name="users" id="users" allowtransparency="true"></iframe> 
    </td>
  </tr>
  <tr>
    <td valign="top"> 
      <iframe frameborder="0" width="0" height="0" scrolling="no" src="chat_acao.asp" name="acao" id="acao" allowtransparency="true"></iframe> 
	</td>
  </tr>
  <tr> 
    <td height="90" colspan="2"> <iframe frameborder="0" width="100%" height="100%" scrolling="no" src="chat_menu.asp?apelido=<%=apelido%>&cor=<%=cor%>" name="menu" id="menu" allowtransparency="true"></iframe> 
    </td>
  </tr>
</table>
</body>
</html>