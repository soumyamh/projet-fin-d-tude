<%@ page import="dao.*,model.*" %>

<%
String mat = (String) session.getAttribute("matricule");

EmployeDAO dao = new EmployeDAO();
Employe e = dao.getByMatricule(mat);
%>
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
<jsp:include page="sidebar-employe.jsp" />
<div class="content">
<h2>Mes Informations</h2>

<img src="uploads/<%=e.getPhoto()%>" width="100">

<input type="hidden" name="id" value="<%=e.getId()%>">

<!-- old photo -->
<input type="hidden" name="old_photo" value="<%=e.getPhoto()%>">

<div class="row">

<div class="col-md-6">
matricule
<input type="text" name="matricule" value="<%=e.getMatricule()%>" class="form-control mb-2" placeholder="Matricule">
</div>

<!-- NOM -->
<div class="col-md-6">
nom
<input type="text" name="nom" value="<%=e.getNom()%>" class="form-control mb-2" placeholder="Nom">
</div>

<!-- PRENOM -->
<div class="col-md-6">
prenom
<input type="text" name="prenom" value="<%=e.getPrenom()%>" class="form-control mb-2" placeholder="Prénom">
</div>

<!-- DATE NAISSANCE -->
<div class="col-md-6">
date_naissance
<input type="date" name="date_naissance" value="<%=e.getDateNaissance()%>" class="form-control mb-2">
</div>

<!-- DATE EMBAUCHE -->
<div class="col-md-6">
date_embauche
<input type="date" name="date_embauche" value="<%=e.getDateEmbauche()%>" class="form-control mb-2">
</div>

<!-- SEXE -->
<div class="col-md-6">
sexe
<select name="sexe" class="form-control mb-2">
<option <%= "Homme".equals(e.getSexe())?"selected":"" %>>Homme</option>
<option <%= "Femme".equals(e.getSexe())?"selected":"" %>>Femme</option>
</select>
</div>

<!-- NATIONALITE -->
<div class="col-md-6">
nationalite
<input type="text" name="nationalite" value="<%=e.getNationalite()%>" class="form-control mb-2" placeholder="Nationalité">
</div>

<!-- SITUATION -->
<div class="col-md-6">
situation_familiale
<input type="text" name="situation_familiale" value="<%=e.getSituationFamiliale()%>" class="form-control mb-2" placeholder="Situation familiale">
</div>

<!-- ADRESSE -->
<div class="col-md-6">
adresse
<input type="text" name="adresse" value="<%=e.getAdresse()%>" class="form-control mb-2" placeholder="Adresse">
</div>

<!-- TELEPHONE -->
<div class="col-md-6">
telephone
<input type="text" name="telephone" value="<%=e.getTelephone()%>" class="form-control mb-2" placeholder="Téléphone">
</div>

<!-- EMAIL -->
<div class="col-md-6">
email
<input type="email" name="email" value="<%=e.getEmail()%>" class="form-control mb-2" placeholder="Email">
</div>

<!-- POSTE -->
<div class="col-md-6">
poste
<input type="text" name="poste" value="<%=e.getPoste()%>" class="form-control mb-2" placeholder="Poste">
</div>

<!-- DEPARTEMENT -->
<div class="col-md-6">
departement
<input type="text" name="departement" value="<%=e.getDepartement()%>" class="form-control mb-2" placeholder="Département">
</div>

<!-- SERVICE -->
<div class="col-md-6">
service
<input type="text" name="service" value="<%=e.getService()%>" class="form-control mb-2" placeholder="Service">
</div>

<!-- TYPE CONTRAT -->
<div class="col-md-6">
type_contrat
<input type="text" name="type_contrat" value="<%=e.getTypeContrat()%>" class="form-control mb-2" placeholder="Type contrat">
</div>

<!-- STATUT -->
<div class="col-md-6">
statut
<select name="statut" class="form-control mb-2">
<option value="Actif" <%= "Actif".equals(e.getStatut())?"selected":"" %>>Actif</option>
<option value="Inactif" <%= "Inactif".equals(e.getStatut())?"selected":"" %>>Inactif</option>
</select>
</div>




</div>
</body>
</html>

