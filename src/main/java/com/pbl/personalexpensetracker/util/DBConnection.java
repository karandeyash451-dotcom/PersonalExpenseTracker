package com.pbl.personalexpensetracker.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/expense_tracker";

    private static final String USER = "root";

    private static final String PASSWORD = "root123";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn =
                    DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("DATABASE CONNECTED");

            return conn;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}