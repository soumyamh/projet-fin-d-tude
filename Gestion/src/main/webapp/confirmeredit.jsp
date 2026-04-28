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

<div class="container mt-5 text-center">

<h3>Confirmer Modification</h3>

<p>Voulez-vous vraiment enregistrer les modifications ?</p>

<form action="updateEmploye" method="post" enctype="multipart/form-data">

<%
for (Object key : request.getParameterMap().keySet()) {
String name = (String) key;
String value = request.getParameter(name);
%>

<input type="hidden" name="<%=name%>" value="<%=value%>">

<% } %>

<button class="btn-login-style">Oui, enregistrer</button>

<a href="employes.jsp" class="btn-login-style">Annuler</a>

</form>

</div>

</body>
</html>