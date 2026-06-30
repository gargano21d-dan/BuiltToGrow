<header>
	<a href="${pageContext.request.contextPath}/home" class="logo">BuiltToGrow</a>

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
		<c:choose>
			<c:when test="${not empty sessionScope.utente}">
				<a href="${pageContext.request.contextPath}/ordini">I miei ordini</a>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/login">Accedi</a>
			</c:otherwise>
		</c:choose>
		<a href="${pageContext.request.contextPath}/carrello">Carrello</a>
	</div>
</header>
