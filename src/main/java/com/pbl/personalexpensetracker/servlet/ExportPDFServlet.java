package com.pbl.personalexpensetracker.servlet;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.Expense;
import com.pbl.personalexpensetracker.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/exportPDF")
public class ExportPDFServlet extends HttpServlet {

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
                dao.getExpensesByUser(
                        user.getUserId()
                );

        response.setContentType(
                "application/pdf"
        );

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=ExpenseReport.pdf"
        );

        try {

            Document document =
                    new Document();

            PdfWriter.getInstance(
                    document,
                    response.getOutputStream()
            );

            document.open();

            document.add(
                    new Paragraph(
                            "PERSONAL EXPENSE TRACKER"
                    )
            );

            document.add(
                    new Paragraph(
                            "Expense Report"
                    )
            );

            document.add(
                    new Paragraph(
                            "User : "
                            + user.getName()
                    )
            );

            document.add(
                    new Paragraph(
                            " "
                    )
            );

            PdfPTable table =
                    new PdfPTable(4);

            table.addCell("Date");
            table.addCell("Category");
            table.addCell("Amount");
            table.addCell("Description");

            double total = 0;

            for(Expense e : expenses){

                table.addCell(
                        e.getExpenseDate().toString()
                );

                table.addCell(
                        e.getCategory()
                );

                table.addCell(
                        String.valueOf(
                                e.getAmount()
                        )
                );

                table.addCell(
                        e.getDescription()
                );

                total += e.getAmount();
            }

            document.add(table);

            document.add(
                    new Paragraph(" ")
            );

            document.add(
                    new Paragraph(
                            "Total Expense : INR "
                            + total
                    )
            );

            document.close();

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}