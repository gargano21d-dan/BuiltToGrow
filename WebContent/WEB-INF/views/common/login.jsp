<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login - BuiltToGrow</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tema.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login.css">
</head>
<body>

	<%@ include file="../components/navbar.jsp" %>

	<main class="auth">
		<form class="form-box" action="${pageContext.request.contextPath}/login" method="post">
			<h1>Accedi</h1>

			<c:if test="${not empty errore}">
				<p class="errore">${errore}</p>
			</c:if>

			<label for="email">Email</label>
			<input type="email" id="email" name="email" placeholder="latua@email.com">

			<label for="password">Password</label>
			<input type="password" id="password" name="password" placeholder="La tua password">

			<button type="submit" class="btn">Accedi</button>

			<p class="link-registrati">Non hai un account? <a href="${pageContext.request.contextPath}/registrazione">Registrati</a></p>
		</form>
	</main>

	<%@ include file="../components/footer.jsp" %>

</body>
</html>
