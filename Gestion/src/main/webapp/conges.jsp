<%@ page import="dao.*,model.*,java.util.*" %>

<%
CongeDAO dao = new CongeDAO();
List<Conge> list = dao.getAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link rel="stylesheet" href="../style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
.section-title{
margin-top:30px;
color:#2c3e50;
font-weight:bold;
}
</style>

</head>

<body>

<jsp:include page="sidebar.jsp" />

<div class="content">

<h2>Gestion des Conges</h2>

<!-- ================= EN ATTENTE ================= -->
<h4 class="section-title">EN ATTENTE</h4>

<table class="table table-bordered">
<tr>
<th>Matricule</th>
<th>Nom</th>
<th>Debut</th>
<th>Fin</th>
<th>Action</th>
</tr>

<% for(Conge c : list){
if("EN_ATTENTE".equals(c.getStatut())){ %>

<tr>
<td><%=c.getMatricule()%></td>
<td><%=c.getNomEmploye()%></td>
<td><%=c.getDateDebut()%></td>
<td><%=c.getDateFin()%></td>

<td>
<a href="conge?action=valider&id=<%=c.getId()%>" class="btn-login-style">Valider</a>

<a href="conge?action=refuser&id=<%=c.getId()%>" class="btn-dark-red">Refuser</a>
</td>

</tr>

<% }} %>

</table>

<!-- ================= VALIDE ================= -->
<h4 class="section-title">VALIDES</h4>

<table class="table table-bordered">
<tr>
<th>Matricule</th>
<th>Nom</th>
<th>Debut</th>
<th>Fin</th>
<th>Statut</th>
</tr>

<% for(Conge c : list){
if("VALIDE".equals(c.getStatut())){ %>

<tr>
<td><%=c.getMatricule()%></td>
<td><%=c.getNomEmploye()%></td>
<td><%=c.getDateDebut()%></td>
<td><%=c.getDateFin()%></td>
<td><span class="btn-login-style">VALIDE</span></td>
</tr>

<% }} %>

</table>

<!-- ================= REFUSE ================= -->
<h4 class="section-title">REFUSES</h4>

<table class="table table-bordered">
<tr>
<th>Matricule</th>
<th>Nom</th>
<th>Debut</th>
<th>Fin</th>
<th>Statut</th>
</tr>

<% for(Conge c : list){
if("REFUSE".equals(c.getStatut())){ %>

<tr>
<td><%=c.getMatricule()%></td>
<td><%=c.getNomEmploye()%></td>
<td><%=c.getDateDebut()%></td>
<td><%=c.getDateFin()%></td>
<td><span class="btn-dark-red">REFUSE</span></td>
</tr>

<% }} %>

</table>

</div>

</body>
</html>