package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/insights")
public class InsightsServlet extends HttpServlet {

    @Override
    protected void doGet(
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

        ExpenseDAO dao =
                new ExpenseDAO();

        request.setAttribute(
                "transactions",
                dao.getTotalTransactions(user.getUserId())
        );

        request.setAttribute(
                "average",
                dao.getAverageExpense(user.getUserId())
        );

        request.setAttribute(
                "highest",
                dao.getHighestExpense(user.getUserId())
        );

        request.setAttribute(
                "lowest",
                dao.getLowestExpense(user.getUserId())
        );

        request.setAttribute(
                "topCategory",
                dao.getTopCategory(user.getUserId())
        );

        request.getRequestDispatcher(
                "insights.jsp"
        ).forward(request,response);
    }
}