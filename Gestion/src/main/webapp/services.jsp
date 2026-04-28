<%@ page import="dao.*,model.*,java.util.*" %>

<%
ServiceDAO sdao = new ServiceDAO();
List<Service> services = sdao.getAll();
PosteDAO pdao = new PosteDAO();

out.println("DEBUG SIZE = " + services.size()); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Services & Postes</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link rel="stylesheet" href="../style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body{
    background:#f4f6f9;
}

.content{
    margin-left:260px;
    padding:30px;
}

.card{
    margin-bottom:20px;
}
</style>

</head>

<body>

<jsp:include page="/sidebar.jsp" />

<div class="content">

<h2>Services & Postes</h2>

<!-- ADD SERVICE -->
<div class="card p-3 mb-4">
    <form action="service" method="post" class="d-flex gap-2">
        <input name="nom" class="form-control" placeholder="Nom service" required>
        <button class="btn-login-style" >Ajouter</button>
    </form>
</div>

<!-- LIST SERVICES -->
<% for(Service s : services){ %>

<div class="card p-3">

    <div class="d-flex justify-content-between">
        <h5><%=s.getNom()%></h5>

        <a href="service?id=<%=s.getId()%>"
           class="btn-dark-red" 
           onclick="return confirm('Supprimer ?')">
           Delete
        </a>
    </div>

    <hr>

    <!-- ADD POSTE -->
    <form action="poste" method="post" class="d-flex gap-2 mb-3">
        <input type="hidden" name="service_id" value="<%=s.getId()%>">
        <input name="nom" class="form-control" placeholder="Ajouter poste" required>
        <button class="btn-login-style" >Ajouter</button>
    </form>

    <!-- LIST POSTES -->
    <ul class="list-group">

    <%
    List<Poste> postes = pdao.getByService(s.getId());

    for(Poste p : postes){
    %>

    <li class="list-group-item d-flex justify-content-between">

        <%=p.getNom()%>

        <a href="poste?id=<%=p.getId()%>"
           class="btn-dark-red" 
           onclick="return confirm('Delete ?')">
           Delete
        </a>

    </li>

    <% } %>

    </ul>

</div>

<% } %>

</div>

</body>
</html>