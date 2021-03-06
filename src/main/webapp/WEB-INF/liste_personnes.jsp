<%@ include file="../layouts/header.jsp" %>

<h4><span class="fa fa-users solo"> Liste des personnes enregitrees</span></h4>
<hr />

<c:if test="${not empty confirmationMessage}">
	<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>${confirmationMessage}</strong>
	</div>
</c:if>

<table class="table">
  
  <thead class="thead-inverse">
    <tr>
      <th>#</th>
      <th>Nom</th>
      <th>Prenom</th>
      <th>Date de naissance</th>
      <th>Telephone</th>
      <th>Operations</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${listPersonne}" var="person"> 
	    <tr>
	      <th scope="row">${person.id}</th>
	      <td>${fn:toUpperCase(person.nom)}</td>
	      <td>${fn:toUpperCase(fn:substring(person.prenom, 0, 1))}${fn:toLowerCase(fn:substring(person.prenom, 1,fn:length(person.prenom)))}</td>
	      <td>${person.dateNaissance}</td>
	      <td>${person.telephone}</td>
	      <td>
		      <div class="row">
				<c:url value="/user" var="detailUser">
				  <c:param name="id"   value="${person.id}" />
				</c:url>
				<c:url value="/edit" var="editUrl">
				  <c:param name="id"   value="${person.id}" />
				</c:url>
				<c:url value="/delete" var="deleteUrl">
				  <c:param name="id"   value="${person.id}" />
				</c:url>
			      <div class="col">
			      	<a href="<c:out value="${detailUser}" />" class="btn btn-primary btn-sm" role="button">Details</a>
			      </div>
			      <div class="col">
			      	<a href="<c:out value="${editUrl}" />" class="btn btn-success btn-sm" role="button">Modifier</a>
			      </div>
			      <div class="col">
			      	<a href="<c:out value="${deleteUrl}" />" class="btn btn-info btn-sm" role="button">Supprimer</a>
			      </div>
		      </div>
	      </td>
	    </tr>
    </c:forEach>
  </tbody>
</table>

<%@ include file="../layouts/footer.jsp" %>