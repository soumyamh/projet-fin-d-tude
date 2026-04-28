<%@ page import="dao.*,model.*,java.util.*" %>

<%
DocumentDAO dao = new DocumentDAO();
List<Document> list = dao.getAllWithEmploye();
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

<h2>Gestion Documents</h2>

<form action="${pageContext.request.contextPath}/document" method="post" enctype="multipart/form-data">

<input type="text" name="matricule" placeholder="Matricule" class="form-control mb-2">

<select name="type" class="form-control mb-2">
<option>CV</option>
<option>Contrat</option>
<option>Diplome</option>
</select>

<input type="file" name="file">

<button class="btn-login-style">Upload</button>

</form>

<hr>

<table class="table table-bordered">

<tr>
<th>Nom</th>
<th>Matricule</th>
<th>Type</th>
<th>Fichier</th>
</tr>

<% for(Document d : list){ %>

<tr>
<td><%=d.getNomEmploye()%></td>
<td><%=d.getMatricule()%></td>
<td><%=d.getType()%></td>

<td>
<a href="uploads/ <%=d.getFileName()%> " target="_blank"  class="btn-login-style" >Voir</a>
</td>
</tr>

<% } %>

</table>
</div>
</body>
</html>