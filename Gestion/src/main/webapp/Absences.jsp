<%@ page import="dao.*,model.*,java.util.*" %>

<%
AbsenceDAO dao = new AbsenceDAO();
List<Absence> list = dao.getAllWithEmploye();
List<Employe> emps = dao.getAllEmployes();
%>
<%
String mat = (String) session.getAttribute("matricule");
out.println("SESSION MAT = " + mat);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">

<title>Services & Postes</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link rel="stylesheet" href="../style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>


<body>

<jsp:include page="/sidebar.jsp" />

<div class="content">

<h2>Gestion des Absences</h2>

<!-- FORM -->
<form action="absence" method="post" class="row g-2 mb-3">

<div class="col-md-4">
<select name="matricule" class="form-control" required>
<option value="">Choisir Employe</option>

<% for(Employe e : emps){ %>
<option value="<%=e.getMatricule()%>">
<%=e.getNom()%> - <%=e.getMatricule()%>
</option>
<% } %>

</select>
</div>

<div class="col-md-3">
<input type="date" name="date_absence" class="form-control" required>
</div>

<div class="col-md-3">
<input type="text" name="motif" class="form-control" placeholder="Motif">
</div>

<div class="col-md-2">
<button class="btn-login-style">Ajouter</button>
</div>

</form>

<!-- TABLE -->
<table class="table table-bordered">

<tr>
<th>Nom</th>
<th>Matricule</th>
<th>Date</th>
<th>Motif</th>
<th>Action</th>
</tr>

<% for(Absence a : list){ %>

<tr>
<td><%=a.getNomEmploye()%></td>
<td><%=a.getMatricule()%></td>
<td><%=a.getDateAbsence()%></td>
<td><%=a.getMotif()%></td>

<td>
<a href="absence?id=<%=a.getId()%>"
class="btn-dark-red"
onclick="return confirm('Supprimer ?')">
Delete
</a>
</td>

</tr>

<% } %>

</table>

</div>

</body>
</html>