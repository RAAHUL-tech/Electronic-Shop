<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */
$link = mysqli_connect("localhost", "root", "", "shop");

    // Check connection

    if($link === false){
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }

    // Escape user inputs for security
    $name = mysqli_real_escape_string($link, $_POST['name']);
    $type = mysqli_real_escape_string($link, $_POST['type']);
    $brand = mysqli_real_escape_string($link, $_POST['brand']);
    $model = mysqli_real_escape_string($link, $_POST['model']);
    $add = mysqli_real_escape_string($link, $_POST['add']);
    // attempt insert query execution
    $sql = "INSERT INTO repair (name,type,brand,model,addinfo) VALUES ('$name', '$type', '$brand', '$model', '$add')";

    if(mysqli_query($link, $sql)){
        echo "Repair order placed!!";
        
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }

    // close connection
    mysqli_close($link);
?>


