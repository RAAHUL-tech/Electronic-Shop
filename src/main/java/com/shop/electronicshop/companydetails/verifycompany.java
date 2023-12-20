/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shop.electronicshop.companydetails;

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
import java.sql.ResultSet;

/**
 *
 * @author rahul
 */
public class verifycompany extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet verifycompany</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet verifycompany at " + request.getContextPath() + "</h1>");
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
        String pass=request.getParameter("pass");
        String pass2="";  
        try
        {
            String passhash=toHexStr(obtainSHA(pass));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
            PreparedStatement stmt=con.prepareStatement("select password from company_user_details where company_name=?");
	    stmt.setString(1, uname);
            ResultSet rs=stmt.executeQuery();
                        while(rs.next())
                        {
                            pass2=rs.getString(1);
                        }
	    con.close(); 
            if(pass2.equals(passhash))
            {
                HttpSession session=request.getSession();
           session.setAttribute("uname", uname);
           response.sendRedirect("http://localhost/Shop/index.php?name="+uname);  
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
