<!DOCTYPE html>
<html>
<head>
<title>Login RH</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#f2f2f2; 
height:100vh;
display:flex;
justify-content:center;
align-items:center;
font-family:Arial, sans-serif;
}

.login-card{
width:350px;
padding:30px;
border-radius:15px;
background:white;
border:2px solid #556B2F;
box-shadow:0 5px 20px rgba(0,0,0,0.1);
}

.login-title{
text-align:center;
margin-bottom:20px;
color:#556B2F;
font-weight:bold;
}

.form-control{
border-radius:10px;
padding:10px;
}

.btn-login-style{
width:100%;
background:#556B2F; /* olive */
color:white;
border:none;
border-radius:10px;
padding:10px;
font-weight:bold;
transition:0.3s;
}

.btn-login-style:hover{
background:#6b8e23;
}

.error-msg{
color:red;
text-align:center;
margin-top:10px;
}

</style>
</head>

<body>

<form action="login" method="post" class="login-card">

<h4 class="login-title">Login </h4>

<input name="username" placeholder="Username" class="form-control mb-3">
<input type="password" name="password" placeholder="Password" class="form-control mb-3">

<button class="btn-login-style">Login</button>

<% if(request.getParameter("error")!=null){ %>
<p class="error-msg">Login incorrect</p>
<% } %>

</form>

</body>
</html>