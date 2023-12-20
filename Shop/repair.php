<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHPWebPage.php to edit this template
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Repair</title>
        <style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
  
  margin: 20px;
  text-align: center
}
th,td {
  padding: 35px;
  font-size: 18px;
}
td:first-child
{
  color: #eegfff;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
font-weight: bolder;
}
#form1{
    text-align: center;
    visibility: hidden;
}
</style>

    </head>
    <body>
        <h3>Repairs offered :</h3>

        <table id="demo"></table>
        
            <h3>Apply for repair:</h3>
            Repair type:
            <select name="type" id="type">
                <option value="null" selected>Not Selected</option>      
                <option value="type1">Full-fledged repair</option>
                <option value="type2">Screen repair</option>
                <option value="type3">Data Recovery</option>
            </select>
            <button type="submit" onclick="func1()">Check if available</button>
        <h5 id="status"></h5>
        <form action="addrepair.php" method="post" id="form1">
            Name :
            <input type="text" name="name" required><br><br>
            Repair type:
            <select name="type" id="type">
                <option value="null" selected>Not Selected</option>
                <option value="type1">Full-fledged repair</option>
                <option value="type2">Screen repair</option>
                <option value="type3">Data Recovery</option>
                <option value="type4">Tempered glass change</option>
            </select><br><br>
            Brand :
            <input type="text" name="brand" required><br><br>
            Model :
            <input type="text" name="model" required><br><br>
            Any additional problem :
            <textarea rows="3" cols="10" name="add"></textarea><br><br>
            <button type="submit">Register</button>
        </form>
        <?php
          
        ?>
        <script>

 window.onload= function () {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      myFunction(this);
    }
  };
  xhttp.open("GET", "repair_price.xml", true);
  xhttp.send();
};
function myFunction(xml) {
  var i;
  var xmlDoc = xml.responseXML;
  var table="<tr><th>NAME</th><th>BRAND</th><th>MODEL</th><th>PRICE</th><th>DURATION</th><th>SUBTOTAL</th></tr>";
  var x = xmlDoc.getElementsByTagName("type");
  for (i = 0; i <x.length; i++) { 
    table += "<tr><td>" +
    x[i].getElementsByTagName("name")[0].childNodes[0].nodeValue +
    "</td><td>" +
    x[i].getElementsByTagName("brand")[0].childNodes[0].nodeValue +
    "</td><td>" +
      x[i].getElementsByTagName("model")[0].childNodes[0].nodeValue +
    "</td><td>" +
    x[i].getElementsByTagName("price")[0].childNodes[0].nodeValue +
    "</td><td>"  +
      x[i].getElementsByTagName("duration")[0].childNodes[0].nodeValue +
    "</td><td>" +
    x[i].getElementsByTagName("subtotal")[0].childNodes[0].nodeValue +
    "</td></tr>";
   
  }
  document.getElementById("demo").innerHTML = table;
}

function func1()
{
    var type= document.getElementById("type").value;
    var status=document.getElementById("status");
    var form=document.getElementById("form1");
    form.style.visibility = 'hidden';
    status.innerHTML="";
    if(type === "type3")
    {
        alert("Sorry currently this service is not available!");
    }
    else {
        status.innerHTML="Hurray!! service currently available!";
        form.style.visibility = 'visible';
    }
}
    

</script>

    </body>
</html>
