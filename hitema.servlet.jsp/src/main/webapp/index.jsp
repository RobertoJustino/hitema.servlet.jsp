<%--
  Created by IntelliJ IDEA.
  User: Developpeur
  Date: 04/05/2022
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   
<html>
<head>
    <title>Index JSP/Servlet</title>
</head>
<body>
<div style="margin: 5%">
    <h1 style="text-align: center">Bienvenue JSP/Servlet</h1>
    <h2><a href="<c:url value = "/check?opt=menu"/>">Menu</a></h2>
</div>
</body>
</html>
