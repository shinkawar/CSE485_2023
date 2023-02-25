CREATE DATABASE IF NOT EXISTS `BTTH01_CSE485` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;

USE `BTTH01_CSE485`;


CREATE TABLE IF NOT EXISTS `tacgia` (
  `ma_tgia` int unsigned NOT NULL,
  `ten_tgia`varchar(50) CHARACTER SET utf8 NOT NULL,
  `hinh_tgia` varchar(100) NULL,
  PRIMARY KEY (`ma_tgia`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

INSERT INTO `tacgia` (`ma_tgia`, `ten_tgia`, `hinh_tgia`) VALUES 
(1, 'Nhacvietplus', NULL),
(2, 'Sưu tầm', NULL),
(3, 'Sandy', NULL),
(4, 'Lê Trung Ngân', NULL),
(5, 'Khánh Ngọc', NULL),
(6, 'Night Stalker', NULL),
(7, 'Phạm Phương Anh', NULL),
(8, 'Tâm tình', NULL);


CREATE TABLE baiviet (
  `ma_bviet` int unsigned NOT NULL,
  `tieude` varchar(300) CHARACTER SET utf8 NOT NULL,
  `ten_bhat` varchar(300) CHARACTER SET utf8 NOT NULL,
  `ma_tloai` int unsigned NOT NULL,
  `tomtat` longtext CHARACTER SET utf8 NOT NULL,
  `noidung`  longtext CHARACTER SET utf8 NULL,
  `ma_tgia` INT UNSIGNED NOT NULL,
  `ngayviet` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hinhanh` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`ma_bviet`),
  FOREIGN KEY (`ma_tloai`) REFERENCES theloai(ma_tloai),
  FOREIGN KEY (`ma_tgia`) REFERENCES tacgia(ma_tgia)
)ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

INSERT INTO `baiviet` (`ma_bviet`,`tieude`,`ten_bhat`,`ma_tloai`,`tomtat`,`noidung` , `ma_tgia` ,`ngayviet` ,`hinhanh`) VALUES 
(1, 'Lòng mẹ', 'Lòng mẹ',2, 'Và mẹ ơi đừng khóc nhé! Cả đời này mẹ đã khóc nhiều lắm rồi, hãy cười lên vì con đã trưởng thành! Con sẽ lại về dậy sớm nấu cơm cho mẹ, nấu nước cho mẹ tắm như ngày xưa. Dù cho vai nắng nhưng lòng thương chẳng nhạt màu, vẫn mơ quay về vui vầy dưới bóng mẹ yêu',NULL, 1, '2012/7/23',NULL),
(2, 'Cảm ơn em đã rời xa anh' , 'Vết mưa',2, 'Cảm ơn em đã cho anh những tháng ngày hạnh phúc, cho anh biết yêu và được yêu. Em cho anh được nếm trải hương vị ngọt ngào của tình yêu nhưng cũng đầy đau khổ và nước mắt. Những tháng ngày đó có lẽ suốt cuộc đời anh không bao giờ quên', NULL, 3, '2012/2/12', NULL),
(3,'Cuộc đời có mấy ngày mai?', 'Phôi pha', 2, 'Đêm nay, trời quang mây tạnh, trong người nghe hoang vắng và tôi ngồi đây Ôm lòng đêm, Nhìn vầng trăng mới về mà ngậm ngùi Nhớ chân giang hồ. Ôi phù du, từng tuổi xuân đã già',NULL, 4, '2014/3/13', NULL),
(4, 'Quê tôi!', 'Quê hương', 5,'Quê hương là gì mà chở đầy kí ức nhỏ xinh. Có đám trẻ nô đùa bên nhau dưới gốc ổi nhà bà Năm giữa trưa nắng gắt chỉ để chờ bà đi vắng là hái trộm. Có hai anh em tôi bì bõm lội sình bắt cua đem về nhà cho mẹ nấu canh, nấu cháo… Có ba chị em tôi lục đục tự nấu ăn khi mẹ vắng nhà. Có anh tôi luôn dắt tôi đi cùng đường ngõ xóm chỉ để em được vui. Có cả những trận cãi nhau nảy lửa của ba anh em nữa…', NULL, 5, '014/2/20',NULL),
(5, 'Đất nước', 'Đất nước', 5,'Đã bao nhiêu lần tôi tự hỏi: liệu trên Thế giới này có nơi nào chiến tranh tang thương mà lại rất đổi anh hùng như nước mình không? Liệu có mảnh đất nào mà mỗi tấc đất hôm nay đã thấm máu xương của những thế hệ đi trước nhiều như nước mình không? Và, liệu có một đất nước nào lại có nhiều bà mẹ đau khổ nhưng cũng hết sức gan góc như đất nước mình không?',NULL ,1, '2010/5/25', NULL),
(6, 'Hard Rock Hallelujah', 'Hard Rock Hallelujah', 7, 'Những linh hồn đang lạc lối, mù quáng mất phương hướng trong cõi trần gian đầy nghiệt ngã hãy nên lắng nghe \"Hard Rock Hallelujah\" để có thể quên tất cả mọi thứ để tìm về đúng bản chất sâu thẳm nhất trong tâm hồn chính mình!',NULL, 6, '2013/9/12',NULL),
(7, 'The Unforgiven', 'The Unforgiven', 7, 'Lâu lắm rồi mới nghe lại The Unforgiven II, vì bài này không phải là bài mà tôi thích. Anh bạn tôi lúc trước, đi đâu cũng nghêu ngao bài này ấy, chỉ tại vì hắn đang... thất tình mà lị. Mà sao Metallica có The Unforgiven rồi lại có thêm bài này chi nữa vậy không biết nữa, làm cho tôi cảm thấy hình như hơi bị đúng so với tâm trạng của tôi lúc này.',NULL, 1, '2010/5/25',NULL),
(8, 'Nơi tình yêu bắt đầu', 'Nơi tình yêu bắt đầu', 1, 'Nhiều người sẽ nghĩ làm gì có yêu nhất và làm gì có yêu mãi. Ừ! Chẳng có gì là mãi mãi cả, vì chúng ta không trường tồn vĩnh cửu',NULL, 1, '2014/2/3',NULL),
(9, 'Love Me Like There’s No Tomorrow', 'Love Me Like There’s No Tomorrow', 8, 'Nếu ai đã từng yêu Queen, yêu cái chất giọng cao, sắc sảo như một vết cắt thật ngọt ẩn giấu bao cảm xúc mãnh liệt của Freddie chắc không thể không \"điêu đứng\" mỗi khi nghe Love Me Like There’s No Tomorrow.',NULL, 1, '2013/2/26',NULL),
(10, 'I am stronger', 'I am stronger', 7, 'Em không phải là người giỏi giấu cảm xúc, nhưng em lại là người giỏi đoán biết cảm xúc của người khác vậy nên đừng cố nói nhớ em, rằng mọi thứ chỉ là do hoàn cảnh. Và cũng đừng dối em rằng anh đã từng yêu em. Em nhắm mắt cũng cảm nhận được mà, thật đấy',NULL, 2, '2013/8/21',NULL),
(11, 'Ôi Cuộc Sống Mến Thương', 'Ôi Cuộc Sống Mến Thương', 5, 'ó một câu nói như thế này Âm nhạc là một cái gì khác lạ mà hầu như tôi muốn nói nó là một phép thần diệu.Vì nó đứng giữa tư tưởng và hiện tượng, tinh thần và vật chất, mọi thứ trung gian mơ hồ thế đó mà không là thế đó giữa các sự vật mà âm nhạc hòa giải', NULL, 2, '2011/10/9', NULL),
(12, 'Cây và gió', 'Cây và gió', 7, 'Em và anh, hai đứa quen nhau thật tình cờ. Lời hát của anh từ bài hát “Cây và gió” đã làm tâm hồn em xao động. Nhưng sự thật phũ phàng rằng em chưa bao giờ nói cho anh biết những suy nghĩ tận sâu trong tim mình. Bởi vì em nhút nhát, em không dám đối mặt với thực tế khắc nghiệt, hay thực ra em không dám đối diện với chính mình.', NULL, 7, '2013/12/5', NULL),
(13, 'Như một cách tạ ơn đời', 'Người thầy', 2,'Ánh nắng cuối ngày rồi cũng sẽ tắt, dòng sông con đò rồi cũng sẽ rẽ sang một hướng khác. Nhưng việc trồng người luôn cảm thụ với chuyến đò ngang, cứ tần tảo đưa rồi lặng lẽ quay về đưa sang. Con đò năm xưa của Thầy nặng trĩu yêu thương, hy sinh thầm lặng.', NUll, 8, '2014/1/2', NULL);

CREATE TABLE theloai (
  `ma_tloai` INT UNSIGNED NOT NULL,
  `ten_tloai` varchar(300) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ma_tloai`)
)ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

INSERT INTO `theloai` (`ma_tloai` ,`ten_tloai`) VALUES 
(1, 'Nhạc trẻ'),
(2, 'Nhạc trữ tình'),
(3, 'Nhạc cách mạng'),
(4, 'Nhạc thiếu nhi'),
(5, 'Nhạc quê hương'),
(6, 'POP'),
(7, 'Rock'),
(8, 'R&B');

CREATE TABLE users (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `hoten` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
/*  `gioitinh` int(11) NOT NULL,
  `avatar` varchar(50) COLLATE utf8_vietnamese_ci NULL,
  `avatar` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT 'upload/images-avatar/avatar_default.jpg', */
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;


INSERT INTO `users` (`id` ,`username`, `password`, `hoten`) VALUES 
(01, 'nguyenthang', 'thang123', 'Nguyễn Bá Thắng'),
(02, 'phamthien', 'thien123', 'Phạm Đình Thiên'),
(03, 'vutam', 'tam123', 'Vũ Đức Tâm');
