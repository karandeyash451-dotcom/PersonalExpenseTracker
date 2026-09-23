package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.UserDAO;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);

        UserDAO dao = new UserDAO();

        if(dao.registerUser(user)) {

            response.sendRedirect("login.jsp");

        } else {

            response.getWriter().println(
                    "Registration Failed"
            );
        }
    }
}