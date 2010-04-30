function formatar(){
	var apelido=document.getElementById("apelido");
	var reDigits = /\w/;
	if(apelido){
		if (reDigits.test(apelido.value)) {
			return true;
		} else {
			document.getElementById("err").innerHTML='* Apelido somente letras e numeros';
			return false;
		}
	}
}