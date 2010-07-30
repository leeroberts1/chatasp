function verificajs(){ 
 var a_data = new Date();
 a_data.setDate(a_data.getDate()+1);
 var o_cookie_data = a_data.toUTCString();
 var o_cookie = "javascript = " + escape("ativado");
 o_cookie = o_cookie+ ";expires="+ o_cookie_data;
 document.cookie = o_cookie;
} 

function js_redir(loc){
	parent.location.href=loc;
}