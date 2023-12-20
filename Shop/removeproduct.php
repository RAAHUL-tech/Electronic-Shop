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
    $uname = mysqli_real_escape_string($link, $_POST['uname']);
    $pname = mysqli_real_escape_string($link, $_POST['product_name']);

    // attempt insert query execution
    $sql = "delete from product_details where product_name= '$pname'";

    if(mysqli_query($link, $sql)){
        echo "Records deleted successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }

    // close connection
    mysqli_close($link);
        ?>


