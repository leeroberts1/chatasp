<!--#include file="chat_conecta.asp"-->
<link href="chat_css.css" rel="stylesheet" type="text/css"> 
<%
dim apelido,cor,cor2,pra,reservado
dim res1

apelido=request.QueryString("apelido")
apelido=replace(apelido," ","&nbsp;")
cor=request.QueryString("cor")
cor2=request.QueryString("cor2")
if cor2="" then
	cor2="ff0000"
end if
pra=replace(request.querystring("vpara")," ","&nbsp;")
if len(pra)=0 then
	pra="Todos"
end if

if reservado="" then
	reservado=request.form("reservado")
end if
%>
<script language="JavaScript" type="text/JavaScript">
<!--

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}


function envia() {
var msg=document.menu.msg.value;
var apelido='<%=apelido%>';
var cor='<%=cor%>';
var cor2='<%=cor2%>';
var pra='<%=pra%>';


if (menu.reservado.checked==true)
{ var reservado="-1";
}
else
{ var reservado="0"; 
}

var act=document.menu.Acao.value;

document.menu.msg.value="";
document.menu.msg.focus();
parent.acao.location.href='chat_acao.asp?x=1&apelido='+apelido+'&act='+act+'&cor='+cor+'&cor2='+cor2+'&pra='+pra+'&reservado='+reservado+'&msg='+msg+'';

}
//-->
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="background-color:transparent">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      
    <td align="center" valign="middle"> 
      <form name="menu" method="post" action="chat_menu.asp?apelido=<%=apelido%>&vpara=<%=pra%>&reservado=<%=reservado%>&cor=<%=cor%>&cor2=<%=cor2%>" onSubmit="envia();">
        <table width="751" border="0" cellpadding="0" cellspacing="0" class="tabela_user">
          <tr bgcolor="#e1e1e1"> 
            <td height="25" colspan="3" class="texto"> &gt;&gt; 
              Mensagens</td>
          </tr>
          <tr> 
            <td width="14">&nbsp;</td>
            <td width="612" height="25" align="left" valign="middle"><span class="texto_simples"><%=apelido%></span> 
              <select name="Acao" size="1" class="texto_simples">
                <%
		  Dim Acao(22),i

   Acao(1) = "fala para"
   Acao(2) = "responde para"
   Acao(3) = "pergunta para"
   Acao(4) = "comenta com"
   Acao(5) = "briga com"
   Acao(6) = "concorda com"
   Acao(7) = "discorda de"
   Acao(8) = "desculpa-se com"
   Acao(9) = "surpreende-se com"
   Acao(10) = "murmura para"
   Acao(11) = "sorri para"
   Acao(12) = "suspira por"
   Acao(13) = "flerta com"
   Acao(14) = "entusiasma-se com"
   Acao(15) = "ri de"
   Acao(16) = "dá um fora em"
   Acao(17) = "briga com"
   Acao(18) = "xinga"
   Acao(19) = "grita com"
   
For i = 1 To 19
   Response.Write "<OPTION VALUE=" & replace(Acao(i)," ","&nbsp;")
   Response.Write ">" & Acao(i) & Chr(13)
Next
%>
              </select>
              <span class="texto_simples"><%=pra%> 
              <%
if reservado<0 then
	res1="checked"
end if
%>
              </span>
              <input name="reservado" type="checkbox" value="-1" <%=res1%>>
              <span class="texto">Reservado</span></td>
            <td><input type="hidden" name="enviado" value="sim"></td>
          </tr>
          <tr> 
            <td>&nbsp; </td>
            <td height="25" align="left" valign="middle"> 
              <span class="texto">Mensagem:              </span>
              <input name="msg" type="text" class="inputbusca" id="msg2" size="70">
              <input type="button" name="Submit3" value="Enviar" onClick="envia();" class="inputbusca">            </td>
            <td width="125"><div align="center"> 
                <input name="Submit2" type="button" class="inputbusca" onClick="MM_goToURL('parent','chat_sai.asp?act=saiu&apelido=<%=apelido%>&cor=<%=cor%>');return document.MM_returnValue" value="Sair">
                </div></td>
          </tr>
        </table>
      </form>
      </td>
    </tr>
  </table>
<script>
document.menu.msg.focus();
</script>
<!--#include file="chat_close.asp"-->