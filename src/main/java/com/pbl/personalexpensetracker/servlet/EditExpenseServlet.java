package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.Expense;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editExpense")
public class EditExpenseServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        int expenseId =
                Integer.parseInt(
                        request.getParameter(
                                "id"
                        )
                );

        ExpenseDAO dao =
                new ExpenseDAO();

        Expense expense =
                dao.getExpenseById(
                        expenseId
                );

        request.setAttribute(
                "expense",
                expense
        );

        request.getRequestDispatcher(
                "editExpense.jsp"
        ).forward(request,
                response);
    }
}