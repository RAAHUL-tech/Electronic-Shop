<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */
$link = mysqli_connect("localhost", "root", "", "shop");

    if($link === false){
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }

    // attempt insert query execution
    $sql = "Select product_img from product_details where id='".$_GET['id']."'";

    $datafromDb= mysqli_query($link, $sql);
    $image;
    while($row= mysqli_fetch_assoc($datafromDb))
    {
        $image=$row['product_img'];
    }
    mysqli_close($link);
header("Content-Type: image/png");
fpassthru($image);
exit;
?>

