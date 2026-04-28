<%@ page import="dao.*,model.*,java.util.*" %>

<%
EmployeDAO dao = new EmployeDAO();
String search = request.getParameter("search");

List<Employe> list;

if(search!=null && !search.isEmpty()){
list = dao.search(search);
}else{
list = dao.getAll();
}
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
<jsp:include page="sidebar.jsp" />
<div class="content">

<h2> Gestion des des employes </h2>


<form method="get">
<input name="search" placeholder="matricule">
<button  class="btn-login-style">search</button>
</form>

<a href="ajouterEmploye.jsp"  class="btn-login-style" >Ajouter</a>

<table class="table table-bordered">

<tr>
<th>Photo</th>
<th>Nom</th>
<th>Matricule</th>
<th>Action</th>
</tr>

<% for(Employe e:list){ %>

<tr>
<td>
<img src="uploads/<%=e.getPhoto()%>" width="50">
</td>
<td><%=e.getNom()%></td>
<td><%=e.getMatricule()%></td>

<td>
<a href="voirEmploye.jsp?id=<%=e.getId()%>" class="btn-neutral-style">Voir</a>

<a href="employe?action=edit&id=<%=e.getId()%>" class="btn-dark-mauve">Edit</a>

<a href="confirmsupprimer.jsp?id=<%=e.getId()%>" class="btn-dark-red">Delete</a>
</td>
</tr>

<% } %>

</table>

</body>
</html>