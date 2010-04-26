
<title><%=application("site")%> - Bate papo</title>



<%
apelido=replace(request.querystring("apelido")," ","&nbsp;")
cor=server.urlencode(request.querystring("cor"))
%>
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
<body background="imagens/fundoadm.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onUnload="MM_openBrWindow('chat_sai.asp?act=saiu2&apelido=<%=apelido%>&cor=<%=cor%>','xx','width=100,height=100')">
<table width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="80" colspan="2"> <iframe frameborder="0" width="100%" height="100%" scrolling="no" src="chat_topo.asp" allowtransparency="true" name="topo"></iframe> 
    </td>
  </tr>
  <tr> 
    <td width="83%" height="350" rowspan="2"> <iframe frameborder="0" width="100%" height="100%" scrolling="auto" src="chat_msgs.asp" name="meio" allowtransparency="true"></iframe> 
    </td>
    <td width="140" height="350"> 
      <iframe frameborder="0" width="100%" height="100%" scrolling="auto" src="chat_users.asp?apelido=<%=apelido%>&cor=<%=cor%>" name="users" allowtransparency="true"></iframe> 
    </td>
  </tr>
  <tr>
    <td> 
      <iframe frameborder="0" width="0" height="0" scrolling="no" src="chat_acao.asp" name="acao" allowtransparency="true"></iframe> </td>
  </tr>
  <tr> 
    <td height="80" colspan="2"> <iframe frameborder="0" width="100%" height="100%" scrolling="no" src="chat_menu.asp?apelido=<%=apelido%>&cor=<%=cor%>" name="menu" allowtransparency="true"></iframe> 
    </td>
  </tr>
</table>
