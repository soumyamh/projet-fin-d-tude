<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<div class="sidebar">

<h4 class="text-center mb-4">Espace Employé</h4>

<!-- ===== MENU ===== -->

<a href="${pageContext.request.contextPath}/dashboard-employe.jsp">
 Dashboard
</a>

<a href="${pageContext.request.contextPath}/mesInfos.jsp">
 Mes Infos
</a>

<a href="${pageContext.request.contextPath}/mesConges.jsp">
 Mes Congés
</a>

<a href="${pageContext.request.contextPath}/mesAbsences.jsp">
 Mes Absences
</a>

<a href="${pageContext.request.contextPath}/mesDocuments.jsp">
 Mes Documents
</a>
<a href="${pageContext.request.contextPath}/mesSalaires.jsp">
 mesSalaire
</a>
<hr>

<a href="${pageContext.request.contextPath}/logout.jsp">
 Logout
</a>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>