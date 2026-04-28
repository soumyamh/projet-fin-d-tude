<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<div class="sidebar">

<h4 class="text-center mb-4">Home</h4>

<!-- ===== MENU ===== -->

<a href="${pageContext.request.contextPath}/dashboard-rh.jsp">
 Dashboard
</a>

<a href="${pageContext.request.contextPath}/employes.jsp">
 Employes
</a>

<a href="${pageContext.request.contextPath}/conges.jsp">
Conges
</a>

<a href="${pageContext.request.contextPath}/Absences.jsp">
 Absences
</a>

<a href="${pageContext.request.contextPath}/Documents.jsp">
 Documents
</a>

<a href="${pageContext.request.contextPath}/services.jsp">
Services
</a>
<a href="${pageContext.request.contextPath}/salaires.jsp">
 Salaires
</a>
<hr>

<a href="${pageContext.request.contextPath}/logout.jsp">
 Logout
</a>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>