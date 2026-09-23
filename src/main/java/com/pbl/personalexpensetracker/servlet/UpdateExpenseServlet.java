package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.Expense;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateExpense")
public class UpdateExpenseServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        Expense expense =
                new Expense();

        expense.setExpenseId(
                Integer.parseInt(
                        request.getParameter(
                                "expenseId"
                        )
                )
        );

        expense.setCategory(
                request.getParameter(
                        "category"
                )
        );

        expense.setAmount(
                Double.parseDouble(
                        request.getParameter(
                                "amount"
                        )
                )
        );

        expense.setDescription(
                request.getParameter(
                        "description"
                )
        );

        expense.setExpenseDate(
                Date.valueOf(
                        request.getParameter(
                                "expenseDate"
                        )
                )
        );

        ExpenseDAO dao =
                new ExpenseDAO();

        dao.updateExpense(
                expense
        );

        response.sendRedirect(
                "viewExpenses"
        );
    }
}