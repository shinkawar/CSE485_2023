<?php
//thien
//$servername = "localhost";
//thang
$servername = "127.0.0.1:4306";
$username = "root";
$password = "";

// Create connection
$conn = mysqli_connect($servername, $username, $password, 'btth01_cse485');
mysqli_query($conn, "SET NAMES 'utf8'");
    if(!$conn){
        echo "Connect failed";
    }