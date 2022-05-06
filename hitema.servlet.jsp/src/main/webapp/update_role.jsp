<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create/Update Rôle</title>
</head>
<body>
<h3>${msgClient}</h3>
	 <form action = "<c:url value = "/check?opt=role&update=${update}"/>"  method = "POST">
         <c:if test="${!empty id}">
			 Id :<input type = "text" name = "id" value="${id}" readonly>
		</c:if>
        
         <br />
         Name :<input type = "text" name = "name" value="${name}" size="30%">
         <br />
         Label: <input type = "text" name = "label" value="${label}" size="50%"/>
         <br>
         <input type = "submit" value = "Valide" />
	</form>
    <a href="<c:url value = "/check?opt=roles"/>">
		<button>Retour</button>
	</a>
</body>
</html>