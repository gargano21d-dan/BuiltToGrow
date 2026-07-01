<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Errore del server - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main class="pagina-errore">
		<h1>500</h1>
		<h2>Errore del server</h2>
		<p>Qualcosa &egrave; andato storto. Riprova pi&ugrave; tardi.</p>
		<a href="${pageContext.request.contextPath}/home" class="btn">Torna alla home</a>
	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
