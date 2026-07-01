<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pagina non trovata - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main class="pagina-errore">
		<h1>404</h1>
		<h2>Pagina non trovata</h2>
		<p>La pagina che stai cercando non esiste o &egrave; stata spostata.</p>
		<a href="${pageContext.request.contextPath}/home" class="btn">Torna alla home</a>
	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
