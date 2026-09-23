package com.pbl.personalexpensetracker.dao;

import com.pbl.personalexpensetracker.model.Budget;
import com.pbl.personalexpensetracker.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BudgetDAO {

    public boolean saveBudget(Budget budget) {

        boolean status = false;

        try {

            Connection conn = DBConnection.getConnection();

            String checkSql =
                    "SELECT * FROM budget WHERE user_id=?";

            PreparedStatement checkPs =
                    conn.prepareStatement(checkSql);

            checkPs.setInt(1, budget.getUserId());

            ResultSet rs =
                    checkPs.executeQuery();

            if(rs.next()) {

                String updateSql =
                        "UPDATE budget SET monthly_budget=? WHERE user_id=?";

                PreparedStatement updatePs =
                        conn.prepareStatement(updateSql);

                updatePs.setDouble(
                        1,
                        budget.getMonthlyBudget()
                );

                updatePs.setInt(
                        2,
                        budget.getUserId()
                );

                status =
                        updatePs.executeUpdate() > 0;

            } else {

                String insertSql =
                        "INSERT INTO budget(user_id, monthly_budget) VALUES(?,?)";

                PreparedStatement insertPs =
                        conn.prepareStatement(insertSql);

                insertPs.setInt(
                        1,
                        budget.getUserId()
                );

                insertPs.setDouble(
                        2,
                        budget.getMonthlyBudget()
                );

                status =
                        insertPs.executeUpdate() > 0;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    public double getBudgetByUser(int userId) {

        double budget = 0;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT monthly_budget FROM budget WHERE user_id=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                budget =
                        rs.getDouble("monthly_budget");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return budget;
    }
public double getMonthlyBudget(int userId) {

    double budget = 0;

    try {

        Connection conn =
                DBConnection.getConnection();

        String sql =
                "SELECT monthly_budget " +
                "FROM budget " +
                "WHERE user_id=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()) {

            budget =
                    rs.getDouble(
                            "monthly_budget"
                    );
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return budget;
}
}