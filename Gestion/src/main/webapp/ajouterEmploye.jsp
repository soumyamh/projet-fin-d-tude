<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

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


<h4 class="section-title">ajouter employes </h4>



<form action="employe" method="post" enctype="multipart/form-data">

<input type="hidden" name="action" value="add">

<!-- IDENTITE -->
Matricule
<input name="matricule" class="form-control mb-2" required>
Nom
<input name="nom"  class="form-control mb-2" required>
Prénom
<input name="prenom"  class="form-control mb-2" required>
date_naissance
<input type="date" name="date_naissance" class="form-control mb-2">
date d'embauche
<input type="date" name="date_embauche" class="form-control mb-2">
sexe
<select name="sexe" class="form-control mb-2">
<option value="Homme">Homme</option>
<option value="Femme">Femme</option>
</select>

Nationalité
<input name="nationalite"  class="form-control mb-2">
Situation familiale
<input name="situation_familiale" class="form-control mb-2">

Adresse
<input name="adresse"  class="form-control mb-2">

<!-- CONTACT -->
Téléphone
<input name="telephone"  class="form-control mb-2">
Email
<input name="email"  class="form-control mb-2">

<!-- TRAVAIL -->
<%@ page import="dao.*,model.*,java.util.*" %>

<%
ServiceDAO sdao = new ServiceDAO();
PosteDAO pdao = new PosteDAO();

List<Service> services = sdao.getAll();
List<Poste> postes = pdao.getAll(); 
%>

Service
<select name="service_id" class="form-control mb-2">
<option value="">-- Choisir Service --</option>
<% for(Service s : services){ %>
<option value="<%=s.getId()%>"><%=s.getNom()%></option>
<% } %>
</select>

Poste
<select name="poste_id" class="form-control mb-2">
<option value="">-- Choisir Poste --</option>
<% for(Poste p : postes){ %>
<option value="<%=p.getId()%>"><%=p.getNom()%></option>
<% } %>
</select>
Département
<input name="departement"  class="form-control mb-2">

Type contrat
<input name="type_contrat"  class="form-control mb-2">
statut
<select name="statut" class="form-control mb-2">
<option value="Actif">Actif</option>
<option value="Inactif">Inactif</option>
</select>

<!-- PHOTO -->
photo
<input type="file" name="photo" class="form-control mb-3">

<button type="submit" class="btn-login-style" >Ajouter</button>

</form>

</div>

</body>
</html>