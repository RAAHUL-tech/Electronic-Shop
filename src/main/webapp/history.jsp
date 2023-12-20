<%-- 
    Document   : history
    Created on : 06-Mar-2023, 8:56:42 pm
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My history</title>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.PreparedStatement"%>
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
     <link rel="stylesheet" href="style.css">
    </head>
    <body>
         <%  String uname=(String)session.getAttribute("uname");%>
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
                    
         <div id='estatement'>
               <h3>Your History</h3>
               <%
                   try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
                   PreparedStatement stmt=con.prepareStatement("select * from history where uname=?");
                   stmt.setString(1, uname);
                   ResultSet rs=stmt.executeQuery();
                   %>
                   <table border='2'>
                       <tr>
                           <th>Username</th>
                           <th>Session id</th>
                           <th>Login Time</th>
                           <th>Logout Time</th>
                       </tr>
                       <% while(rs.next()){ %>
                       <tr>
                           <td><%=rs.getString(1)%></td>
                           <td><%=rs.getString(2)%></td>
                           <td><%=rs.getString(3)%></td>
                           <td><%=rs.getString(4)%></td>
                       </tr>
                       <%} %>
                   </table>
           </div>  
                       <%  }
catch(Exception e)
{
e.printStackTrace();
}
%>        
                    
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
 
   </script>
    </body>
</html>
