<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Set Monthly Budget</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

/* ========================================
   GLOBAL
======================================== */

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

    font-family:'Segoe UI',sans-serif;

    overflow-x:hidden;
}

/* ========================================
   CARD
======================================== */

.card{

    background:
    rgba(255,255,255,0.12)
    !important;

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,0.18);

    border-radius:25px;

    overflow:hidden;

    color:white;

    box-shadow:
    0 8px 32px rgba(0,0,0,.20);
}

/* ========================================
   CARD HEADER
======================================== */

.card-header{

    background:
    rgba(40,167,69,.85)
    !important;

    border:none;
}

.card-header h3{

    margin:0;

    font-weight:700;
}

/* ========================================
   CARD BODY
======================================== */

.card-body{

    padding:30px;
}

/* ========================================
   FORM
======================================== */

.form-label{

    color:white;

    font-weight:600;
}

.form-control{

    background:
    rgba(255,255,255,0.15);

    border:
    1px solid rgba(255,255,255,0.20);

    color:white;

    border-radius:12px;

    padding:12px;
}

.form-control:focus{

    background:
    rgba(255,255,255,0.20);

    color:white;

    border-color:white;

    box-shadow:none;
}

.form-control::placeholder{

    color:
    rgba(255,255,255,.7);
}

/* ========================================
   BUTTONS
======================================== */

.btn{

    border:none;

    border-radius:12px;

    font-weight:600;

    padding:10px 18px;

    transition:.3s ease;
}

.btn:hover{

    transform:
    translateY(-2px);
}

/* ========================================
   DARK MODE BUTTON
======================================== */

.theme-btn{

    position:fixed;

    top:20px;

    right:20px;

    z-index:1000;

    background:
    rgba(255,255,255,0.12);

    border:
    1px solid rgba(255,255,255,0.18);

    backdrop-filter:blur(15px);

    color:white;

    padding:10px 18px;

    border-radius:12px;

    cursor:pointer;
}

/* ========================================
   DARK MODE
======================================== */

.dark-mode{

    background:
    linear-gradient(
        135deg,
        #0f172a,
        #1e293b
    ) !important;

    color:white !important;
}

.dark-mode .card{

    background:
    rgba(15,23,42,.60)
    !important;
}

.dark-mode .form-control{

    background:
    rgba(255,255,255,.08)
    !important;

    color:white !important;

    border:
    1px solid rgba(255,255,255,.10);
}

.dark-mode .form-label{

    color:white !important;
}

</style>

</head>
<script>

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const btn =
        document.getElementById("themeBtn");

        if(
            localStorage.getItem("theme")
            === "dark"
        ){

            document.body.classList.add(
                "dark-mode"
            );

            btn.innerHTML =
            "☀ Light Mode";
        }

        btn.addEventListener(
            "click",
            function(){

                document.body.classList.toggle(
                    "dark-mode"
                );

                if(
                    document.body.classList.contains(
                        "dark-mode"
                    )
                ){

                    localStorage.setItem(
                        "theme",
                        "dark"
                    );

                    btn.innerHTML =
                    "☀ Light Mode";

                }else{

                    localStorage.setItem(
                        "theme",
                        "light"
                    );

                    btn.innerHTML =
                    "🌙 Dark Mode";
                }
            }
        );
    }
);

</script>

<body>

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h3 class="text-center">
Monthly Budget
</h3>

</div>

<div class="card-body">

<form action="setBudget" method="post">

<div class="mb-3">

<label class="form-label">
Enter Monthly Budget (INR)
</label>

<input type="number"
       step="0.01"
       name="budget"
       class="form-control"
       required>

</div>

<div class="text-center">

<button type="submit"
        class="btn btn-success">

Save Budget

</button>

<a href="dashboard.jsp"
   class="btn btn-primary">

Dashboard

</a>

</div>

</form>

</div>

</div>

</div>

</div>

</div>

</body>
<button id="themeBtn" class="theme-btn">
    🌙 Dark Mode
</button>
</html>