<?php
    require_once 'db.php';
    $sql = "SELECT ma_bviet,tieude,ten_bhat,".'theloai.ten_tloai'.",tomtat,noidung,".'tacgia.ten_tgia'.",ngayviet,hinhanh FROM baiviet,tacgia,theloai where tacgia.ma_tgia=baiviet.ma_tgia and theloai.ma_tloai=baiviet.ma_tloai ORDER BY ngayviet DESC";
    $result = mysqli_query($conn, $sql);
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
                <a href="add_article.php" class="btn btn-success">Thêm mới</a>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Tiêu đề</th>
                            <th scope="col">Tên bài hát</th>
                            <th class="col-sm-1" scope="col">Tên thể loại</th>
                            <th scope="col">Tóm tắt</th>
                            <th class="col-sm-1" scope="col">Nội dung</th>
                            <th scope="col">Tác giả</th>
                            <th class="col-sm-1" scope="col">Ngày Viết</th>
                            <th class="col-sm-1" scope="col">Hình ảnh</th>
                            <th class="col-sm-1">Sửa</th>
                            <th class="col-sm-1">Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $count =0;
                            if(mysqli_num_rows($result) > 0){
                                while($row = mysqli_fetch_assoc($result)){
                                    $count ++;
                        ?>
                        <tr>
                            <td><?= $count?></td>
                            <td><?= $row['tieude']?></td>
                            
                            <td><?= $row['ten_bhat']?></td>
                            <td><?= $row['ten_tloai']?></td>
                            <td><?= $row['tomtat']?></td>
                            <td><?= $row['noidung']?></td>
                            <td><?= $row['ten_tgia']?></td>
                            <td><?= $row['ngayviet']?></td>
                            <td><?= $row['hinhanh']?></td>
                            <td>
                                <a href="edit_article.php?id=<?= $row['ma_bviet']?>"><i class="fa-solid fa-pen-to-square"></i></a>
                            </td>
                            <td>
                                <a href="delete_article_process.php?id=<?= $row['ma_bviet']?>" onclick="return confirm('Xác nhận xóa?');"><i class="fa-solid fa-trash"></i></a>
                            </td>
                        </tr>
                       
                        <?php
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <footer class="bg-white d-flex justify-content-center align-items-center border-top border-secondary  border-2" style="height:80px">
        <h4 class="text-center text-uppercase fw-bold">TLU's music garden</h4>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>