<%@ page import="model.User" %>
<%@ page import="dao.CongeDAO,dao.AbsenceDAO,dao.DocumentDAO,dao.SalaireDAO" %>
<%@ page import="java.util.*" %>

<%
User u = (User) session.getAttribute("user");


String mat = (String) session.getAttribute("matricule");

/* DAO */
CongeDAO congeDAO = new CongeDAO();
AbsenceDAO absenceDAO = new AbsenceDAO();
DocumentDAO documentDAO = new DocumentDAO();
SalaireDAO salaireDAO = new SalaireDAO();

/* STATISTIQUES */
int totalConges = congeDAO.getByMatricule(mat).size();
int congesValides = congeDAO.countByStatut(mat,"VALIDE");
int congesRefuses = congeDAO.countByStatut(mat,"REFUSE");

int totalAbsences = absenceDAO.getByMatricule(mat).size();
int totalDocs = documentDAO.getByMatricule(mat).size();
int totalSalaires = salaireDAO.getByMatricule(mat).size();
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
<h4>Espace Employe</h4>

<a href="mesInfos.jsp">Mes Infos</a>
<a href="mesConges.jsp">Mes Conges</a>
<a href="mesAbsences.jsp">Mes Absences</a>
<a href="mesDocuments.jsp">Mes Documents</a>
<a href="mesSalaires.jsp">Mes Salaires</a>
<a href="logout.jsp">Logout</a>
</div>

<!-- ===== CONTENT ===== -->
<div class="content">

<h2 style="color:#556B2F;">Bienvenue </h2>

<!-- ===== STATISTIQUES ===== -->
<div class="cardBox">

<div class="card">
<h5>Mes Conges</h5>
<h2><%=totalConges%></h2>
</div>

<div class="card">
<h5>Valides</h5>
<h2><%=congesValides%></h2>
</div>

<div class="card">
<h5>Refuses</h5>
<h2><%=congesRefuses%></h2>
</div>

</div>

<div class="cardBox">

<div class="card">
<h5>Mes Absences</h5>
<h2><%=totalAbsences%></h2>
</div>

<div class="card">
<h5>Mes Documents</h5>
<h2><%=totalDocs%></h2>
</div>

<div class="card">
<h5>Mes Salaires</h5>
<h2><%=totalSalaires%></h2>
</div>

</div>

</div>

</body>
</html>