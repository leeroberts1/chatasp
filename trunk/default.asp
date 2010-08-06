<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CHATASP - Bate Papo</title>
<script src="js/js.js" language="javascript"></script>
</head>
<body>
<%
For Each objCookie In Request.Cookies
	Response.Cookies(objCookie) = ""
	Response.Cookies(objCookie).Expires = now()-1
Next
%>
Redirecionando ....
<script>verificajs();location.href='chat_index.asp';</script>
<%
	response.write request.ServerVariables("ALL_HTTP")
	'response.Redirect("chat_index.asp")
%>
</body>
</html>