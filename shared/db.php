<?php

$username = "root";
$password = "root";

try {
    $db = new PDO('mysql:host=localhost;dbname=root', $username, $password);

} catch (PDOException $error){
   echo "Oulala " . $error->getMessage();
   die();
}