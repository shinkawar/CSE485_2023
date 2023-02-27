<?php
require_once 'db.php';
$ma_bviet=$_GET['id']; 
$xoa_baiviet="DELETE FROM baiviet WHERE ma_bviet=$ma_bviet";
mysqli_query($conn,$xoa_baiviet);

header("Location: article.php")
?>