<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pbl.personalexpensetracker.model.Expense" %>

<%
List<Expense> expenses =
(List<Expense>) request.getAttribute("expenses");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Expenses</title>

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

html,
body{
    overflow-x:hidden;
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
    1px solid rgba(255,255,255,0.18);

    box-shadow:
    0 8px 32px rgba(31,38,135,0.15);

    padding:15px 0;
}

.navbar-brand{

    color:white !important;

    font-size:1.4rem;

    font-weight:700;

    letter-spacing:.5px;
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
    rgba(255,255,255,0.8)
    !important;
}

/* ========================================
   GLASS CARDS
======================================== */

.card,
.card-box,
.nav-card{

    background:
    rgba(255,255,255,0.12)
    !important;

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,0.18);

    border-radius:25px;

    color:white;

    box-shadow:
    0 8px 32px rgba(0,0,0,.20);
}

/* ========================================
   FORM
======================================== */

.form-control,
.form-select{

    background:
    rgba(255,255,255,0.15);

    border:
    1px solid rgba(255,255,255,0.20);

    color:white;
}

.form-control:focus,
.form-select:focus{

    background:
    rgba(255,255,255,0.20);

    color:white;

    box-shadow:none;

    border-color:white;
}

.form-select option{
    color:black;
}

/* ========================================
   TABLE
======================================== */

.table-responsive{

    border-radius:25px;

    overflow:hidden;

    background:
    rgba(255,255,255,0.10);

    backdrop-filter:blur(20px);

    -webkit-backdrop-filter:blur(20px);

    border:
    1px solid rgba(255,255,255,0.15);

    box-shadow:
    0 8px 32px rgba(0,0,0,.20);

    margin-top:20px;
}

.table{

    width:100%;

    margin-bottom:0;

    background:transparent !important;
}

/* TABLE HEADER */

.table thead th{

    background:
    rgba(255,255,255,0.15)
    !important;

    color:white !important;

    font-weight:700;

    padding:18px;

    text-align:center;

    border:none;
}

/* TABLE BODY */

.table tbody tr{

    background:
    rgba(255,255,255,0.22);

    transition:.3s ease;
}

.table tbody tr:nth-child(even){

    background:
    rgba(255,255,255,0.28);
}

.table tbody tr:hover{

    background:
    rgba(255,255,255,0.38);
}

.table tbody td{

    color:#1e293b !important;

    font-weight:600;

    text-align:center;

    padding:18px;

    vertical-align:middle;

    border-color:
    rgba(255,255,255,0.12);
}

/* ========================================
   AMOUNT
======================================== */

.amount{

    color:#059669 !important;

    font-weight:700;

    font-size:15px;
}

/* ========================================
   BADGES
======================================== */

.badge{

    padding:10px 18px;

    border-radius:25px;

    font-size:13px;

    font-weight:600;
}

/* ========================================
   ACTION BUTTONS
======================================== */

.action-btn{

    display:inline-block;

    text-decoration:none;

    padding:8px 14px;

    margin:3px;

    border-radius:10px;

    font-size:14px;

    font-weight:600;

    transition:.3s ease;
}

.edit-btn{

    background:
    rgba(59,130,246,.20);

    color:#2563eb !important;

    border:
    1px solid rgba(59,130,246,.30);
}

.edit-btn:hover{

    background:
    rgba(59,130,246,.40);

    color:white !important;
}

.delete-btn{

    background:
    rgba(239,68,68,.20);

    color:#dc2626 !important;

    border:
    1px solid rgba(239,68,68,.30);
}

.delete-btn:hover{

    background:
    rgba(239,68,68,.40);

    color:white !important;
}

/* ========================================
   EXPORT BUTTON
======================================== */

.export-btn{

    background:
    rgba(255,255,255,.10);

    border:
    1px solid rgba(255,255,255,.15);

    color:white !important;

    padding:10px 18px;

    border-radius:12px;

    text-decoration:none;

    transition:.3s;
}

.export-btn:hover{

    background:
    rgba(255,255,255,.20);

    color:white !important;

    transform:
    translateY(-2px);
}

/* ========================================
   THEME BUTTON
======================================== */

.theme-btn{

    border:none;

    padding:10px 18px;

    border-radius:12px;

    background:
    rgba(255,255,255,.12);

    border:
    1px solid rgba(255,255,255,.18);

    color:white;

    font-weight:600;

    cursor:pointer;

    transition:.3s;
}

.theme-btn:hover{

    background:
    rgba(255,255,255,.22);

    transform:
    translateY(-2px);
}

/* ========================================
   LOGOUT BUTTON
======================================== */

.logout-btn{

    padding:10px 18px;

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

    transition:.3s;
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

.dark-mode .navbar{

    background:
    rgba(0,0,0,.35)
    !important;
}

.dark-mode .card,
.dark-mode .card-box,
.dark-mode .nav-card{

    background:
    rgba(15,23,42,.60)
    !important;
}

.dark-mode .table-responsive{

    background:
    rgba(15,23,42,.50)
    !important;
}

.dark-mode .table thead th{

    background:
    rgba(0,0,0,.35)
    !important;

    color:white !important;
}

.dark-mode .table tbody tr{

    background:
    rgba(255,255,255,.05)
    !important;
}

.dark-mode .table tbody tr:nth-child(even){

    background:
    rgba(255,255,255,.08)
    !important;
}

.dark-mode .table tbody tr:hover{

    background:
    rgba(255,255,255,.12)
    !important;
}

.dark-mode .table tbody td{

    color:black !important;
}

.dark-mode .amount{

    color:#7CFFB2 !important;
}

.dark-mode .text-muted{

    color:
    rgba(255,255,255,.75)
    !important;
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

<nav class="navbar">

    <div class="container d-flex justify-content-between align-items-center">

        <span class="navbar-brand">

            💰 Personal Expense Tracker

        </span>

        <div class="d-flex align-items-center">

            <button
    id="themeBtn"
    class="theme-btn me-2">

    🌙 Dark Mode

</button>

            <a href="logout"
               class="logout-btn">

                🚪 Logout

            </a>

        </div>

    </div>

</nav>

<div class="text-center mb-5">

<h1 class="page-title">

📋 My Expenses

</h1>

<p class="text-muted">

View, manage and analyze your spending records

</p>

</div>

<div class="card shadow card-box">

<div class="card-body">
<div class="card shadow mb-4">

<div class="card-body">

<form action="searchExpense"
      method="get">

<div class="row">

<div class="col-md-6">

<select name="category"
        class="form-select">

<option value="Food">
Food
</option>

<option value="Travel">
Travel
</option>

<option value="Shopping">
Shopping
</option>

<option value="Bills">
Bills
</option>

<option value="Entertainment">
Entertainment
</option>

<option value="Other">
Other
</option>

</select>

</div>

<div class="col-md-6">

<button class="btn btn-primary">

Search

</button>

<a href="viewExpenses"
   class="btn btn-secondary">

Show All

</a>

</div>

</div>

</form>

</div>

</div>
    <div class="card shadow mb-4">

<div class="card-body">

<h5>
Filter By Date
</h5>

<form action="filterExpenses"
      method="post">

<div class="row">

<div class="col-md-4">

<label>
From Date
</label>

<input type="date"
       name="fromDate"
       class="form-control"
       required>

</div>

<div class="col-md-4">

<label>
To Date
</label>

<input type="date"
       name="toDate"
       class="form-control"
       required>

</div>

<div class="col-md-4">

<label>
&nbsp;
</label>

<button type="submit"
        class="btn btn-primary w-100">

Filter Expenses

</button>
    <a href="viewExpenses"
   class="btn btn-secondary w-100">

Show All

</a>

</div>

</div>

</form>

</div>

</div>
 
    
<div class="d-flex justify-content-end mb-4">

    <a href="exportPDF"
       class="glass-btn">

       📄 Export PDF

    </a>

</div>
<table class="table table-hover align-middle">

<thead>

<tr>

<th>ID</th>
<th>Category</th>
<th>Amount (INR)</th>
<th>Description</th>
<th>Date</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<%
if(expenses != null){

for(Expense e : expenses){
%>

<tr>

<td>
<%= e.getExpenseId() %>
</td>

<td>

<%
String category = e.getCategory();

if(category.equals("Food")){
%>

<span class="badge bg-success">
Food
</span>

<%
}else if(category.equals("Travel")){
%>

<span class="badge bg-primary">
Travel
</span>

<%
}else if(category.equals("Shopping")){
%>

<span class="badge bg-warning text-dark">
Shopping
</span>

<%
}else if(category.equals("Entertainment")){
%>

<span class="badge bg-info text-dark">
Entertainment
</span>

<%
}else if(category.equals("Bills")){
%>

<span class="badge bg-danger">
Bills
</span>

<%
}else{
%>

<span class="badge bg-secondary">
Other
</span>

<%
}
%>

</td>

<td class="amount">
INR <%= e.getAmount() %>
</td>

<td>
<%= e.getDescription() %>
</td>

<td>
<%= e.getExpenseDate() %>
</td>

<td>

<a href="editExpense?id=<%=e.getExpenseId()%>"
   class="action-btn edit-btn">

   ✏ Edit

</a>

<a href="deleteExpense?id=<%=e.getExpenseId()%>"
   class="action-btn delete-btn">

   🗑 Delete

</a>
</td>

</tr>

<%
}
}
%>

</tbody>

</table>

</div>

</div>

<div class="card shadow nav-card mt-4">

<div class="card-body text-center">

<a href="dashboard.jsp"
   class="btn btn-primary">

🏠 Dashboard

</a>

<a href="addExpense.jsp"
   class="btn btn-success">

💸 Add Expense

</a>

<a href="summary"
   class="btn btn-warning">

📊 Summary

</a>

<a href="exportCSV"
   class="btn btn-info">

📁 Export CSV

</a>

</div>

</div>

</div>

</body>
</html>