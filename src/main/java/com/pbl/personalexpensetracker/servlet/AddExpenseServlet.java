package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.Expense;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addExpense")
public class AddExpenseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null ||
           session.getAttribute("user") == null){

            response.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        Expense expense = new Expense();

        expense.setUserId(
                user.getUserId()
        );

        expense.setCategory(
                request.getParameter("category")
        );

        expense.setAmount(
                Double.parseDouble(
                        request.getParameter("amount")
                )
        );

        expense.setDescription(
                request.getParameter("description")
        );

        expense.setExpenseDate(
                Date.valueOf(
                        request.getParameter("expenseDate")
                )
        );

        ExpenseDAO dao =
                new ExpenseDAO();

        if(dao.addExpense(expense)) {

            response.sendRedirect(
                    "viewExpenses"
            );

        } else {

            response.getWriter().println(
                    "Failed To Add Expense"
            );
        }
    }
}