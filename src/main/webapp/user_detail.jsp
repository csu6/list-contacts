<%@ include file="layouts/header.jsp" %>

<h4><span class="fa fa-user-plus solo"> Enregister une personne</span></h4>
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
			<label for="email">Prénom:</label> 
			<input type="text" class="form-control" id="prenom" name="prenom">
		</div>
		<div class="form-group">
			<label for="email">Nom:</label> 
			<input type="text" class="form-control" id="nom" name="nom">
		</div>
		<div class="form-group">
			<label for="pwd">Date de naissance:</label> 
			<input type="text" class="form-control" id="dateNaissance" name="dateNaissance">
		</div>
		<div class="form-group">
			<label for="pwd">Telephone:</label> 
			<input type="text" class="form-control" id="telephone" name="telephone">
		</div>
		<button type="submit" class="btn btn-default">Enregistrer</button>
	</form>

</div>



<%@ include file="layouts/footer.jsp"%>


