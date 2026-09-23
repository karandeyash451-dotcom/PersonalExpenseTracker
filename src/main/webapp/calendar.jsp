<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.pbl.personalexpensetracker.model.Expense" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
List<Expense> expenses =
        (List<Expense>) request.getAttribute("expenses");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Expense Calendar View</title>

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
   PAGE TITLE
======================================== */

.page-title{

    font-size:48px;

    font-weight:700;

    color:white;
}

.text-muted{

    color:
    rgba(255,255,255,.80)
    !important;
}

/* ========================================
   DATE HEADER
======================================== */

.date-header{

    background:
    rgba(13,110,253,.25);

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,.15);

    color:white;

    padding:15px 20px;

    border-radius:18px;

    margin-top:25px;

    box-shadow:
    0 8px 32px rgba(0,0,0,.15);
}

/* ========================================
   CALENDAR CARD
======================================== */

.calendar-card{

    background:
    rgba(255,255,255,.12)
    !important;

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,.18);

    border-radius:20px;

    color:white;

    transition:.3s ease;

    box-shadow:
    0 8px 32px rgba(0,0,0,.20);
}

.calendar-card:hover{

    transform:
    translateY(-5px);

    box-shadow:
    0 12px 35px rgba(0,0,0,.25);
}

.calendar-card strong{

    color:white;
}

/* ========================================
   AMOUNT
======================================== */

.expense-amount{

    color:#7CFFB2;

    font-weight:700;

    font-size:18px;
}

/* ========================================
   BUTTONS
======================================== */

.glass-btn{

    display:inline-block;

    padding:10px 18px;

    margin:5px;

    border-radius:12px;

    background:
    rgba(255,255,255,.12);

    backdrop-filter:blur(15px);

    border:
    1px solid rgba(255,255,255,.18);

    color:white !important;

    text-decoration:none;

    font-weight:600;

    transition:.3s ease;
}

.glass-btn:hover{

    background:
    rgba(255,255,255,.22);

    transform:
    translateY(-2px);
}

/* ========================================
   THEME BUTTON
======================================== */

.theme-btn{

    position:fixed;

    top:20px;

    right:20px;

    z-index:999;

    border:none;

    padding:10px 18px;

    border-radius:12px;

    background:
    rgba(255,255,255,.12);

    backdrop-filter:blur(15px);

    border:
    1px solid rgba(255,255,255,.18);

    color:white;

    font-weight:600;

    cursor:pointer;

    transition:.3s ease;
}

.theme-btn:hover{

    background:
    rgba(255,255,255,.22);
}

/* ========================================
   ALERT
======================================== */

.alert{

    background:
    rgba(255,255,255,.15);

    backdrop-filter:blur(15px);

    color:white;

    border:
    1px solid rgba(255,255,255,.18);

    border-radius:15px;
}

/* ========================================
   DARK MODE - PREMIUM GLASSMORPHISM
======================================== */

.dark-mode{

    background:
    linear-gradient(
        135deg,
        #020617,
        #0f172a,
        #1e293b
    ) !important;

    color:#f8fafc !important;
}

/* ========================================
   PAGE TITLE
======================================== */

.dark-mode .page-title{

    color:#ffffff !important;

    text-shadow:
    0 0 20px rgba(255,255,255,.15);
}

.dark-mode .text-muted{

    color:
    rgba(255,255,255,.70)
    !important;
}

/* ========================================
   DATE HEADER
======================================== */

.dark-mode .date-header{

    background:
    linear-gradient(
        135deg,
        rgba(59,130,246,.35),
        rgba(99,102,241,.35)
    );

    border:
    1px solid rgba(255,255,255,.12);

    color:white;

    box-shadow:
    0 8px 30px rgba(37,99,235,.20);
}

/* ========================================
   CALENDAR CARD
======================================== */

.dark-mode .calendar-card{

    background:
    rgba(255,255,255,.06)
    !important;

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,.10);

    color:white !important;

    box-shadow:
    0 8px 32px rgba(0,0,0,.35);
}

.dark-mode .calendar-card:hover{

    background:
    rgba(255,255,255,.10)
    !important;

    transform:
    translateY(-5px);

    box-shadow:
    0 15px 40px rgba(0,0,0,.40);
}

.dark-mode .calendar-card strong{

    color:#93c5fd;
}

/* ========================================
   EXPENSE AMOUNT
======================================== */

.dark-mode .expense-amount{

    color:#4ade80 !important;

    font-weight:700;

    text-shadow:
    0 0 10px rgba(74,222,128,.25);
}

/* ========================================
   BUTTONS
======================================== */

.dark-mode .glass-btn{

    background:
    rgba(255,255,255,.08);

    border:
    1px solid rgba(255,255,255,.12);

    color:white !important;
}

.dark-mode .glass-btn:hover{

    background:
    rgba(255,255,255,.18);

    color:white !important;
}

/* ========================================
   INDIVIDUAL NAVIGATION BUTTONS
======================================== */

.dark-mode .btn-primary{

    background:
    linear-gradient(
        135deg,
        #2563eb,
        #3b82f6
    );

    border:none;
}

.dark-mode .btn-success{

    background:
    linear-gradient(
        135deg,
        #16a34a,
        #22c55e
    );

    border:none;
}

.dark-mode .btn-info{

    background:
    linear-gradient(
        135deg,
        #0891b2,
        #06b6d4
    );

    border:none;

    color:white !important;
}

/* ========================================
   ALERT
======================================== */

.dark-mode .alert{

    background:
    rgba(255,255,255,.06);

    border:
    1px solid rgba(255,255,255,.10);

    color:white;
}

/* ========================================
   THEME BUTTON
======================================== */

.dark-mode .theme-btn{

    background:
    rgba(255,255,255,.08);

    color:white;

    border:
    1px solid rgba(255,255,255,.12);
}

.dark-mode .theme-btn:hover{

    background:
    rgba(255,255,255,.18);
}
</style>

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

<div class="container py-5">

<h1 class="text-center page-title mb-4">
Expense Calendar View
</h1>

<p class="text-center text-muted mb-4">
All expenses grouped by date
</p>

<%

if(expenses == null || expenses.isEmpty()){

%>

<div class="alert alert-info text-center">

No expenses found.

</div>

<%

}else{

Date previousDate = null;

for(Expense expense : expenses){

Date currentDate =
        expense.getExpenseDate();

if(previousDate == null ||
   !previousDate.equals(currentDate)){

%>

<div class="date-header">

<h4 class="mb-0">

<%= currentDate %>

</h4>

</div>

<%

previousDate = currentDate;

}

%>

<div class="card shadow calendar-card mt-2">

<div class="card-body">

<div class="row align-items-center">

<div class="col-md-3">

<strong>
Category
</strong>

<br>

<%= expense.getCategory() %>

</div>

<div class="col-md-5">

<strong>
Description
</strong>

<br>

<%= expense.getDescription() %>

</div>

<div class="col-md-4 text-end">

    <strong>Amount</strong>

    <br>

    <span class="expense-amount">
        ₹ <%= expense.getAmount() %>
    </span>

</div>

</div>

</div>

</div>

<%

}

}

%>

<div class="text-center mt-5">

    <a href="dashboard.jsp"
   class="btn btn-primary me-2">
   Dashboard
</a>

<a href="summary"
   class="btn btn-success me-2">
   Analytics
</a>

<a href="viewExpenses"
   class="btn btn-info">
   View Expenses
</a>
</div>

</div>

</body>
<button id="themeBtn"
        class="theme-btn">

    🌙 Dark Mode

</button>
</html>
