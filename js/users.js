function troca_target(para,cor2){
	var para_=document.getElementById('para');
	para_.innerHTML=para;
	para_.style.color=rgbConvert(cor2);
	document.getElementById('msg2').value="";
	document.getElementById('msg2').focus();	
}

function rolagem(){
	if(parent.document.getElementById('rolar').checked){
  		location.hash = "MARCA"
	}
	
}

function show_users(){
	makePOSTRequest('chat_users.asp', 'act', 'users');
}

function reset_users(){
	window.setInterval('show_users()',10000);
}

function rgbConvert(str) {
	if(str.length==6){
		return ('#'+str);
	}else{
		str = str.replace(/rgb\(|\)/g, "").split(",");
		str[0] = parseInt(str[0], 10).toString(16).toLowerCase();
		str[1] = parseInt(str[1], 10).toString(16).toLowerCase();
		str[2] = parseInt(str[2], 10).toString(16).toLowerCase();
		str[0] = (str[0].length == 1) ? '0' + str[0] : str[0];
		str[1] = (str[1].length == 1) ? '0' + str[1] : str[1];
		str[2] = (str[2].length == 1) ? '0' + str[2] : str[2];
		return ('#' + str.join(""));
	}
}