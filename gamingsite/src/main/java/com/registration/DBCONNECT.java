package com.registration;

import java.sql.Connection;

import java.sql.DriverManager;

public class DBCONNECT {
    private static final String url = "jdbc:mysql://localhost:3306/legend_arena";
    private static final String user = "root";
    private static final String password= "vishwa";
    private static Connection con;

    public static Connection getConnection() {
          // Ensure the connection is established only once
            try {
                // Load the MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                con = DriverManager.getConnection(url, user, password);
        
            } catch (Exception e) {
            	System.out.println("Database connection is not success!!!");
        }
        return con;
        
         }}
    