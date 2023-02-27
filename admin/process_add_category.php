<?php
    require_once 'db.php';
    $matheloai=$_POST['txtMatheloai'];
    $tentheloai=$_POST['txtTentheloai'];
    $add_tloai="INSERT INTO theloai(ma_tloai,ten_tloai) VALUES('$matheloai','$tentheloai')";
    mysqli_query($conn, $add_tloai);
    header("Location: category.php")
?>