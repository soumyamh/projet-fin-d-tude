<%@ page import="model.Utilisateur" %>
<%@ page import="dao.CongeDAO,dao.AbsenceDAO,dao.DocumentDAO,dao.SalaireDAO" %>
<%@ page import="java.util.*" %>

<%
Utilisateur u = (Utilisateur) session.getAttribute("Utilisateur");


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
    background:linear-gradient(135deg,#f5efe4,#e8dcc6);
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
    background:linear-gradient(135deg,#f5efe4,#e8dcc6);
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
.bg-caramel { background: #6b3e08 !important; }
.bg-dark-green { background: #006400 !important; }
.bg-dark-mauve { background: #5D3954 !important; }
.bg-dark-red { background: #8B0000 !important; }
</style>

</head>

<body>

<jsp:include page="sidebar-employe.jsp" />
<jsp:include page="chatbot.jsp"/>


<!-- ===== CONTENT ===== -->
<div class="content">

<h2 style="color:#556B2F;">Bienvenue </h2>

<!-- ===== STATISTIQUES ===== -->
<div class="cardBox">

<div class="card bg-caramel">
<h5>Mes Conges</h5>
<h2><%=totalConges%></h2>
</div>

<div class="card bg-dark-mauve">
<h5>Valides</h5>
<h2><%=congesValides%></h2>
</div>

<div class="card bg-dark-red">
<h5>Refuses</h5>
<h2><%=congesRefuses%></h2>
</div>

</div>

<div class="cardBox">

<div class="card bg-dark-red">
<h5>Mes Absences</h5>
<h2><%=totalAbsences%></h2>
</div>

<div class="card bg-caramel">
<h5>Mes Documents</h5>
<h2><%=totalDocs%></h2>
</div>

<div class="card bg-dark-mauve">
<h5>Mes Salaires</h5>
<h2><%=totalSalaires%></h2>
</div>

</div>

</div>

</body>
</html>