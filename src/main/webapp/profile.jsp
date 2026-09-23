<%@ page import="com.pbl.personalexpensetracker.model.User" %>
<%@ page import="com.pbl.personalexpensetracker.dao.ExpenseDAO" %>
<%@ page import="com.pbl.personalexpensetracker.dao.BudgetDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

ExpenseDAO expenseDAO = new ExpenseDAO();
BudgetDAO budgetDAO = new BudgetDAO();

double totalExpense =
        expenseDAO.getTotalExpense(
                user.getUserId()
        );

double monthlyExpense =
        expenseDAO.getMonthlyExpense(
                user.getUserId()
        );

double budget =
        budgetDAO.getBudgetByUser(
                user.getUserId()
        );

int totalTransactions =
        expenseDAO.getExpenseCount(
                user.getUserId()
        );
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>User Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

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

    font-family:'Segoe UI',sans-serif;
}

/* ========================================
   PAGE TITLE
======================================== */

h1{

    color:white;

    font-weight:700;

    font-size:48px;

    text-align:center;

    margin-bottom:35px;
}

/* ========================================
   PROFILE CARD
======================================== */

.profile-card{

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
    0 8px 32px rgba(0,0,0,0.20);
}

/* ========================================
   CARD CONTENT
======================================== */

.profile-card h3,
.profile-card h4{

    color:white;

    font-weight:700;
}

.profile-card p{

    font-size:16px;

    margin-bottom:15px;

    color:white;
}

.profile-card strong{

    color:#ffffff;
}

/* ========================================
   HR LINE
======================================== */

.profile-card hr{

    border-color:
    rgba(255,255,255,0.15);
}

/* ========================================
   FINANCIAL VALUES
======================================== */

.amount{

    color:#7CFFB2;

    font-weight:700;
}

/* ========================================
   DASHBOARD BUTTON
======================================== */

.glass-btn{

    display:inline-block;

    padding:12px 20px;

    border-radius:12px;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(15px);

    border:
    1px solid rgba(255,255,255,0.18);

    color:white !important;

    text-decoration:none;

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
   DARK MODE
======================================== */

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

.dark-mode .profile-card{

    background:
    rgba(255,255,255,0.06)
    !important;

    border:
    1px solid rgba(255,255,255,0.08);

    color:white;
}

.dark-mode .profile-card p{

    color:white;
}

.dark-mode .profile-card h3,
.dark-mode .profile-card h4{

    color:white;
}

.dark-mode .amount{

    color:#4ade80 !important;
}

.dark-mode .glass-btn{

    background:
    rgba(255,255,255,0.08);

    color:white !important;
}

.dark-mode .glass-btn:hover{

    background:
    rgba(255,255,255,0.18);
}

</style>

</head>

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
<body>

<div class="container py-5">

<h1 class="text-center mb-4">
My Profile
</h1>

<div class="row justify-content-center">

<div class="col-md-8">

<div class="card shadow profile-card">

<div class="card-body">

<h3 class="mb-4">
User Information
</h3>

<hr>

<p>
<strong>Name :</strong>
<%= user.getName() %>
</p>

<p>
<strong>Email :</strong>
<%= user.getEmail() %>
</p>

<p>
<strong>User ID :</strong>
<%= user.getUserId() %>
</p>

<hr>

<h4>Financial Summary</h4>

<p>
<strong>Total Expense :</strong>
<span class="amount">
₹ <%= totalExpense %>
</span>
</p>

<p>
<strong>Monthly Expense :</strong>
<span class="amount">
₹ <%= monthlyExpense %>
</span>
</p>

<p>
<strong>Current Budget :</strong>
<span class="amount">
₹ <%= budget %>
</span>
</p>

<p>
<strong>Total Transactions :</strong>
<span class="amount">
<%= totalTransactions %>
</span>
</p>

</div>

</div>

</div>

</div>

<div class="text-center mt-4">

<a href="dashboard.jsp"
   class="btn btn-primary">

Back To Dashboard

</a>

</div>

</div>

</body>

</html>

