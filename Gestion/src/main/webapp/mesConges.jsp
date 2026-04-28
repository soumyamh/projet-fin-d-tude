<%@ page import="dao.*,model.*,java.util.*" %>

<%
String mat = (String) session.getAttribute("matricule");

CongeDAO dao = new CongeDAO();
List<Conge> list = dao.getByMatricule(mat);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link rel="stylesheet" href="../style.css">

<style>
.section-title{
    margin-top:30px;
    color:#2c3e50;
    font-weight:bold;
}
</style>

</head>

<body>

<jsp:include page="sidebar-employe.jsp" />

<div class="content">

<h2>Mes Conges</h2>

<!-- ===== DEMANDE ===== -->
<div class="card p-3 mb-4">
<form action="employeConge" method="post" class="d-flex gap-2">
    <input type="date" name="date_debut" class="form-control" required>
    <input type="date" name="date_fin" class="form-control" required>
    <button class="btn-login-style">Demander</button>
</form>
</div>

<!-- ================= EN ATTENTE ================= -->
<h4 class="section-title">EN ATTENTE</h4>

<table class="table table-bordered">
<tr>
<th>Debut</th>
<th>Fin</th>
<th>Statut</th>
</tr>

<% for(Conge c : list){
if("EN_ATTENTE".equals(c.getStatut())){ %>

<tr>
<td><%=c.getDateDebut()%></td>
<td><%=c.getDateFin()%></td>
<td><span class="btn-dark-yellow">EN ATTENTE</span></td>
</tr>

<% }} %>

</table>

<!-- ================= VALIDE ================= -->
<h4 class="section-title">VALIDES</h4>

<table class="table table-bordered">
<tr>
<th>Debut</th>
<th>Fin</th>
<th>Statut</th>
</tr>

<% for(Conge c : list){
if("VALIDE".equals(c.getStatut())){ %>

<tr>
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
<th>Debut</th>
<th>Fin</th>
<th>Statut</th>
</tr>

<% for(Conge c : list){
if("REFUSE".equals(c.getStatut())){ %>

<tr>
<td><%=c.getDateDebut()%></td>
<td><%=c.getDateFin()%></td>
<td><span class="btn-dark-red">REFUSE</span></td>
</tr>

<% }} %>

</table>

</div>

</body>
</html>