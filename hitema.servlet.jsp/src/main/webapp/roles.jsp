<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rôle JSP</title>
</head>
<body>
	<div style="text-align: center;">
	<h1>Liste des Rôles</h1>
	<div>
		<h3>Total : ${fn:length(roles)} </h3>
		<h3>${msgClient}</h3>
		<a href="<c:url value = "/check?opt=menu"/>">
			<button>Retour</button>
		</a>
		<a href="<c:url value = "/check?opt=new role" />">
			<button>Nouveau</button>
		</a>
	</div>
	</div>
<div style="margin: 2%">
		<table border="1" style="width:80%; margin: auto;" >
		 	<thead>
			<tr>
			    <th style="width: 5%">Id</th>
			    <th style="width: 30%">Name</th>
			    <th style="width: 50%">Label</th>
			    <th style="width: 5%">Delete</th>
  			</tr>
  		 </thead>
  		 <tbody>
			<c:forEach items="${roles}" var="r">
				<tr>
					<td>${r.id}</td>
					<td><a href="<c:url value = "check?opt=update role&id=${r.id}"/>">${r.name}</a></td>
					<td>${r.label}</td>
					<td style="text-align: center;">
						<a href="<c:url value = "/check?opt=delete role&id=${r.id}"/>">
							<button>Delete</button>
						</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table> 
	</div>
</body>
</html>