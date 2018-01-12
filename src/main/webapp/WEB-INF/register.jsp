<%@ include file="../layouts/header.jsp" %>

<h4>
    <c:if test="${empty personne}">
        <span class="fa fa-user-plus solo"> Enregister une personne</span>
    </c:if>
    <c:if test="${edit}">
        <span class="fa fa-user-plus solo"> Editer une personne</span>
    </c:if>
	<c:if test="${not empty personne && !edit}">
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
    <c:if test="${edit}">
    <form action="update" method="post">
     </c:if>
    <c:if test="${empty edit}">
    <form action="register" method="post">
    </c:if>
        <c:if test="${edit}">
                <input type="hidden" class="form-control" id="id" name="id" value="${personne.id}" />
        </c:if>
		<div class="form-group">
			<label for="email">Nom:</label> 
			<input type="text" class="form-control" id="nom" name="nom"
                   <c:if test="${not empty personne && !edit}">value="${personne.nom}" readonly </c:if>
                   <c:if test="${edit}">value="${personne.nom}"  </c:if>
			/>
		</div>
		<div class="form-group">
			<label for="email">Prenom:</label>
			<input type="text" class="form-control" id="prenom" name="prenom"
                   <c:if test="${not empty personne && !edit}">value="${personne.prenom}" readonly </c:if>
                   <c:if test="${edit}">value="${personne.prenom}"  </c:if>
			/>
		</div>
		<div class="form-group">
			<label for="pwd">Date de naissance:</label> 
			<input type="text" class="form-control" id="dateNaissance" name="dateNaissance"
                   <c:if test="${not empty personne && !edit}">value="${personne.dateNaissance}" readonly </c:if>
                   <c:if test="${edit}">value="${personne.dateNaissance}" </c:if>
			/>
		</div>
		<div class="form-group">
            ${userForm}
			<label for="pwd">Telephone:</label>

            ---> <springForm:errors path="telephone" cssClass="error" /> <===
            --->     <form:errors path="telephone" />${telephoneHasBindError} <===
                <spring:hasBindErrors name="userForm">
                    <c:forEach var="error" items="${errors.allErrors}">
                        <b><spring:message message="${error}" /></b>
                        <br />
                    </c:forEach>
                </spring:hasBindErrors>
==========>
                <form:input path="nom" />
                <form:errors path="telephone" cssClass="error" /> <==========
                https://www.boraji.com/spring-4-mvc-form-validation-example-using-hibernate-validator
			<input type="text" class="form-control" id="telephone" name="telephone"
                   <c:if test="${not empty personne && !edit}">value="${personne.telephone}" readonly </c:if>
                   <c:if test="${edit}">value="${personne.telephone}"  </c:if>
			/>
		</div>

        <c:if test="${empty personne}">
            <button type="submit" class="btn btn-default">Enregistrer</button>
        </c:if>
        <c:if test="${edit}">
            <button type="submit" class="btn btn-default">Mettre a jour</button>
        </c:if>
		<c:if test="${not empty personne && !edit}">
			<a href="/list_personnes" class="btn btn-info btn-sm" role="button"><< Retour a la liste</a>
		</c:if>
		
	</form>

</div>



<%@ include file="../layouts/footer.jsp"%>


