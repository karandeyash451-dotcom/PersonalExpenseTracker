package com.pbl.personalexpensetracker.servlet;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import com.pbl.personalexpensetracker.dao.BudgetDAO;
import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/exportAnalyticsPdf")
public class ExportAnalyticsPDFServlet
        extends HttpServlet {

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

        BudgetDAO budgetDAO =
                new BudgetDAO();

        double weekly =
                dao.getWeeklyExpense(
                        user.getUserId()
                );

        double monthly =
                dao.getMonthlyExpense(
                        user.getUserId()
                );

        double yearly =
                dao.getYearlyExpense(
                        user.getUserId()
                );

        double budget =
                budgetDAO.getBudgetByUser(
                        user.getUserId()
                );

        double remaining =
                budget - monthly;

        response.setContentType(
                "application/pdf"
        );

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=AnalyticsReport.pdf"
        );

        try {

            Document document =
                    new Document();

            PdfWriter.getInstance(
                    document,
                    response.getOutputStream()
            );

            document.open();

            Font titleFont =
                    new Font(
                            Font.FontFamily.HELVETICA,
                            18,
                            Font.BOLD
                    );

            Paragraph title =
                    new Paragraph(
                            "PERSONAL EXPENSE TRACKER REPORT",
                            titleFont
                    );

            title.setAlignment(
                    Element.ALIGN_CENTER
            );

            document.add(title);

            document.add(
                    new Paragraph(" ")
            );

            document.add(
                    new Paragraph(
                            "User: "
                                    + user.getName()
                    )
            );

            document.add(
                    new Paragraph(
                            "Generated On: "
                                    + LocalDateTime.now()
                    )
            );

            document.add(
                    new Paragraph(
                            "------------------------------------------"
                    )
            );

            document.add(
                    new Paragraph(
                            "Weekly Expense : INR "
                                    + weekly
                    )
            );

            document.add(
                    new Paragraph(
                            "Monthly Expense : INR "
                                    + monthly
                    )
            );

            document.add(
                    new Paragraph(
                            "Yearly Expense : INR "
                                    + yearly
                    )
            );

            document.add(
                    new Paragraph(
                            "------------------------------------------"
                    )
            );

            document.add(
                    new Paragraph(
                            "Budget : INR "
                                    + budget
                    )
            );

            document.add(
                    new Paragraph(
                            "Spent : INR "
                                    + monthly
                    )
            );

            document.add(
                    new Paragraph(
                            "Remaining : INR "
                                    + remaining
                    )
            );

            document.close();

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}