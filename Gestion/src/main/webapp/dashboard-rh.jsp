<%@ page import="model.User" %>
<%@ page import="dao.StatistiqueDAO" %>

<%
User u = (User) session.getAttribute("user");

/* STATISTIQUES */
StatistiqueDAO dao = new StatistiqueDAO();

int totalEmp = dao.totalEmployes();
int totalConges = dao.totalConges();
int valide = dao.congesValides();
int refuse = dao.congesRefuses();
int absences = dao.totalAbsences();
int documents = dao.totalDocuments();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    margin:0;
    font-family:Arial;
    background:#f4f4f4;
}

/* ===== SIDEBAR ===== */
.sidebar{
    width:230px;
    height:100vh;
    position:fixed;
    left:0;
    top:0;
    background: linear-gradient(135deg,#556B2F,#8FBC8F);
    padding:20px;
    color:white;
}

.sidebar h4{
    color:white;
}

.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    margin:10px 0;
    padding:10px;
    border-radius:8px;
    transition:0.3s;
}

.sidebar a:hover{
    background:rgba(255,255,255,0.2);
    padding-left:15px;
}

/* ===== CONTENT ===== */
.content{
    margin-left:250px;
    padding:20px;
    background:#f2f3f5;
    min-height:100vh;
}

/* ===== CARDS ===== */
.cardBox{
    display:flex;
    gap:20px;
    margin-top:20px;
}

.card{
    padding:20px;
    border-radius:10px;
    flex:1;
    text-align:center;
    background:linear-gradient(135deg,#556B2F,#8FBC8F);
    color:white;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
    transition:0.3s;
}

.card:hover{
    transform:scale(1.05);
    background:linear-gradient(135deg,#3d4f20,#6e9c6e);
}
</style>

</head>

<body>

<!-- ===== SIDEBAR ===== -->
<div class="sidebar">
<h4>Home</h4>

<a href="employes.jsp">Employes</a>
<a href="conges.jsp">Conges</a>
<a href="Absences.jsp">Absences</a>
<a href="Documents.jsp">Documents</a>
<a href="services.jsp">Services</a>
<a href="salaires.jsp">Salaires</a>
<a href="logout.jsp">Logout</a>
</div>

<!-- ===== CONTENT ===== -->
<div class="content">

<h2 style="color:#556B2F;">Bienvenue RH </h2>

<!-- ===== STATISTIQUES ===== -->
<div class="cardBox">

<div class="card">
<h5>Total Employes</h5>
<h2><%=totalEmp%></h2>
</div>

<div class="card">
<h5>Total Conges</h5>
<h2><%=totalConges%></h2>
</div>

<div class="card">
<h5>Conges Valides</h5>
<h2><%=valide%></h2>
</div>

</div>

<div class="cardBox">

<div class="card">
<h5>Congs Refuses</h5>
<h2><%=refuse%></h2>
</div>

<div class="card">
<h5>Absences</h5>
<h2><%=absences%></h2>
</div>

<div class="card">
<h5>Documents</h5>
<h2><%=documents%></h2>
</div>

</div>

</div>

</body>
</html>