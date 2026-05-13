<%@ page import="model.Employe" %>
<%@ page import="dao.EmployeDAO" %>

<%
String mat = (String) session.getAttribute("matricule");

Employe emp = null;

if(mat != null){
    EmployeDAO edao = new EmployeDAO();
    emp = edao.getByMatricule(mat);
}
%>
<html>
<head>
<style>
.profileBox{
    text-align:center;
    margin-bottom:20px;
}

.profileImg{
    width:70px;
    height:70px;
    border-radius:50%;
    object-fit:cover;
    border:3px solid white;
    margin-bottom:10px;
}

/* ===== NAME ===== */
.profileBox h6{
    margin:0;
    font-size:14px;
    font-weight:bold;
    color:white;
}

/* ===== SMALL TEXT ===== */
.profileBox small{
    color:#e0e0e0;
    font-size:12px;
}
</style>

</head>

<body>
<div class="sidebar">

   <div class="profileBox">

        <img src="uploads/<%= (emp!=null && emp.getPhoto()!=null) ? emp.getPhoto() : "default.png" %>"
             class="profileImg"
             onerror="this.src='default.png'">

        <h6>
            <%= (emp!=null) ? emp.getNom()+" "+emp.getPrenom() : "Employé" %>
        </h6>

   
</div>
    <hr>

    <!-- ===== MENU ===== -->
    <a href="${pageContext.request.contextPath}/dashboard-rh.jsp">Dashboard</a>
    <a href="${pageContext.request.contextPath}/employes.jsp">Employes</a>
    <a href="${pageContext.request.contextPath}/conges.jsp">Conges</a>
    <a href="${pageContext.request.contextPath}/Absences.jsp">Absences</a>
    <a href="${pageContext.request.contextPath}/Documents.jsp">Documents</a>
    <a href="${pageContext.request.contextPath}/services.jsp">Services</a>
    <a href="${pageContext.request.contextPath}/salaires.jsp">Salaires</a>
    <hr>
    <a href="${pageContext.request.contextPath}/logout.jsp">Logout</a>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>