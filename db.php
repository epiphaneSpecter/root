<?php

$username = "root";
$password = "root";

try {
    $db = new PDO('mysql:host=localhost;dbname=root', $username, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // var_dump($db->errorInfo());

} catch (PDOException $error){
   echo "OUllaaaa " . $error->getMessage();
   die();
}