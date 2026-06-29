<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BuiltToGrow - Integratori e Fitness</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/home.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main>

		<section class="hero">
			<h1>Non aspettare il cambiamento. <span>Costruiscilo.</span></h1>
			<p>Integratori puri, abbigliamento tecnico e accessori essenziali per superare i tuoi limiti.</p>
			<a href="${pageContext.request.contextPath}/catalogo" class="btn">Scopri la collezione</a>
		</section>

		<section class="evidenza">
			<h2>I preferiti dalla community</h2>

			<div class="griglia-prodotti">
				<c:forEach var="p" items="${prodotti}">
					<article class="card">
						<a href="${pageContext.request.contextPath}/prodotto?id=${p.id}" class="card-link">
							<div class="card-img"></div>
							<h3>${p.nome}</h3>
						</a>
						<p class="prezzo">${p.prezzo} &euro;</p>
						<a href="${pageContext.request.contextPath}/carrello?action=add&id=${p.id}" class="btn-card">Aggiungi</a>
					</article>
				</c:forEach>
			</div>
		</section>

	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
