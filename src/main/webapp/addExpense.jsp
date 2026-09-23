<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Expense - Personal Expense Tracker</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
/* ========================================
   RESET
======================================== */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

/* ========================================
   BODY
======================================== */

body{

    min-height:100vh;

    background:
    linear-gradient(
        135deg,
        #667eea,
        #764ba2
    );

    background-attachment:fixed;

    font-family:
    "Segoe UI",
    sans-serif;

    color:white;

    overflow-x:hidden;
}

/* ========================================
   NAVBAR
======================================== */

.navbar{

    background:
    rgba(255,255,255,0.12)
    !important;

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border-bottom:
    1px solid
    rgba(255,255,255,0.18);

    box-shadow:
    0 8px 32px
    rgba(31,38,135,0.15);

    padding:
    15px 0;
}

.navbar-brand{

    color:white !important;

    font-size:1.4rem;

    font-weight:700;

    letter-spacing:0.5px;
}

/* ========================================
   THEME BUTTON
======================================== */

.theme-btn{

    border:none;

    padding:
    10px 18px;

    border-radius:12px;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(15px);

    -webkit-backdrop-filter:blur(15px);

    border:
    1px solid
    rgba(255,255,255,0.18);

    color:white;

    font-weight:600;

    transition:.3s ease;
}

.theme-btn:hover{

    background:
    rgba(255,255,255,0.22);

    transform:
    translateY(-2px);

    color:white;
}

/* ========================================
   LOGOUT BUTTON
======================================== */

.logout-btn{

    padding:
    10px 18px;

    border-radius:12px;

    background:
    linear-gradient(
        135deg,
        #ff4b5c,
        #ff6b81
    );

    color:white !important;

    text-decoration:none;

    font-weight:600;

    transition:.3s ease;
}

.logout-btn:hover{

    transform:
    translateY(-2px);

    color:white !important;

    box-shadow:
    0 8px 20px
    rgba(255,75,92,0.35);
}

/* ========================================
   GLASS CARD
======================================== */

.glass-card{

    max-width:750px;

    margin:auto;

    margin-top:60px;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid
    rgba(255,255,255,0.18);

    border-radius:25px;

    color:white;

    box-shadow:
    0 8px 32px
    rgba(0,0,0,0.25);
}

/* ========================================
   CARD HEADER
======================================== */

.card-header{

    background:
    transparent !important;

    border:none;

    text-align:center;

    padding-top:30px;

    color:white;
}

.card-header h2{

    font-weight:700;
}

/* ========================================
   FORM ELEMENTS
======================================== */

.form-label{

    font-weight:600;

    color:white;
}

.form-control,
.form-select{

    background:
    rgba(255,255,255,0.15);

    border:
    1px solid
    rgba(255,255,255,0.20);

    color:white;

    border-radius:12px;

    padding:12px;
}

.form-control:focus,
.form-select:focus{

    background:
    rgba(255,255,255,0.20);

    color:white;

    border-color:white;

    box-shadow:none;
}

.form-control::placeholder{

    color:
    rgba(255,255,255,0.7);
}

.form-select option{

    color:black;
}

/* ========================================
   BUTTONS
======================================== */

.btn-glass{

    border:none;

    border-radius:12px;

    padding:12px;

    font-weight:600;

    transition:.3s ease;
}

.btn-glass:hover{

    transform:
    translateY(-3px);
}

/* ========================================
   QUICK LINKS
======================================== */

.quick-links a{

    margin:5px;
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
}

.dark-mode .glass-card{

    background:
    rgba(
        30,
        41,
        59,
        0.35
    );
}

.dark-mode .navbar{

    background:
    rgba(
        0,
        0,
        0,
        0.35
    ) !important;
}

</style>

<script>

document.addEventListener(
    "DOMContentLoaded",
    function(){

        if(
            localStorage.getItem("theme")
            === "dark"
        ){
            document.body.classList.add(
                "dark-mode"
            );
        }

    }
);

</script>

</head>

<script>

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const themeBtn =
        document.getElementById(
            "themeBtn"
        );

        if(
            localStorage.getItem("theme")
            === "dark"
        ){

            document.body.classList.add(
                "dark-mode"
            );

            themeBtn.innerHTML =
            "☀️ Light";
        }

        themeBtn.addEventListener(
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

                    themeBtn.innerHTML =
                    "☀️ Light";

                }else{

                    localStorage.setItem(
                        "theme",
                        "light"
                    );

                    themeBtn.innerHTML =
                    "🌙 Dark";
                }

            }
        );

    }
);

</script>

<body>

<nav class="navbar">

    <div class="container d-flex justify-content-between align-items-center">

        <span class="navbar-brand">

            💰 Personal Expense Tracker

        </span>

        <div class="d-flex align-items-center">

            <button id="themeBtn"
                    class="theme-btn me-2">

                🌙 Dark

            </button>

            <a href="logout"
               class="logout-btn">

                🚪 Logout

            </a>

        </div>

    </div>

</nav>

<div class="container pb-5">

<div class="card glass-card">

<div class="card-header">

<h2>

💸 Add New Expense

</h2>

<p>

Record and manage your daily expenses

</p>

</div>

<div class="card-body p-4">

<form action="addExpense"
      method="post">

<div class="mb-4">

<label class="form-label">

Category

</label>

<select name="category"
        class="form-select">

<option>Food</option>
<option>Travel</option>
<option>Shopping</option>
<option>Entertainment</option>
<option>Bills</option>
<option>Other</option>

</select>

</div>

<div class="mb-4">

<label class="form-label">

Amount

</label>

<input type="number"
       step="0.01"
       name="amount"
       class="form-control"
       placeholder="Enter amount"
       required>

</div>

<div class="mb-4">

<label class="form-label">

Description

</label>

<input type="text"
       name="description"
       class="form-control"
       placeholder="Enter description"
       required>

</div>

<div class="mb-4">

<label class="form-label">

Expense Date

</label>

<input type="date"
       name="expenseDate"
       class="form-control"
       required>

</div>

<div class="d-grid">

<button type="submit"
        class="btn btn-success btn-lg btn-glass">

💾 Save Expense

</button>

</div>

</form>

<hr class="my-4">

<div class="text-center quick-links">

<a href="dashboard.jsp"
   class="btn btn-primary">

🏠 Dashboard

</a>

<a href="viewExpenses"
   class="btn btn-info">

📋 View Expenses

</a>

<a href="summary"
   class="btn btn-warning">

📊 Summary

</a>

</div>

</div>

</div>

</div>

</body>

</html>