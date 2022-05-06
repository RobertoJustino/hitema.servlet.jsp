<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students JSP</title>
</head>
<body>
	<div style="text-align: center;">
	<h1>Liste des Etudiants</h1>
	<div>
		<h3>Total : ${fn:length(students)} </h3>
		<a href="<c:url value = "check?opt=menu"/>">
			<button>Retour</button>
		</a>
		<a href="<c:url value = "/"/>">
			<button>Nouveau</button>
		</a>
<!-- 		<button onclick="hitema.servlet.jsp">Retour</button> -->
	</div>
	
		<table>
		 	<thead>
			<tr>
			    <th>Id</th>
			    <th>First Name</th>
			    <th>Last Name</th>
			    <th>Gender</th>
			    <th>Birth Date</th>
			    <th>Email Address</th>
  			</tr>
  		 </thead>
  		 <tbody>
			<c:forEach items="${students}" var="s">
				<tr>
					<td>${s.id}</td>
					<td>${s.firstName}</td>
					<td>${s.lastName}</td>
					<td>${s.genre}</td>
					<td>${s.birthDate}</td>
					<td>${s.email}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table> 
	</div>
</body>
</html>