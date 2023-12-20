/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shop.electronicshop.companydetails;

import static com.shop.electronicshop.userdetails.registeruser.obtainSHA;
import static com.shop.electronicshop.userdetails.registeruser.toHexStr;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author rahul
 */
public class registercompany extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registercompany</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registercompany at " + request.getContextPath() + "</h1>");
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
       
        String uname=request.getParameter("uname");
        String email=request.getParameter("email");
        String loc=request.getParameter("loc");
        String pass=request.getParameter("pass");
        String cpass=request.getParameter("cpass");
        try
        {
           String passhash=toHexStr(obtainSHA(pass));
           String cpasshash=toHexStr(obtainSHA(cpass));
           if(passhash.equals(cpasshash))
           {
               Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
           PreparedStatement stmt1=con.prepareStatement("insert into company_user_details(company_name,email,location,password) values(?,?,?,?)");
	   stmt1.setString(1, uname);
	   stmt1.setString(2, email);
           stmt1.setString(3, loc);
	   stmt1.setString(4, passhash);
	   stmt1.executeUpdate();
           con.close();
           HttpSession session=request.getSession();
           session.setAttribute("uname", uname);
           RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
           rd.forward(request, response);
           }
           else
           {
               PrintWriter out = response.getWriter();
               out.println("Something went wrong!!");
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    public static byte[] obtainSHA(String s) throws NoSuchAlgorithmException
    {
        MessageDigest msgDgst=MessageDigest.getInstance("SHA-512");
        return msgDgst.digest(s.getBytes(StandardCharsets.UTF_8));
    }
    public static String toHexStr(byte[] hash)
    {
        BigInteger no=new BigInteger(1,hash);
        StringBuilder sb=new StringBuilder(no.toString(16));
        while(sb.length()<32)
        {
            sb.insert(0, '0');
        }
        return sb.toString();
    }

}
