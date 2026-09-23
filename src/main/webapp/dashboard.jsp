<%@ page import="com.pbl.personalexpensetracker.model.User" %>
<%@ page import="com.pbl.personalexpensetracker.dao.BudgetDAO" %>
<%@ page import="com.pbl.personalexpensetracker.dao.ExpenseDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pbl.personalexpensetracker.model.Expense" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

BudgetDAO budgetDAO =
        new BudgetDAO();
double budgetPercentage = 0;


ExpenseDAO expenseDAO =
        new ExpenseDAO();

List<Expense> recentExpenses =
        expenseDAO.getRecentExpenses(
                user.getUserId()
        );

double monthlyBudget =
        budgetDAO.getBudgetByUser(
                user.getUserId()
        );

double monthlyExpense =
        expenseDAO.getMonthlyExpense(
                user.getUserId()
        );

double percentageUsed = 0;

if(monthlyBudget > 0){

    percentageUsed =
            (monthlyExpense * 100)
                    / monthlyBudget;
}
budgetPercentage = percentageUsed;

double remainingBudget =
        monthlyBudget - monthlyExpense;

if(remainingBudget < 0){

    remainingBudget = 0;
}
%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Dashboard - Personal Expense Tracker</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

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

    font-family:'Segoe UI',sans-serif;
}


.navbar-brand{

    color:white !important;

    font-size:1.4rem;

    font-weight:700;
}

.dashboard-title{

    color:white;

    font-weight:700;

    font-size:2.5rem;
}

.text-muted{

    color:
    rgba(255,255,255,0.8) !important;
}

.card{

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,0.2);

    border-radius:25px;

    color:white;

    box-shadow:
    0 8px 32px rgba(0,0,0,0.25);
}

.card-hover{

    transition:0.4s;
}

.card-hover:hover{

    transform:
    translateY(-10px);

    box-shadow:
    0 12px 40px rgba(0,0,0,0.35);
}

.btn{

    border-radius:12px;

    transition:0.3s;
}

.btn:hover{

    transform:
    translateY(-3px);
}

.table{

    color:white;
}

.table thead th{

    color:#ffffff !important;

    font-weight:700;

    font-size:16px;

    background:
    rgba(255,255,255,0.15);

    border-bottom:
    1px solid rgba(255,255,255,0.25);
}

.table td{

    border-color:
    rgba(255,255,255,0.15);
}

.alert{

    border:none;

    border-radius:15px;
}
.dark-mode{

    background:
    linear-gradient(
        135deg,
        #020617,
        #0f172a,
        #1e293b
    ) !important;

    color:white !important;
}

.dark-mode .card,
.dark-mode .feature-card{

    background:
    rgba(15,23,42,0.60);

    border:
    1px solid rgba(255,255,255,0.08);
}

.dark-mode .navbar{

    background:
    rgba(0,0,0,0.30)
    !important;

    border-bottom:
    1px solid rgba(255,255,255,0.08);
}

.dark-mode .progress{

    background:
    rgba(255,255,255,0.08);
}

.dark-mode .table{

    color:white !important;
}

.dark-mode .table thead th{

    background:
    rgba(255,255,255,0.08);

    color:white !important;
}

.dark-mode .table td{

    color:black !important;

    border-color:
    rgba(255,255,255,0.08);
}
.progress{

    background:
    rgba(255,255,255,0.15);

    overflow:hidden;
}

.progress-bar{

    border-radius:20px;
}

.table thead th{

    color:white;

    font-weight:600;
}

.badge{

    padding:8px 12px;

    border-radius:20px;
}
.feature-card{

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,0.2);

    border-radius:25px;

    color:white;

    text-align:center;

    padding:30px 20px;

    transition:0.4s;

    height:100%;
}

.feature-card:hover{

    transform:
    translateY(-10px)
    scale(1.03);

    box-shadow:
    0 15px 35px rgba(0,0,0,0.3);
}

.feature-icon{

    font-size:48px;

    margin-bottom:15px;
}

.feature-title{

    font-size:22px;

    font-weight:700;
}

.feature-btn{

    border:none;

    border-radius:12px;

    padding:10px 25px;

    margin-top:10px;

    font-weight:600;
}

/* ========================================
   NAVBAR GLASSMORPHISM
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

    padding:15px 0;
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

    cursor:pointer;
}

.theme-btn:hover{

    background:
    rgba(255,255,255,0.22);

    color:white;

    transform:
    translateY(-2px);
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

    color:white !important;

    transform:
    translateY(-2px);

    box-shadow:
    0 8px 20px
    rgba(255,75,92,0.35);
}

/* ========================================
   BUDGET ALERTS
======================================== */

.glass-alert{

    background:
    rgba(255,255,255,0.15);

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,0.15);

    border-radius:18px;

    color:white;

    font-weight:600;

    margin-bottom:20px;
}

.alert-warning{

    background:
    rgba(245,158,11,0.25)
    !important;

    color:white !important;
}

.alert-danger{

    background:
    rgba(239,68,68,0.25)
    !important;

    color:white !important;
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
            localStorage.getItem("theme")
            === "dark"
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

<div class="container mt-5">

<div class="text-center mb-4">

<h1 class="dashboard-title">

Welcome Back,
<%= user.getName() %>

</h1>

<p class="text-muted">
Manage your expenses efficiently and track your spending habits
</p>

</div>

   



    <div class="row justify-content-center mb-5">

<div class="col-lg-8">

<div class="card card-hover">

<div class="card-body p-4 text-center">

<h3 class="mb-4">

Monthly Budget Overview

</h3>

<div class="row">

<div class="col-md-4">

<h6>Budget</h6>

<h3>

₹ <%= String.format("%.2f", monthlyBudget) %>

</h3>

</div>

<div class="col-md-4">

<h6>Spent</h6>

<h3>

₹ <%= String.format("%.2f", monthlyExpense) %>

</h3>

</div>

<div class="col-md-4">

<h6>Used</h6>

<h3>

<%= String.format("%.2f", percentageUsed) %>%

</h3>

</div>

</div>

<hr>

<div class="progress mt-3"
     style="height:20px;border-radius:20px;">

<div class="progress-bar
<%= percentageUsed >= 100 ?
"bg-danger" :
percentageUsed >= 80 ?
"bg-warning" :
"bg-success" %>"

role="progressbar"

style="width:
<%= Math.min(percentageUsed,100) %>%">

</div>

</div>

<div class="mt-4">

<%
if(monthlyBudget > 0){

if(percentageUsed >= 100){
%>

<div class="alert alert-danger">

Budget Exceeded

</div>

<%
}
else if(percentageUsed >= 80){
%>

<div class="alert alert-warning">

Warning: Budget usage above 80%

</div>

<%
}
else{
%>

<div class="alert alert-success">

Financial Health Looks Good

</div>

<%
}
}
else{
%>

<div class="alert alert-info">

Please set a budget

</div>

<%
}
%>

</div>

</div>

</div>

</div>

</div>
<div class="row justify-content-center mb-5">

<div class="col-lg-11">

<div class="card card-hover">

<div class="card-body">

<h3 class="text-center mb-4">

Recent Transactions

</h3>

<div class="table-responsive">

<table class="table align-middle">

<thead>

<tr>

<th>Date</th>
<th>Category</th>
<th>Amount</th>
<th>Description</th>

</tr>

</thead>

<tbody>

<%
for(Expense exp : recentExpenses){
%>

<tr>

<td>

<%= exp.getExpenseDate() %>

</td>

<td>

<span class="badge bg-primary">

<%= exp.getCategory() %>

</span>

</td>

<td>

₹ <%= exp.getAmount() %>

</td>

<td>

<%= exp.getDescription() %>

</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

</div>

</div>

</div>

</div>

<!-- Budget Progress Card -->

<div class="card p-4 mb-4">

    <h4>Monthly Budget Usage</h4>

    <div class="progress mt-3">

        <div class="progress-bar"
             role="progressbar"
             style="width:<%= percentageUsed %>%">

            <%= String.format("%.0f", percentageUsed) %>%

        </div>

    </div>

</div>

<!-- PASTE ALERT CODE HERE -->

<% if(monthlyBudget > 0){ %>

    <% if(budgetPercentage >= 80 &&
          budgetPercentage < 100){ %>

        <div class="alert alert-warning glass-alert">

            ⚠ Warning:
            You have used

            <strong>
                <%= String.format("%.0f",budgetPercentage) %>%
            </strong>

            of your monthly budget.

        </div>

    <% } %>

    <% if(budgetPercentage >= 100){ %>

        <div class="alert alert-danger glass-alert">

            🚨 Budget Exceeded!

            You have spent

            ₹<%= monthlyExpense %>

            out of

            ₹<%= monthlyBudget %>

        </div>

    <% } %>

<% } %>
<div class="col-md-3">

    <div class="card card-hover">

        <div class="card-body text-center">

            <h5>
                Remaining Budget
            </h5>

            <h2>

                ₹
                <%= remainingBudget %>

            </h2>

        </div>

    </div>

</div>

<!-- FEATURES -->
<div class="row g-4 mt-2">

<!-- ADD EXPENSE -->

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<div class="feature-icon">
💸
</div>

<div class="feature-title">
Add Expense
</div>

<p>
Record new expenses
</p>

<a href="addExpense.jsp"
   class="btn btn-success feature-btn">

Open

</a>

</div>

</div>

<!-- VIEW EXPENSES -->

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<div class="feature-icon">
📋
</div>

<div class="feature-title">
View Expenses
</div>

<p>
Browse all transactions
</p>

<a href="viewExpenses"
   class="btn btn-primary feature-btn">

Open

</a>

</div>

</div>

<!-- SUMMARY -->

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<div class="feature-icon">
📊
</div>

<div class="feature-title">
Analytics
</div>

<p>
View spending insights
</p>

<a href="summary"
   class="btn btn-warning feature-btn">

Open

</a>

</div>

</div>

<!-- BUDGET -->

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<div class="feature-icon">
🎯
</div>

<div class="feature-title">
Budget
</div>

<p>
Manage monthly limits
</p>

<a href="budget.jsp"
   class="btn btn-danger feature-btn">

Open

</a>

</div>

</div>

<!-- CALENDAR -->

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<div class="feature-icon">
📅
</div>

<div class="feature-title">
Calendar
</div>

<p>
Daily expense timeline
</p>

<a href="calendar"
   class="btn btn-secondary feature-btn">

Open

</a>

</div>

</div>

<!-- PROFILE -->

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<div class="feature-icon">
👤
</div>

<div class="feature-title">
Profile
</div>

<p>
Account information
</p>

<a href="profile.jsp"
   class="btn btn-dark feature-btn">

Open

</a>

</div>

</div>

<!-- EXPORT PDF -->

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<div class="feature-icon">
📄
</div>

<div class="feature-title">
Export PDF
</div>

<p>
Download report
</p>

<a href="exportPDF"
   class="btn btn-dark feature-btn">

Download

</a>

</div>

</div>

<!-- EXPORT CSV -->

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<div class="feature-icon">
📁
</div>

<div class="feature-title">
Export CSV
</div>

<p>
Spreadsheet report
</p>

<a href="exportCSV"
   class="btn btn-success feature-btn">

Export

</a>

</div>

</div>



</div>



<div class="card mt-5">

<div class="card-body text-center">

<h4>

💰 Personal Expense Tracker

</h4>

<p>

Manage expenses • Track budgets • Improve savings

</p>

<hr>

<p class="mb-0">

Developed By Yash Karande

</p>

</div>

</div>

</div>

</body>
</html>