<%@ page import="dao.*,model.*,java.util.*" %>

<%
String mat = (String) session.getAttribute("matricule");

SalaireDAO dao = new SalaireDAO();
List<Salaire> list = dao.getByMatricule(mat);
%>

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

<h2>Mes Salaires</h2>

<table class="table table-bordered">

<tr>
<th>Mois</th>
<th>Annee</th>
<th>Base</th>
<th>Primes</th>
<th>Déductions</th>
<th>Net</th>
</tr>

<% for(Salaire s : list){ %>

<tr>
<td><%=s.getMois()%></td>
<td><%=s.getAnnee()%></td>
<td><%=s.getSalaireBase()%></td>
<td><%=s.getPrimes()%></td>
<td><%=s.getDeductions()%></td>
<td><%=s.getSalaireNet()%></td>
</tr>

<% } %>

</table>
</div>
</body>
</html>