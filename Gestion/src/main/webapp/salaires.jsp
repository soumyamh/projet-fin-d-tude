<%@ page import="dao.*,model.*,java.util.*" %>

<%
SalaireDAO dao = new SalaireDAO();
List<Salaire> list = dao.getAll();
%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link rel="stylesheet" href="../style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<jsp:include page="sidebar.jsp" />
<div class="content">
<h2>Gestion des Salaires</h2>

<form action="salaire" method="post">

<input name="matricule" placeholder="Matricule" class="form-control mb-2">
<input name="mois" placeholder="Mois" class="form-control mb-2">
<input name="annee" placeholder="Année" class="form-control mb-2">

<input name="salaire_base" placeholder="Salaire base" class="form-control mb-2">
<input name="primes" placeholder="Primes" class="form-control mb-2">
<input name="deductions" placeholder="Déductions" class="form-control mb-2">

<button class="btn-login-style">Ajouter</button>

</form>

<hr>

<table class="table table-bordered">

<tr>
<th>Matricule</th>
<th>Nom</th>
<th>Mois</th>
<th>Annee</th>
<th>Net</th>
<th>Action</th>
</tr>

<% for(Salaire s : list){ %>

<tr>
<td><%=s.getMatricule()%></td>
<td><%=s.getNomEmploye()%></td>
<td><%=s.getMois()%></td>
<td><%=s.getAnnee()%></td>
<td><%=s.getSalaireNet()%></td>

<td>
<a href="salaire?id=<%=s.getId()%>"  class="btn-dark-red">Delete</a>
</td>

</tr>

<% } %>

</table>

</body>
</html>