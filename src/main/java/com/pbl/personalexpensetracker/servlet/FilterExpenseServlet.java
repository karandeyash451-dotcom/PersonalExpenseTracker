package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.Expense;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/filterExpenses")
public class FilterExpenseServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
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

        String fromDate =
                request.getParameter("fromDate");

        String toDate =
                request.getParameter("toDate");

        ExpenseDAO dao =
                new ExpenseDAO();

        List<Expense> expenses =
                dao.getExpensesByDateRange(
                        user.getUserId(),
                        fromDate,
                        toDate
                );

        request.setAttribute(
                "expenses",
                expenses
        );

        request.getRequestDispatcher(
                "expenses.jsp"
        ).forward(request,response);
    }
}