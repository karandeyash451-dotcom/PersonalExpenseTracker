package com.pbl.personalexpensetracker.util;

public class TestDB {

    public static void main(String[] args) {

        if(DBConnection.getConnection() != null) {
            System.out.println("CONNECTED");
        } else {
            System.out.println("NOT CONNECTED");
        }

    }
}