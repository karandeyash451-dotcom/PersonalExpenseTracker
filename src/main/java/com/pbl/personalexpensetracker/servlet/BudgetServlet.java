package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.BudgetDAO;
import com.pbl.personalexpensetracker.model.Budget;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/setBudget")
public class BudgetServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        User user =
                (User) session.getAttribute("user");

        double amount =
                Double.parseDouble(
                        request.getParameter("budget")
                );

        Budget budget = new Budget();

        budget.setUserId(
                user.getUserId()
        );

        budget.setMonthlyBudget(
                amount
        );

        BudgetDAO dao =
                new BudgetDAO();

        dao.saveBudget(budget);

        response.sendRedirect(
                "dashboard.jsp"
        );
    }
}