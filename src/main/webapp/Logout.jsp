<%-- 
    Document   : Logout
    Created on : 03-Feb-2023, 7:48:57 pm
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@page import="java.time.format.DateTimeFormatter"%>
        <%@page import="java.time.LocalDateTime"%>
        <%@page import="java.sql.*"%>
    </head>
    <body>
        <% 
            String uname=(String)session.getAttribute("uname");
            String id=(String)session.getAttribute("id");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();  
            String time=dtf.format(now);
            session.invalidate(); 
            try{
            Class.forName("com.mysql.jdbc.Driver");
              Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
               PreparedStatement stmt1=con1.prepareStatement("update history set sclosedtime=? where uname=? AND sid=?");
               stmt1.setString(1, time);
               stmt1.setString(2, uname);
               stmt1.setString(3, id);
               stmt1.executeUpdate();
               con1.close();
            }
            catch(Exception e)
        {
            e.printStackTrace();
        }
        
        %>
        <h1>Session closed you will be redirected to index page...</h1>
        <script>
            window.onload = function() {
                var interval = setInterval(myURL, 3000);
            };
        function myURL() {
         document.location.href = 'http://localhost:8080/Electronicshop/';
         clearInterval(interval);
      }
        </script>
    </body>
</html>
