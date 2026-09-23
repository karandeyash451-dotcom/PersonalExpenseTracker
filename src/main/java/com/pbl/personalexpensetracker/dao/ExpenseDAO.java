package com.pbl.personalexpensetracker.dao;

import com.pbl.personalexpensetracker.model.Expense;
import com.pbl.personalexpensetracker.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDAO {

    // ADD EXPENSE

    public boolean addExpense(Expense expense) {

        boolean status = false;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "INSERT INTO expenses(user_id, category, amount, description, expense_date) VALUES(?,?,?,?,?)";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, expense.getUserId());
            ps.setString(2, expense.getCategory());
            ps.setDouble(3, expense.getAmount());
            ps.setString(4, expense.getDescription());
            ps.setDate(5, expense.getExpenseDate());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

    // VIEW EXPENSES

    public List<Expense> getExpensesByUser(int userId) {

        List<Expense> expenses = new ArrayList<>();

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "SELECT * FROM expenses WHERE user_id=? ORDER BY expense_date DESC";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Expense expense = new Expense();

                expense.setExpenseId(rs.getInt("expense_id"));
                expense.setUserId(rs.getInt("user_id"));
                expense.setCategory(rs.getString("category"));
                expense.setAmount(rs.getDouble("amount"));
                expense.setDescription(rs.getString("description"));
                expense.setExpenseDate(rs.getDate("expense_date"));

                expenses.add(expense);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return expenses;
    }

    // DELETE EXPENSE

    public boolean deleteExpense(int expenseId) {

        boolean status = false;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "DELETE FROM expenses WHERE expense_id=?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, expenseId);

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

    // TOTAL EXPENSE

    public double getTotalExpense(int userId) {

        double total = 0;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "SELECT SUM(amount) AS total FROM expenses WHERE user_id=?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                total = rs.getDouble("total");
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return total;
    }

    // CATEGORY TOTAL

    public double getCategoryTotal(int userId, String category) {

        double total = 0;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "SELECT SUM(amount) AS total " +
                "FROM expenses " +
                "WHERE user_id=? AND category=?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setString(2, category);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                total = rs.getDouble("total");
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return total;
    }

    // WEEKLY EXPENSE

    public double getWeeklyExpense(int userId) {

        double total = 0;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "SELECT SUM(amount) AS total " +
                "FROM expenses " +
                "WHERE user_id=? " +
                "AND YEARWEEK(expense_date)=YEARWEEK(CURDATE())";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                total = rs.getDouble("total");
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return total;
    }

    // MONTHLY EXPENSE

    public double getMonthlyExpense(int userId) {

        double total = 0;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "SELECT SUM(amount) AS total " +
                "FROM expenses " +
                "WHERE user_id=? " +
                "AND MONTH(expense_date)=MONTH(CURDATE()) " +
                "AND YEAR(expense_date)=YEAR(CURDATE())";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                total = rs.getDouble("total");
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return total;
    }

    // YEARLY EXPENSE

    public double getYearlyExpense(int userId) {

        double total = 0;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "SELECT SUM(amount) AS total " +
                "FROM expenses " +
                "WHERE user_id=? " +
                "AND YEAR(expense_date)=YEAR(CURDATE())";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                total = rs.getDouble("total");
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return total;
    }
public double[] getMonthlyTrend(int userId) {

    double[] monthlyData = new double[12];

    try {

        Connection conn = DBConnection.getConnection();

        String sql =
            "SELECT MONTH(expense_date) AS month, " +
            "SUM(amount) AS total " +
            "FROM expenses " +
            "WHERE user_id=? " +
            "AND YEAR(expense_date)=YEAR(CURDATE()) " +
            "GROUP BY MONTH(expense_date)";

        PreparedStatement ps =
            conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {

            int month =
                rs.getInt("month");

            monthlyData[month - 1] =
                rs.getDouble("total");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return monthlyData;
}
// GET SINGLE EXPENSE

public Expense getExpenseById(int expenseId) {

    Expense expense = null;

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT * FROM expenses WHERE expense_id=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, expenseId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()) {

            expense = new Expense();

            expense.setExpenseId(
                    rs.getInt("expense_id")
            );

            expense.setUserId(
                    rs.getInt("user_id")
            );

            expense.setCategory(
                    rs.getString("category")
            );

            expense.setAmount(
                    rs.getDouble("amount")
            );

            expense.setDescription(
                    rs.getString("description")
            );

            expense.setExpenseDate(
                    rs.getDate("expense_date")
            );
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return expense;
}


// UPDATE EXPENSE

public boolean updateExpense(
        Expense expense) {

    boolean status = false;

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "UPDATE expenses " +
                "SET category=?, amount=?, description=?, expense_date=? " +
                "WHERE expense_id=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setString(
                1,
                expense.getCategory()
        );

        ps.setDouble(
                2,
                expense.getAmount()
        );

        ps.setString(
                3,
                expense.getDescription()
        );

        ps.setDate(
                4,
                expense.getExpenseDate()
        );

        ps.setInt(
                5,
                expense.getExpenseId()
        );

        status =
                ps.executeUpdate() > 0;

    } catch(Exception e) {

        e.printStackTrace();
    }

    return status;
}
// SEARCH EXPENSES BY CATEGORY

public List<Expense> searchExpensesByCategory(
        int userId,
        String category) {

    List<Expense> expenses =
            new ArrayList<>();

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT * FROM expenses " +
                "WHERE user_id=? " +
                "AND category=? " +
                "ORDER BY expense_date DESC";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ps.setString(2, category);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()) {

            Expense expense =
                    new Expense();

            expense.setExpenseId(
                    rs.getInt("expense_id")
            );

            expense.setUserId(
                    rs.getInt("user_id")
            );

            expense.setCategory(
                    rs.getString("category")
            );

            expense.setAmount(
                    rs.getDouble("amount")
            );

            expense.setDescription(
                    rs.getString("description")
            );

            expense.setExpenseDate(
                    rs.getDate("expense_date")
            );

            expenses.add(expense);
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return expenses;
}
public int getTotalTransactions(int userId) {

    int count = 0;

    try {

        Connection conn = DBConnection.getConnection();

        String sql =
                "SELECT COUNT(*) AS total FROM expenses WHERE user_id=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            count = rs.getInt("total");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return count;
}
public double getAverageExpense(int userId) {

    double avg = 0;

    try {

        Connection conn = DBConnection.getConnection();

        String sql =
                "SELECT AVG(amount) AS avgExpense FROM expenses WHERE user_id=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            avg = rs.getDouble("avgExpense");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return avg;
}
public double getHighestExpense(int userId) {

    double max = 0;

    try {

        Connection conn = DBConnection.getConnection();

        String sql =
                "SELECT MAX(amount) AS highest FROM expenses WHERE user_id=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            max = rs.getDouble("highest");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return max;
}
public double getLowestExpense(int userId) {

    double min = 0;

    try {

        Connection conn = DBConnection.getConnection();

        String sql =
                "SELECT MIN(amount) AS lowest FROM expenses WHERE user_id=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            min = rs.getDouble("lowest");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return min;
}
public String getTopCategory(int userId) {

    String category = "N/A";

    try {

        Connection conn = DBConnection.getConnection();

        String sql =
                "SELECT category, SUM(amount) total " +
                "FROM expenses " +
                "WHERE user_id=? " +
                "GROUP BY category " +
                "ORDER BY total DESC " +
                "LIMIT 1";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            category = rs.getString("category");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return category;
}
public List<Expense> getExpensesByDateRange(
        int userId,
        String fromDate,
        String toDate) {

    List<Expense> expenses =
            new ArrayList<>();

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT * FROM expenses " +
                "WHERE user_id=? " +
                "AND expense_date BETWEEN ? AND ? " +
                "ORDER BY expense_date DESC";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);
        ps.setString(2, fromDate);
        ps.setString(3, toDate);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()) {

            Expense expense =
                    new Expense();

            expense.setExpenseId(
                    rs.getInt("expense_id"));

            expense.setUserId(
                    rs.getInt("user_id"));

            expense.setCategory(
                    rs.getString("category"));

            expense.setAmount(
                    rs.getDouble("amount"));

            expense.setDescription(
                    rs.getString("description"));

            expense.setExpenseDate(
                    rs.getDate("expense_date"));

            expenses.add(expense);
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return expenses;
}
public double getTopCategoryAmount(int userId) {

    double amount = 0;

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT SUM(amount) total " +
                "FROM expenses " +
                "WHERE user_id=? " +
                "GROUP BY category " +
                "ORDER BY total DESC " +
                "LIMIT 1";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()) {

            amount =
                    rs.getDouble("total");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return amount;
}
public double getSuggestionSavings(int userId) {

    double amount = 0;

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT SUM(amount) total " +
                "FROM expenses " +
                "WHERE user_id=? " +
                "GROUP BY category " +
                "ORDER BY total DESC " +
                "LIMIT 1";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()) {

            amount =
                    rs.getDouble("total");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return amount * 0.10;
}
// RECENT 5 EXPENSES

public List<Expense> getRecentExpenses(int userId) {

    List<Expense> expenses =
            new ArrayList<>();

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT * FROM expenses " +
                "WHERE user_id=? " +
                "ORDER BY expense_date DESC " +
                "LIMIT 5";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()) {

            Expense expense =
                    new Expense();

            expense.setExpenseId(
                    rs.getInt("expense_id")
            );

            expense.setUserId(
                    rs.getInt("user_id")
            );

            expense.setCategory(
                    rs.getString("category")
            );

            expense.setAmount(
                    rs.getDouble("amount")
            );

            expense.setDescription(
                    rs.getString("description")
            );

            expense.setExpenseDate(
                    rs.getDate("expense_date")
            );

            expenses.add(expense);
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return expenses;
}
// PREVIOUS MONTH EXPENSE

public double getPreviousMonthExpense(int userId) {

    double total = 0;

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
            "SELECT SUM(amount) AS total " +
            "FROM expenses " +
            "WHERE user_id=? " +
            "AND MONTH(expense_date)=MONTH(CURDATE()-INTERVAL 1 MONTH) " +
            "AND YEAR(expense_date)=YEAR(CURDATE()-INTERVAL 1 MONTH)";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()) {

            total =
                    rs.getDouble("total");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return total;
}
public int getExpenseCount(int userId) {

    int count = 0;

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT COUNT(*) AS total " +
                "FROM expenses " +
                "WHERE user_id=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()) {

            count =
                    rs.getInt("total");
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return count;
}
public List<Expense> getExpensesByDate(int userId) {

    List<Expense> expenses =
            new ArrayList<>();

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT * FROM expenses " +
                "WHERE user_id=? " +
                "ORDER BY expense_date DESC";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()) {

            Expense expense =
                    new Expense();

            expense.setExpenseId(
                    rs.getInt("expense_id")
            );

            expense.setUserId(
                    rs.getInt("user_id")
            );

            expense.setCategory(
                    rs.getString("category")
            );

            expense.setAmount(
                    rs.getDouble("amount")
            );

            expense.setDescription(
                    rs.getString("description")
            );

            expense.setExpenseDate(
                    rs.getDate("expense_date")
            );

            expenses.add(expense);
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return expenses;
}
}