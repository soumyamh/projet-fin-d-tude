<%@ page import="dao.*,model.*,java.util.*" %>

<%
String mat = (String) session.getAttribute("matricule");

AbsenceDAO dao = new AbsenceDAO();
List<Absence> list = dao.getByMatricule(mat);
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
<h2>Mes Absences</h2>

<table class="table table-bordered">
<tr>
<th>Date</th>
<th>Motif</th>
</tr>

<% for(Absence a : list){ %>

<tr>
<td><%=a.getDateAbsence()%></td>
<td><%=a.getMotif()%></td>
</tr>

<% } %>

</table>
</div>
</body>
</html>