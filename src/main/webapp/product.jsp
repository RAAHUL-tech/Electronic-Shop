<%-- 
    Document   : product
    Created on : 08-Feb-2023, 3:45:06 pm
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
         <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.*"%>
        <%@page import="java.io.*"%>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
         <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/0399202c65.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
     <style>
        *{
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    box-sizing: border-box;
   
}
body{
  background: #07051a;
}
  .wrapper .search-input{
    background: #fff;
    width: auto;
    border-radius: 5px;
    display: inline-flex;
    box-shadow: 0px 1px 5px 3px rgba(0,0,0,0.12);
  }
  .search-input input{
    height: 30px;
    width: auto;
    outline: none;
    border: none;
    background-color: ghostwhite;
    border-radius: 5px;
    padding: 0 60px 0 20px;
    font-size: 15px;
    box-shadow: 0px 1px 5px rgba(0,0,0,0.1);
  }
  .search-input.active input{
    border-radius: 5px 5px 0 0;
  }
  .search-input .autocom-box{
    padding: 0;
    opacity: 0;
    pointer-events: none;
    max-height: 280px;
    overflow-y: auto;
  }
  .search-input.active .autocom-box{
    padding: 10px 8px;
    opacity: 1;
    background-color: transparent;
    pointer-events: auto;
  }
  .autocom-box li{
    list-style: none;
    color: black;
    padding: 8px 12px;
    display: none;
    width: 100%;
    cursor: default;
    border-radius: 3px;
  }
  .search-input.active .autocom-box li{
    display: block;
    background-color: transparent;
  }
  .autocom-box li:hover{
    background: #aaa9a9;
  }
  .search-input .icon{
   
    right: 0px;
    top: 0px;
    text-align: center;
    font-size: 16px;
    color: black;
    cursor: pointer;
  }
  body { 
      padding-top: 70px; 
      padding-left: 30px;
      color: white;
  }
  .drop{
      padding: 10px;
      color: white;
      position: absolute;
      text-align: right;
  }
  .drop select{
      color: black;
  }
  .drop #sort option{
      color: black;
  }
  .drop button{
      background: white;
      color: black;
      width: 50px;
      height: 30px;
  }
  .item{
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content:right;
      padding: 30px;
      color: white;
  }
  .outeritem{
      width: auto;
      height: auto;
      display: flex;
      padding: 10px;
      justify-content: center;
      align-items:flex-start;
  }
  .outeritem .item h2{
      padding-bottom: 30px;
  }
  .outeritem .item .inneritem{
      display: flex;
      padding: 10px 10px 0 10px;
      letter-spacing: 1px;
      font-weight: 100;
      justify-content:space-around;
      align-items: stretch;
  }
  .outeritem .item .inneritem ul li p{
      line-height: 20px;
      padding: 20px;
  }
  .outeritem .item .inneritem p{
      padding-right: 40px;
      line-height: 10px;
  }
  .outeritem .item .inneritem button{
      color: black;
      width: 50px;
  }
  .outeritem .item .inneritem button:hover{
      color: #ffc800;
  }
  @media screen and (max-width:520px){
      .outeritem img{
          width: 250px;
          height: 250px;
      }
  }
  #reviewform input{
      color: black;
     
  }
  #reviewform button{
      color: yellow;
      background-color: black;
  }
    </style>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%  String uname=(String)session.getAttribute("uname"); %>
    <header>
      <nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><i>Electrosell</i></a>
          </div>
      
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#offer1">Offers</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Review <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Model</a></li>
                  <li><a href="#">Price range</a>
                    </li>
                  <li><a href="#">Battery life</a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-form navbar-right">
              <div class="wrapper">
                <div class="search-input">
              <div class="form-group ">
                <a href="" target="_blank" hidden></a>
                <input type="text" class="form-control" placeholder="Search items here" name="item">
                <div class="autocom-box">
                  <ul>
                  <li>Mobile phone</li>
                  <li>Smart phone</li>
                  <li>Washing machine</li>
                  </ul>
                </div>
              </div>
              <button type="submit" class="btn btn-default icon"> <i class="fa fa-search"></i></button>
              </div>
              </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="buy.jsp">Buy<span class="sr-only">(current)</span></a></li>
              <li><a href="sell.jsp">Sell</a></li>
              <li><a href="http://localhost/Shop/repair.php">Repair</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li style="color:black;padding: 2px;"><b><%=uname %></b></li>
                    <li role="separator" class="divider"></li>
                  <li><a href="mycart.jsp">My cart</a></li>
                  <li><a href="history.jsp">My Activity</a></li>
                   <li><a href="Logout.jsp">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
         
        <%
                   try{
                   String id=request.getParameter("id");
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
                   PreparedStatement stmt=con.prepareStatement("select product_name,product_specification1,product_specification2,product_specification3,orginal_amt,amount,discount from product where id=?");
                   stmt.setString(1, id);
                   ResultSet rs=stmt.executeQuery();
                   %>   
      <div class="container" id="product-cards">
       <h1 class="text-center">PRODUCTS</h1>
       </div>
       <% while(rs.next()){ %>
       <div class="container outeritem">
           <img src="./Serv1?id=<%=id%>" width="500px" height="500px" value=<%=id%>/>
       <div class="container item">
           <h2><%=rs.getString(1)%></h2>
           <ul>
              <li><p><%=rs.getString(2)%></p></li>
              <li><p><%=rs.getString(3)%></p></li>
              <li><p><%=rs.getString(4)%></p></li>
           </ul>
           <div class="inneritem">
               <p style="text-decoration:line-through;">&#8377;<%=rs.getInt(5)%></p>
           <p>&#8377;<%=rs.getInt(6)%></p>
           <p><%=rs.getInt(7)%>%</p>
           <button type="submit" name="button" onclick="func(<%=id%>)" value=<%=id%>><span><li class="fa-solid fa-cart-shopping"></li></span></button>
           </div>
           <hr width="700px">
       </div>
       </div>
       <%} %>
         <%  }
catch(Exception e)
{
e.printStackTrace();
}
%>
     <div class="container" id="product-cards">
       <h1 class="text-center">REVIEWS</h1>
       </div>
    <%  String id="";
        try
        {
          int count=1;
          id=request.getParameter("id");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
           PreparedStatement stmt=con.prepareStatement("select person_name,star,comments from review where id=?");
           stmt.setString(1, id);
           ResultSet rs=stmt.executeQuery();
    %>
         <% while(rs.next()){ %>
       <div class="container outeritem">
       <div class="container item">
           <p><%=count%>.<%=rs.getString(1)%></p>
              <p>Star Rating :<i class="fa-solid fa-star checked"></i><%=rs.getInt(2)%>/5</p>
              <p>Comments :<%=rs.getString(3)%></p>
              <% count+=1; %>
           <hr width="700px">
       </div>
       </div> 
    
    <%} %>
    <h3>Place your review here</h3>
    <form action="postreview" method="post" id="reviewform">
        <input type="hidden" name="hide" value=<%=id%>>
    Star rating :
    <input type="number" placeholder="4/5" required name="star">
    Comments :
    <input type="text" required name="com">
    <button type="submit">Submit</button>
    </form>
     <%  
         }
catch(Exception e)
{
e.printStackTrace();
}
%>
        <%@ include file = "footer.jsp" %>
<script>
    function func(id)
    {
       // var id=document.getElementById("hide").value;
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open( "POST","./addtocart" ); 
        xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlHttp.send("id="+id);
        console.log(id);
        alert("Item added to cart");
    }
    
    
</script>
    <script src="script.js"></script>
     <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script> 
    </body>
</html>
