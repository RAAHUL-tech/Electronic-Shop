/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shop.electronicshop.onload;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author rahul
 */
public class Serv1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Serv1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Serv1 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Blob image = null;
        byte[] imgData = null;
       String id= request.getParameter("id");//here you are getting id 
       int i;
       ResultSet rs =null;

 try {

            //loading drivers for mysql
           Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");


         String sql = "SELECT product_img FROM product_details where id=?";  

           PreparedStatement ps = con.prepareStatement(sql);


               ps.setString(1, id);
              rs = ps.executeQuery();    
 while (rs.next()) {
                  image = rs.getBlob("product_img");//getting image from database 
                  imgData = image.getBytes(1,(int)image.length()); //extra info about image
                } 

response.setContentType("image/png");//setting response type



OutputStream o = response.getOutputStream();

o.write(imgData);//sending the image to jsp page 
o.flush();
o.close();


 }
    catch(Exception e)
         {
             e.printStackTrace();
         }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
