<%@ include file="layouts/header.jsp" %>
	
<table class="table">
  
  <thead class="thead-inverse">
    <tr>
      <th>#</th>
      <th>Nom</th>
      <th>Prénom</th>
      <th>Date de naissance</th>
      <th>Téléphone</th>
      <th>Opérations</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
      <td>@twitter</td>
      <td>
	      <div class="row">
		      <div class="col"><a href="#">Détails</a></div>
		      <div class="col"><a href="#">Modifier</a></div>
		      <div class="col"><a href="#">Supprimer</a></div>
	      </div>
      </td>
    </tr>
  </tbody>
</table>

<%@ include file="layouts/footer.jsp" %>