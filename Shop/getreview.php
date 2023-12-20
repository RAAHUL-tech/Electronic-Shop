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
    $id = mysqli_real_escape_string($link, $_POST['pid']);

    $result = mysqli_query($link,"SELECT * FROM review where id='$id'");   ?>
<!DOCTYPE html>
<html>
 <head>
 <title> User-review</title>
 </head>
<body>
<?php
if (mysqli_num_rows($result) > 0) {
?>

    <table border="1">
  
  <tr>
    <td>Product id</td>
    <td>Reviewer name</td>
    <td>Star rating</td>
    <td>Comments</td>
  </tr>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
    <td><?php echo $row["id"]; ?></td>
    <td><?php echo $row["person_name"]; ?></td>
    <td><?php echo $row["star"]; ?></td>
    <td><?php echo $row["comments"]; ?></td>
</tr>
<?php
$i++;
}
?>
</table>
 <?php
}
else{
    echo "No result found";
}
?>
</body>
</html>


