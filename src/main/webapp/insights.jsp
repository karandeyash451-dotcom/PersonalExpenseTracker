<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Expense Insights</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    background:#f4f6f9;
}

.card{
    border-radius:15px;
}

</style>

</head>

<body>

<div class="container py-5">

<h1 class="text-center mb-5">
Expense Insights Dashboard
</h1>

<div class="row g-4">

<div class="col-md-4">

<div class="card shadow">

<div class="card-body text-center">

<h5>Total Transactions</h5>

<h2>

<%= request.getAttribute("transactions") %>

</h2>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card shadow">

<div class="card-body text-center">

<h5>Average Expense</h5>

<h2>

₹ <%= String.format("%.2f",
request.getAttribute("average")) %>

</h2>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card shadow">

<div class="card-body text-center">

<h5>Highest Expense</h5>

<h2>

₹ <%= request.getAttribute("highest") %>

</h2>

</div>

</div>

</div>

<div class="col-md-6">

<div class="card shadow">

<div class="card-body text-center">

<h5>Lowest Expense</h5>

<h2>

₹ <%= request.getAttribute("lowest") %>

</h2>

</div>

</div>

</div>

<div class="col-md-6">

<div class="card shadow">

<div class="card-body text-center">

<h5>Top Spending Category</h5>

<h2>

<%= request.getAttribute("topCategory") %>

</h2>

</div>

</div>

</div>

</div>

<div class="text-center mt-5">

<a href="dashboard.jsp"
   class="btn btn-primary">

Dashboard

</a>

<a href="summary"
   class="btn btn-success">

Analytics

</a>

</div>

</div>

</body>
</html>