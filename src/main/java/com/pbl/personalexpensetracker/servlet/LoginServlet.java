package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.UserDAO;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        UserDAO dao = new UserDAO();

        User user =
                dao.loginUser(username, password);

        if(user != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "user",
                    user
            );

            response.sendRedirect(
                    "dashboard.jsp"
            );

        } else {

            request.setAttribute(
                    "error",
                    "Invalid Username or Password"
            );

            request.getRequestDispatcher(
                    "login.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}