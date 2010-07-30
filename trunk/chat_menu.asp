<%
apelido=request("apelido")
apelido=replace(apelido," ","&nbsp;")
cor=request("cor")
%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      
    <td align="center" valign="middle"> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabelas">
          <tr bgcolor="#e1e1e1"> 
            <td height="25" colspan="3" class="texto"> &gt;&gt; 
              Mensagens<span id="chat_mensagens"></span></td>
          </tr>
          <tr> 
            <td width="14">&nbsp;</td>
            <td width="612" height="25" align="left" valign="middle">
			<span class="texto_simples">
				<span style="color:#<%=cor%>" id="apelido">
					<%=apelido%>
				</span>
			</span> 
              <select name="Acao" size="1" class="texto_simples" id="acao">
                <%
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
			<span class="texto_simples">
				<span style="color:#FF0000" id="para">
					Todos
				</span>
			</span> 			  
              <input name="reservado" type="checkbox" value="true" <%=res1%> id="reservado">
              <span class="texto">Reservado</span></td>
            <td><input type="hidden" name="enviado" value="sim"></td>
          </tr>
          <tr> 
            <td>&nbsp; </td>
            <td height="25" align="left" valign="middle"> 
              <span class="texto">Mensagem:              </span>
              <input name="msg" type="text" class="inputbusca" id="msg2" size="70">
              <input type="button" name="enviar" value="Enviar" onClick="envia();" class="inputbusca">            </td>
            <td width="125"><div align="center"> 
                <input name="sair" type="button" class="inputbusca" onClick="MM_goToURL('parent','chat_sai.asp?act=saiu&apelido=<%=apelido%>&cor=<%=cor%>');return document.MM_returnValue" value="Sair">
                </div></td>
          </tr>
          <tr>
            <td height="10" colspan="3"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<script>
	document.getElementById("msg2").focus();
</script>
