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
    $product = mysqli_real_escape_string($link, $_POST['product']);
    $price = mysqli_real_escape_string($link, $_POST['product_price']);
    $discount = mysqli_real_escape_string($link, $_POST['discount']);
    $des = mysqli_real_escape_string($link, $_POST['des']);
    $addinfo = mysqli_real_escape_string($link, $_POST['add']);
    $imgData = $_FILES['img']['tmp_name'];
    $image= base64_encode(file_get_contents(addslashes($imgData)));
    // attempt insert query execution
    $sql = "INSERT INTO product_details (product_img, product_name, product_description, amount, discount) VALUES ('$image', '$product', '$des', '$price', '$discount')";

    if(mysqli_query($link, $sql)){
        echo "Records added successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }

    // close connection
    mysqli_close($link);
        ?>


