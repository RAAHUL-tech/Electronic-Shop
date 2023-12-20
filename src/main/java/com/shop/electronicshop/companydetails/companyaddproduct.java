/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shop.electronicshop.companydetails;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author rahul
 */
@MultipartConfig(maxFileSize = 16177215) 
public class companyaddproduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet companyaddproduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet companyaddproduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pname=request.getParameter("product");
        String pprice=request.getParameter("product_price");
        String dis=request.getParameter("discount");
        String des=request.getParameter("des");
        String addinfo=request.getParameter("add");
        InputStream inputStream = null;
        Part file=request.getPart("image");
        if (file != null) {
            System.out.println(file.getName());
            System.out.println(file.getSize());
            System.out.println(file.getContentType());
            inputStream = file.getInputStream();
        }
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
            PreparedStatement stmt=con.prepareStatement("INSERT INTO product_details (product_img, product_name, product_description, amount, discount) VALUES (?,?,?,?,?)");
            if(inputStream!=null)
            {
                stmt.setBlob(1, inputStream);
  
            }
            stmt.setString(2, pname);
            stmt.setString(3, des);
            stmt.setString(4, pprice);
            stmt.setString(5, dis);
            stmt.executeUpdate();
            con.close();
            System.out.println("image uploaded to database");
            response.sendRedirect("http://localhost/Shop/index.php");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }


}
