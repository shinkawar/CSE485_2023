<?php
    require_once 'db.php';
    $ma_bviet=$_POST['txtMaBaiViet'];
    $tieude=$_POST['txtTieuDe'];
    $baihat=$_POST['txtBaiHat'];
    $theloai=$_POST['txtTheLoai'];
    $tomtat=$_POST['txtTomTat'];
    $noidung=$_POST['txtNoiDung'];
    $tacgia=$_POST['txtTacGia'];
    $ngayviet = date("Y-m-d H:i:s");
    $hinhanh=$_POST['txtHinhAnh'];
    
    $sql_check_ma_tloai = "SELECT ma_tloai FROM theloai WHERE ten_tloai = '$theloai'";
    $result_ma_tloai = mysqli_query($conn, $sql_check_ma_tloai);
    if (mysqli_num_rows($result_ma_tloai) > 0) {
        $ma_tloai = mysqli_fetch_assoc($result_ma_tloai);
        $theloai = $ma_tloai['ma_tloai'];
      } else {
        echo("Không tìm thấy thể loại có tên '$theloai'");
      }

    $sql_check_ma_tgia = "SELECT ma_tgia FROM tacgia WHERE ten_tgia = '$tacgia'";
    $result_ma_tgia = mysqli_query($conn, $sql_check_ma_tgia);
    if (mysqli_num_rows($result_ma_tgia) > 0) {
        $ma_tgia = mysqli_fetch_assoc($result_ma_tgia);
        $tacgia = $ma_tgia['ma_tgia'];
        echo("Sửa thành công");
      } else {
        echo("Không tìm thấy thể loại có tên '$tacgia'");
      }
    $update_baiViet_sql="UPDATE baiviet SET tieude='$tieude',ten_bhat='$baihat',ma_tloai='$theloai',tomtat='$tomtat',noidung='$noidung'
    ,ma_tgia='$tacgia',ngayviet='$ngayviet',hinhanh='$hinhanh' WHERE ma_bviet='$ma_bviet'";
    mysqli_query($conn, $update_baiViet_sql);
?>
