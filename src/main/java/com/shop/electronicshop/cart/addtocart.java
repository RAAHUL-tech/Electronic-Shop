/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shop.electronicshop.cart;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rahul
 */
public class addtocart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addtocart</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addtocart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("id");
        int id1=Integer.parseInt(id);
        HttpSession session=request.getSession();
        String uname=(String)session.getAttribute("uname");
        String pname="",pdes="";
        int amt=0,discount=0;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        PreparedStatement stmt=con.prepareStatement("select product_name,product_description,amount,discount from product_details where id=?");
	stmt.setString(1, id);
        ResultSet rs=stmt.executeQuery();
                        while(rs.next())
                        {
                            pname=rs.getString(1);
                            pdes=rs.getString(2);
                            amt=rs.getInt(3);
                            discount=rs.getInt(4);
                        }
	    con.close(); 
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        PreparedStatement stmt1=con1.prepareStatement("insert into cart values(?,?,?,?,?,?)");
	stmt1.setString(1, uname); 
        stmt1.setString(2, id); 
        stmt1.setString(3, pname); 
        stmt1.setString(4, pdes); 
        stmt1.setInt(5, amt); 
        stmt1.setInt(6, discount); 
        stmt1.executeUpdate();
        con1.close(); 
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
