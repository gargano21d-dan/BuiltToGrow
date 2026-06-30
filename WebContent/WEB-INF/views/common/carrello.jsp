<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Carrello - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/carrello.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main class="carrello">

		<h1>Il tuo carrello</h1>

		<c:choose>
			<c:when test="${empty carrello.items}">
				<p>Il carrello &egrave; vuoto. <a href="${pageContext.request.contextPath}/catalogo">Vai al catalogo</a></p>
			</c:when>
			<c:otherwise>
				<div class="carrello-contenuto">

					<table class="tabella-carrello">
						<thead>
							<tr>
								<th>Prodotto</th>
								<th>Prezzo</th>
								<th>Quantit&agrave;</th>
								<th>Totale</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${carrello.items}">
								<tr>
									<td>${item.prodotto.nome}</td>
									<td>${item.prodotto.prezzo} &euro;</td>
									<td>${item.quantita}</td>
									<td>${item.subtotale} &euro;</td>
									<td><a href="${pageContext.request.contextPath}/carrello?action=remove&id=${item.prodotto.id}" class="rimuovi">Rimuovi</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<aside class="riepilogo">
						<h2>Riepilogo ordine</h2>
						<div class="riga totale"><span>Totale</span><span>${carrello.totale} &euro;</span></div>
						<a href="${pageContext.request.contextPath}/checkout" class="btn">Procedi al checkout</a>
					</aside>

				</div>
			</c:otherwise>
		</c:choose>

		<a href="${pageContext.request.contextPath}/catalogo" class="continua">&larr; Continua lo shopping</a>

	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
