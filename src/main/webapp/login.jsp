<%@ page contentType="text/html;charset=UTF-8" %>

<%
String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Login - Personal Expense Tracker</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    min-height:100vh;

    background:
    linear-gradient(
        135deg,
        #667eea,
        #764ba2
    );

    display:flex;
    justify-content:center;
    align-items:center;

    font-family:'Segoe UI',sans-serif;
}

.login-card{

    width:900px;
    min-height:550px;

    background:
    rgba(255,255,255,0.15);

    backdrop-filter:blur(20px);
    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,0.2);

    border-radius:25px;

    overflow:hidden;

    box-shadow:
    0 8px 32px rgba(0,0,0,0.25);
}

.left-panel{

    background:
    rgba(255,255,255,0.08);

    color:white;

    padding:50px;

    height:100%;
}

.left-panel h1{

    font-size:40px;
    font-weight:700;
}

.left-panel p{

    font-size:18px;
    opacity:0.9;
}

.logo-icon{

    font-size:90px;

    margin-top:40px;
}

.right-panel{

    padding:50px;
}

.login-title{

    text-align:center;

    font-weight:700;

    margin-bottom:30px;
}

.form-control{

    height:50px;

    border-radius:12px;

    border:none;

    background:
    rgba(255,255,255,0.7);
}

.form-control:focus{

    box-shadow:none;
}

.btn-login{

    width:100%;

    height:50px;

    border:none;

    border-radius:12px;

    font-weight:600;

    background:
    linear-gradient(
        45deg,
        #4facfe,
        #00f2fe
    );

    color:white;
}

.btn-login:hover{

    transform:translateY(-2px);

    transition:0.3s;
}

.register-link{

    text-align:center;

    margin-top:20px;
}

.register-link a{

    text-decoration:none;

    font-weight:600;
}

.alert{

    border-radius:12px;
}

.password-wrapper{

    position:relative;
}

.toggle-password{

    position:absolute;

    right:15px;

    top:15px;

    cursor:pointer;
}

</style>

</head>

<body>

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-10">

<div class="login-card">

<div class="row g-0">

<!-- LEFT SIDE -->

<div class="col-md-6">

<div class="left-panel d-flex flex-column justify-content-center">

<h1>
Personal Expense Tracker
</h1>

<p class="mt-3">

Track Expenses<br>
Manage Budgets<br>
Analyze Spending

</p>

<div class="text-center">

<i class="fas fa-wallet logo-icon"></i>

</div>

</div>

</div>

<!-- RIGHT SIDE -->

<div class="col-md-6 bg-white">

<div class="right-panel">

<h2 class="login-title">

Welcome Back

</h2>

<%
if(error != null){
%>

<div class="alert alert-danger">

<%= error %>

</div>

<%
}
%>

<form action="login"
      method="post">

<div class="mb-3">

<label class="form-label">

Username

</label>

<input type="text"
       name="username"
       class="form-control"
       required>

</div>

<div class="mb-4">

<label class="form-label">

Password

</label>

<div class="password-wrapper">

<input type="password"
       id="password"
       name="password"
       class="form-control"
       required>

<i class="fas fa-eye toggle-password"
   onclick="togglePassword()"></i>

</div>

</div>

<button type="submit"
        class="btn-login">

Login

</button>

</form>

<div class="register-link">

Don't have an account?

<a href="register.jsp">

Register Here

</a>

</div>

</div>

</div>

</div>

</div>

</div>

</div>

</div>

<script>

function togglePassword(){

    const password =
        document.getElementById(
                "password"
        );

    if(password.type === "password"){

        password.type =
                "text";

    }
    else{

        password.type =
                "password";
    }
}

</script>

</body>

</html>