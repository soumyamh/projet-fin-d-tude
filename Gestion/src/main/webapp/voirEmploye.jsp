<%@ page import="dao.*,model.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
EmployeDAO dao = new EmployeDAO();
Employe e = dao.getById(id);
%>

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

<h3>Details Employe</h3>

<img src="uploads/<%=e.getPhoto()%>" width="120" class="mb-3">

<table class="table table-bordered">

<tr><th>Matricule</th><td><%=e.getMatricule()%></td></tr>
<tr><th>Nom</th><td><%=e.getNom()%></td></tr>
<tr><th>Prénom</th><td><%=e.getPrenom()%></td></tr>
<tr><th>Date naissance</th><td><%=e.getDateNaissance()%></td></tr>
<tr><th>Date embauche</th><td><%=e.getDateEmbauche()%></td></tr>
<tr><th>Sexe</th><td><%=e.getSexe()%></td></tr>
<tr><th>Nationalité</th><td><%=e.getNationalite()%></td></tr>
<tr><th>Situation familiale</th><td><%=e.getSituationFamiliale()%></td></tr>
<tr><th>Adresse</th><td><%=e.getAdresse()%></td></tr>
<tr><th>Téléphone</th><td><%=e.getTelephone()%></td></tr>
<tr><th>Email</th><td><%=e.getEmail()%></td></tr>
<tr><th>Service</th><td><%=e.getService()%></td></tr>
<tr><th>Poste</th><td><%=e.getPoste()%></td></tr>
<tr><th>Département</th><td><%=e.getDepartement()%></td></tr>
<tr><th>Type contrat</th><td><%=e.getTypeContrat()%></td></tr>
<tr><th>Statut</th><td><%=e.getStatut()%></td></tr>

</table>

<a href="employes.jsp" class="btn-login-style" >Retour</a>

</div>

</body>
</html>