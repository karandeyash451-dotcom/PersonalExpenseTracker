package com.pbl.personalexpensetracker.servlet;

import com.pbl.personalexpensetracker.dao.BudgetDAO;
import com.pbl.personalexpensetracker.dao.ExpenseDAO;
import com.pbl.personalexpensetracker.model.User;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/summary")
public class SummaryServlet extends HttpServlet {

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
        
        int expenseCount =
        dao.getExpenseCount(
                user.getUserId()
        );

        BudgetDAO budgetDAO =
                new BudgetDAO();

        double total =
                dao.getTotalExpense(
                        user.getUserId()
                );

        double weekly =
                dao.getWeeklyExpense(
                        user.getUserId()
                );

        double monthly =
                dao.getMonthlyExpense(
                        user.getUserId()
                );
        double previousMonth =
        dao.getPreviousMonthExpense(
                user.getUserId()
        );
        double difference =
        monthly - previousMonth;

double changePercent = 0;

String comparisonMessage;

if(previousMonth > 0){

    changePercent =
            (Math.abs(difference) * 100)
            / previousMonth;
}

if(difference > 0){

    comparisonMessage =
            String.format(
                "%.2f%% Higher than last month",
                changePercent
            );

}
else if(difference < 0){

    comparisonMessage =
            String.format(
                "%.2f%% Lower than last month",
                changePercent
            );

}
else{

    comparisonMessage =
            "No change from last month";
}
        

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

        double usagePercent = 0;

        if(budget > 0){

            usagePercent =
                    (monthly * 100)
                    / budget;
        }
        
        LocalDate today =
        LocalDate.now();

int currentDay =
        today.getDayOfMonth();

int totalDays =
        today.lengthOfMonth();

double predictedExpense = 0;

if(currentDay > 0){

    predictedExpense =
            (monthly / currentDay)
            * totalDays;
}

String forecastMessage;

if(predictedExpense > budget &&
        budget > 0){

    forecastMessage =
            "Warning: You may exceed your budget this month.";

}
else if(budget > 0){

    forecastMessage =
            "Great! You are likely to stay within budget.";

}
else{

    forecastMessage =
            "Set a budget to enable forecasting.";
}
        int healthScore;
String healthStatus;

if(budget == 0){

    healthScore = 0;
    healthStatus = "Set a Budget First";

}
else if(usagePercent < 50){

    healthScore = 100;
    healthStatus = "Excellent Financial Control";

}
else if(usagePercent < 70){

    healthScore = 85;
    healthStatus = "Good Financial Control";

}
else if(usagePercent < 90){

    healthScore = 70;
    healthStatus = "Average Financial Control";

}
else if(usagePercent <= 100){

    healthScore = 55;
    healthStatus = "Budget Almost Exhausted";

}
else{

    healthScore = 30;
    healthStatus = "Budget Overspending";
}

        double food =
                dao.getCategoryTotal(
                        user.getUserId(),
                        "Food"
                );

        double travel =
                dao.getCategoryTotal(
                        user.getUserId(),
                        "Travel"
                );

        double shopping =
                dao.getCategoryTotal(
                        user.getUserId(),
                        "Shopping"
                );

        double bills =
                dao.getCategoryTotal(
                        user.getUserId(),
                        "Bills"
                );

        double entertainment =
                dao.getCategoryTotal(
                        user.getUserId(),
                        "Entertainment"
                );

        double other =
                dao.getCategoryTotal(
                        user.getUserId(),
                        "Other"
                );

        double[] monthlyTrend =
                dao.getMonthlyTrend(
                        user.getUserId()
                );
        String topCategory =
        dao.getTopCategory(
                user.getUserId()
        );

double topAmount =
        dao.getTopCategoryAmount(
                user.getUserId()
        );
double suggestedSaving =
        dao.getSuggestionSavings(
                user.getUserId()
        );
String spendingInsight;

if(monthly > previousMonth){

    spendingInsight =
            "Spending increased compared to last month";

}
else if(monthly < previousMonth){

    spendingInsight =
            "Spending decreased compared to last month";

}
else{

    spendingInsight =
            "Spending remained same as last month";
}

String budgetInsight =
        String.format(
                "Budget usage is %.2f%%",
                usagePercent
        );

String forecastInsight =
        String.format(
                "Predicted month-end expense is ₹ %.2f",
                predictedExpense
        );

        double foodPercent = 0;
        double travelPercent = 0;
        double shoppingPercent = 0;
        double billsPercent = 0;
        double entertainmentPercent = 0;
        double otherPercent = 0;

        if(total > 0){

            foodPercent =
                    (food * 100) / total;

            travelPercent =
                    (travel * 100) / total;

            shoppingPercent =
                    (shopping * 100) / total;

            billsPercent =
                    (bills * 100) / total;

            entertainmentPercent =
                    (entertainment * 100) / total;

            otherPercent =
                    (other * 100) / total;
        }

        request.setAttribute("total", total);
        request.setAttribute("weekly", weekly);
        request.setAttribute("monthly", monthly);
        request.setAttribute("yearly", yearly);

        request.setAttribute("budget", budget);
        request.setAttribute("remaining", remaining);
        request.setAttribute("usagePercent", usagePercent);
        request.setAttribute(
        "healthScore",
        healthScore
);

request.setAttribute(
        "healthStatus",
        healthStatus
);

        request.setAttribute("food", food);
        request.setAttribute("travel", travel);
        request.setAttribute("shopping", shopping);
        request.setAttribute("bills", bills);
        request.setAttribute("entertainment", entertainment);
        request.setAttribute("other", other);

        request.setAttribute("foodPercent", foodPercent);
        request.setAttribute("travelPercent", travelPercent);
        request.setAttribute("shoppingPercent", shoppingPercent);
        request.setAttribute("billsPercent", billsPercent);
        request.setAttribute("entertainmentPercent", entertainmentPercent);
        request.setAttribute("otherPercent", otherPercent);

        request.setAttribute(
                "monthlyTrend",
                monthlyTrend
        );
        request.setAttribute(
        "topCategory",
        topCategory
);

request.setAttribute(
        "topAmount",
        topAmount
);
request.setAttribute(
        "suggestedSaving",
        suggestedSaving
);
request.setAttribute(
        "predictedExpense",
        predictedExpense
);

request.setAttribute(
        "forecastMessage",
        forecastMessage
);

request.setAttribute(
        "currentDay",
        currentDay
);

request.setAttribute(
        "totalDays",
        totalDays
);
request.setAttribute(
        "previousMonth",
        previousMonth
);

request.setAttribute(
        "difference",
        Math.abs(difference)
);

request.setAttribute(
        "comparisonMessage",
        comparisonMessage
);
request.setAttribute(
        "spendingInsight",
        spendingInsight
);

request.setAttribute(
        "budgetInsight",
        budgetInsight
);

request.setAttribute(
        "forecastInsight",
        forecastInsight
);

        request.getRequestDispatcher(
                "summary.jsp"
        ).forward(request, response);
    }
}
