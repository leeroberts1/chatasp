function formatar(src, mask,evt){
	var i = src.value.length;
	var saida = mask.substring(i,i+1);
	var key_code = evt.keyCode  ? evt.keyCode  :
				   evt.charCode ? evt.charCode :
				   evt.which    ? evt.which    : void 0;
  
	if (key_code != 8  &&  key_code != 9  &&  key_code != 13  &&  key_code != 27  &&  key_code != 46){
		if (key_code != 35  &&  key_code != 36  &&  key_code != 37  &&  key_code != 38  &&  key_code != 39  &&  key_code != 40){
			if (saida == "A") {
				return ((key_code >=97) && (key_code  <= 122)) ? true : false ;
			} else if (saida == "0") {
				return ((key_code  >= 48) && (key_code  <= 57))? true : false ;
			} else if (saida == "M") {
				return ((key_code>=48)&&(key_code<=57)||(key_code>=97)&&(key_code<=122))? true : false ;
			} else if (saida == "#") {
				return;
			} else {
				src.value += saida;
				i += 1;
				saida = mask.substring(i,i+1);
				if (saida == "A") {
					if ((key_code  >=97) && (key_code  <= 122)) {
						key_code  -= 32; 
					} else {
						return false;
					}
				} else if (saida == "0") {
					return ((key_code  >= 48) && (key_code  <= 57)) ? true : false ;
				} else if (saida == "M") {
					return ((key_code>=48)&&(key_code<=57)||(key_code>=97)&&(key_code<=122)) ?  true : false ;
				} else {
					return;
				}
			}
		}
	} 
}