<%@ page import="dao.*,model.*,java.util.*" %>

<%
String mat = (String) session.getAttribute("matricule");

DocumentDAO dao = new DocumentDAO();
List<Document> list = dao.getByMatricule(mat);
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
<jsp:include page="sidebar-employe.jsp" />
<div class="content">
<h2>Mes Documents</h2>

<table class="table table-bordered">
<tr>
<th>Type</th>
<th>Fichier</th>
</tr>

<% for(Document d : list){ %>

<tr>
<td><%=d.getType()%></td>
<td>
<a href="uploads/<%=d.getFileName()%>" target="_blank"  class="btn-login-style">
Voir
</a>
</td>
</tr>

<% } %>

</table>
</div>
</body>
</html>