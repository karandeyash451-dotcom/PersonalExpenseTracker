package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.Expense;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/calendar")
public class CalendarServlet extends HttpServlet {

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

        List<Expense> expenses =
                dao.getExpensesByDate(
                        user.getUserId()
                );

        request.setAttribute(
                "expenses",
                expenses
        );

        request.getRequestDispatcher(
                "calendar.jsp"
        ).forward(request, response);
    }
}