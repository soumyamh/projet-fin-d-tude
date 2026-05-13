<%@ page import="model.Utilisateur" %>
<%@ page import="dao.*,java.util.*" %>

<%
Utilisateur u = (Utilisateur) session.getAttribute("Utilisateur");

StatistiqueDAO dao = new StatistiqueDAO();

int totalEmp = dao.totalEmployes();
int totalConges = dao.totalConges();
int valide = dao.congesValides();
int refuse = dao.congesRefuses();
int absences = dao.totalAbsences();
int documents = dao.totalDocuments();

EmployeDAO edao = new EmployeDAO();
CongeDAO cdao = new CongeDAO();
AbsenceDAO adao = new AbsenceDAO();
SalaireDAO sdao = new SalaireDAO();

Map<String,Integer> empMois = edao.countEmployesParMois();
Map<String,Integer> congeMois = cdao.congeParMois();
Map<String,Integer> absService = adao.absenceParService();
Map<String,Double> salMois = sdao.salaireParMois();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
    background: linear-gradient(135deg,#556B2F,#8FBC8F);
    padding:20px;
    color:white;
}

.sidebar a{
    display:block;
    color:white;
    margin:10px 0;
    padding:10px;
    border-radius:8px;
    text-decoration:none;
}

.sidebar a:hover{
    background:rgba(255,255,255,0.2);
}

/* ===== CONTENT ===== */
.content{
    margin-left:250px;
    padding:20px;
}

/* ===== CARDS ===== */
.cardBox{
    display:flex;
    gap:15px;
}

.card{
    flex:1;
    padding:15px;
    border-radius:10px;
    text-align:center;
    background:linear-gradient(135deg,#8b6f47,#c8a97e);
    color:white;

    font-size:14px;
}

/* ===== CHART GRID ===== */
.chartGrid{
    margin-top:30px;
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
}

/* ===== SMALL CHART CARD ===== */
.chartCard{
    background:white;
    padding:15px;
    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
    height:260px;
}

/* canvas size */
.chartCard canvas{
    width:100% !important;
    height:180px !important;
}
/* Couleurs personnalisées pour les cartes */
.bg-caramel { background: #6b3e08 !important; }
.bg-dark-green { background: #006400 !important; }
.bg-dark-mauve { background: #5D3954 !important; }
.bg-dark-red { background: #8B0000 !important; }

</style>

</head>

<body>

<jsp:include page="sidebar.jsp" />
<jsp:include page="chatbot.jsp"/>
<div class="content">




<!-- ===== CARDS ===== -->
<!-- ===== CARDS ===== -->
<div class="cardBox">
    <!-- Employés : Caramel -->
    <div class="card bg-dark-mauve ">
        <h6> Employes </h6>
        <h3><%=totalEmp%></h3>
    </div>

    <!-- Congés : Dark Yellow -->
    <div class="card bg-dark-mauve ">
        <h6>Conges</h6>
        <h3><%=totalConges%></h3>
    </div>

    <!-- Valides : Dark Mauve -->
    <div class="card bg-dark-mauve">
        <h6>Valides</h6>
        <h3><%=valide%></h3>
    </div>
</div>

<div class="cardBox" style="margin-top:15px;">
    <!-- Refusés : Dark Red -->
    <div class="card bg-dark-mauve ">
        <h6>Refuses</h6>
        <h3><%=refuse%></h3>
    </div>
 <!-- Documents : Caramel -->
    <div class="card bg-dark-mauve ">
        <h6>Documents</h6>
        <h3><%=documents%></h3>
    </div>
    <!-- Absences : Dark Red -->
    <div class="card bg-dark-mauve ">
        <h6>Absences</h6>
        <h3><%=absences%></h3>
    </div>

    
</div>
<!-- ===== SMALL CHARTS ===== -->
<div class="chartGrid">

<div class="chartCard">
<canvas id="empChart"></canvas>
</div>

<div class="chartCard">
<canvas id="salaryChart"></canvas>
</div>

<div class="chartCard" style="height: auto; min-height: 300px;">
    <canvas id="absChart"></canvas>
    
    <!-- Légende dynamique générée selon tes services -->
    <div id="absLegend" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 12px; margin-top: 15px; font-size: 12px;">
        <% 
            String[] couleurs = {"#6b3e08", "#CCCC00", "#8B0000", "#5D3954"};
            int i = 0;
            for(String service : absService.keySet()) { 
                String color = couleurs[i % couleurs.length];
        %>
            <div style="display: flex; align-items: center; gap: 6px;">
                <div style="width: 12px; height: 12px; background: <%=color%>; border-radius: 2px;"></div>
                <span><%=service%></span>
            </div>
        <% 
                i++;
            } 
        %>
    </div>
</div>

<div class="chartCard">
<canvas id="congeChart"></canvas>
</div>

</div>

</div>

<script>
// EMPLOYES -> Caramel (#6b3e08)
new Chart(document.getElementById("empChart"), {
    type:'line',
    data:{
        labels:[<% for(String k:empMois.keySet()){ %>"<%=k%>",<% } %>],
        datasets:[{
            label:"Employes",
            data:[<% for(int v:empMois.values()){ %><%=v%>,<% } %>],
            borderColor:"#6b3e08",
            backgroundColor:"rgba(107, 62, 8, 0.2)", // Caramel transparent
            tension:0.4,
            fill: true
        }]
    }
});

// SALAIRE -> Dark Yellow (#CCCC00)
new Chart(document.getElementById("salaryChart"), {
    type:'bar',
    data:{
        labels:[<% for(String k:salMois.keySet()){ %>"<%=k%>",<% } %>],
        datasets:[{
            label:"Salaires",
            data:[<% for(double v:salMois.values()){ %><%=v%>,<% } %>],
            backgroundColor:"#CCCC00"
        }]
    }
});

//ABSENCE -> Utilisation de toutes les couleurs
new Chart(document.getElementById("absChart"), {
    type:'doughnut',
    data:{
        labels:[<% for(String k:absService.keySet()){ %>"<%=k%>",<% } %>],
        datasets:[{
            data:[<% for(int v:absService.values()){ %><%=v%>,<% } %>],
            // On alterne entre tes 4 couleurs préférées
            backgroundColor:["#6b3e08", "#CCCC00", "#8B0000", "#5D3954"] 
        }]
    },
    options: {
        maintainAspectRatio: false,
        plugins: {
            legend: {
                display: false // On cache la légende par défaut pour mettre la tienne personnalisée
            }
        }
    }
});

// CONGES -> Dark Mauve (#5D3954)
new Chart(document.getElementById("congeChart"), {
    type:'bar',
    data:{
        labels:[<% for(String k:congeMois.keySet()){ %>"<%=k%>",<% } %>],
        datasets:[{
            label:"Conges",
            data:[<% for(int v:congeMois.values()){ %><%=v%>,<% } %>],
            backgroundColor:"#5D3954"
        }]
    }
});
</script>
</body>
</html>