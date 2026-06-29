<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Catalogo - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/catalogo.css">
</head>
<body>

	<header>
		<a href="${pageContext.request.contextPath}/index.html" class="logo">BuiltToGrow</a>

		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/catalogo">Integrazione</a></li>
				<li><a href="${pageContext.request.contextPath}/catalogo">Vestiario</a></li>
				<li><a href="${pageContext.request.contextPath}/catalogo">Accessori</a></li>
				<li><a href="#">Obiettivi</a></li>
				<li><a href="#">Blog</a></li>
			</ul>
		</nav>

		<div class="azioni-utente">
			<a href="${pageContext.request.contextPath}/login.html">Accedi</a>
			<a href="${pageContext.request.contextPath}/carrello.html">Carrello</a>
		</div>
	</header>

	<main class="catalogo">

		<aside class="sidebar">
			<h3>Categorie</h3>
			<ul>
				<li><a href="${pageContext.request.contextPath}/catalogo">Tutti i prodotti</a></li>
				<li><a href="#">Proteine</a></li>
				<li><a href="#">Creatina</a></li>
				<li><a href="#">Vitamine</a></li>
				<li><a href="#">Abbigliamento</a></li>
				<li><a href="#">Accessori</a></li>
			</ul>
		</aside>

		<section class="prodotti">
			<h1>Catalogo prodotti</h1>

			<div class="griglia-catalogo">

				<c:forEach var="p" items="${prodotti}">
					<article class="card">
						<div class="card-img"></div>
						<h3>${p.nome}</h3>
						<p class="prezzo">${p.prezzo} &euro;</p>
						<a href="#" class="btn-card">Aggiungi</a>
					</article>
				</c:forEach>

			</div>
		</section>

	</main>

	<footer>
		<p>BuiltToGrow &copy; 2026 - Progetto Tecnologie Software per il Web</p>
	</footer>

</body>
</html>
