<?php
//thien
//$servername = "localhost";
//thang
$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$conn = mysqli_connect($servername, $username, $password, 'btth01_cse485');
mysqli_query($conn, "SET NAMES 'utf8'");
if (!$conn) {
    echo "Connect failed";
}
