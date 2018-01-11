<%@ include file="layouts/header.jsp" %>

<h4>
	<c:if test="${empty personne}">
		<span class="fa fa-user-plus solo"> Enregister une personne</span>
	</c:if>
	<c:if test="${not empty personne}">
		<span class="fa fa-user solo">
			${fn:toUpperCase(personne.nom)} ${fn:toUpperCase(fn:substring(personne.prenom, 0, 1))}${fn:toLowerCase(fn:substring(personne.prenom, 1,fn:length(personne.prenom)))}
		</span>
	</c:if>
</h4>
<hr />	
<div>

<c:if test="${not empty confirmationMessage}">
    <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>${confirmationMessage}</strong>
    </div>
</c:if>

	<form action="register" method="post">
		<div class="form-group">
			<label for="email">Nom:</label> 
			<input type="text" class="form-control" id="nom" name="nom" 
				<c:if test="${not empty personne}">value="${personne.nom}" readonly </c:if>
			/>
		</div>
		<div class="form-group">
			<label for="email">Prénom:</label> 
			<input type="text" class="form-control" id="prenom" name="prenom" 
				<c:if test="${not empty personne}">value="${personne.prenom}" readonly </c:if>
			/>
		</div>
		<div class="form-group">
			<label for="pwd">Date de naissance:</label> 
			<input type="text" class="form-control" id="dateNaissance" name="dateNaissance" 
				<c:if test="${not empty personne}">value="${personne.dateNaissance}" readonly </c:if>
			/>
		</div>
		<div class="form-group">
			<label for="pwd">Telephone:</label> 
			<input type="text" class="form-control" id="telephone" name="telephone" 
				<c:if test="${not empty personne}">value="${personne.telephone}" readonly </c:if>
			/>
		</div>
		
		<c:if test="${empty personne}">
			<button type="submit" class="btn btn-default">Enregistrer</button>
		</c:if>
		<c:if test="${not empty personne}">
			<a href="/list_personnes" class="btn btn-info btn-sm" role="button"><< Retour à la liste</a>
		</c:if>
		
	</form>

</div>



<%@ include file="layouts/footer.jsp"%>


