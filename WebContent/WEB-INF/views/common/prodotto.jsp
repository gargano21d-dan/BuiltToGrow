<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>${prodotto.nome} - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/prodotto.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main>
		<div class="prodotto-dettaglio">
			<div class="prodotto-img"></div>

			<div class="prodotto-info">
				<h1>${prodotto.nome}</h1>
				<p class="prezzo-grande">${prodotto.prezzo} &euro;</p>
				<p class="descrizione">${prodotto.descrizione}</p>

				<div class="acquisto">
					<a href="${pageContext.request.contextPath}/carrello?action=add&id=${prodotto.id}" class="btn">Aggiungi al carrello</a>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
