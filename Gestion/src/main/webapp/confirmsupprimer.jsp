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


<div class="container text-center mt-5">

<h3>Confirmer suppression</h3>

<p>Supprimer : <%=request.getParameter("matricule")%> ?</p>

<a href="employe?action=delete&id=<%=request.getParameter("id")%>" class="btn-login-style">
Oui
</a>

<a href="employes.jsp" class="btn-login-style">
Annuler
</a>

</div>

</body>
</html>