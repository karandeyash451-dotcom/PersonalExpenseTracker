package com.pbl.personalexpensetracker.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String HOST =
            System.getenv().getOrDefault("MYSQLHOST", "localhost");

    private static final String PORT =
            System.getenv().getOrDefault("MYSQLPORT", "3306");

    private static final String DATABASE =
            System.getenv().getOrDefault("MYSQLDATABASE", "expense_tracker");

    private static final String USER =
            System.getenv().getOrDefault("MYSQLUSER", "root");

    private static final String PASSWORD =
            System.getenv().getOrDefault("MYSQLPASSWORD", "root123");

    private static final String URL =
            "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE
            + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

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
