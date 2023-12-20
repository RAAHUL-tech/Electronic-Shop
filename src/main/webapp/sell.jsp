<%-- 
    Document   : sell
    Created on : 07-Mar-2023, 2:56:28 pm
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electrosell-Sell</title>
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
      width: 100px;
      height: 200px;
      display: flex;
      justify-content: center;
      align-items:flex-start;
  }
  .outeritem .item .inneritem{
      display: flex;
      flex-wrap:nowrap;
      padding: 10px 10px 0 10px;
      justify-content:space-around;
      align-items: stretch;
  }
  .outeritem .item .inneritem p{
      padding-right: 40px;
  }
  .outeritem .item .inneritem button{
      color: black;
      width: 60px;
  }
  .outeritem .item .inneritem button:hover{
      color: white;
      background: red;
  }
  .amount{
      padding: 20px;
      text-align: right;
      padding-right: 20px;
  }
  .amount button{
      color: white;
      background: green;
      padding: 5px;
      border-radius: 5px;
  }
  #form{
      text-align: center;
      padding: 10px;
  }
  #form form div{
      display: flex;
      justify-content:center;
      align-items: center;
      padding: 20px;
  }
  #form form div input{
      padding-left: 10px;
      color: black;
      background-color: white;
  }
  #form form div textarea{
      color: black;
  }
  #form form button{
      background-color: yellow;
      color: black;
      border-radius: 5px;
      width: 70px;
      text-align: center;
  }
    </style>
    <link rel="stylesheet" href="style.css">
    </head>
    <body>
         <%  String uname=(String)session.getAttribute("uname");  %>
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
              <li><a href="buy.jsp">Buy</a></li>
              <li><a href="sell.jsp">Sell<span class="sr-only">(current)</span></a></li>
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
      <div id="form">
          <label style="text-decoration: underline;color: yellow;">Product Info</label>
          <form action="addoldproduct" method="post" enctype="multipart/form-data">
              <div>
              Product Name:
              <input type="text" placeholder="Product Name" name="product" required><br>
              </div>
              <div>
              Actual Product Price:
              <input type="number" placeholder="Product Actual Price" name="product_price1" required><br>
              </div>
              <div>
              Current Price:
              <input type="number" placeholder="Current Price" name="product_price2" required><br>
              </div>
              <div>
              Product Description:
              <textarea rows="4" cols="20" placeholder="Product description" name="des" required></textarea><br>
              </div>
              <div>
              Additional Information:
              <textarea rows="4" cols="20" placeholder="Additional information" name="add" required></textarea><br>
              </div>
              <div>
              Upload image:
              <input type="file" name="img" required>
              </div>
              <button type="submit">Submit<button>
          </form>           
      </div>
           <br><br><br><br><hr/><br><br><br><br>
       <div id="form">
          <label style="text-decoration: underline;color: yellow;">Remove Product</label>
          <form action="removeoldproduct" method="post" enctype="multipart/form-data">
              <div>
             User Name:
              <input type="text" placeholder="User Name" name="uname" required><br>
              </div>
              <div>
              Product Name:
              <input type="text" placeholder="Product Name" name="product_name" required><br>
              </div>
              <button type="submit">Submit<button>
          </form>           
      </div>
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
 
   </script>
    </body>
</html>
