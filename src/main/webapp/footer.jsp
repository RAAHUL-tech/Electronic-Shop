<%-- 
    Document   : footer
    Created on : 06-Mar-2023, 6:24:27 pm
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    </style>
    </head>
    <body>
        <!-- footer -->
    <footer id="footer">
      <div class="footer-top">
        <div class="container">
          <div class="row">

            <div class="col-lg-3 col-md-6 footer-contact">
              <h3>Electronic Shop</h3>
              <p>
                Pondycherry <br>
                Chennai <br>
                India <br>
              </p>
              <strong>Phone:</strong> +91-9489514933 <br>
              <strong>Email:</strong> electrosell@gmail.com <br>
            </div>

            <div class="col-lg-3 col-md-6 footer-links">
              <h4>Usefull Links</h4>
             <ul>
              <li><a href="#">Home</a></li>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Services</a></li>
              <li><a href="#">Terms of service</a></li>
              <li><a href="#">Privacy policy</a></li>
             </ul>
            </div>



           

            <div class="col-lg-3 col-md-6 footer-links">
              <h4>Our Services</h4>

             <ul>
              <li><a href="#">PS 5</a></li>
              <li><a href="#">Computer</a></li>
              <li><a href="#">Gaming Laptop</a></li>
              <li><a href="#">Mobile Phone</a></li>
              <li><a href="#">Gaming Gadget</a></li>
             </ul>
            </div>

            <div class="col-lg-3 col-md-6 footer-links">
              <h4>Our Social Networks</h4>
              <p>Subscribe to our social media accounts to get latest update and discounts!</p>

              <div class="socail-links mt-3">
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-skype"></i></a>
                <a href="#"><i class="fa-brands fa-linkedin"></i></a>
              </div>
            
            </div>

          </div>
        </div>
      </div>
      <hr>
      <div class="container py-4">
        <div class="copyright">
          &copy; Copyright <strong><span>Electrosell</span></strong>. All Rights Reserved
        </div>
      </div>
    </footer>
    <!-- footer -->
    </body>
</html>
