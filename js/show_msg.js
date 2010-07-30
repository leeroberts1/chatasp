function show_text(){
	rolagem();
	var videoid="id=1";
	makePOSTRequest('inc_msg.asp', videoid, 'chat_mensagens');
}

function reset_form(){
	window.setInterval('show_text()',3000);
}		