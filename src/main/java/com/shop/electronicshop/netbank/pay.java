/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shop.electronicshop.netbank;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import com.google.zxing.BarcodeFormat;  
import com.google.zxing.EncodeHintType;  
import com.google.zxing.MultiFormatWriter;  
import com.google.zxing.WriterException;  
import com.google.zxing.client.j2se.MatrixToImageWriter;  
import com.google.zxing.common.BitMatrix;  
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;  
import java.io.File;
public class pay extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String amt=request.getParameter("amt");
        int c=(int)Math.random()*1000;
        PrintWriter out=response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet pay</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Amount to be payed : "+amt+"</h1>");
            out.println("<h1>Scan the below QR-code to pay the amount.</h1>");
            String str= "AMOUNT TO BE PAYED IS"+amt;  
            String path = "C:\\Users\\rahul\\OneDrive\\Desktop\\Webproject\\Electronicshop\\src\\main\\webapp\\qrcode\\qrcode-"+c+".png";  
            String charset = "UTF-8";  
            Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();  
            hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
            try{
               generateQRcode(str, path, charset, hashMap, 200, 200); 
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            String path2="./qrcode/qrcode-"+c+".png";
            out.print("<img src="+path2+" alt=qrcode>");  
            out.println("</body>");
            out.println("</html>");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String amt=request.getParameter("amt");
        PrintWriter out=response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet pay</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Amount to be payed : "+amt+"</h1>");
            
            out.println("</body>");
            out.println("</html>");
    }
    public static void generateQRcode(String data, String path, String charset, Map map, int h, int w) throws WriterException, IOException  
{  
          BitMatrix matrix = new MultiFormatWriter().encode(new String(data.getBytes(charset), charset), BarcodeFormat.QR_CODE, w, h);  
          MatrixToImageWriter.writeToFile(matrix, path.substring(path.lastIndexOf('.') + 1), new File(path));  
}    
}
