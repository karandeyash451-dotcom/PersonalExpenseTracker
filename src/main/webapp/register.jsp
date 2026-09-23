<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Register - Personal Expense Tracker</title>

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

.register-card{

    width:1000px;

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

    padding:40px;
}

.register-title{

    text-align:center;

    font-weight:700;

    margin-bottom:25px;
}

.form-control{

    height:50px;

    border-radius:12px;

    border:none;

    background:
    rgba(255,255,255,0.75);
}

.form-control:focus{

    box-shadow:none;
}

.btn-register{

    width:100%;

    height:50px;

    border:none;

    border-radius:12px;

    font-weight:600;

    background:
    linear-gradient(
        45deg,
        #00c853,
        #64dd17
    );

    color:white;
}

.btn-register:hover{

    transform:translateY(-2px);

    transition:0.3s;
}

.login-link{

    text-align:center;

    margin-top:20px;
}

.login-link a{

    text-decoration:none;

    font-weight:600;
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

.password-strength{

    height:8px;

    border-radius:10px;

    margin-top:10px;

    background:#e0e0e0;

    overflow:hidden;
}

.password-bar{

    height:100%;

    width:0%;

    transition:0.3s;
}

.strength-text{

    font-size:14px;

    margin-top:5px;
}

</style>

</head>

<body>

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-11">

<div class="register-card">

<div class="row g-0">

<!-- LEFT PANEL -->

<div class="col-md-5">

<div class="left-panel d-flex flex-column justify-content-center h-100">

<h1>

Join Expense Tracker

</h1>

<p class="mt-3">

Track expenses<br>
Manage budgets<br>
Improve financial habits

</p>

<div class="text-center">

<i class="fas fa-chart-line logo-icon"></i>

</div>

</div>

</div>

<!-- RIGHT PANEL -->

<div class="col-md-7 bg-white">

<div class="right-panel">

<h2 class="register-title">

Create Account

</h2>

<form action="register"
      method="post">

<div class="mb-3">

<label class="form-label">

Full Name

</label>

<input type="text"
       class="form-control"
       name="name"
       required>

</div>

<div class="mb-3">

<label class="form-label">

Email Address

</label>

<input type="email"
       class="form-control"
       name="email"
       required>

</div>

<div class="mb-3">

<label class="form-label">

Username

</label>

<input type="text"
       class="form-control"
       name="username"
       required>

</div>

<div class="mb-3">

<label class="form-label">

Password

</label>

<div class="password-wrapper">

<input type="password"
       id="password"
       class="form-control"
       name="password"
       onkeyup="checkStrength()"
       required>

<i class="fas fa-eye toggle-password"
   onclick="togglePassword()"></i>

</div>

<div class="password-strength">

<div id="strengthBar"
     class="password-bar"></div>

</div>

<div id="strengthText"
     class="strength-text">

Enter Password

</div>

</div>

<button type="submit"
        class="btn-register">

Create Account

</button>

</form>

<div class="login-link">

Already have an account?

<a href="login.jsp">

Login Here

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

    let password =
        document.getElementById(
                "password"
        );

    if(password.type === "password"){

        password.type = "text";

    }else{

        password.type = "password";
    }
}

function checkStrength(){

    let password =
        document.getElementById(
                "password"
        ).value;

    let bar =
        document.getElementById(
                "strengthBar"
        );

    let text =
        document.getElementById(
                "strengthText"
        );

    if(password.length < 4){

        bar.style.width = "25%";
        bar.style.background = "red";

        text.innerHTML = "Weak";

    }
    else if(password.length < 8){

        bar.style.width = "60%";
        bar.style.background = "orange";

        text.innerHTML = "Medium";

    }
    else{

        bar.style.width = "100%";
        bar.style.background = "green";

        text.innerHTML = "Strong";

    }
}

</script>

</body>

</html>