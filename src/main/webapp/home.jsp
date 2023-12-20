<%-- 
    Document   : home
    Created on : 03-Feb-2023, 9:26:00 am
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Electronic shop</title>
    <%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
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
    padding: 8px 12px;
    display: none;
    width: 100%;
    cursor: default;
    border-radius: 3px;
  }
  .search-input.active .autocom-box li{
    display: block;
    background-color: transparent;
    color: black;
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
    </style>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%! static int count=0,c2=0; %>
    <%  String uname=(String)session.getAttribute("uname");
    Cookie cookie = null;
         Cookie[] cookies = null;
         String value="";
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
              value=cookie.getValue();
            }
         } else {
           System.out.println("Noname");
         }
    Cookie c1=new Cookie("count",String.valueOf(count));
     c2=Integer.parseInt(c1.getValue());
     if(c2==0)
    {
        count++;
    }
    else
    {
        c1=new Cookie("count",String.valueOf(count));   
        count++;
    }
    %>
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
              <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
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
              <li><a href="buy.jsp">Buy</a></li>
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
     
    <section class="home">
    <div class="content">
      <h1> <span>Purchase electronic products</span>
        <br>
        online and get <span id="span2">discounts</span> <br> Buy..Sell..Repair...
      </h1>
      <p>Search all products and get it in one place. 
        <br>All top brands available with discount and expert rating.
      </p>
      <div class="btn"><button>Shop Now</button></div>
       <h2>Visit Count : <%=count%></h2>
       <tag:set var="id" value="${sesid}"></tag:set>
       <tag:out value="Session Id:${sesid}"></tag:out>
    </div>
    <div class="img">
      <img src="./images/background.png" alt="">
    </div>
  </section>
    
    <!-- product cards -->
    <div class="container" id="product-cards">
      <h1 class="text-center">PRODUCTS</h1>
      <div class="row" style="margin-top: 30px;">
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/p6.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Iphone 13 pro</h3>
              <p class="text-center">128GB ROM,16 GB RAM.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;80,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/a1.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Airpods</h3>
              <p class="text-center">B&O speaker with 8hrs battery.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;6000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/laptop2.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Hp Laptop</h3>
              <p class="text-center">512 GB SSD,8 GB RAM.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;60,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/t1.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Apple I-pad</h3>
              <p class="text-center">6 GB RAM and 4000 MAH battery.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;45,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
      </div>

      <div class="row" style="margin-top: 30px;">
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/w1.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Smart Watch</h3>
              <p class="text-center">50+ Sports mode,7hr battery capacity.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;10,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pcm1.png" alt="">
            <div class="card-body">
              <h3 class="text-center">PC Monitor</h3>
              <p class="text-center">15.6 LED display with 3 UI design.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;20,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/phone1.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Galaxy S 22</h3>
              <p class="text-center">128GB RAM,180 deg fold.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;70,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/h1.png" alt="">
            <div class="card-body">
              <h3 class="text-center">POCO Headphone</h3>
              <p class="text-center">BO audio system build and Alexa built-in.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;5,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- product cards -->

    
    <!-- other cards -->
    <div class="container" id="other-cards">
      <div class="row">
        <div class="col-md-6 py-3 py-md-0">
          <div class="card">
            <img src="./images/c1.png" alt="">
            <div class="card-img-overlay">
              <h3>Best Laptop in Tech</h3>
              <h5>Latest Collection</h5>
              <p>Up To 20% Off</p>
              <button id="shopnow">Shop Now</button>
            </div>
          </div>
        </div>
        <div class="col-md-6 py-3 py-md-0">
          <div class="card">
            <img src="./images/c2.png" alt="">
            <div class="card-img-overlay">
              <h3>Best Headphone in Tech</h3>
              <h5>Latest Collection</h5>
              <p>Up To 30% Off</p>
              <button id="shopnow">Shop Now</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- other cards -->
   

    <!-- product cards -->
    <div class="container" id="product-cards">

      <div class="row" style="margin-top: 30px;">
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr1.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Samsung Washing Machine</h3>
              <p class="text-center">Top-load with 8kg capacity.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;50,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr2.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Samsung 1Ton AC</h3>
              <p class="text-center">Spreads across 270 deg through flip wings.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;45,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr3.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Microwave Oven</h3>
              <p class="text-center">Heats food in 30 seconds.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;10,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr4.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Refridgerator</h3>
              <p class="text-center">15kg volume with 4 battery backups.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;17,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
      </div>

      <!-- other cards -->
      <div id="offer1">
    <div class="container" id="other">
      <div class="row">
        <div class="col-md-4 py-3 py-md-0">
          <div class="card">
            <img src="./images/c3.png" alt="">
            <div class="card-img-overlay">
              <h3>Home Gadget</h3>
              <p>Latest collection Up To 20% Off</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 py-3 py-md-0">
          <div class="card">
            <img src="./images/c4.png" alt="">
            <div class="card-img-overlay">
              <h3>Gaming Gadget</h3>
              <p>Latest collection Up To 30% Off</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 py-3 py-md-0">
          <div class="card">
            <img src="./images/c5.png" alt="">
            <div class="card-img-overlay">
              <h3>Electronic Gadget</h3>
              <p>Latest collection Up To 15% Off</p>
            </div>
          </div>
        </div>
      </div>
    </div>
      </div>
    <!-- other cards -->




      <div class="row" style="margin-top: 30px;">
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr5.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Electric Fan</h3>
              <p class="text-center">125 Watt super electric fan.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;2,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr6.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Samsung Fridge</h3>
              <p class="text-center">200 Watt smart auto-colled fridge.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;45,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr7.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Gaming PC</h3>
              <p class="text-center">16 inch super Amoled display with Intel graphics.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;60,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr8.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Hp Monitor</h3>
              <p class="text-center">15.6 crystal Lcd display.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;5,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
      </div>



      <div class="row" style="margin-top: 30px;">
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr9.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Smart Watch</h3>
              <p class="text-center">100+ sports mode and 5km water resistent.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;20,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr10.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Sony Power Bank</h3>
              <p class="text-center">12,000 Mah backup support,Usb-type-c.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;1000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr11.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Hp Gaming Mouse</h3>
              <p class="text-center">Upto 1000+ click support and multimodes.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;1500 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <div class="card">
            <img src="./images/pr12.png" alt="">
            <div class="card-body">
              <h3 class="text-center">Joysticks</h3>
              <p class="text-center">360 deg crystal rotation with multi-game support.</p>
              <div class="star text-center">
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
                <i class="fa-solid fa-star checked"></i>
              </div>
              <h2>&#8377;12,000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- product cards -->









    <!-- offer -->
    <div class="container" id="offer">
      <div class="row">
        <div class="col-md-3 py-3 py-md-0">
          <i class="fa-solid fa-cart-shopping"></i>
          <h3>Free Shipping</h3>
          <p>On order over &#8377;10,000</p>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <i class="fa-solid fa-rotate-left"></i>
          <h3>Free Returns</h3>
          <p>Within 30 days</p>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <i class="fa-solid fa-truck"></i>
          <h3>Fast Delivery</h3>
          <p>World Wide</p>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <i class="fa-solid fa-thumbs-up"></i>
          <h3>Big choice</h3>
          <p>Of products</p>
        </div>
      </div>
    </div>
    <!-- offer -->





    
    <!-- newslater -->
    <div class="container" id="newslater">
      <h3 class="text-center">Subscribe To Electrosell For Latest update.</h3>
      <div class="input text-center">
        <input type="text" placeholder="Enter Your Email..">
        <button id="subscribe">SUBSCRIBE</button>
      </div>
    </div>
    <!-- newslater -->






     <%@ include file = "footer.jsp" %>

<a href="#" class="arrow"><i><img src="./images/arrow.png" alt=""></i></a>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script> 
   <script>
    let suggestions = [
    "Apple",
    "Apple laptop",
    "Apple mobile",
    "Apple ear buds",
    "Apple Mac book",
    "Apple iphone",
    "Apple smart watch",
    "Apple phone",
    "Refrifgerator",
    "Mobile",
    "Smart watch",
    "Earbuds",
    "Bluetooth headset",
    "Bluetooth speaker",
    "Bluetooth",
    "Watch",
    "Samsung",
    "Samsung Mobile",
    "Samsung M series",
    "Samasung A series",
    "Samsung watch",
    "Galaxy watch",
    "Galaxy mobile",
    "Sony ear pods",
    "Song bluetooth",
    "Poco",
    "Poco phone",
    "Redmi phone",
    "Realme watch",
    "Realme phone",
    "Oppo phone",
    "Oppo mobile",
    "Vivo mobile",
    "Pendrive",
    "Samsung pendrive",
    "Song pendrive",
    "Memory card",
    "64 gb memory card",
    "128 gb memory card",
    "512 gb memory card",
    "64 gb pendrive",
    "128 gb pendrive",
    "512 gb penderive",
    "32 gb pendrive",
    "16 gb pendrive",
    "8 gb pendrive"
];
const searchWrapper = document.querySelector(".search-input");
const inputBox = searchWrapper.querySelector("input");
const suggBox = searchWrapper.querySelector(".autocom-box");
const icon = searchWrapper.querySelector(".icon");
let linkTag = searchWrapper.querySelector("a");
let webLink;
// if user press any key and release
inputBox.onkeyup = (e)=>{
    let userData = e.target.value; //user enetered data
    let emptyArray = [];
    if(userData){
        icon.onclick = ()=>{
            webLink = `https://www.google.com/search?q=${userData}`;
            linkTag.setAttribute("href", webLink);
            linkTag.click();
        };
        emptyArray = suggestions.filter((data)=>{
            //filtering array value and user characters to lowercase and return only those words which are start with user enetered chars
            return data.toLocaleLowerCase().startsWith(userData.toLocaleLowerCase());
        });
        emptyArray = emptyArray.map((data)=>{
            // passing return data inside li tag
            return data = `<li>${data}</li>`;
        });
        searchWrapper.classList.add("active"); //show autocomplete box
        showSuggestions(emptyArray);
        let allList = suggBox.querySelectorAll("li");
        for (let i = 0; i < allList.length; i++) {
            //adding onclick attribute in all li tag
            allList[i].setAttribute("onclick", "select(this)");
        }
    }else{
        searchWrapper.classList.remove("active"); //hide autocomplete box
    }
};
function select(element){
    let selectData = element.textContent;
    inputBox.value = selectData;
    icon.onclick = ()=>{
        webLink = `https://www.google.com/search?q=${selectData}`;
        linkTag.setAttribute("href", webLink);
        linkTag.click();
    };
    searchWrapper.classList.remove("active");
}
function showSuggestions(list){
    let listData;
    if(!list.length){
        userValue = inputBox.value;
        listData = `<li>${userValue}</li>`;
    }else{
      listData = list.join('');
    }
    suggBox.innerHTML = listData;
}

window.onload=function(){

    help();
};
function help()
{
    var user_details={
    name:"rahulkrishna",
    len:11 
    };
    console.log(user_details);
 }
 
   </script>
  </body>
</html>