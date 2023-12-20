<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */
$xml1= simplexml_load_file('repair_price.xml');
$type1=$xml1->addChild('type');
$type1->addChild('name', $_POST['rname']);
$type1->addChild('brand', $_POST['models']);
$type1->addChild('model', $_POST['brands']);
$type1->addChild('price', $_POST['price']);
$type1->addChild('duration', $_POST['dur']);
$type1->addChild('subtotal', $_POST['stot']);
file_put_contents('repair_price.xml', $xml1->asXML());
echo 'Records inserted successfully!!';
?>

