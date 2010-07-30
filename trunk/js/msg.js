function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}


function envia() {
	var msg=document.getElementById('msg2').value;
	var apelido=document.getElementById('apelido').innerHTML;
	var cor=document.getElementById('apelido').style.color;
	var cor2=document.getElementById('para').style.color;
	cor=rgbConvert(cor).replace('#','');
	cor2=rgbConvert(cor2).replace('#','');
	var pra=document.getElementById('para').innerHTML;
	if (document.getElementById('reservado').checked==true){
		var reservado="-1";
	}else{
		var reservado="0"; 
	}
	var act=document.getElementById('acao').value;
	document.getElementById('msg2').value="";
	document.getElementById('msg2').focus();
	var dados='chat_acao.asp?x=1&apelido='+apelido+'&act='+act+'&cor='+cor+'&cor2='+cor2+'&pra='+pra+'&reservado='+reservado+'&msg='+msg;
	makePOSTRequest(dados, act, 'chat_mensagens');
}