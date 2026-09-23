<%@ page contentType="text/html;charset=UTF-8" %>
<%
double[] monthlyTrend =
(double[]) request.getAttribute(
        "monthlyTrend"
);
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Expense Analytics</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

/* ========================================
   RESET
======================================== */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

html,
body{
    width:100%;
    overflow-x:hidden;
}

/* ========================================
   BODY
======================================== */

body{

    min-height:100vh;

    background:
    linear-gradient(
        135deg,
        #667eea 0%,
        #764ba2 100%
    );

    background-attachment:fixed;

    font-family:
    "Segoe UI",
    sans-serif;

    color:white;
}

/* ========================================
   CONTAINER
======================================== */

.container{

    max-width:1400px;
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

    padding:14px 0;
}

.navbar .container{

    display:flex;

    justify-content:space-between;

    align-items:center;
}

.navbar-brand{

    color:white !important;

    font-size:1.5rem;

    font-weight:700;

    letter-spacing:.5px;
}

/* ========================================
   GLASS CARDS
======================================== */

.glass-card,
.card{

    background:
    rgba(255,255,255,0.12)
    !important;

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid
    rgba(255,255,255,0.18);

    border-radius:20px;

    overflow:hidden;

    color:white !important;

    box-shadow:
    0 8px 32px
    rgba(31,38,135,0.25);

    transition:.25s ease;
}

.glass-card:hover,
.card:hover{

    transform:
    translateY(-4px);

    box-shadow:
    0 12px 30px
    rgba(0,0,0,0.18);
}

/* ========================================
   CARD HEADER
======================================== */

.card-header,
.glass-header{

    background:
    rgba(255,255,255,0.08)
    !important;

    border-bottom:
    1px solid
    rgba(255,255,255,0.15);

    color:white !important;

    text-align:center;

    padding:20px;
}

/* ========================================
   CARD BODY
======================================== */

.card-body,
.glass-body{

    background:transparent !important;

    color:white !important;

    padding:25px;
}

/* ========================================
   HEADINGS
======================================== */

h1,h2,h3,h4,h5,h6{

    color:white !important;

    font-weight:700;
}

.page-title{

    color:white;

    font-size:2.8rem;

    font-weight:700;
}

.text-muted{

    color:
    rgba(255,255,255,0.75)
    !important;
}

/* ========================================
   TABLES
======================================== */

.table{

    color:white !important;
}

.table th{

    background:
    rgba(255,255,255,0.08)
    !important;

    color:white !important;

    border:none;
}

.table td{

    border-color:
    rgba(255,255,255,0.08);
}

/* ========================================
   LIST GROUP
======================================== */

.list-group-item{

    background:
    rgba(255,255,255,0.08)
    !important;

    color:white !important;

    border:
    1px solid
    rgba(255,255,255,0.10)
    !important;
}

/* ========================================
   ALERTS
======================================== */

.alert-success{

    background:
    rgba(40,167,69,0.20)
    !important;

    border:
    1px solid
    rgba(40,167,69,0.35);

    color:white;
}

.alert-warning{

    background:
    rgba(255,193,7,0.20)
    !important;

    border:
    1px solid
    rgba(255,193,7,0.35);

    color:white;
}

.alert-danger{

    background:
    rgba(220,53,69,0.20)
    !important;

    border:
    1px solid
    rgba(220,53,69,0.35);

    color:white;
}

/* ========================================
   PROGRESS BAR
======================================== */

.progress{

    height:25px;

    background:
    rgba(255,255,255,0.10)
    !important;

    border-radius:20px;

    overflow:hidden;
}

.progress-bar{

    font-weight:600;
}

/* ========================================
   CATEGORY CARDS
======================================== */

.category-card{

    transition:.3s ease;
}

.category-card:hover{

    transform:
    translateY(-4px);
}

/* ========================================
   CHART SECTION
======================================== */

.chart-card{

    overflow:hidden;
}

.chart-card canvas{

    width:100% !important;

    max-width:100%;

    padding:10px;
}

/* ========================================
   BUTTONS
======================================== */

.btn{

    border:none;

    border-radius:12px;

    font-weight:600;

    transition:.3s ease;
}

.btn:hover{

    transform:
    translateY(-2px);
}

/* ========================================
   NAVIGATION BUTTONS
======================================== */

.glass-btn{

    display:inline-flex;

    align-items:center;

    justify-content:center;

    min-width:150px;

    height:45px;

    margin:5px;

    border-radius:12px;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(15px);

    border:
    1px solid
    rgba(255,255,255,0.18);

    color:white !important;

    text-decoration:none;

    font-size:15px;

    font-weight:600;

    transition:.3s ease;
}

.glass-btn:hover{

    background:
    rgba(255,255,255,0.22);

    color:white !important;

    transform:
    translateY(-2px);
}

/* ========================================
   THEME BUTTON
======================================== */

.theme-btn{

    border:none;

    padding:
    9px 18px;

    border-radius:12px;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(15px);

    border:
    1px solid
    rgba(255,255,255,0.18);

    color:white;

    font-weight:600;

    cursor:pointer;

    transition:.3s ease;
}

.theme-btn:hover{

    background:
    rgba(255,255,255,0.22);

    transform:
    translateY(-2px);
}

/* ========================================
   LOGOUT BUTTON
======================================== */

.logout-btn{

    display:inline-flex;

    align-items:center;

    justify-content:center;

    padding:
    9px 18px;

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

    color:white !important;

    transform:
    translateY(-2px);

    box-shadow:
    0 8px 20px
    rgba(255,75,92,.35);
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

.dark-mode .glass-card,
.dark-mode .card{

    background:
    rgba(
        15,
        23,
        42,
        0.45
    ) !important;

    border:
    1px solid
    rgba(
        255,
        255,
        255,
        0.08
    );
}

.dark-mode .navbar{

    background:
    rgba(
        0,
        0,
        0,
        0.30
    ) !important;
}

.dark-mode .list-group-item{

    background:
    rgba(
        255,
        255,
        255,
        0.05
    ) !important;
}

.dark-mode .table{

    color:white !important;
}

</style><style>

/* ========================================
   RESET
======================================== */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

html,
body{
    width:100%;
    overflow-x:hidden;
}

/* ========================================
   BODY
======================================== */

body{

    min-height:100vh;

    background:
    linear-gradient(
        135deg,
        #667eea 0%,
        #764ba2 100%
    );

    background-attachment:fixed;

    font-family:
    "Segoe UI",
    sans-serif;

    color:white;
}

/* ========================================
   CONTAINER
======================================== */

.container{

    max-width:1400px;
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

    padding:14px 0;
}

.navbar .container{

    display:flex;

    justify-content:space-between;

    align-items:center;
}

.navbar-brand{

    color:white !important;

    font-size:1.5rem;

    font-weight:700;

    letter-spacing:.5px;
}

/* ========================================
   GLASS CARDS
======================================== */

.glass-card,
.card{

    background:
    rgba(255,255,255,0.12)
    !important;

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid
    rgba(255,255,255,0.18);

    border-radius:20px;

    overflow:hidden;

    color:white !important;

    box-shadow:
    0 8px 32px
    rgba(31,38,135,0.25);

    transition:.25s ease;
}

.glass-card:hover,
.card:hover{

    transform:
    translateY(-4px);

    box-shadow:
    0 12px 30px
    rgba(0,0,0,0.18);
}

/* ========================================
   CARD HEADER
======================================== */

.card-header,
.glass-header{

    background:
    rgba(255,255,255,0.08)
    !important;

    border-bottom:
    1px solid
    rgba(255,255,255,0.15);

    color:white !important;

    text-align:center;

    padding:20px;
}

/* ========================================
   CARD BODY
======================================== */

.card-body,
.glass-body{

    background:transparent !important;

    color:white !important;

    padding:25px;
}

/* ========================================
   HEADINGS
======================================== */

h1,h2,h3,h4,h5,h6{

    color:white !important;

    font-weight:700;
}

.page-title{

    color:white;

    font-size:2.8rem;

    font-weight:700;
}

.text-muted{

    color:
    rgba(255,255,255,0.75)
    !important;
}

/* ========================================
   TABLES
======================================== */

.table{

    color:white !important;
}

.table th{

    background:
    rgba(255,255,255,0.08)
    !important;

    color:white !important;

    border:none;
}

.table td{

    border-color:
    rgba(255,255,255,0.08);
}

/* ========================================
   LIST GROUP
======================================== */

.list-group-item{

    background:
    rgba(255,255,255,0.08)
    !important;

    color:white !important;

    border:
    1px solid
    rgba(255,255,255,0.10)
    !important;
}

/* ========================================
   ALERTS
======================================== */

.alert-success{

    background:
    rgba(40,167,69,0.20)
    !important;

    border:
    1px solid
    rgba(40,167,69,0.35);

    color:white;
}

.alert-warning{

    background:
    rgba(255,193,7,0.20)
    !important;

    border:
    1px solid
    rgba(255,193,7,0.35);

    color:white;
}

.alert-danger{

    background:
    rgba(220,53,69,0.20)
    !important;

    border:
    1px solid
    rgba(220,53,69,0.35);

    color:white;
}

/* ========================================
   PROGRESS BAR
======================================== */

.progress{

    height:25px;

    background:
    rgba(255,255,255,0.10)
    !important;

    border-radius:20px;

    overflow:hidden;
}

.progress-bar{

    font-weight:600;
}

/* ========================================
   CATEGORY CARDS
======================================== */

.category-card{

    transition:.3s ease;
}

.category-card:hover{

    transform:
    translateY(-4px);
}

/* ========================================
   CHART SECTION
======================================== */

.chart-card{

    overflow:hidden;
}

.chart-card canvas{

    width:100% !important;

    max-width:100%;

    padding:10px;
}

/* ========================================
   BUTTONS
======================================== */

.btn{

    border:none;

    border-radius:12px;

    font-weight:600;

    transition:.3s ease;
}

.btn:hover{

    transform:
    translateY(-2px);
}

/* ========================================
   NAVIGATION BUTTONS
======================================== */

.glass-btn{

    display:inline-flex;

    align-items:center;

    justify-content:center;

    min-width:150px;

    height:45px;

    margin:5px;

    border-radius:12px;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(15px);

    border:
    1px solid
    rgba(255,255,255,0.18);

    color:white !important;

    text-decoration:none;

    font-size:15px;

    font-weight:600;

    transition:.3s ease;
}

.glass-btn:hover{

    background:
    rgba(255,255,255,0.22);

    color:white !important;

    transform:
    translateY(-2px);
}

/* ========================================
   THEME BUTTON
======================================== */

.theme-btn{

    border:none;

    padding:
    9px 18px;

    border-radius:12px;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(15px);

    border:
    1px solid
    rgba(255,255,255,0.18);

    color:white;

    font-weight:600;

    cursor:pointer;

    transition:.3s ease;
}

.theme-btn:hover{

    background:
    rgba(255,255,255,0.22);

    transform:
    translateY(-2px);
}

/* ========================================
   LOGOUT BUTTON
======================================== */

.logout-btn{

    display:inline-flex;

    align-items:center;

    justify-content:center;

    padding:
    9px 18px;

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

    color:white !important;

    transform:
    translateY(-2px);

    box-shadow:
    0 8px 20px
    rgba(255,75,92,.35);
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

.dark-mode .glass-card,
.dark-mode .card{

    background:
    rgba(
        15,
        23,
        42,
        0.45
    ) !important;

    border:
    1px solid
    rgba(
        255,
        255,
        255,
        0.08
    );
}

.dark-mode .navbar{

    background:
    rgba(
        0,
        0,
        0,
        0.30
    ) !important;
}

.dark-mode .list-group-item{

    background:
    rgba(
        255,
        255,
        255,
        0.05
    ) !important;
}

.dark-mode .table{

    color:white !important;
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

    const btn =
    document.getElementById(
        "themeBtn"
    );

    if(
        localStorage.getItem(
            "theme"
        ) === "dark"
    ){

        document.body.classList.add(
            "dark-mode"
        );

        btn.innerHTML =
        "☀️ Light";
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
            "☀️ Light";

        }else{

            localStorage.setItem(
                "theme",
                "light"
            );

            btn.innerHTML =
            "🌙 Dark";
        }

    });

});

</script>

<body>

<nav class="navbar">

<div class="container">

    <span class="navbar-brand">

        📊 Expense Analytics Dashboard

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
    
    
    <div class="text-center mb-4">

    <h2 class="dashboard-title">

        Financial Overview

    </h2>

    <p class="text-muted">

        Spending insights, forecasts and budget tracking

    </p>

</div>
    
    <!-- SUMMARY CARDS -->

    <div class="row g-4 mb-5">

        <div class="col-lg-3 col-md-6">

            <div class="glass-card stat-card">

                <div class="card-body text-center">

                    <h5>This Week</h5>

                    <h2 class="text-primary">

                        ₹ <%= request.getAttribute("weekly") %>

                    </h2>

                </div>

            </div>

        </div>

        <div class="col-lg-3 col-md-6">

            <div class="glass-card stat-card">

                <div class="card-body text-center">

                    <h5>This Month</h5>

                    <h2 class="text-success">

                        ₹ <%= request.getAttribute("monthly") %>

                    </h2>

                </div>

            </div>

        </div>

        <div class="col-lg-3 col-md-6">

            <div class="glass-card stat-card">

                <div class="card-body text-center">

                    <h5>This Year</h5>

                    <h2 class="text-warning">

                        ₹ <%= request.getAttribute("yearly") %>

                    </h2>

                </div>

            </div>

        </div>

        <div class="col-lg-3 col-md-6">

            <div class="glass-card stat-card">

                <div class="card-body text-center">

                    <h5>Overall Total</h5>

                    <h2 class="text-danger">

                        ₹ <%= request.getAttribute("total") %>

                    </h2>

                </div>

            </div>

        </div>

    </div>
<!-- BUDGET TRACKER -->


<div class="card chart-card mt-5 mb-5">

<div class="card-body p-4">

<h3 class="text-center mb-4">

💰 Monthly Budget Tracker

</h3>

<div class="row text-center">

<div class="col-md-4">

<h6>

Budget

</h6>

<h2 class="fw-bold">

₹ <%= request.getAttribute(
        "budget"
) %>

</h2>

</div>

<div class="col-md-4">

<h6>

Spent

</h6>

<h2 class="fw-bold">

₹ <%= request.getAttribute(
        "monthly"
) %>

</h2>

</div>

<div class="col-md-4">

<h6>

Remaining

</h6>

<h2 class="fw-bold">

₹ <%= request.getAttribute(
        "remaining"
) %>

</h2>

</div>

</div>

<hr>

<%

double usage =
(Double)request.getAttribute(
        "usagePercent"
);

%>

<div class="mb-3">

<h5>

Budget Usage

</h5>

<p>

<%= String.format(
        "%.2f",
        usage
) %> %

</p>

</div>

<div class="progress glass-progress">

<div class="progress-bar"

style="width:<%= usage %>%">

<%= String.format(
        "%.1f",
        usage
) %> %

</div>

</div>

<br>

<%

if(usage >= 100){
%>

<div class="alert alert-danger">

🚨 Budget Limit Exceeded

</div>

<%
}
else if(usage >= 80){
%>

<div class="alert alert-warning">

⚠ Warning:
You have used more than
80% of your budget.

</div>

<%
}
else{
%>

<div class="alert alert-success">

✅ Budget is under control.

</div>

<%
}
%>

</div>

</div>



    <!-- CATEGORY BREAKDOWN -->

    <div class="text-center mb-5">

    <h2 class="fw-bold text-white">

        📊 Category Breakdown

    </h2>

    <p class="glass-subtitle">

        Spending distribution across categories

    </p>

</div>

    <div class="row g-4">

        <div class="col-lg-4 col-md-6">

            <div class="card category-card">

                <div class="card-body text-center">

                    <h4>Food</h4>

                    <h2>
                        ₹ <%= request.getAttribute("food") %>
                    </h2>

                    <p class="text-muted">

                        <%= String.format("%.2f",
                        (Double)request.getAttribute("foodPercent")) %> %

                    </p>

                </div>

            </div>

        </div>

        <div class="col-lg-4 col-md-6">

            <div class="card category-card">

                <div class="card-body text-center">

                    <h4>Travel</h4>

                    <h2>
                        ₹ <%= request.getAttribute("travel") %>
                    </h2>

                    <p class="text-muted">

                        <%= String.format("%.2f",
                        (Double)request.getAttribute("travelPercent")) %> %

                    </p>

                </div>

            </div>

        </div>

        <div class="col-lg-4 col-md-6">

            <div class="card category-card">

                <div class="card-body text-center">

                    <h4>Shopping</h4>

                    <h2>
                        ₹ <%= request.getAttribute("shopping") %>
                    </h2>

                    <p class="text-muted">

                        <%= String.format("%.2f",
                        (Double)request.getAttribute("shoppingPercent")) %> %

                    </p>

                </div>

            </div>

        </div>

        <div class="col-lg-4 col-md-6">

            <div class="card category-card">

                <div class="card-body text-center">

                    <h4>Bills</h4>

                    <h2>
                        ₹ <%= request.getAttribute("bills") %>
                    </h2>

                    <p class="text-muted">

                        <%= String.format("%.2f",
                        (Double)request.getAttribute("billsPercent")) %> %

                    </p>

                </div>

            </div>

        </div>

        <div class="col-lg-4 col-md-6">

            <div class="card category-card">

                <div class="card-body text-center">

                    <h4>Entertainment</h4>

                    <h2>
                        ₹ <%= request.getAttribute("entertainment") %>
                    </h2>

                    <p class="text-muted">

                        <%= String.format("%.2f",
                        (Double)request.getAttribute("entertainmentPercent")) %> %

                    </p>

                </div>

            </div>

        </div>

        <div class="col-lg-4 col-md-6">

            <div class="card category-card">

                <div class="card-body text-center">

                    <h4>Other</h4>

                    <h2>
                        ₹ <%= request.getAttribute("other") %>
                    </h2>

                    <p class="text-muted">

                        <%= String.format("%.2f",
                        (Double)request.getAttribute("otherPercent")) %> %

                    </p>

                </div>

            </div>

        </div>

    </div>

    <!-- MONTHLY CHART -->

<div class="glass-card mt-5">

    <div class="glass-header">

        <h4 class="mb-0">
            🏆 Top Spending Category
        </h4>

        <small>
            AI Based Spending Analysis
        </small>

    </div>

    <div class="glass-body text-center">

        <h2 class="fw-bold text-white">

            <%= request.getAttribute(
                    "topCategory"
            ) %>

        </h2>

        <h3 class="mt-3">

            ₹ <%= request.getAttribute(
                    "topAmount"
            ) %>

        </h3>

        <p class="glass-subtitle mt-2">

            Highest spending category based on
            all recorded expenses.

        </p>

        <hr>

        <h4 class="mt-4">

            💡 Smart Savings Suggestion

        </h4>

        <p>

            Reduce

            <strong>

                <%= request.getAttribute(
                        "topCategory"
                ) %>

            </strong>

            spending by

            <strong>

                10%

            </strong>

            to improve your monthly savings.

        </p>

        <div class="mt-4">

            <h5>

                Potential Savings

            </h5>

            <h2 class="fw-bold">

                ₹

                <%= String.format(
                        "%.2f",
                        (Double)request.getAttribute(
                                "suggestedSaving"
                        )
                ) %>

            </h2>

        </div>

    </div>

</div>
            
<!-- FINANCIAL HEALTH SCORE -->

<!-- HEALTH SCORE + BADGE -->

<div class="row mt-5">

    <div class="col-lg-6 mb-4">

        <div class="glass-card h-100">

            <div class="glass-header">

                <h4>

                    ❤️ Financial Health Score

                </h4>

            </div>

            <div class="glass-body text-center">

                <h1 class="display-2 fw-bold">

                    <%= request.getAttribute(
                            "healthScore"
                    ) %>

                    /100

                </h1>

                <h4 class="mt-3">

                    <%= request.getAttribute(
                            "healthStatus"
                    ) %>

                </h4>

            </div>

        </div>

    </div>

    <div class="col-lg-6 mb-4">

        <div class="glass-card h-100">

            <div class="glass-header">

                <h4>

                    🏆 Achievement Badge

                </h4>

            </div>

            <div class="glass-body text-center">

                <h1 class="display-4">

                    🏅

                </h1>

                <h3>

                    <%= request.getAttribute(
                            "badge"
                    ) %>

                </h3>

            </div>

        </div>

    </div>

</div>


<!-- EXPENSE INSIGHTS -->

<div class="glass-card mt-4">

    <div class="glass-header">

        <h4>

            📈 Expense Insights

        </h4>

    </div>

    <div class="glass-body">

        <ul class="list-group glass-list">

            <li class="list-group-item">

                Highest Spending Category:

                <strong>

                    <%= request.getAttribute(
                            "topCategory"
                    ) %>

                </strong>

            </li>

            <li class="list-group-item">

                <%= request.getAttribute(
                        "spendingInsight"
                ) %>

            </li>

            <li class="list-group-item">

                <%= request.getAttribute(
                        "budgetInsight"
                ) %>

            </li>

            <li class="list-group-item">

                <%= request.getAttribute(
                        "forecastInsight"
                ) %>

            </li>

        </ul>

    </div>

</div>


<!-- EXPENSE FORECAST -->

<div class="glass-card mt-5">

    <div class="glass-header">

        <h4>

            🔮 Expense Forecast

        </h4>

    </div>

    <div class="glass-body text-center">

        <p>

            <strong>

                Current Month Expense:

            </strong>

            ₹

            <%= request.getAttribute(
                    "monthly"
            ) %>

        </p>

        <p>

            <strong>

                Days Passed:

            </strong>

            <%= request.getAttribute(
                    "currentDay"
            ) %>

            /

            <%= request.getAttribute(
                    "totalDays"
            ) %>

        </p>

        <p>

            <strong>

                Predicted Month-End Expense:

            </strong>

            ₹

            <%= String.format(
                    "%.2f",
                    (Double)request.getAttribute(
                            "predictedExpense"
                    )
            ) %>

        </p>

        <p>

            <strong>

                Monthly Budget:

            </strong>

            ₹

            <%= request.getAttribute(
                    "budget"
            ) %>

        </p>

        <hr>

        <h4>

            <%= request.getAttribute(
                    "forecastMessage"
            ) %>

        </h4>

    </div>

</div>
            <!-- MONTH TO MONTH COMPARISON -->

<div class="card shadow mt-5 mb-5">

    <div class="card-header bg-dark text-white">

        <h4 class="mb-0">

            Month Comparison

        </h4>

    </div>

    <div class="card-body">

        <div class="row text-center">

            <div class="col-md-4">

                <h5>

                    Current Month

                </h5>

                <h3 class="text-primary">

                    ₹ <%= request.getAttribute(
                            "monthly"
                    ) %>

                </h3>

            </div>

            <div class="col-md-4">

                <h5>

                    Previous Month

                </h5>

                <h3 class="text-secondary">

                    ₹ <%= request.getAttribute(
                            "previousMonth"
                    ) %>

                </h3>

            </div>

            <div class="col-md-4">

                <h5>

                    Difference

                </h5>

                <h3 class="text-danger">

                    ₹ <%= request.getAttribute(
                            "difference"
                    ) %>

                </h3>

            </div>

        </div>

        <hr>

        <h4 class="text-center">

            <%= request.getAttribute(
                    "comparisonMessage"
            ) %>

        </h4>

    </div>

</div>
            
<!-- MONTHLY GOAL TRACKER -->

<!-- MONTHLY GOAL TRACKER -->

<div class="glass-card mt-5 mb-5">

    <div class="glass-header">

        <h4>

            🎯 Monthly Goal Tracker

        </h4>

    </div>

    <div class="glass-body">

        <div class="row text-center">

            <div class="col-md-4">

                <h5>Budget</h5>

                <h2>

                    ₹ <%= request.getAttribute(
                            "budget"
                    ) %>

                </h2>

            </div>

            <div class="col-md-4">

                <h5>Spent</h5>

                <h2>

                    ₹ <%= request.getAttribute(
                            "monthly"
                    ) %>

                </h2>

            </div>

            <div class="col-md-4">

                <h5>Remaining</h5>

                <h2>

                    ₹ <%= request.getAttribute(
                            "remaining"
                    ) %>

                </h2>

            </div>

        </div>

        <hr>

        <h5>

            Budget Usage

        </h5>

        <div class="glass-progress">

            <div class="progress-bar"

                 style="width:
                 <%= Math.min(
                        ((Double)request.getAttribute(
                                "usagePercent")),
                        100
                 ) %>%">

                <%= String.format(
                        "%.2f",
                        (Double)request.getAttribute(
                                "usagePercent"
                        )
                ) %> %

            </div>

        </div>

    </div>

</div>
            
            
    <!-- CATEGORY PIE CHART -->

<div class="glass-card mt-5">
    <div class="glass-header">

        <h4>

🥧 Category Expense Distribution

</h4>

    </div>

    <div class="glass-body">

        <canvas id="pieChart"></canvas>

    </div>

</div>


<!-- NAVIGATION -->

<div class="glass-card navigation-card mt-5">

    <div class="glass-header text-center">

        <h4 class="mb-0">
            🚀 Quick Navigation
        </h4>

        <small>
            Access all expense management tools
        </small>

    </div>

    <hr>

<div class="text-center mt-4">

    <a href="dashboard.jsp"
       class="btn btn-primary btn-lg me-2">

        🏠 Dashboard

    </a>

    <a href="addExpense.jsp"
       class="btn btn-success btn-lg me-2">

        ➕ Add Expense

    </a>

    <a href="viewExpenses"
       class="btn btn-info btn-lg me-2">

        📋 View Expenses

    </a>

    <a href="exportAnalyticsPdf"
       class="btn btn-danger btn-lg">

        📄 Analytics PDF

    </a>

</div>

</div>

</div>

<script>

const ctx =
document.getElementById(
        "expenseChart"
);

new Chart(ctx, {

    type: "bar",

    data: {

        labels: [

            "Jan",
            "Feb",
            "Mar",
            "Apr",
            "May",
            "Jun",
            "Jul",
            "Aug",
            "Sep",
            "Oct",
            "Nov",
            "Dec"

        ],

        datasets: [{

            label: "Monthly Expenses",

            data: [

                <%= monthlyTrend[0] %>,
                <%= monthlyTrend[1] %>,
                <%= monthlyTrend[2] %>,
                <%= monthlyTrend[3] %>,
                <%= monthlyTrend[4] %>,
                <%= monthlyTrend[5] %>,
                <%= monthlyTrend[6] %>,
                <%= monthlyTrend[7] %>,
                <%= monthlyTrend[8] %>,
                <%= monthlyTrend[9] %>,
                <%= monthlyTrend[10] %>,
                <%= monthlyTrend[11] %>

            ],

            borderWidth: 2

        }]

    },

    options: {

        responsive: true,

        scales: {

            y: {

                beginAtZero: true

            }

        }

    }

});
const pieCtx =
document.getElementById(
        "pieChart"
);

new Chart(pieCtx, {

    type: "pie",

    data: {

        labels: [

            "Food",
            "Travel",
            "Shopping",
            "Bills",
            "Entertainment",
            "Other"

        ],

        datasets: [{

            data: [

                <%= request.getAttribute("food") %>,
                <%= request.getAttribute("travel") %>,
                <%= request.getAttribute("shopping") %>,
                <%= request.getAttribute("bills") %>,
                <%= request.getAttribute("entertainment") %>,
                <%= request.getAttribute("other") %>

            ]

        }]

    },

    options: {

        responsive: true,

        plugins: {

            legend: {

                position: "bottom"

            }

        }

    }

});

</script>

</body>

</html>