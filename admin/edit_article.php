<?php
    require_once 'db.php';
    $ma_bviet=$_GET['id'];
    $sql = "SELECT ma_bviet,tieude,ten_bhat,".'theloai.ten_tloai'.",tomtat,noidung,".'tacgia.ten_tgia'.",ngayviet,hinhanh FROM baiviet,tacgia,theloai where tacgia.ma_tgia=baiviet.ma_tgia and theloai.ma_tloai=baiviet.ma_tloai AND ma_bviet=$ma_bviet";
    $result = mysqli_query($conn, $sql);
    $row =mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music for Life</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/style_login.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Administration</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                <a class="nav-link" aria-current="page" href="./">Trang chủ</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="../index.php">Trang ngoài</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="category.php">Thể loại</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="author.php">Tác giả</a>
                </li>
                <li class="nav-item">
                <a class="nav-link active fw-bold" href="article.php">Bài viết</a>
                </li>
            </ul>
            </div>
        </div>
    </nav>

    <main class="container mt-5 mb-5">
        <!-- <h3 class="text-center text-uppercase mb-3 text-primary">CẢM NHẬN VỀ BÀI HÁT</h3> -->
        <div class="row">
            <div class="col-sm">
                <h3 class="text-center text-uppercase fw-bold">Sửa bài viết</h3>
                <form action="edit_article_process.php" method="post">
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblMaBaiViet">Mã bài viết</span>
                        <input type="text" class="form-control" name="txtMaBaiViet" readonly value="<?= $row['ma_bviet']?>">
                    </div>
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblTieuDe">Tiêu đề</span>
                        <input type="text" class="form-control" name="txtTieuDe" value="<?= $row['tieude']?>">
                    </div>
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblTenBaiHat">Tên bài hát</span>
                        <input type="text" class="form-control" name="txtBaiHat" value="<?= $row['ten_bhat']?>">
                    </div>
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblTenTheLoai">Tên thể loại</span>
                        <input type="text" class="form-control" name="txtTheLoai" value="<?= $row['ten_tloai']?>">
                    </div>
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblTomTat">Tóm tắt</span>
                        <input type="text" class="form-control" name="txtTomTat" value="<?= $row['tomtat']?>">
                    </div>
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblNoiDung">Nội dung</span>
                        <input type="text" class="form-control" name="txtNoiDung" value="<?= $row['noidung']?>">
                    </div>
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblTacGia">Tác giả</span>
                        <input type="text" class="form-control" name="txtTacGia" value="<?= $row['ten_tgia']?>">
                    </div>
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblNgayViet">Ngày viết</span>
                        <input type="text" class="form-control" name="txtNgayViet" value="<?= $row['ngayviet']?>">
                    </div>
                    <div class="input-group mt-3 mb-3">
                        <span class="input-group-text" id="lblHinhAnh">Hình ảnh</span>
                        <input type="text" class="form-control" name="txtHinhAnh" value="<?= $row['hinhanh']?>">
                    </div>

                    <div class="form-group  float-end ">
                        <input type="submit" value="Lưu" class="btn btn-success">
                        <a href="article.php" class="btn btn-warning ">Quay lại</a>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <footer class="bg-white d-flex justify-content-center align-items-center border-top border-secondary  border-2" style="height:80px">
        <h4 class="text-center text-uppercase fw-bold">TLU's music garden</h4>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>