<%@ page import="com.pbl.personalexpensetracker.model.Expense"%>

<%
Expense expense =
(Expense) request.getAttribute(
        "expense"
);
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Expense</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card shadow">

<div class="card-header bg-warning">

<h3>
Edit Expense
</h3>

</div>

<div class="card-body">

<form action="updateExpense"
      method="post">

<input type="hidden"
       name="expenseId"
       value="<%= expense.getExpenseId() %>">

<label>
Category
</label>

<select class="form-control"
        name="category">

<option><%= expense.getCategory() %></option>

<option>Food</option>
<option>Travel</option>
<option>Shopping</option>
<option>Bills</option>
<option>Entertainment</option>
<option>Other</option>

</select>

<br>

<label>
Amount
</label>

<input type="number"
       step="0.01"
       class="form-control"
       name="amount"
       value="<%= expense.getAmount() %>">

<br>

<label>
Description
</label>

<input type="text"
       class="form-control"
       name="description"
       value="<%= expense.getDescription() %>">

<br>

<label>
Date
</label>

<input type="date"
       class="form-control"
       name="expenseDate"
       value="<%= expense.getExpenseDate() %>">

<br>

<button class="btn btn-warning">

Update Expense

</button>

<a href="viewExpenses"
   class="btn btn-secondary">

Cancel

</a>

</form>

</div>

</div>

</div>

</body>

</html>