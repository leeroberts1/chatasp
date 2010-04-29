function troca_target(apelido,para,cor1,cor2){
	var menu=parent.document.getElementById('menu');
	menu.src='chat_menu.asp?apelido='+apelido+'&vpara='+para+'&cor='+cor1+'&cor2='+cor2;
}

function rolagem(){
	if(parent.document.getElementById("rolar").checked){
  		location.hash = "MARCA"
	}
	
}