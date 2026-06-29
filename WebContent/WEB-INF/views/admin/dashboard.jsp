<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Area Admin - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/carrello.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main class="carrello">
		<h1>Area Amministratore &mdash; Prodotti</h1>

		<table class="tabella-carrello">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Prezzo</th>
					<th>Quantit&agrave;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${prodotti}">
					<tr>
						<td>${p.id}</td>
						<td>${p.nome}</td>
						<td>${p.prezzo} &euro;</td>
						<td>${p.quantita}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
