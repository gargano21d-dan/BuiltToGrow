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

		<a href="${pageContext.request.contextPath}/admin/prodotto?action=nuovo" class="btn">+ Aggiungi prodotto</a>

		<table class="tabella-carrello">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Prezzo</th>
					<th>IVA</th>
					<th>Quantit&agrave;</th>
					<th>Azioni</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${prodotti}">
					<tr>
						<td>${p.id}</td>
						<td>${p.nome}</td>
						<td>${p.prezzo} &euro;</td>
						<td>${p.iva}%</td>
						<td>${p.quantita}</td>
						<td>
							<a href="${pageContext.request.contextPath}/admin/prodotto?action=modifica&id=${p.id}">Modifica</a>
							<a href="${pageContext.request.contextPath}/admin/prodotto?action=elimina&id=${p.id}" class="rimuovi" onclick="return confirm('Sei sicuro di voler eliminare questo prodotto?');">Elimina</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
