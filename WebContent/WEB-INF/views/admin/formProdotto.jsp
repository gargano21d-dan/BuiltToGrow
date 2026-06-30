<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Gestione prodotto - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main class="auth">
		<form class="form-box" action="${pageContext.request.contextPath}/admin/prodotto?action=salva" method="post">
			<h1>${prodotto != null ? 'Modifica prodotto' : 'Nuovo prodotto'}</h1>

			<input type="hidden" name="id" value="${prodotto.id}">

			<label for="nome">Nome</label>
			<input type="text" id="nome" name="nome" value="${prodotto.nome}" required>

			<label for="descrizione">Descrizione</label>
			<input type="text" id="descrizione" name="descrizione" value="${prodotto.descrizione}">

			<label for="prezzo">Prezzo (&euro;)</label>
			<input type="text" id="prezzo" name="prezzo" value="${prodotto.prezzo}" pattern="[0-9]+([.][0-9]+)?" title="Solo numeri, es. 34.99" required>

			<label for="iva">IVA (%)</label>
			<input type="text" id="iva" name="iva" value="${prodotto.iva}" pattern="[0-9]+([.][0-9]+)?" title="Solo numeri, es. 22" required>

			<label for="quantita">Quantit&agrave;</label>
			<input type="text" id="quantita" name="quantita" value="${prodotto.quantita}" pattern="[0-9]+" title="Solo numeri interi" required>

			<label for="categoria_id">Categoria</label>
			<select id="categoria_id" name="categoria_id" required>
				<c:forEach var="cat" items="${categorie}">
					<option value="${cat.id}" ${cat.id == prodotto.categoriaId ? 'selected' : ''}>${cat.nome}</option>
				</c:forEach>
			</select>

			<button type="submit" class="btn">Salva</button>
			<p class="link-registrati"><a href="${pageContext.request.contextPath}/admin">&larr; Torna alla lista</a></p>
		</form>
	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
