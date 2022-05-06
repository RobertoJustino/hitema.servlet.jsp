<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu JSP</title>
</head>
<body>
<div style="text-align: center;">
	<h1>Menu</h1><p>(Hitema version : ${version })</p>
	<h3 style="color:green">${hour}</h3>
</div>
<div style="text-align: center;">
	<h3><a href="/hitema.servlet.jsp/check?opt=students">Etudiants</a></h3>
	<h3><a href="/hitema.servlet.jsp/check?opt=roles">Rôles</a></h3>
</div>
</body>
</html>