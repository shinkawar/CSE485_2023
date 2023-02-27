<?php
    require_once 'db.php';
    $ma_tloai=$_GET['id']; 
    $xoa_tloai="DELETE FROM theloai WHERE ma_tloai=$ma_tloai";
    mysqli_query($conn,$xoa_tloai);
    header("Location: category.php")
?>