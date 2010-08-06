function makePOSTRequest(url, parameters, tipo) {
	var http_request = false;
	if (window.XMLHttpRequest){
		http_request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {}
		}
	}
	if (!http_request) {
		alert('Cannot create XMLHTTP instance');
		return false;
	}else{
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType("text/xml;charset=iso-8859-1");
		}
	}
	http_request.onreadystatechange = function(){
		result='';
		
		if (http_request.readyState == 4) {
			if (http_request.status == 200) {
				
				result = http_request.responseText;
				if(document.getElementById(tipo)){
					if((tipo=="chat_mensagens")&&(result=="ERROR")){
						parent.location.href='chat_sai.asp';
					}
					document.getElementById(tipo).innerHTML = result; 
				}
				tipo='';
			} else {
				alert('Houve um erro ao processar seu pedido, tente novamente.');
			}
		}
	
	}
	http_request.open('POST', url, true);
	http_request.setRequestHeader('Content-Type','text/xml');
	http_request.setRequestHeader('encoding','ISO-8859-1'); 
	http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	http_request.setRequestHeader("Content-length", parameters.length);
	http_request.setRequestHeader("Connection", "close");
	http_request.send(parameters);
}
