<?php
    session_start();
    if(isset($_POST['btnLogin'])){
        // Lay tu FORM
        $user = $_POST['txtUser'];
        $pass = $_POST['txtPass'];

        //Kết nối tới cơ sở dữ liệu
        require_once 'db.php';

        // Tạo truy vấn kiểm tra tài khoản và mật khẩu
        $sql = "SELECT * FROM USERS WHERE username='$user'";
        $result = mysqli_query($conn,$sql);
       
        // Kiểm tra kết quả truy vấn
        if (mysqli_num_rows($result) > 0) {
            // Lấy thông tin người dùng từ cơ sở dữ liệu
            $users = mysqli_fetch_assoc($result);
            // Kiểm tra mật khẩu
            if ($pass == $users['password']){
                // Lưu thông tin người dùng vào session
                $_SESSION['user'] = $users;
                // Chuyển hướng đến trang index.php
                header('Location: index.php');
                exit;
            }  else {
                // Hiển thị thông báo lỗi đăng nhập
                echo "Tài khoản hoặc mật khẩu không chính xác";
            }
        } else {
            // Hiển thị thông báo lỗi đăng nhập
            echo "Tài khoản hoặc mật khẩu không chính xác";
        }
    }
?>