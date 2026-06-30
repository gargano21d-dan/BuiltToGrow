<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>I tuoi ordini - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/carrello.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main class="carrello">
		<h1>I tuoi ordini</h1>

		<c:if test="${param.success == 'true'}">
			<p class="conferma">Ordine effettuato con successo!</p>
		</c:if>

		<c:choose>
			<c:when test="${empty ordini}">
				<p>Non hai ancora effettuato ordini. <a href="${pageContext.request.contextPath}/catalogo">Vai al catalogo</a></p>
			</c:when>
			<c:otherwise>
				<table class="tabella-carrello">
					<thead>
						<tr>
							<th>Ordine N&deg;</th>
							<th>Data</th>
							<th>Totale</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="o" items="${ordini}">
							<tr>
								<td>${o.id}</td>
								<td>${o.dataOrdine}</td>
								<td>${o.prezzoTotale} &euro;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>

		<a href="${pageContext.request.contextPath}/catalogo" class="continua">&larr; Continua lo shopping</a>

	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
