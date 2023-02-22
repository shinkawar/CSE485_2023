/*a. Liệt kê các bài viết về các bài hát thuộc thể loại Nhạc trữ tình (2 đ)*/
SELECT baiviet.tieude, baiviet.ten_bhat
FROM baiviet
JOIN tenloai ON baiviet.ma_tloai = tenloai.ma_tloai
WHERE tenloai.ten_tloai = 'Nhạc trữ tình';

/*b. Liệt kê các bài viết của tác giả “Nhacvietplus” (2 đ)*/
SELECT baiviet.tieude, baiviet.ten_bhat
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
WHERE tacgia.ten_tgia = 'Nhacvietplus';

/*c. Liệt kê các thể loại nhạc chưa có bài viết cảm nhận nào. (2 đ)*/
SELECT tenloai.ma_tloai, tenloai.ten_tloai
FROM tenloai
LEFT JOIN baiviet ON tenloai.ma_tloai = baiviet.ma_tloai
WHERE baiviet.ma_bviet IS NULL;

/*d. Liệt kê các bài viết với các thông tin sau: mã bài viết, tên bài viết, tên bài hát, tên tác giả, tên 
thể loại, ngày viết. (2 đ)*/
SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, tacgia.ten_tgia, tenloai.ten_tloai, baiviet.ngayviet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
JOIN tenloai ON baiviet.ma_tloai = tenloai.ma_tloai;

/*e. Tìm thể loại có số bài viết nhiều nhất (2 đ)*/
SELECT tenloai.ten_tloai, COUNT(*) AS so_bai_viet
FROM baiviet
JOIN tenloai ON baiviet.ma_tloai = tenloai.ma_tloai
GROUP BY tenloai.ten_tloai
ORDER BY so_bai_viet DESC
LIMIT 1;

/*f. Liệt kê 2 tác giả có số bài viết nhiều nhất (2 đ*/
SELECT tacgia.ten_tgia, COUNT(*) AS so_bai_viet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
GROUP BY tacgia.ten_tgia
ORDER BY so_bai_viet DESC
LIMIT 2;

/*g. Liệt kê các bài viết về các bài hát có tựa bài hát chứa 1 trong các từ “yêu”, “thương”, “anh”, 
“em” (2 đ)*/
SELECT ma_bviet, tieude, ten_bhat, ten_tgia, ten_tloai, ngayviet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
JOIN tenloai ON baiviet.ma_tloai = tenloai.ma_tloai
WHERE ten_bhat LIKE '%yêu%' OR ten_bhat LIKE '%thương%' OR ten_bhat LIKE '%anh%' OR ten_bhat LIKE '%em%';

/*h. Liệt kê các bài viết về các bài hát có tiêu đề bài viết hoặc tựa bài hát chứa 1 trong các từ 
“yêu”, “thương”, “anh”, “em” (2 đ)*/
SELECT ma_bviet, tieude, ten_bhat, ten_tgia, ten_tloai, ngayviet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
JOIN tenloai ON baiviet.ma_tloai = tenloai.ma_tloai
WHERE tieude LIKE '%yêu%' OR tieude LIKE '%thương%' OR tieude LIKE '%anh%' OR tieude LIKE '%em%' 
OR ten_bhat LIKE '%yêu%' OR ten_bhat LIKE '%thương%' OR ten_bhat LIKE '%anh%' OR ten_bhat LIKE '%em%';

/*i. Tạo 1 view có tên vw_Music để hiển thị thông tin về Danh sách các bài viết kèm theo Tên 
thể loại và tên tác giả (2 đ)*/
CREATE VIEW vw_Music AS
SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, tenloai.ten_tloai, tacgia.ten_tgia
FROM baiviet
INNER JOIN tenloai ON baiviet.ma_tloai = tenloai.ma_tloai
INNER JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia;

/*j. Tạo 1 thủ tục có tên sp_DSBaiViet với tham số truyền vào là Tên thể loại và trả về danh sách 
Bài viết của thể loại đó. Nếu thể loại không tồn tại thì hiển thị thông báo lỗi. (2 đ)*/

