<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Login OcpSmart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            /* الخلفية اللي طلبتي */
            background: linear-gradient(135deg, #f5efe4, #e8dcc6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }

        .login-container {
            display: flex;
            width: 800px;
            height: 450px;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }

        /* الجهة اليسرى (الخضراء) */
        .brand-section {
            flex: 1;
            background-color: #556B2F; /* Vert Olive */
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            /* شكل المنحنى بحال لي فالتصوير */
            border-top-right-radius: 100px;
            border-bottom-right-radius: 100px;
        }

        .logo-box {
            background: white;
            padding: 20px 40px;
            border-radius: 15px;
            border: 4px solid #98FB98; /* اللون الفاتح لي داير باللوغو */
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            text-align: center;
        }

        .logo-box h2 {
            margin: 0;
            color: #333;
            font-weight: bold;
            font-size: 28px;
        }

        /* الجهة اليمنى (الاستمارة) */
        .form-section {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-title {
            text-align: center;
            margin-bottom: 30px;
            color: #556B2F;
            font-weight: bold;
            font-size: 24px;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #ddd;
            margin-bottom: 15px;
            background-color: #fcfcfc;
        }

        .btn-login-style {
            width: 100%;
            background: #556B2F;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-weight: bold;
            font-size: 16px;
            transition: 0.3s;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-login-style:hover {
            background: #6b8e23;
            transform: translateY(-2px);
        }

        .error-msg {
            color: #d9534f;
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            font-weight: 500;
        }

        label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
            display: block;
        }
        
       .title-ocp{
    font-size: 42px;
    font-weight: 700;
    text-align: center;
    font-family: 'Poppins', sans-serif;

    background: linear-gradient(135deg, #f5efe4, #e8dcc6);
    
    padding: 14px 35px;
    border-radius: 15px;

    color: #4b3b2a;
    
    
    
}
    </style>
</head>
<body>

<div class="login-container">
    <div class="brand-section">
        
            <h2 class="title-ocp">OcpSmart</h2>
        
    </div>

    <div class="form-section">
        <form action="login" method="post">
            <h4 class="login-title">Connexion</h4>

            <label>Username</label>
            <input name="username" type="text" placeholder="Nom d'utilisateur" class="form-control" required>
            
            <label>Password</label>
            <input type="password" name="password" placeholder="Mot de passe" class="form-control" required>

            <button type="submit" class="btn-login-style">Connexion</button>

            <% if(request.getParameter("error")!=null){ %>
                <p class="error-msg">Login incorrect</p>
            <% } %>
        </form>
    </div>
</div>

</body>
</html>