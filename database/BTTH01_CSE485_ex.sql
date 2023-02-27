/*a. Liệt kê các bài viết về các bài hát thuộc thể loại Nhạc trữ tình (2 đ)*/
SELECT baiviet.tieude, baiviet.ten_bhat
FROM baiviet
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
WHERE theloai.ten_tloai = 'Nhạc trữ tình';

/*b. Liệt kê các bài viết của tác giả “Nhacvietplus” (2 đ)*/
SELECT baiviet.tieude, baiviet.ten_bhat
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
WHERE tacgia.ten_tgia = 'Nhacvietplus';

/*c. Liệt kê các thể loại nhạc chưa có bài viết cảm nhận nào. (2 đ)*/
SELECT theloai.ma_tloai, theloai.ten_tloai
FROM theloai
LEFT JOIN baiviet ON theloai.ma_tloai = baiviet.ma_tloai
WHERE baiviet.ma_bviet IS NULL;

/*d. Liệt kê các bài viết với các thông tin sau: mã bài viết, tên bài viết, tên bài hát, tên tác giả, tên 
thể loại, ngày viết. (2 đ)*/
SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, tacgia.ten_tgia, theloai.ten_tloai, baiviet.ngayviet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai;

/*e. Tìm thể loại có số bài viết nhiều nhất (2 đ)*/
SELECT theloai.ten_tloai, COUNT(*) AS so_bai_viet
FROM baiviet
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
GROUP BY theloai.ten_tloai
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
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
WHERE ten_bhat LIKE '%yêu%' OR ten_bhat LIKE '%thương%' OR ten_bhat LIKE '%anh%' OR ten_bhat LIKE '%em%';

/*h. Liệt kê các bài viết về các bài hát có tiêu đề bài viết hoặc tựa bài hát chứa 1 trong các từ 
“yêu”, “thương”, “anh”, “em” (2 đ)*/
SELECT ma_bviet, tieude, ten_bhat, ten_tgia, ten_tloai, ngayviet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
WHERE tieude LIKE '%yêu%' OR tieude LIKE '%thương%' OR tieude LIKE '%anh%' OR tieude LIKE '%em%' 
OR ten_bhat LIKE '%yêu%' OR ten_bhat LIKE '%thương%' OR ten_bhat LIKE '%anh%' OR ten_bhat LIKE '%em%';

/*i. Tạo 1 view có tên vw_Music để hiển thị thông tin về Danh sách các bài viết kèm theo Tên 
thể loại và tên tác giả (2 đ)*/
CREATE VIEW vw_Music AS
SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, theloai.ten_tloai, tacgia.ten_tgia
FROM baiviet
INNER JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
INNER JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia;

/*j. Tạo 1 thủ tục có tên sp_DSBaiViet với tham số truyền vào là Tên thể loại và trả về danh sách 
Bài viết của thể loại đó. Nếu thể loại không tồn tại thì hiển thị thông báo lỗi. (2 đ)*/
DELIMITER //

CREATE PROCEDURE sp_DSBaiViet(IN Category VARCHAR(150))
BEGIN
  DECLARE Category_id INT UNSIGNED;
  
  -- Kiểm tra xem thể loại có tồn tại trong bảng Thể loại không
  SELECT ma_tloai INTO Category_id FROM theloai WHERE ten_tloai = Category;
  IF Category_id IS NULL THEN
    SELECT 'Thể loại không tồn tại.' AS error_message;
  ELSE
    -- Nếu thể loại tồn tại, lấy danh sách bài viết của thể loại đó
    SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, baiviet.tmtat, baiviet.ngayviet, tacgia.ten_tgia
    FROM baiviet
    JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
    WHERE baiviet.ma_tloai = Category_id;
  END IF;
END//

DELIMITER ;

-- Đặt DELIMITER để phân biệt giữa các câu lệnh bên trong thủ tục.
-- Gọi thủ tục
CALL sp_DSBaiViet('Tên thể loại cần tìm');

/*k. Thêm mới cột SLBaiViet vào trong bảng theloai. Tạo 1 trigger có tên tg_CapNhatTheLoai để
khi thêm/sửa/xóa bài viết thì số lượng bài viết trong bảng theloai được cập nhật theo. (2 đ)*/
CREATE TRIGGER tg_CapNhatTheLoai AFTER INSERT, UPDATE, DELETE ON baiviet ()
FOR EACH ROW
BEGIN
    UPDATE theloai SET SLBaiViet = (
        SELECT COUNT(*) FROM baiviet WHERE ma_tloai = theloai.ma_tloai
    );
END;

CREATE TRIGGER tg_CapNhatTheLoai BEFORE INSERT ON baiviet
  FOR EACH ROW BEGIN
    INSERT INTO baiviet SET ma_bviet = NEW.ma_tloai
    DELETE FROM baiviet WHERE ma_bviet = NEW.ma_tloai
    UPDATE theloai SET SLBaiViet = SLBaiViet + 1 WHERE ma_bviet = NEW.ma_tloai
  END


CREATE TRIGGER tg_CapNhatTheLoai BEFORE INSERT ON baiviet
  FOR EACH ROW 
    UPDATE theloai SET SLBaiViet = SLBaiViet + 1 WHERE ma_tloai = NEW.ma_tloai;

/*l. Bổ sung thêm bảng Users để lưu thông tin Tài khoản đăng nhập và sử dụng cho chức năng 
Đăng nhập/Quản trị trang web. (5 đ)*/


USE `BTTH01_CSE485`;
ALTER TABLE theloai ADD SLBaiViet INT UNSIGNED NOT NULL;