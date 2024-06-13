/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author gauta
 */
public class signUp extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Connection conn = null;
        PreparedStatement stmt = null;

        try(PrintWriter out = resp.getWriter()){
        
        String name = req.getParameter("user_name");
        String password = req.getParameter("user_password");
        String email = req.getParameter("user_email");
        try {
            // Load the JDBC driver class
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "ishan@5701A@");
            String query = "insert into user(name,password,email) values(?,?,?)";
            
            // Create a statement
            stmt = conn.prepareStatement(query);
            
            stmt.setString(1, name);
            stmt.setString(2, password);
            stmt.setString(3, email);
            
            stmt.executeUpdate();
            out.println("done.........");
            
            // Process the result set
        } 
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle any exceptions
            out.println("error.........");
        } 
        finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle any exceptions
            }
        }
        
        
        // Write HTML content to the response
        out.println("<html>");
        out.println("<head>");
        out.println("<title>MyServlet</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>"+name+"</h1>");
        out.println("<p>This is a simple Servlet example.</p>");
        out.println("</body>");
        out.println("</html>");
        
        }
    }
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("hello");
//        
//    }
    
    
    
}
