-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 26, 2024 lúc 07:32 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Tên danh mục, vd: đồ điện tử'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'nam'),
(2, 'nữ'),
(5, 'áo khoác nam'),
(9, 'đầm'),
(10, 'áo thun nữ'),
(11, 'áo polo nam'),
(12, 'áo sơ mi nữ'),
(13, 'áo len nữ'),
(14, 'áo khoác nữ'),
(19, 'áo thun nam'),
(20, 'áo sơ mi nam'),
(21, 'áo len nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(200) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `active`) VALUES
(2, 2, 'Nguyen Duy Quang', 'example@gmail.com', '01122983', '211 Khuong Trung', 'hang de vo xin nhe tay', '2024-11-16 00:00:00', 'pending', 811.22, 'cod', '211 Khuong Trung', '2024-11-20', NULL, 'cash', 1),
(3, 2, 'Nguyen Duy Quang', 'example@gmail.com', '01122983', '211 Khuong Trung', 'hang de vo xin nhe tay', '2024-11-16 00:00:00', 'pending', 811.22, 'cod', '211 Khuong Trung', '2024-11-20', NULL, 'cash', 1),
(4, 2, 'Nguyen Duy Quang', 'example@gmail.com', '01122983', '211 Khuong Trung', 'hang de vo xin nhe tay', '2024-11-16 00:00:00', 'pending', 44337500, 'cod', '211 Khuong Trung', '2024-11-20', NULL, 'cash', 1),
(5, 2, 'Nguyen Duy Quang', 'example@gmail.com', '01122983', '211 Khuong Trung', 'hang de vo xin nhe tay', '2024-11-16 00:00:00', 'pending', 44337500, 'cod', '211 Khuong Trung', '2024-11-20', NULL, 'cash', 1),
(6, 2, 'Nguyen Duy Quang', 'example@gmail.com', '01122983', '211 Khuong Trung', 'hang de vo xin nhe tay', '2024-11-16 00:00:00', 'pending', 44337500, 'cod', '211 Khuong Trung', '2024-11-20', NULL, 'cash', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL CHECK (`price` >= 0),
  `number_of_products` int(11) DEFAULT NULL CHECK (`number_of_products` > 0),
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `color` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(350) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` float NOT NULL CHECK (`price` >= 0),
  `thumbnail` varchar(300) DEFAULT '',
  `description` longtext DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Áo sơ mi lụa cổ đổ Lucille', 950000, NULL, 'Công sở hiện đại không còn chỉ gói gọn trong những bộ trang phục nghiêm túc có đôi phần cứng nhắc, bởi giờ đây, phái đẹp không chỉ đẹp trong những dịp đặc biệt mà còn chỉn chu và tinh tế mỗi ngày khi đến văn phòng!', NULL, NULL, 12),
(2, 'Áo sơ mi Tuysi Drop Waist', 1290000, NULL, 'Chiếc áo sơ mi kết hợp hoàn hảo giữa phong cách thanh lịch và tinh tế, phù hợp cho nàng tại môi trường công sở hay những buổi gặp gỡ trang trọng.Chất liệu Tuysi cao cấp mang đến cảm giác mềm mại, co giãn nhẹ, giúp áo vừa vặn, thoải mái khi mặc. Thiết kế ôm cơ thể bên cạnh chi tiết chiết eo đã tôn lên đường cong, tạo cảm giác gọn gàng, thanh mảnh.Cổ đức chỉn chu, sang trọng. Tay áo dài lịch sự. Chiếc áo sơ mi này dễ dàng kết hợp với quần tây, chân váy bút chì hoặc các kiểu váy công sở khác để người mặc luôn tỏa sáng trong mọi dịp.', NULL, NULL, 12),
(3, 'Áo sơ mi SAPPHIRE Cotton', 1150000, NULL, 'Thiết kế nằm trong BST SAPPHIRE CHIC, lấy cảm hứng từ sắc xanh quý phái của đá Sapphire với những thiết kế công sở hiện đại, ghi dấu ấn với tính thẩm mỹ cao và sự tinh tế qua các chi tiết tạo điểm nhấn mà không mất đi nét sang trọng vốn có.Áo sơ mi kết hợp hoàn hảo giữa phong cách cổ điển và hiện đại. Được làm từ chất liệu Cotton cao cấp, áo không chỉ mềm mại và thoáng mát, mà còn đảm bảo sự thoải mái, dễ chịu trong suốt cả ngày. Đặc biệt, chất liệu có độ bền cao và thấm hút tốt, rất thích hợp cho những ngày làm việc bận rộn hoặc những buổi hẹn gặp quan trọng.Thiết kế cổ đức chỉn chu, phù hợp cho các dịp công sở, hội họp. Tay áo dài với những đường cắt may tỉ mỉ, cho thấy sự gọn gàng của quý cô thanh lịch. Áo dễ dàng phối hợp với quần tây, quần jeans hoặc chân váy, giúp bạn tạo nên những bộ trang phục linh hoạt và đa dạng.', NULL, NULL, 12),
(4, 'Áo sơ mi lụa cổ kiểu', 890000, NULL, 'Thiết kế nằm trong BST Dreamy Bloom, người bạn đồng hành hoàn hảo của phái đẹp, giúp nàng luôn tự tin, sang trọng và phong cách trong mọi khoảnh khắc.', NULL, NULL, 12),
(5, 'Áo lụa Tencel thân bèo cách điệu', 1090000, NULL, 'Thiết kế được lựa chọn trong BST Office Divas, mang đậm dấu ấn phong cách hiện đại dành riêng cho phái đẹp. Ngôn ngữ thiết kế tối giản được điểm xuyết khéo léo bằng các chi tiết cách điệu mềm mại không chỉ nâng tầm vẻ đẹp thanh lịch mà còn thể hiện cá tính độc lập và gu thời trang đẳng cấp.Áo sơ mi lụa Tencel với phần thân được nhấn nhá bằng chi tiết bèo cách điệu, tạo nên vẻ độc đáo và tinh tế, giúp tôn lên phong cách riêng của người mặc.', NULL, NULL, 12),
(6, 'Áo sơ mi Croptop Office', 1190000, NULL, 'Thiết kế được lựa chọn trong BST Office Divas, mang đậm dấu ấn phong cách hiện đại dành riêng cho phái đẹp. Ngôn ngữ thiết kế tối giản được điểm xuyết khéo léo bằng các chi tiết cách điệu mềm mại không chỉ nâng tầm vẻ đẹp thanh lịch mà còn thể hiện cá tính độc lập và gu thời trang đẳng cấp.Áo sơ mi Croptop Office là sự kết hợp hoàn hảo giữa phong cách trẻ trung, hiện đại bên cạnh nét thanh lịch chuyên nghiệp.', NULL, NULL, 12),
(7, 'Áo sơ mi Tencel Divas', 1190000, NULL, 'Thiết kế được lựa chọn trong BST Office Divas, mang đậm dấu ấn phong cách hiện đại dành riêng cho phái đẹp. Ngôn ngữ thiết kế tối giản được điểm xuyết khéo léo bằng các chi tiết cách điệu mềm mại không chỉ nâng tầm vẻ đẹp thanh lịch mà còn thể hiện cá tính độc lập và gu thời trang đẳng cấp.Áo sơ mi Divas nổi bật với phần cổ tròn được tạo tầng bèo nhẹ nhàng, mang lại vẻ nữ tính, tinh tế mà không kém phần thanh lịch.Thiết kế tay dài xếp ly thời thượng không chỉ tăng thêm sự duyên dáng mà còn thể hiện gu thời trang hiện đại, phù hợp cho cả công sở và các dịp trang trọng.', NULL, NULL, 12),
(8, 'Áo sơ mi Tuysi Peplum', 1090000, NULL, 'Thiết kế nằm trong BST Dreamy Bloom, nổi bật với phần eo chiết nhẹ, tạo đường cong duyên dáng, tôn lên vòng eo, giúp bạn thêm tự tin và cuốn hút.', NULL, NULL, 12),
(9, 'Áo sơ mi Cotton cổ đức', 890000, NULL, 'Mang đến vẻ đẹp nhẹ nhàng nhưng tinh tế, áo sơ mi phù hợp cho mọi dịp từ công sở đến dạo phố. Được làm từ chất liệu cotton cao cấp, áo đảm bảo độ mềm mại, thoáng mát và thấm hút mồ hôi tốt, giúp người mặc cảm thấy thoải mái cả ngày dài. Thiết kế cổ đức truyền thống tạo nên vẻ ngoài chỉn chu và thanh lịch. Và khi kết hợp với chi tiết tay liền giúp áo giữ được phom dáng đẹp ngay khi vận động.Áo có dáng suông nhẹ, phù hợp với nhiều kiểu cơ thể, dễ dàng phối hợp với quần tây, chân váy hoặc quần jeans, tạo nên những bộ trang phục trang nhã, xu hướng. ', NULL, NULL, 12),
(10, 'Áo sơ mi xếp ly vai lệch', 890000, NULL, 'Thiết kế áo kiểu phom dáng vừa vặn, dễ dàng kết hợp với nhiều trang phục khác như quần tây, chân váy hoặc jeans, mang lại vẻ ngoài thời trang và cuốn hút. ', NULL, NULL, 12),
(11, 'Áo sơ mi tay liền phối voan', 950000, NULL, 'Thiết kế nằm trong BST Dreamy Bloom, người bạn đồng hành hoàn hảo của phái đẹp, giúp nàng luôn tự tin, sang trọng và phong cách trong mọi khoảnh khắc.', NULL, NULL, 12),
(12, 'Áo sơ mi Croptop bo gấu', 890000, NULL, 'Áo kiểu tay liền với form dáng thoải mái, giúp bạn dễ dàng phối cùng các loại trang phục như quần jeans, chân váy hoặc quần shorts, tạo nên nhiều phong cách khác nhau từ cá tính đến nữ tính.', NULL, NULL, 12),
(13, 'Áo sơ mi Lụa Muse', 990000, NULL, 'Ánh nắng mùa thu, dù không còn chói chang, vẫn mang đến cảm giác ấm áp, nhẹ nhàng tựa như sự mềm mại và lãng mạn luôn hiện hữu bên trong mỗi người phụ nữ. Đây chính là nguồn cảm hứng chủ đạo cho những thiết kế tinh tế trong BST Muse of the Sun.Áo sơ mi Lụa Muse mang vẻ ngoài nhẹ nhàng, không quá cầu kì trong thiết kế nhưng khi diện lên lại toát nên sự sang trọng, vô cùng tinh tế.Thiết kế tạo điểm nhấn kim tuyến phần viền cổ và túi giả, một chút đặc biệt đủ để áo trở nên nổi bật, gây ấn tượng ngay từ cái nhìn đầu tiên.Chất liệu lụa mềm mại, kết hợp dáng tay dài thanh thoát giúp người mặc có trải nghiệm thoải mái cũng như thích hợp với tiết trời thu sang.', NULL, NULL, 12),
(14, 'Áo sơ mi Long Sleeves Tencel', 1090000, NULL, 'Long Sleeves Tencel mang đến phong cách thanh lịch và thoải mái với chất liệu Tencel cao cấp, nổi bật mềm mại, thoáng khí cùng khả năng thấm hút tốt. Áo không chỉ tạo cảm giác dễ chịu khi mặc mà còn có độ bóng nhẹ, mang lại vẻ ngoài sang trọng, hiện đại.Thiết kế tay dài cổ điển giúp áo phù hợp cho nhiều hoàn cảnh, từ công sở đến các buổi gặp gỡ. Phom dáng suông nhẹ của áo dễ dàng kết hợp với các trang phục khác như quần tây, chân váy hoặc quần jeans. Đây là một lựa chọn tuyệt vời cho những ngày làm việc dài, duy trì phong cách tinh tế.', NULL, NULL, 12),
(15, 'Áo sơ mi Tuysi dáng ngắn', 890000, NULL, 'Thiết kế sơ mi Tuysi cổ đức, lựa chọn thời trang cao cấp giúp nàng nổi bật trong những dịp quan trọng hay các sự kiện đặc biệt.Áo sơ mi dáng croptop, có độ ôm nhẹ, tự tin khoe trọn vẻ đẹp cơ thể. Áo cổ đức truyền thống nhưng được xếp ly tạo kiểu ở phần thân trước của áo, làm nên điểm nhấn và kiểu dáng độc đáo. Đặc biệt, áo còn được đính hàng khuy kim loại sang trọng. ', NULL, NULL, 12),
(16, 'Áo sơ mi lụa Blossom tạo kiểu', 990000, NULL, 'Áo sơ mi Blossom với nền họa tiết bắt mặt cùng thiết kế cách tân hiện đại sẽ giúp nàng có nhiều gợi ý hơn trong việc mix&match đồ công sở hay đi chơi cùng bạn bè.IVY moda lựa chọn chất liệu lụa cao cấp giúp chiếc áo có độ bóng nhẹ, mềm mại và thoáng mát, mang lại cảm giác thoải mái cho người mặc trong suốt cả ngày.Phần cổ tạo nơ độc đáo, tăng sự thu hút cho tổng thể thiết kế, đồng thời tôn lên vẻ đẹp thanh lịch và nữ tính. Thiết kế không tay phóng khoáng, giúp áo thêm phần trẻ trung.Kiểu dáng của áo dễ dàng kết hợp với các trang phục như quần tây, chân váy bút chì hoặc quần jeans, mang lại sự linh hoạt trong phong cách thời trang từ công sở đến dạo phố.', NULL, NULL, 12),
(17, 'Áo sơ mi Sleek Lines', 950000, NULL, 'Thiết kế sơ mi lụa tay ngắn, dáng suông giúp mang lại cho người diện cảm giác thoải mái và mềm mại. Đặc biệt, phần cổ áo được thiết kế chữ V cách điệu giúp áo trở nên thu hút, tăng sự hiện đại.Áo sơ mi này có thể dễ dàng kết hợp với nhiều trang phục khác nhau. Khi kết hợp cùng quần jean và giày sneakers, bạn sẽ có một trang phục đơn giản, trẻ trung và năng động. Nếu muốn tạo nên phong cách thanh lịch hơn, hãy kết hợp áo với chân váy ôm hoặc quần tây đen và giày cao gót.', NULL, NULL, 12),
(18, 'Áo sơ mi Tuysi dáng ngắn', 890000, NULL, 'Thiết kế sơ mi Tuysi cổ đức, lựa chọn thời trang cao cấp giúp nàng nổi bật trong những dịp quan trọng hay các sự kiện đặc biệt.Áo sơ mi dáng croptop, có độ ôm nhẹ, tự tin khoe trọn vẻ đẹp cơ thể. Áo cổ đức truyền thống nhưng được xếp ly tạo kiểu ở phần thân trước của áo, làm nên điểm nhấn và kiểu dáng độc đáo. Đặc biệt, áo còn được đính hàng khuy kim loại sang trọng. ', NULL, NULL, 12),
(19, 'Áo sơ mi Tencel thêu hoa ngực', 1250000, NULL, 'Thiết kế sơ mi Tencel cao cấp là lựa chọn không thể thiếu trong tủ đồ nàng công sở yêu thích sự tinh tế, mềm mại và thoải mái. IVY moda sử dụng chất liệu Tencel với đặc tính thoáng mát, thấm hút tốt, mang lại trải nghiệm yêu thích suốt cả ngày dài. Điểm nhấn nổi bật của chiếc áo là phần thêu hoa tỉ mỉ ở phần túi ngực, tạo nét nữ tính nhưng vẫn hiện đại. Thiết kế này không chỉ làm tăng thêm tính cuốn hút cho trang phục mà còn thể hiện sự khéo léo và tinh tế trong từng chi tiết. Phom dáng suông nhẹ nhàng, dễ dàng kết hợp với các loại quần tây, chân váy hoặc quần jeans, phù hợp trong nhiều hoàn cảnh từ công sở đến dạo phố.', NULL, NULL, 12),
(20, 'Áo sơ mi Tencel Kose', 1490000, NULL, 'Ánh nắng mùa thu, dù không còn chói chang, vẫn mang đến cảm giác ấm áp, nhẹ nhàng tựa như sự mềm mại và lãng mạn luôn hiện hữu bên trong mỗi người phụ nữ. Đây chính là nguồn cảm hứng chủ đạo cho những thiết kế tinh tế trong BST Muse of the Sun.Áo sơ mi Kose mang đến sự thanh lịch và mềm mại nhờ chất liệu Tencel cao cấp, nổi bật với khả năng thấm hút tốt, thoáng mát, an toàn với làn da. Đây là sự lựa chọn hoàn hảo cho những ai yêu thích thoải mái nhưng vẫn giữ vẻ ngoài sang trọng.Thiết kế cổ kiểu buộc nơ chính là điểm nhấn độc đáo, tạo nên nét nữ tính và duyên dáng, giúp bạn nổi bật trong bất kỳ dịp nào. Kiểu dáng của chiếc áo dễ dàng phối hợp với quần tây, chân váy bút chì hoặc quần jeans, tạo nên phong cách thời trang từ chuyên nghiệp đến trẻ trung.', NULL, NULL, 12),
(21, 'Áo sơ mi lụa Pink Vibe', 1250000, NULL, 'Thiết kế sơ mi tinh tế và sang trọng, mang đến vẻ ngoài thanh lịch nhưng vẫn hiện đại cho người mặc. Chất liệu lụa mềm mại, thoáng mát giúp chiếc áo tôn lên vẻ đẹp rạng rỡ, thời thượng. Áo thổi làn gió mới nhờ chi tiết cổ cách điệu. Phần tay dài giúp tạo sự thanh thoát và nhẹ nhàng, thích hợp cho môi trường công sở hoặc các sự kiện trang trọng.Với dáng suông, áo sơ mi Pink Vibe dễ dàng phối hợp với quần tây, chân váy hoặc quần jeans, để nàng có vẻ ngoài hoàn hảo từ công sở đến dạo phố.', NULL, NULL, 12),
(22, 'Áo sơ mi lụa Green Vibe', 1250000, NULL, 'Thiết kế sơ mi tinh tế và sang trọng, mang đến vẻ ngoài thanh lịch nhưng vẫn hiện đại cho người mặc. Chất liệu lụa mềm mại, thoáng mát giúp chiếc áo tôn lên vẻ đẹp rạng rỡ, thời thượng. Áo thổi làn gió mới nhờ chi tiết cổ cách điệu. Phần tay dài giúp tạo sự thanh thoát và nhẹ nhàng, thích hợp cho môi trường công sở hoặc các sự kiện trang trọng.Với dáng suông, áo sơ mi Pink Vibe dễ dàng phối hợp với quần tây, chân váy hoặc quần jeans, để nàng có vẻ ngoài hoàn hảo từ công sở đến dạo phố.', '2024-11-22 14:59:35', '2024-11-22 14:59:35', 12),
(23, 'Áo sơ mi Long Sleeves Tencele', 1090000, NULL, 'Long Sleeves Tencel mang đến phong cách thanh lịch và thoải mái với chất liệu Tencel cao cấp, nổi bật mềm mại, thoáng khí cùng khả năng thấm hút tốt. Áo không chỉ tạo cảm giác dễ chịu khi mặc mà còn có độ bóng nhẹ, mang lại vẻ ngoài sang trọng, hiện đại.Thiết kế tay dài cổ điển giúp áo phù hợp cho nhiều hoàn cảnh, từ công sở đến các buổi gặp gỡ. Phom dáng suông nhẹ của áo dễ dàng kết hợp với các trang phục khác như quần tây, chân váy hoặc quần jeans. Đây là một lựa chọn tuyệt vời cho những ngày làm việc dài, duy trì phong cách tinh tế.', '2024-11-22 15:00:05', '2024-11-22 15:00:05', 12),
(24, 'Áo sơ mi tay kiểu Sleeves', 1090000, NULL, 'Áo sơ mi mang lại sự mới mẻ trong phong cách thời trang công sở. Phần kiểu dáng ôm tôn lên đường nét cơ thể, tô điểm vẻ ngoài thon gọn, tinh tế cho người mặc. Điểm nhấn tay cánh dơi cách điệu, giúp áo trở nên mềm mại và uyển chuyển, tạo nên sự khác biệt độc đáo so với các mẫu áo sơ mi thông thường. Thiết kế dễ dàng kết hợp cùng chân váy bút chì, quần tây hoặc quần jeans để có những set đồ thời trang đa dạng, từ thanh lịch, công sở đến trẻ trung, hiện đại.', '2024-11-22 15:00:33', '2024-11-22 15:00:33', 12),
(25, 'Áo sơ mi Pink Lace', 1190000, NULL, 'Áo sơ mi Pink Tencel mang đến sự kết hợp hoàn hảo giữa nét cổ điển và hiện đại, tạo nên vẻ ngoài tinh tế, đầy cuốn hút.Chiếc áo có tay dài với chi tiết bo gấu croptop thời thượng, vừa mang điểm nhấn trẻ trung, vừa giúp tôn lên vòng eo thon gọn. Thiết kế dễ dàng phối cùng quần cạp cao hoặc chân váy, để nàng trông thật nổi bật mỗi khi xuất hiện. Đây chính là lựa chọn hoàn hảo cho những buổi dạo phố, sự kiện hoặc gặp gỡ bạn bè, giúp bạn nổi bật với phong cách trẻ trung nhưng vẫn giữ được sự thanh lịch và quyến rũ.', '2024-11-22 15:01:06', '2024-11-22 15:01:06', 12),
(26, 'Áo sơ mi Green Lace', 1190000, NULL, 'Áo sơ mi Pink Tencel mang đến sự kết hợp hoàn hảo giữa nét cổ điển và hiện đại, tạo nên vẻ ngoài tinh tế, đầy cuốn hút.Chiếc áo có tay dài với chi tiết bo gấu croptop thời thượng, vừa mang điểm nhấn trẻ trung, vừa giúp tôn lên vòng eo thon gọn. Thiết kế dễ dàng phối cùng quần cạp cao hoặc chân váy, để nàng trông thật nổi bật mỗi khi xuất hiện. Đây chính là lựa chọn hoàn hảo cho những buổi dạo phố, sự kiện hoặc gặp gỡ bạn bè, giúp bạn nổi bật với phong cách trẻ trung nhưng vẫn giữ được sự thanh lịch và quyến rũ.', '2024-11-22 15:01:17', '2024-11-22 15:01:17', 12),
(27, 'Áo sơ mi cổ đức ôm kéo khóa', 950000, NULL, 'Thiết kế áo thanh lịch, hiện đại với điểm nhấn ở chi tiết khóa kéo phía trước, mang đến sự phá cách và tiện lợi. Chất liệu Tuysi mềm mại, thoáng mát, giúp áo có độ rũ nhẹ, phù hợp cho những ngày làm việc năng động hay các dịp gặp gỡ bạn bè. Phần cổ đức kết hợp dáng ôm tăng tính gọn gàng và chuyên nghiệp. Áo có thể dễ dàng kết hợp với quần tây, chân váy hoặc quần jeans để tạo nên phong cách thanh lịch, trẻ trung, năng động.Đây là lựa chọn lý tưởng cho những người yêu thích sự tinh tế, hiện đại nhưng vẫn giữ được nét trang nhã trong phong cách.', '2024-11-22 15:01:44', '2024-11-22 15:01:44', 12),
(28, 'Áo sơ mi Tencel cổ đức dấu khuy', 990000, NULL, 'Mang đến sự kết hợp hoàn hảo giữa thoải mái và phong cách thanh lịch, một chiếc sơ mi dáng suông là lựa chọn lý tưởng cho những cô nàng hiện đại yêu thích vẻ đẹp nhẹ nhàng nhưng không kém phần sang trọng.Được làm từ chất liệu lụa cao cấp mềm mại và mịn màng, áo không chỉ giúp tôn lên sự quý phái mà còn mang lại cảm giác dễ chịu cho người mặc suốt cả ngày dài. Thiết kế dáng suông giúp che khuyết điểm, phù hợp với nhiều dáng người khác nhau, trong khi phần cổ đức cổ điển tạo nên sự tinh tế cho trang phục.', '2024-11-22 15:02:06', '2024-11-22 15:02:06', 12),
(29, 'Áo sơ mi lụa Mystic', 1190000, NULL, 'Áo sơ mi lụa Mystic mang đến sự kết hợp hoàn hảo giữa phong cách hiện đại và sự tinh tế. Chất liệu lụa cao cấp giúp áo có độ bóng nhẹ, mềm mại, tạo cảm giác thoải mái cho người mặc. Đặc biệt, lụa còn có đặc tính thoáng mát, dễ chịu, phù hợp với nhiều dịp từ công sở đến các sự kiện trang trọng.Thiết kế cổ V xếp chéo trở thành điểm nhấn độc đáo, giúp tôn lên vẻ quyến rũ. Và khi đi cùng các chi tiết xếp ly ở thân áo đã làm tăng thêm chiều sâu cũng như độ rũ tự nhiên, nhẹ nhàng cho áo sơ mi.Thân áo bo gấu cách điệu, tôn lên vóc dáng thon gọn, làm nổi bật sự thanh thoát. Thiết kế Mystic cổ xếp dễ dàng phối hợp với quần âu, chân váy hay quần jeans, tạo nên vẻ ngoài sang trọng và thanh lịch, phù hợp cho nhiều dịp.', '2024-11-22 15:02:36', '2024-11-22 15:02:36', 12),
(30, 'Áo sơ mi Tencel cổ đức dấu khuy', 990000, NULL, 'Mang đến sự kết hợp hoàn hảo giữa thoải mái và phong cách thanh lịch, một chiếc sơ mi dáng suông là lựa chọn lý tưởng cho những cô nàng hiện đại yêu thích vẻ đẹp nhẹ nhàng nhưng không kém phần sang trọng.Được làm từ chất liệu lụa cao cấp mềm mại và mịn màng, áo không chỉ giúp tôn lên sự quý phái mà còn mang lại cảm giác dễ chịu cho người mặc suốt cả ngày dài. Thiết kế dáng suông giúp che khuyết điểm, phù hợp với nhiều dáng người khác nhau, trong khi phần cổ đức cổ điển tạo nên sự tinh tế cho trang phục.', '2024-11-22 15:03:00', '2024-11-22 15:03:00', 12),
(31, 'Áo sơ mi Tencel Blossom', 1190000, NULL, 'Mang đậm vẻ đẹp tinh tế và thanh thoát, áo sơ mi Tencel Blossom là lựa chọn hoàn hảo cho nàng công sở hiện đại yêu thích phong cách nhẹ nhàng, nữ tính nhưng vẫn đầy thanh lịch.Chất liệu Tencel mềm mại, thoáng mát, thân thiện với môi trường giúp áo vừa mang đến cảm giác thoải mái, vừa có khả năng thấm hút mồ hôi tốt và thích hợp diện trong nhiều tiết trời khác nhau.Điểm nhấn đặc biệt của chiếc áo chính là nền họa tiết thêu hoa chìm tỉ mỉ, tạo sự tinh tế, sang trọng mà không quá cầu kỳ. Thiết kế dễ dàng kết hợp với quần tây, chân váy hoặc jeans, phù hợp cho cả những ngày đi làm hay đi dạo phố.', '2024-11-22 15:03:29', '2024-11-22 15:03:29', 12),
(32, 'Áo Ladies Mystic thêu hoa', 1090000, NULL, 'Ladies Mystic, thiết kế độc đáo kết hợp giữa sự mềm mại của chất liệu và nét tinh tế từ họa tiết thêu hoa. Chất liệu Tuysi cao cấp mang đến cảm giác nhẹ nhàng, có độ rủ tự nhiên, giúp áo luôn giữ được dáng vẻ sang trọng. Đây là lựa chọn lý tưởng cho nàng công sở những ngày cần sự thoải mái nhưng vẫn muốn giữ nét chỉn chu, phong cách.', '2024-11-22 15:03:56', '2024-11-22 15:03:56', 12),
(33, 'Áo sơ mi lụa tay dài Grace', 1350000, NULL, 'Tinh tế và thanh lịch, áo sơ mi Grace là một thiết kế hoàn hảo dành cho những cô nàng yêu thích phong cách thời trang sang trọng nhưng không kém phần dịu dàng. Được làm từ chất liệu lụa cao cấp, áo mang đến cảm giác mềm mại, nhẹ nhàng trên da, đồng thời có độ bóng nhẹ, giúp tôn lên vẻ đẹp tinh tế của người mặc.Thiết kế tay dài cổ điển, phù hợp cho nhiều dịp từ công sở đến các sự kiện quan trọng. Phần cổ áo tạo kiểu với các chi tiết xếp nếp hoa văn thời thượng, thể hiện nét trang nhã và hiện đại. Áo dễ dàng kết hợp với nhiều kiểu trang phục khác nhau như chân váy bút chì, quần âu hoặc jeans, tạo nên phong cách thanh lịch nhưng vẫn giữ được sự thoải mái.', '2024-11-22 15:04:26', '2024-11-22 15:04:26', 12),
(34, 'Áo sơ mi họa tiết Croptop', 690000, NULL, 'Áo sơ mi được làm từ chất liệu Batiste in họa tiết nét vẽ, có độ mềm mại, tạo sự sang trọng và thoải mái khi mặc.Thiết kế cổ 2 ve, tay ngắn, kiểu dáng croptop năng động, trẻ trung. Với nền họa tiết bắt mắt, cùng kiểu dáng trẻ trung, thích hợp để nàng diện trong nhiều dịp khác nhau. ', '2024-11-22 15:05:01', '2024-11-22 15:05:01', 12),
(35, 'Sơ mi Croptop hồng Baby', 800000, NULL, 'Áo sơ mi cổ đức tay dài, khuy cài ở thân trước. Áo dáng suông, kiểu croptop trẻ trung, năng động. Chất liệu thô cotton mềm mịn, thoáng mát, thích hợp thời tiết ngày Hè. ', '2024-11-22 15:05:23', '2024-11-22 15:05:23', 12),
(36, 'Sơ mi lụa cổ đổ tay hến', 550000, NULL, 'Thiết kế áo sơ mi thanh lịch và nữ tính, với điểm nhấn cổ đổ mềm mại kết hợp tay hến nhẹ nhàng mà duyên dáng.Áo lựa chọn chất liệu lụa cao cấp, có độ bóng nhẹ, tạo vẻ ngoài sang trọng và thời thượng. Sơ mi thoáng mát, thấm hút mồ hôi tốt, phù hợp cho các ngày hè nóng bức.', '2024-11-22 15:05:56', '2024-11-22 15:05:56', 12),
(37, 'Violet Daily - Áo sơ mi kiểu', 550000, NULL, 'Mang đến sắc tím pastel kết hợp kiểu dáng nhẹ nhàng và bay bổng. Áo sơ mi cổ kiểu, thiết kế tay ngắn cùng dáng croptop bo gấu trẻ trung, hiện đại. Thiết kế vừa tạo cảm giác thon gọn cho vòng eo vừa mang đến sự thoải mái, nữ tính. Sản phẩm được kết hợp từ 3 dòng chất liệu Rayon, Poly, Spandex. Sản phẩm mang đến kết cấu mịn, thoải mái, tạo cảm giác mềm mại khi chạm vào. Ngoài ra, chất liệu có độ rủ tự nhiên và  khả năng chống thấm nước, thoáng khí mát mẻ dành cho mùa hè.', '2024-11-22 15:06:22', '2024-11-22 15:06:22', 12),
(38, 'Áo sơ mi Tencel tay lỡ', 750000, NULL, 'Thiết kế sơ mi thanh lịch, tinh tế cho nàng công sở đón hè đang về. Áo cổ tròn, dáng suông phù hợp mọi vóc dáng mà còn dễ dàng che đi khuyết điểm. Tay áo lỡ, tạo độ bồng nhẹ, nữ tính. Thân trước đính thêm các chi tiết hoa nổi, dễ dàng thu hút mọi ánh nhìn. Gợi ý nàng mix áo cùng quần hay chân váy để có set đồ hoàn chỉnh. Sản phẩm được cắt may từ chất liệu Tencel sinh học cao cấp. Vải độ bền màu cao, ít bị co giãn, giữ được phom tốt. Bề mặt mềm mịn giúp người mặc trải nghiệm cảm giác thoái mái và nhẹ nhàng trên da. Vải được lựa chọn thích hợp diện trong mùa hè oi bức. ', '2024-11-22 15:06:50', '2024-11-22 15:06:50', 12),
(39, 'Áo sơ mi lụa Peplum cổ tròn', 550000, NULL, 'Thiết kế được nhiều nàng hiện đại ưu chuộng trong mùa hè đến bởi tính ứng dụng cũng như kiểu dáng trẻ trung, bắt mắt và đặc biệt dễ mix với nhiều trang phục khác nhau. Áo cổ tròn, tay ngắn, tạo kiểu Peplum nổi bật. Thân và tay áo có nhiều điểm xếp ly nhẹ, giúp áo trở nên mềm mại hơn. Áo lựa chọn chất liệu cao cấp, mềm mại, mịn màng, có độ bóng nhẹ, mang lại cảm giác thoải mái và sang trọng cho người mặc.', '2024-11-22 15:07:29', '2024-11-22 15:07:29', 12),
(40, 'Áo sơ mi Tencel mix ren hoa', 750000, NULL, 'Áo sơ mi là sự kết hợp hoàn hảo giữa chất liệu cao cấp và thiết kế tinh tế.Thiết kế áo cổ đức, tay ngắn, dáng suông. Thân trước áo cách điệu lớp ren hoa đan kết tỉ mỉ, tạo sự nổi bật, sang trọng và thu hút. Áo mềm mại và thoáng khí. Dệt may từ chất liệu Tencel với độ mềm mại, mịn màng, khả năng thấm hút mồ hôi tốt, mang lại cảm giác dễ chịu cho người mặc.Nàng có thể lựa chọn mix áo cùng chân váy hoặc quần để có set công sở thanh lịch, chuyên nghiệp mà vẫn giữ được nét nữ tính.', '2024-11-22 15:08:06', '2024-11-22 15:08:06', 12),
(41, 'Áo sơ mi cổ đức Petal', 650000, NULL, 'Petal mang lại vẻ ngoài tinh tế, thanh lịch và nữ tính. Thiết kế phù hợp với nhiều hoàn cảnh và phong cách khác nhau, từ nơi công sở đến những buổi gặp mặt bạn bè. Áo sơ mi cổ đức, tay ngắn, dáng suông nhẹ. Cổ áo mix khuy kiểu, thêm phối túi cách điệu giúp áo trở nên nổi bật hơn. Thiết kế lựa chọn chất liệu lụa mềm mại, mịn màng, độ bóng nhẹ. Petal Set cũng có khả năng thoáng khí tốt, thích hợp cho nhiều kiểu thời tiết. ', '2024-11-22 15:08:35', '2024-11-22 15:08:35', 12),
(42, 'Áo sơ mi cổ bèo dáng suông', 650000, NULL, 'Thiết kế sơ mi công sở vẻ ngoài thanh lịch, chuyên nghiệp mà vẫn giữ được nét nữ tính. Áo thể hiện sự duyên dáng cũng thích hợp cho các buổi dạo phố, gặp gỡ bạn bè hoặc các hoạt động hàng ngày.Cổ áo chữ V, được tạo kiểu bằng các chi tiết bèo nhún, mang đến điểm nhấn nữ tính và mềm mại. Áo phom dáng suông, không ôm sát cơ thể, thoải mái và dễ chịu khi mặc. Bên cạnh đó, dáng suông cũng giúp che đi các khuyết điểm, phù hợp với nhiều dáng người khác nhau.Chất liệu raw cloth bề mặt mịn, thoáng mát, thấm hút mồ hôi, thích hợp cho thời tiết hè oi nóng. ', '2024-11-22 15:09:02', '2024-11-22 15:09:02', 12),
(43, 'Áo peplum Rosalie', 450000, NULL, 'Thiết kế đang là sự lựa chọn ưu tiên trong thời trang công sở thời gian trở lại đây bởi tính ứng dụng cũng như sự chỉn chu, sang trọng mà nó mang lại. Nàng vừa có thể mặc theo set vừa có thể tách rời để biến tấu thành nhiều outfits khác nhau.Áo cách điệu cổ tròn, tay ngắn xếp ly, phần eo tạo kiểu peplum che khuyết điểm tốt. Kết hợp khuy khác màu bắt mắt, hoàn hảo xây dựng cấu trúc thêm phần cách điệu.Rosalie sử dụng chất liệu Gabardine, mềm mại, ít nhăn và co giãn hai chiều. Giúp người mặc di chuyển thoải mái. Không tạo cảm giác khó chịu khi làm việc và gò bó với thiết kế ôm cơ thể.', '2024-11-22 15:09:36', '2024-11-22 15:09:36', 12),
(44, 'Áo sơ mi Croptop Cut - out họa tiết', 950000, NULL, 'Áo sơ mi cổ đức tay dài, khuy cài ở thân trước. Áo dáng suông, kiểu croptop trẻ trung, năng động. Thiết kế được cut-out hoa văn độc đáo, tạo điểm nhấn nổi bật. Chất liệu vải mềm mịn, thoáng mát, thích hợp thời tiết ngày hè. Thiết kế giúp làm tôn lên đường nét tinh tế, và quyến rũ của phái đẹp. Kết hợp áo với chân vấy ngắn hoặc jeans là nàng đã có 1 outfit đi chơi cực trẻ trung và nữ tính.', '2024-11-22 15:10:06', '2024-11-22 15:10:06', 12),
(45, 'Áo sơ mi tay lỡ thêu hoa', 650000, NULL, 'Được lựa chọn từ chất liệu Tencel cao cấp, áo mang lại cảm giác mềm mại và dễ chịu khi diện lên. Chất liệu này cũng tạo nên độ bóng, làm nổi bật vẻ đẹp của sản phẩm.Kiểu dáng suông với tay lỡ của áo tôn lên vẻ nữ tính, nhẹ nhàng và thanh lịch. Chi tiết phối hoa nổi bật trên thân áo sang trọng, thể hiện sự tỉ mỉ, chỉn chu trong từng đường nét thêu hoa. Áo có thể dễ dàng phối cùng nhiều loại trang phục khác nhau. Nếu muốn tạo nên một phong cách thanh lịch hơn, bạn có thể kết hợp áo với một chiếc chân váy midi và đôi giày cao gót.', '2024-11-22 15:10:32', '2024-11-22 15:10:32', 12),
(46, 'Áo sơ mi kiểu Expert', 650000, NULL, 'Được lựa chọn từ chất liệu Tencel cao cấp, áo mang lại cảm giác mềm mại và dễ chịu khi diện lên. Chất liệu này cũng tạo nên độ bóng, làm nổi bật vẻ đẹp của sản phẩm.Kiểu dáng suông với tay lỡ của áo tôn lên vẻ nữ tính, nhẹ nhàng và thanh lịch. Chi tiết phối hoa nổi bật trên thân áo sang trọng, thể hiện sự tỉ mỉ, chỉn chu trong từng đường nét thêu hoa. Áo có thể dễ dàng phối cùng nhiều loại trang phục khác nhau. Nếu muốn tạo nên một phong cách thanh lịch hơn, bạn có thể kết hợp áo với một chiếc chân váy midi và đôi giày cao gót.', '2024-11-22 15:11:51', '2024-11-22 15:11:51', 12),
(47, 'Áo sơ mi lụa cánh tiên', 650000, NULL, 'Được lựa chọn từ chất liệu Tencel cao cấp, áo mang lại cảm giác mềm mại và dễ chịu khi diện lên. Chất liệu này cũng tạo nên độ bóng, làm nổi bật vẻ đẹp của sản phẩm.Kiểu dáng suông với tay lỡ của áo tôn lên vẻ nữ tính, nhẹ nhàng và thanh lịch. Chi tiết phối hoa nổi bật trên thân áo sang trọng, thể hiện sự tỉ mỉ, chỉn chu trong từng đường nét thêu hoa. Áo có thể dễ dàng phối cùng nhiều loại trang phục khác nhau. Nếu muốn tạo nên một phong cách thanh lịch hơn, bạn có thể kết hợp áo với một chiếc chân váy midi và đôi giày cao gót.', '2024-11-22 15:11:59', '2024-11-22 15:11:59', 12),
(48, 'Lyluta Set - Áo ôm kiểu', 650000, NULL, 'Được lựa chọn từ chất liệu Tencel cao cấp, áo mang lại cảm giác mềm mại và dễ chịu khi diện lên. Chất liệu này cũng tạo nên độ bóng, làm nổi bật vẻ đẹp của sản phẩm.Kiểu dáng suông với tay lỡ của áo tôn lên vẻ nữ tính, nhẹ nhàng và thanh lịch. Chi tiết phối hoa nổi bật trên thân áo sang trọng, thể hiện sự tỉ mỉ, chỉn chu trong từng đường nét thêu hoa. Áo có thể dễ dàng phối cùng nhiều loại trang phục khác nhau. Nếu muốn tạo nên một phong cách thanh lịch hơn, bạn có thể kết hợp áo với một chiếc chân váy midi và đôi giày cao gót.', '2024-11-22 15:12:18', '2024-11-22 15:12:18', 12),
(49, 'Áo sơ lụa suông cổ đức', 650000, NULL, 'Được lựa chọn từ chất liệu Tencel cao cấp, áo mang lại cảm giác mềm mại và dễ chịu khi diện lên. Chất liệu này cũng tạo nên độ bóng, làm nổi bật vẻ đẹp của sản phẩm.Kiểu dáng suông với tay lỡ của áo tôn lên vẻ nữ tính, nhẹ nhàng và thanh lịch. Chi tiết phối hoa nổi bật trên thân áo sang trọng, thể hiện sự tỉ mỉ, chỉn chu trong từng đường nét thêu hoa. Áo có thể dễ dàng phối cùng nhiều loại trang phục khác nhau. Nếu muốn tạo nên một phong cách thanh lịch hơn, bạn có thể kết hợp áo với một chiếc chân váy midi và đôi giày cao gót.', '2024-11-22 15:12:29', '2024-11-22 15:12:29', 12),
(50, 'Áo sơ mi lụa Dark Beige', 790000, NULL, 'Được lựa chọn từ chất liệu Tencel cao cấp, áo mang lại cảm giác mềm mại và dễ chịu khi diện lên. Chất liệu này cũng tạo nên độ bóng, làm nổi bật vẻ đẹp của sản phẩm.Kiểu dáng suông với tay lỡ của áo tôn lên vẻ nữ tính, nhẹ nhàng và thanh lịch. Chi tiết phối hoa nổi bật trên thân áo sang trọng, thể hiện sự tỉ mỉ, chỉn chu trong từng đường nét thêu hoa. Áo có thể dễ dàng phối cùng nhiều loại trang phục khác nhau. Nếu muốn tạo nên một phong cách thanh lịch hơn, bạn có thể kết hợp áo với một chiếc chân váy midi và đôi giày cao gót.', '2024-11-22 15:12:57', '2024-11-22 15:12:57', 12),
(51, 'Áo thun vân hoa', 790000, NULL, 'Áo thun nằm trong BST Her Signature với những chi tiết thiết kế cách điệu tinh tế, kết hợp với họa tiết nhẹ nhàng, thể hiện tuyên ngôn về phong cách thời trang công sở kiểu mới – một phong cách tự tin, thanh lịch nhưng không kém phần duyên dáng.', '2024-11-22 16:20:57', '2024-11-22 16:20:57', 10),
(52, 'Áo thun ôm LONG SLEEVE', 750000, NULL, 'Thiết kế áo thun cổ vuông cách điệu mang lại nét mới lạ, tôn lên phần cổ và vai, tạo vẻ thanh lịch mà vẫn quyến rũ. Áo dáng ôm, phù hợp với nhiều trang phục khác nhau như chân váy, quần jeans hay quần âu.', '2024-11-22 16:21:20', '2024-11-22 16:21:20', 10),
(53, 'Áo thun xếp kiểu Queen', 750000, NULL, 'Thiết kế nằm trong BST SAPPHIRE CHIC với những thiết kế công sở hiện đại, ghi dấu ấn với tính thẩm mỹ cao và sự tinh tế qua các chi tiết tạo điểm nhấn mà không mất đi nét sang trọng vốn có.Với chất liệu thun mềm mại, co giãn và thoáng mát, áo mang lại cảm giác thoải mái suốt cả ngày dài. Thiết kế xếp kiểu độc đáo ở phần thân trước và tay áo tạo nên điểm nhấn nổi bật, giúp người mặc trở nên thu hút hơn trong mọi tình huống.Áo có dáng ôm vừa vặn, tôn lên đường cong tự nhiên của cơ thể. Phần cổ tròn đơn giản kết hợp với các đường xếp kiểu tinh xảo tạo nên nét đẹp quý phái, phù hợp cho cả những buổi dạo phố lẫn các sự kiện quan trọng. Màu sắc trung tính của áo dễ dàng phối với nhiều trang phục khác nhau như quần jeans, quần tây hay chân váy.', '2024-11-22 16:21:50', '2024-11-22 16:21:50', 10),
(54, 'Áo thun cổ đức DIVAS', 790000, NULL, 'Thiết kế được lựa chọn trong BST Office Divas, mang đậm dấu ấn phong cách hiện đại dành riêng cho phái đẹp. Ngôn ngữ thiết kế tối giản được điểm xuyết khéo léo bằng các chi tiết cách điệu mềm mại không chỉ nâng tầm vẻ đẹp thanh lịch mà còn thể hiện cá tính độc lập và gu thời trang đẳng cấp.Áo thun cổ đức cổ điển được cách tân nhẹ nhàng, mang lại nét sang trọng và trang nhã, phù hợp cho cả trang phục thường ngày hay các dịp cần sự chỉn chu.', '2024-11-22 16:22:15', '2024-11-22 16:22:15', 10),
(55, 'Áo thun xếp ly vai lệch', 650000, NULL, 'Lựa chọn tuyệt vời cho nàng công sở yêu thích sự phá cách, năng động và muốn tạo dấu ấn cá nhân trong phong cách thời trang của mình !', '2024-11-22 16:22:36', '2024-11-22 16:22:36', 10),
(56, 'Áo thun cổ lọ', 590000, NULL, 'Áo thun cổ lọ thiết kế độc quyền bởi thương hiệu IVY moda. Dáng basic cơ bản cổ lọ 3 phân, chất liệu thun co dãn 3 chiều tạo cảm giác vô cùng dễ chịu. Là một trong những sản phẩm lựa chọn hàng đầu trong chức năng dữ nhiệt  mùa lạnh...', '2024-11-22 16:23:00', '2024-11-22 16:23:00', 10),
(57, 'Áo thun tay ngắn in họa tiết', 590000, NULL, 'Áo phông là sự lựa chọn tuyệt vời để bạn luôn tự tin và nổi bật với phong cách trẻ trung, năng động. ', '2024-11-22 16:23:15', '2024-11-22 16:23:15', 10),
(58, 'Áo len kẻ tay ngắn', 990000, NULL, 'Áo len ngắn tay, dáng suông, bo viền khác màu. Điểm nhấn áo nằm ở họa tiết kẻ bắt mắt, đầy ấn tượng. Sự kết hợp tinh tế giúp tôn lên vẻ đẹp tối giản và tạo nên sự khác biệt trong thiết kế.', '2024-11-22 16:23:36', '2024-11-22 16:23:36', 10),
(59, 'Áo Polo Daily', 48000, NULL, 'Áo polo thời trang nữ linh hoạt và thoải mái. Thiết kế cổ đức có khuy cài, gấu tay bo nhẹ. Áo được làm từ chất liệu thun co giãn nhẹ, thoáng khí với đường may chắc chắn, tỉ mỉ tạo nên vẻ bền bỉ và chất lượng.Dễ dàng kết hợp với nhiều kiểu quần như jean, chino hoặc chân váy, tạo nên phong cách thời trang xu hướng. ', '2024-11-22 16:24:12', '2024-11-22 16:24:12', 10),
(60, 'Áo thun A la More', 45000, NULL, 'Áo được làm từ chất liệu cotton, giúp mang lại sự thoải mái và mềm mại cho người mặc.Áo thun cổ tròn, tay ngắn, dáng suông. Phần cổ áo được nhấn viền khác màu kết hợp chữ cùng họa tiết bắt mắt trên thân trước. Thiết kế dễ dàng phối hợp với nhiều loại quần, từ jeans đến shorts, tạo ra những outfits phù hợp cho nhiều dịp khác nhau.', '2024-11-22 16:24:31', '2024-11-22 16:24:31', 10),
(61, 'Áo thun viền cổ tay ren', 59000, NULL, 'Áo thun cổ tròn, tay ngắn, độ dài thường, dáng suông cơ bản.Áo có màu trắng, tạo điểm tương phản nổi bật qua đường viền cổ sắc nét. Tay áo tạo điểm nhấn qua chi tiết phối ren độc đáo, mới lạ.', '2024-11-22 16:24:57', '2024-11-22 16:24:57', 10),
(62, 'Áo thun bo gấu dáng ngắn', 52000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:26:17', '2024-11-22 16:26:17', 10),
(63, 'Áo thun ôm cổ đổ', 52000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:26:32', '2024-11-22 16:26:32', 10),
(64, 'Áo thun ôm cổ cách điệu', 48000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:26:49', '2024-11-22 16:26:49', 10),
(65, 'Áo thun khoác ngoài Ladies Croptop Tay Dài', 25000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:27:03', '2024-11-22 16:27:03', 10),
(66, 'Áo thun tay phối ren', 52000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:27:20', '2024-11-22 16:27:20', 10),
(67, 'Áo thun Moments', 52000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:27:34', '2024-11-22 16:27:34', 10),
(68, 'Áo thun dập họa tiết', 55000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:27:43', '2024-11-22 16:27:43', 10),
(69, 'Áo thun Pink baby', 45000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:27:52', '2024-11-22 16:27:52', 10),
(70, 'Áo thun Spring Time', 52000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:28:02', '2024-11-22 16:28:02', 10),
(71, 'Áo Polo cartoon', 55000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:28:14', '2024-11-22 16:28:14', 10),
(72, 'Áo 2 dây Batiste', 37000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:28:32', '2024-11-22 16:28:32', 10),
(73, 'Áo len ôm tay ngắn', 73000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:28:42', '2024-11-22 16:28:42', 10),
(74, 'Áo thun ôm thiết kế dây rút sườn', 55000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:29:00', '2024-11-22 16:29:00', 10),
(75, 'Áo thun đính chữ Blink', 41000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:29:13', '2024-11-22 16:29:13', 10),
(76, 'Áo thun cổ V xếp chéo', 48000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:29:27', '2024-11-22 16:29:27', 10),
(77, 'Áo thun thêu hoa Ensoleille', 34000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:29:48', '2024-11-22 16:29:48', 10),
(78, 'Áo thun IVY moda', 30000, NULL, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.Thiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.Áo nổi bật với tay liền, kiểu dáng croptop bo gấu, mang vẻ đẹp kiêu sa, thời thượng.', '2024-11-22 16:30:04', '2024-11-22 16:30:04', 10),
(79, 'Áo len kẻ tay ngắn', 990000, NULL, 'Áo len ngắn tay, dáng suông, bo viền khác màu. Điểm nhấn áo nằm ở họa tiết kẻ bắt mắt, đầy ấn tượng. Sự kết hợp tinh tế giúp tôn lên vẻ đẹp tối giản và tạo nên sự khác biệt trong thiết kế.Áo lựa chọn chất liệu len mềm mịn, giữ ấm cơ thể tốt mà không gây  kích ứng da. Chiếc áo sẽ là lựa chọn hoàn hảo cho những buổi đi chơi, dạo phố hay hẹn hò cùng bạn bè, gia đình. ', '2024-11-25 14:29:22', '2024-11-25 14:29:22', 13),
(80, 'Áo khoác len kẻ', 1290000, NULL, 'Thêm chút hiện đại qua kiểu dáng trẻ trung sẽ tạo nên phiên bản hoàn hảo cho chiếc áo len Thu - Đông năm nay. Áo khoác dáng suông, tay dài, đan len phối hai màu tươi sáng. Bạn có thể kết hợp áo với nhiều kiểu quần và chân váy khác nhau. Nếu thời tiết lạnh chỉ cần thêm một áo khoác ngoài là đã có ngay một set đồ xuống phố.  ', '2024-11-25 14:29:52', '2024-11-25 14:29:52', 13),
(81, 'Khoác cardigan len khuy kiểu', 1190000, NULL, 'Áo khoác cardigan len cổ tròn, tay dài. Thiết kế áo bo viền len gân và đổi màu nổi bật. Áo khoác cài bằng khuy kim loại phía trước. Sang trọng và tinh tế. Thiết kế này giúp quý cô trở nên thời thượng khi mix cùng chân zuýp ôm, boot cao gót. Được may từ vải len dệt kim cao cấp tạo cảm giác mềm mại, giữ nhiệt hiệu quả.', '2024-11-25 14:30:21', '2024-11-25 14:30:21', 13),
(82, 'Áo khoác len kẻ', 1250000, NULL, 'Thêm chút hiện đại qua kiểu dáng trẻ trung sẽ tạo nên phiên bản hoàn hảo cho chiếc áo len Thu - Đông năm nay. Áo khoác dáng suông, tay dài, đan len phối hai màu tươi sáng. Bạn có thể kết hợp áo với nhiều kiểu quần và chân váy khác nhau. Nếu thời tiết lạnh chỉ cần thêm một áo khoác ngoài là đã có ngay một set đồ xuống phố.  ', '2024-11-25 14:30:44', '2024-11-25 14:30:44', 13),
(83, 'Áo len kẻ caro', 1090000, NULL, 'Áo len ngắn tay, dáng suông, bo viền khác màu. Điểm nhấn áo nằm ở họa tiết kẻ caro đối lập, đầy ấn tượng. Sự kết hợp tinh tế giúp tôn lên vẻ đẹp tối giản và tạo nên sự khác biệt trong thiết kế.Áo lựa chọn chất liệu len mềm mịn, giữ ấm cơ thể tốt mà không gây  kích ứng da. Chiếc áo sẽ là lựa chọn hoàn hảo cho những buổi đi chơi, dạo phố hay hẹn hò cùng bạn bè, gia đình.', '2024-11-25 14:31:10', '2024-11-25 14:31:10', 13),
(84, 'Áo len mỏng họa tiết kẻ ngang', 1090000, NULL, 'Áo ngắn tay độ dài ngang hông, cổ polo chữ V. Thân áo chần chun co giãn. Dáng áo ôm tạo kiểu.Được may từ chất liệu vải len mềm mỏng, có độ đàn hồi cao và vẫn giữ được sự thoáng mát. Mix cùng chân zuýp, quần jeans đi làm đi chơi, hay xuống phố sau giờ tan tầm...', '2024-11-25 14:31:32', '2024-11-25 14:31:32', 13),
(85, 'Áo khoác len lông cừu merino', 3790000, NULL, 'Áo khoác len là item không thể thiếu vào những ngày đông. Thiết kế áo dáng suông may bo ôm ở cổ tay và eo mang lại sự trẻ trung, tôn dáng người mặc.Chất vải len cao cấp làm từ sợi len lông cừu Merino trứ danh. Cừu Merino là một giống cừu nổi tiếng về việc cho lông cừu làm len. Đây là giống cừu có bộ lông tuyệt vời với những sợi lông cực mảnh, mềm và trắng, là nguyên liệu cho loại len mịn và tốt nhất thế giới với những đặc tính nổi bật như mềm mại, êm ái trên da; thoáng khí, hút ẩm tốt; độ đàn hồi và độ bền cao; giúp tăng khả năng chống tĩnh điện nên rất thân thiện với người mặc do đó góp phần tạo nên ưu thế của giống này. Với thiết kế basic cùng chất liệu cao cấp, chiếc áo len xứng đáng là item nên có cho tủ đồ đông của nàng bởi tính bền bỉ và không lỗi mốt. Áo mix cùng áo croptop 2 dây MS 12M7810 và chân váy len MS 30M7801 đồng bộ là nàng đã có 1 outfit đi chơi hoàn hảo.', '2024-11-25 14:31:59', '2024-11-25 14:31:59', 13),
(86, 'Áo 2 dây len lông cừu', 1290000, NULL, 'Thiết kế áo 2 dây croptop ôm sát tôn dáng người mặc. Chất liệu áo từ loại vải len cao cấp làm từ sợi len lông cừu Merino trứ danh. Cừu Merino là một giống cừu nổi tiếng về việc cho lông cừu làm len. Đây là giống cừu có bộ lông tuyệt vời với những sợi lông cực mảnh, mềm và trắng, là nguyên liệu cho loại len mịn và tốt nhất thế giới với những đặc tính nổi bật như mềm mại, êm ái trên da; thoáng khí, hút ẩm tốt; độ đàn hồi và độ bền cao; giúp tăng khả năng chống tĩnh điện nên rất thân thiện với người mặc do đó góp phần tạo nên ưu thế của giống này. ', '2024-11-25 14:32:23', '2024-11-25 14:32:23', 13),
(87, 'Áo len lông cừu đục lỗ', 2600000, NULL, 'Thiết kế áo lấy cảm hứng từ áo polo ngắn tay, cổ đức cùng hàng khuy kim loại tạo kiểu, tay và gấu áo may bo co giãn.Chất vải len làm từ sợi len lông cừu cao cấp với những đặc tính nổi bật như mềm mại, êm ái trên da; thoáng khí, hút ẩm tốt; độ đàn hồi và độ bền cao; giúp tăng khả năng chống tĩnh điện nên rất thân thiện với người mặc. Chất vải len mỏng tạo kiểu đục lỗ trẻ trung phù hợp diện vào mùa Xuân Hè này. Áo có độ xuyên thấu nhẹ, phía trước phối 2 túi vuông giúp trang phục thêm kín đáo.', '2024-11-25 14:32:56', '2024-11-25 14:32:56', 13),
(88, 'Áo khoác len lông cừu mỏng', 2790000, NULL, 'Áo khoác len cổ tròn dài tay. Cài bằng hàng khuy kim loại phía trước vừa tạo điểm nhấn, vừa mang lại vẻ thanh lịch.Chất vải len làm từ sợi len lông cừu cao cấp với những đặc tính nổi bật như mềm mại, êm ái trên da; thoáng khí, hút ẩm tốt; độ đàn hồi và độ bền cao; giúp tăng khả năng chống tĩnh điện nên rất thân thiện với người mặc.', '2024-11-25 14:33:25', '2024-11-25 14:33:25', 13),
(89, 'Áo khoác len lông cừu', 3090000, NULL, 'Áo khoác len cổ V dài tay. Cài bằng hàng khuy kim loại phía trước vừa tạo điểm nhấn, vừa mang lại vẻ thanh lịch.Chất vải len làm từ sợi len lông cừu cao cấp với những đặc tính nổi bật như mềm mại, êm ái trên da; thoáng khí, hút ẩm tốt; độ đàn hồi và độ bền cao; giúp tăng khả năng chống tĩnh điện nên rất thân thiện với người mặc.', '2024-11-25 14:33:56', '2024-11-25 14:33:56', 13),
(90, 'Áo len mỏng dáng ôm', 990000, NULL, 'Áo len cổ cao, tay lỡ, áo dáng ôm tôn dáng. Chất liệu len dệt kim cao cấp, mềm mại, mịn màng, không xù, không bai dão, phù hợp thời tiết se lạnh. Áo dễ dàng mix cùng các kiểu váy dây, chân váy hay jeans cho nàng nhiều set đồ ưng ý đi chơi, hẹn hò hay đi làm...', '2024-11-25 14:34:22', '2024-11-25 14:34:22', 13),
(91, 'Point Supima - Áo thun Regular', 490000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:46:23', '2024-11-25 14:46:23', 19),
(92, 'Áo thun Ice cotton Regular tay ngắn', 490000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:46:37', '2024-11-25 14:46:37', 19),
(93, 'Áo thun Daily Metagent', 390000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:46:50', '2024-11-25 14:46:50', 19),
(94, 'Áo thun Regular CASUAL Supima', 490000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:47:01', '2024-11-25 14:47:01', 19),
(95, 'Áo thun Supima FIRE STARTS', 490000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:47:15', '2024-11-25 14:47:15', 19),
(96, 'Áo Tanktop Regular FIRE STARTS', 450000, NULL, 'Áo thun cổ tròn,thiết kế không tay,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:47:43', '2024-11-25 14:47:43', 19),
(97, 'Endless Summer - Áo thun Regular Supima', 450000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:48:08', '2024-11-25 14:48:08', 19),
(98, 'Áo thun Regular ICE COTTON', 550000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:48:21', '2024-11-25 14:48:21', 19),
(99, 'Áo thun Regular Car', 490000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:48:39', '2024-11-25 14:48:39', 19),
(100, 'Áo thun Regular Supima MOUNTAIN', 490000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:48:48', '2024-11-25 14:48:48', 19),
(101, 'Áo thun Regular ICE phối màu', 520000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:49:00', '2024-11-25 14:49:00', 19),
(102, 'Áo thun Regular Holiday', 490000, NULL, 'Áo thun cổ tròn,thiết kế tay ngắn,họa tiết trơn kết hợp viền kẻ nổi bật', '2024-11-25 14:49:13', '2024-11-25 14:49:13', 19),
(103, 'Áo thun dài tay METAGENT', 890000, NULL, 'Áo thun Basic METAGENT dài tay với kiểu dáng Regular trẻ trung, hiện đại. Dáng áo suông, mặc thoải mái, thích hợp cả buông và sơ vin. Áo có thể mix với nhiều kiểu quần khác nhau như quần Tây, quần Short, quần Khaki...tất cả đều làm thay đổi tổng thể diện mạo Quý anh trở nên lịch lãm hơn. Thiết kế áo in chữ METAGENT nổi bật, chất liệu in bóng bền màu cao. Áo lựa chọn chất liệu vải cao cấp, mềm mại và thoáng mát, chắc chắn đây sẽ là sự lựa chọn tuyệt vời mùa Thu này.', '2024-11-25 14:50:01', '2024-11-25 14:50:01', 19),
(104, 'Áo thun Your Dream', 370000, NULL, 'Áo cổ tròn, tay cộc, kiểu dáng Slim fit, độ dài vừa phải. Thiết kế phù hợp với quý anh yêu thích vẻ ngoài hiện đại, trẻ trung, năng động. Thân trước áo tạo điểm nhấn mây in 3D sắc nét với chủ đề Your Dream, bắt mắt người nhìn. Sản phẩm được sản xuất từ Ice Cotton, một chất liệu phát triển bởi SPOERRY Thụy Sĩ. Vải có độ xoắn cao, lông tơ sẽ bị triệt tiêu, mang đến cảm giác mát lạnh.Thấm hút mồ hôi tốt, mang đến cảm giác mặc thoải mái, thích hợp với các hoạt động ngoài trời.  ngay điểm chạm đầu tiên trên da.', '2024-11-25 14:50:46', '2024-11-25 14:50:46', 19),
(105, 'Prime Polo - Áo Polo Modal Slim Fit', 590000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 14:59:55', '2024-11-25 14:59:55', 11),
(106, 'Áo Polo Slim fit Point Man', 620000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 15:00:21', '2024-11-25 15:00:21', 11),
(107, 'Áo Polo Modal Slim Fit phối cổ', 590000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 15:00:38', '2024-11-25 15:00:38', 11),
(108, 'Milo Polo - Áo Polo Regular Supima', 650000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 15:00:51', '2024-11-25 15:00:51', 11),
(109, 'Áo Polo Modal Slim fit phối viền', 620000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 15:01:04', '2024-11-25 15:01:04', 11),
(110, 'Áo Polo Modal Slim fit', 660000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 15:01:26', '2024-11-25 15:01:26', 11),
(111, 'Áo Polo Modal cổ đức phối kẻ', 620000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 15:01:41', '2024-11-25 15:01:41', 11),
(112, 'Áo Polo Regular phối màu', 620000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 15:01:50', '2024-11-25 15:01:50', 11);
INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(113, 'Áo Polo Slim fit In Heart', 590000, NULL, 'Áo polo cổ đức, thiết kế tay ngắn , cài khuy thời thượng ', '2024-11-25 15:02:02', '2024-11-25 15:02:02', 11),
(114, 'Polo len họa tiết kẻ', 1190000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Áo polo len cộc tay thành công thể hiện tính  hài hòa giữa thời trang và sự thoải mái, một sự lựa chọn không thể thiếu trong tủ đồ của Quý anh thời thượng.Thiết kế kiểu dáng polo lịch lãm. Họa tiết kẻ làm nổi bật, giúp tăng thời trang. Áo có chất liệu len tổng hợp, ấm áp, thoải mái và có khả năng giữ nhiệt cao.Áo polo len cộc tay dễ dàng phối đồ với quần jeans, quần tây, hoặc quần kaki. Quý anh cân nhắc diện áo trong nhiều tình huống khác nhau, từ đến nơi công sở, tham dự sự kiện đến gặp gỡ bạn bè. ', '2024-11-25 15:02:42', '2024-11-25 15:02:42', 11),
(115, 'Knit Polo - Áo len cổ đức', 1190000, NULL, 'Áo len cổ đức, thiết kế 3 khuy cài. Áo kiểu dáng Regular fit, hơi ôm cơ thể. Áo độ dài thường, thích hợp sơ vin để tạo nên những Outfit thời thượng cho Quý anh. Knit Polo sử dụng công nghệ dệt len tiêu chuẩn mang đến chất len mềm, nhẹ phù hợp với thời tiết sang Thu. ', '2024-11-25 15:03:11', '2024-11-25 15:03:11', 11),
(116, 'Zipped Polo', 590000, NULL, 'Thiết kế kiểu dáng Regular giúp người mặc thoải mái di chuyển và hoạt động, không bị hạn chế động tác.Chất liệu thun mềm mại và mịn màng, mang đến cảm giác dễ chịu và thoải mái cho người mặc, đặc biệt là trong những ngày hè nóng bức.Điểm nhấn của chiếc áo là khóa kéo ở cổ, giúp cho việc mặc và tháo áo trở nên nhanh chóng và tiện lợi hơn. Khoá kéo cổ áo cũng tạo thêm phần thời trang và sự sang trọng cho sản phẩm này. ', '2024-11-25 15:03:40', '2024-11-25 15:03:40', 11),
(117, 'Áo thun polo kẻ viền', 250000, NULL, 'Chất liệu thun co giãn tốt, mềm mại khi sử dụng. Kiểu áo regular fit phù hợp với vóc dáng người Việt.Áo cổ đức rộng thoáng, cổ liền hàng 3 khuy cài.Thiết kế dáng trơn đơn giản, lịch sự, trẻ trung, năng động, dáng tay ngắn thoáng mát trong mùa Xuân Hè.', '2024-11-25 15:04:22', '2024-11-25 15:04:22', 11),
(118, 'Áo Polo thêu họa tiết', 250000, NULL, 'Chất liệu thun co giãn tốt, mềm mại khi sử dụng. Kiểu áo regular fit phù hợp với vóc dáng người Việt.Áo cổ đức rộng thoáng, cổ liền hàng 3 khuy cài.Thiết kế dáng trơn đơn giản, lịch sự, trẻ trung, năng động, dáng tay ngắn thoáng mát trong mùa Xuân Hè.', '2024-11-25 15:04:35', '2024-11-25 15:04:35', 11),
(119, 'Áo sơ mi Regular kẻ sọc', 760000, NULL, 'Áo cổ đức. Tay áo dài. Thiết kế cài khuy trước thân. Áo độ dài thường', '2024-11-25 15:17:09', '2024-11-25 15:17:09', 20),
(120, 'Áo sơ mi Regular Linen Cotton', 870000, NULL, 'Áo cổ đức. Tay áo dài. Thiết kế cài khuy trước thân. Áo độ dài thường', '2024-11-25 15:17:20', '2024-11-25 15:17:20', 20),
(121, 'Áo sơ mi Regular tay ngắn Basic', 690000, NULL, 'Áo cổ đức. Thiết kế tay cộc. Có khuy cài. Kiểu dáng Regular', '2024-11-25 15:17:51', '2024-11-25 15:17:51', 20),
(122, 'Áo sơ mi Regular kẻ phối túi', 510000, NULL, 'Áo sơ mi cổ đức. Thiết kế tay dài. Khuy cài ở thân trước và cổ tay. Họa tiết chấm bi nhỏ', '2024-11-25 15:18:34', '2024-11-25 15:18:34', 20),
(123, 'Cyrus Shirt - Sơ mi trơn lịch lãm', 390000, NULL, 'Áo sơ mi Slim fit, cổ đức. Tay áo dài, độ dài thường, màu sắc trơn. Thiết kế áo khuy cài phía trước và  khuy cố định ở cổ, tay áo. Áo lựa chọn chất liệu vải mềm mịn, được dệt đan sợi dưới nền vải.Kiểu dáng Slim fit thiết kế form ôm nhẹ, tôn đường nét của cơ thể. Tông màu lịch lãm, dễ phối nhiều trang phục như quần jean, short, quần tây... Áo có thể sơ vin hoặc thả suông. ', '2024-11-25 15:18:59', '2024-11-25 15:18:59', 20),
(124, 'Áo sơ mi Slim fit Basic', 430000, NULL, 'Áo sơ mi Slim fit, cổ đức. Tay áo dài, độ dài thường, màu sắc trơn. Thiết kế áo khuy cài phía trước và  khuy cố định ở cổ, tay áo. Áo lựa chọn chất liệu vải mềm mịn, được dệt đan sợi dưới nền vải.Kiểu dáng Slim fit thiết kế form ôm nhẹ, tôn đường nét của cơ thể. Tông màu lịch lãm, dễ phối nhiều trang phục như quần jean, short, quần tây... Áo có thể sơ vin hoặc thả suông. ', '2024-11-25 15:19:18', '2024-11-25 15:19:18', 20),
(125, 'Áo sơ mi Regular tay dài', 500000, NULL, 'Áo sơ mi dáng Regular mang vẻ đẹp cổ điển, thời thượng giúp tôn lên vẻ đẹp nam tính của quý anh. Thiết kế áo tay dài, độ dài thường, cổ đức, cổ tay áo có nấc khuy để người mặc điều chỉnh.Dáng áo có độ rộng nhẹ nên khi sơ vin không khiến người mặc cảm thấy bí bách. Form áo vuông vắn khi mix cùng quần Tây sẽ giúp quý anh trông phong độ hơn rất nhiều. Chất liệu vải Bamboo ( vải sợi tre) bền chắc, an toàn và thân thiện với môi trường. Thiết kế mềm mại, thoáng khí, thấm hút mồ hôi tốt, chống tia UV và đặc biệt là ít nhăn.', '2024-11-25 15:19:55', '2024-11-25 15:19:55', 20),
(126, 'Áo sơ mi tay cộc cổ đức', 500000, NULL, 'Thiết kế sơ mi nam cộc tay đẹp và thời trang, phù hợp với những người yêu thích phong cách lịch sự nhưng không kém phần thoải mái.', '2024-11-25 15:20:15', '2024-11-25 15:20:15', 20),
(127, 'Áo sơ mi vải thô phối túi', 300000, NULL, 'Thiết kế sơ mi nam cộc tay đẹp và thời trang, phù hợp với những người yêu thích phong cách lịch sự nhưng không kém phần thoải mái.', '2024-11-25 15:20:31', '2024-11-25 15:20:31', 20),
(128, 'Áo sơ mi họa tiết chấm bi', 350000, NULL, 'Thiết kế sơ mi nam dài tay đẹp và thời trang, phù hợp với những người yêu thích phong cách lịch sự nhưng không kém phần thoải mái.', '2024-11-25 15:20:51', '2024-11-25 15:20:51', 20),
(129, 'Áo sơ mi họa tiết kẻ', 350000, NULL, 'Áo sơ mi dáng regular fit phù hợp với vóc dáng người Việt.  Thiết kế áo cơ bản, cổ áo và cổ tay đứng phom, cài bằng hàng khuy nhựa trong suốt.', '2024-11-25 15:21:10', '2024-11-25 15:21:10', 20),
(130, 'Áo sơ mi Khaki túi ngực', 350000, NULL, 'Áo sơ mi tay dài, dáng regular trẻ trung, hiện đại. Thiết kế áo cơ bản, cổ áo và cổ tay đứng phom, cài bằng hàng khuy nhựa tinh tế.', '2024-11-25 15:21:32', '2024-11-25 15:21:32', 20),
(131, 'Áo sơ mi vải thô dáng slim fit', 350000, NULL, 'Chất liệu thô được dệt từ các loại sợi tự nhiên, mềm mại khi sử dụng.Kiểu dáng Slim fit ôm vừa vặn vào cơ thể những vẫn tạo cảm giác thoải mái cho người mặc, phù hợp với vóc dáng người Việt.Thiết kế túi vuông nhỏ một bên tạo điểm nhấn trẻ trung, năng động, dáng tay dài phù hợp với nhiều mùa trong năm.', '2024-11-25 15:22:01', '2024-11-25 15:22:01', 20),
(132, 'Áo sơ mi kẻ caro phối túi', 350000, NULL, ' Áo sơ mi dáng regular fit, cổ đức, tay dài.Chất liệu vải thô mềm mát, ít nhăn. Họa tiết kẻ caro phối màu bắt mắt Cài bằng hàng khuy phía trước, phối túi ngực bên trái tạo kiểu', '2024-11-25 15:22:29', '2024-11-25 15:22:29', 20),
(133, 'Áo sơ mi dạ flannel', 350000, NULL, ' Áo sơ mi dáng regular, cổ đức, dài tay Ngực phải phối túi vuông Chất liệu vải thô dạ dày dặn, giữ ấm tốt', '2024-11-25 15:23:00', '2024-11-25 15:23:00', 20),
(134, 'Crest jumper - Áo len phối màu Regular fit', 1290000, NULL, ' Áo cổ tròn , Thiết kế tay dài , Chất liệu len tổng hợp cao cấp, Áo đan mix màu hiện đại', '2024-11-25 15:33:26', '2024-11-25 15:33:26', 21),
(135, 'Áo len trơn cổ tròn', 1290000, NULL, 'Mẫu len nam mới nhất thành công mang đến sự thoải mái, đơn giản qua kiểu dáng cổ tròn và màu sắc trơn trung tính để trở thành lựa chọn yêu thích trong tủ đồ mùa lạnh của Quý anh yêu thời trang.Áo len nam được làm từ chất liệu len cao cấp, được dệt từ những sợi tổng hợp tuyển chọn, tạo cảm giác ấm áp và thoải mái.Áo có đường may chắc chắn, tỉ mỉ bên cạnh ngoại hình vô cùng chỉn chu.Thiết kế dễ dàng phối hợp với nhiều kiểu trang phục khác nhau, từ quần jean, quần kaki đến quần khaki, với phong cách thoải mái và trẻ trung.', '2024-11-25 15:34:23', '2024-11-25 15:34:23', 21),
(136, 'Áo len Slim fit basic', 1390000, NULL, 'Áo len cổ tròn, viền cổ nổi, to bản 1cm. Thiết kế tay dài, kiểu dáng Slim fit trẻ trung, hiện đại. Gấu áo và cổ tay dệt kim cố định, tạo độ bo nhẹ.Thiết kế basic dễ dàng mix cùng nhiều item khác nhau để tạo nên những Outfit thời thượng.Chất áo len mịn, được thêu dệt tỉ mỉ đến từng chi tiết, giữ ấm tốt và mang đến cảm giác thoải mái khi mặc. .', '2024-11-25 15:47:09', '2024-11-25 15:47:09', 21),
(137, 'Áo len phối màu', 1390000, NULL, 'Tạm thời xa các thiết kế basic, một chiếc áo len phối màu theo hình khối là lựa chọn lý tưởng để làm mới bản thân.Sợi len mềm mại, quy trình sản xuất đạt chuẩn Quốc tế cùng thiết kế suông thoải mái.Kết hợp cùng áo sơ mi, quần âu hay dầy sneaker, bạn sẽ luôn tự tin với vẻ ngoài của mình. .', '2024-11-25 15:47:31', '2024-11-25 15:47:31', 21),
(138, 'Áo len Slim fit basic', 1390000, NULL, 'Áo len cổ tròn, viền cổ nổi, to bản 1cm. Thiết kế tay dài, kiểu dáng Slim fit trẻ trung, hiện đại. Gấu áo và cổ tay dệt kim cố định, tạo độ bo nhẹ.Thiết kế basic dễ dàng mix cùng nhiều item khác nhau để tạo nên những Outfit thời thượng.', '2024-11-25 15:47:53', '2024-11-25 15:47:53', 21),
(139, 'Knit Polo - Áo len cổ đức', 1190000, NULL, 'Áo len cổ đức, thiết kế 3 khuy cài. Áo kiểu dáng Regular fit, hơi ôm cơ thể. Áo độ dài thường, thích hợp sơ vin để tạo nên những Outfit thời thượng cho Quý anh. Knit Polo sử dụng công nghệ dệt len tiêu chuẩn mang đến chất len mềm, nhẹ phù hợp với thời tiết sang Thu.  Nếu Quý anh đang muốn tìm kiểm một thiết kế hiện đại, trẻ trung mà còn mang lại sự lịch lãm cho mùa Thu/ Đông này thì đừng bỏ lỡ phiên bản áo len Polo này. ', '2024-11-25 15:48:21', '2024-11-25 15:48:21', 21),
(140, 'Áo len kẻ cổ tròn', 1290000, NULL, 'Kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Mang đến vẻ năng động và lịch lãm qua mẫu áo len họa tiết kẻ, đây chính là item không thể thiếu trong tủ đồ quý anh trong thời tiết se lạnh này. Cổ áo tròn dễ mặc. Họa tiết kẻ ngang tạo sự cân đối, giúp người mặc trông cao hơn. Đặc biệt, thiết kế sử dụng chất liệu len mềm mại, ấm áp và và thoải mái. Quý anh có thể kết hợp chúng với quần jeans, quần tây, hoặc quần kaki tùy theo tình huống. Hay để tạo nên một vẻ ngoại hình lịch lãm, mix thêm một chiếc áo phông, sơ mi hoặc áo khoác nhẹ.', '2024-11-25 15:49:06', '2024-11-25 15:49:06', 21),
(141, 'Áo len dệt Jacquad', 1390000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:49:31', '2024-11-25 15:49:31', 21),
(142, 'Áo len lông cừu Metagent', 1430000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:49:45', '2024-11-25 15:49:45', 21),
(143, 'Áo len Polo phối viền', 430000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:49:59', '2024-11-25 15:49:59', 21),
(144, 'Áo polo len lông cừu', 1230000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:50:25', '2024-11-25 15:50:25', 21),
(145, 'Áo len lông cừu dáng slim fit', 1350000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:50:43', '2024-11-25 15:50:43', 21),
(146, 'Áo len lông cừu basic', 1160000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:50:59', '2024-11-25 15:50:59', 21),
(147, 'Áo khoác len lông cừu cổ đức', 1590000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:51:39', '2024-11-25 15:51:39', 21),
(148, 'Áo len lông cừu phối viền', 1150000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:51:50', '2024-11-25 15:51:50', 21),
(149, 'Áo len lông cừu dáng slim fit', 1150000, NULL, 'Lấy cảm hứng từ sự kết hợp tinh tế giữa văn hoá đô thị và phong cách cá nhân, BST URBAN REFINED tôn vinh sự hiện đại và tối giản trong bản sắc thời trang của những quý anh thành thị.Xuất hiện trong BST thời trang Thu Đông lần này, áo len dệt Jacquad tạo điểm nhấn qua cấu trúc dệt hoa văn độc đáo giúp nổi bật vẻ đẹp lịch lãm và phong cách thời trang cá nhân của quý anh. ', '2024-11-25 15:52:01', '2024-11-25 15:52:01', 21),
(150, 'Áo len basic dáng regular fit', 450000, NULL, 'Chất liệu vải len dệt mềm mịn không gây ngứa. Khả năng giữ ấm tốt, chất vải co giãn nhẹ, độ đàn hồi tốt.Thiết kế basic không lỗi mốt, phom dáng regular trẻ trung phù hợp với vóc dáng người Việt', '2024-11-25 15:52:34', '2024-11-25 15:52:34', 21),
(151, 'Áo blazer công sở tay ngắn', 1180000, NULL, 'Áo blazer là thiết kế hoàn hảo dành cho các cô nàng công sở đang tìm kiếm bộ trang phục trẻ trung, cá tính nhưng vẫn giữ được nét lịch sự, duyên dáng.Thiết kế kế thừa vẻ đẹp của phom dáng cổ điển, cách điệu thêm sự phóng khoáng qua dáng tay ngắn. Mix cùng MS 20M8698 để tạo set bộ thời trang và hiện đại. Sản phẩm kết hợp từ 3 dòng chất liệu Rayon, Poly, Spandex cao cấp, mang đến kết cấu mịn, thoải mái, tạo cảm  giác mềm mại khi chạm vào. Ngoài ra, chất liệu có độ rủ tự nhiên và  khả năng chống thấm nước, thoáng khí mát mẻ dành cho mùa hè.', '2024-11-25 16:04:19', '2024-11-25 16:04:19', 14),
(152, 'Áo vest cách điệu tay bồng', 680000, NULL, 'Sản phẩm áo vest cách điệu tay bồng của Ivy Moda là một sự kết hợp tuyệt vời giữa phong cách công sở và sự sang trọng hiện đại. Với kiểu dáng croptop tay ngắn, sản phẩm tôn lên vẻ ngoài tươi trẻ và cá tính của người mặc.Chất liệu tuytsi cao cấp được sử dụng cho mang lại sự mềm mại, thoải mái và độ bền cao. Thiết kế cách điệu tay bồng tạo nên sự nhẹ nhàng, bay bổng cho người mặc, giúp bạn tự tin hơn khi diện sản phẩm này.Áo vest cách điệu tay bồng có thể dễ dàng kết hợp với nhiều trang phục khác nhau, từ chân váy đến quần jean, giúp bạn tạo ra nhiều phong cách thời trang khác nhau. Với sự kết hợp độc đáo giữa phong cách cổ điển và hiện đại, sản phẩm này sẽ là một lựa chọn hoàn hảo cho các buổi gặp gỡ bạn bè, tiệc tùng hoặc những ngày làm việc tại văn phòng.', '2024-11-25 16:05:00', '2024-11-25 16:05:00', 14),
(153, 'Silver Mist Blazer', 1790000, NULL, 'Khẳng định vẻ đẹp thời trang xu hướng qua ấn phẩm Silver Mist Blazer trong BST EXPRESS, tham gia trình diễn tại show thời trang FALL/WINTER 2023, nơi những giá trị đích thực được đánh thức và tỏ bày thông qua các thiết kế cao cấp nhất!Thiết kế áo blazer được kế thừa vẻ đẹp của form dáng áo vest cổ điển: dáng suông, có túi kiểu. Chất liệu tuysi mềm nhẹ, thoáng mát, ít nhăn và giữ form dáng tốt. Tất cả đã tạo nên cấu trúc thanh lịch, sang trọng mà vẫn đảm bảo tính thoải mái.Không chỉ đẹp từ thiết kế đến chất liệu, set đồ còn mang tính ứng dụng cao, phù hợp cho các cô nàng diện nơi công sở và đi dự sự kiện. ', '2024-11-25 16:05:28', '2024-11-25 16:05:28', 14),
(154, 'Áo Blazer Dahlia Set', 1320000, NULL, 'Thiết kế set bộ với áo blazer cùng quần short cá tính là lựa chọn hoàn hảo dành cho cô nàng công sở đang tìm kiếm sự trẻ trung, cá tính nhưng vẫn đảm bảo tính chuyên nghiệp, lịch sự khi đi làm. Bản phối Dahlia Set từ MS 67M8817 kết hợp MS 20M8817 sẽ là một gợi ý từ IVY moda cho tủ đồ Xuân - Hè của nàng. Áo blazer lên dáng cổ V, tay ngắn, form suông thoải mái. Thiết kế được dệt điểm hoa tạo hiệu ứng mắt mắt, điểm nhấn cho bộ trang phục. Item thành công kế thừa vẻ đẹp của phom dáng cổ điển cũng như cách điệu thêm sự phóng khoáng, hiện đại. Sản phẩm kết hợp từ 2 dòng chất liệu Rayon, Poly cao cấp, mang đến kết cấu mịn, thoải mái, tạo cảm  giác mềm mại khi chạm vào. Ngoài ra, chất liệu có độ rủ tự nhiên và  khả năng chống thấm nước, thoáng khí mát mẻ dành cho mùa hè.Xu hướng nữ quyền được IVY moda kết hợp giữa vẻ đẹp thanh lịch, sang trọng nhưng vẫn đề cao sự thoải mái, dễ chịu từ phom dáng đến chất liệu mềm mại.Không chỉ đẹp từ thiết kế đến chất liệu, áo blazer còn mang tính ứng dụng cao, phù hợp cho các cô nàng diện nơi công sở và đi dự sự kiện. ', '2024-11-25 16:06:02', '2024-11-25 16:06:02', 14),
(155, 'Phedra Vest - Áo vest xếp chéo', 520000, NULL, 'Phedra Vest nằm trong BST EXPRESS tham gia trình diễn tại show thời trang FALL/WINTER 2023, nơi những giá trị đích thực được đánh thức và tỏ bày thông qua các thiết kế cao cấp nhất ! Thiết kế được biến tấu từ áo khoác cổ hai ve cổ điển bên cạnh dáng croptop trẻ trung, hiện đại. Áo có tay dài, cách điệu giấu khuy, vừa mang đến sự cá tính vừa thể hiện gu thẩm mỹ thời thượng của nàng công sở đam mê thời trang. Chất liệu vải Tuysi cao cấp và mềm mại, bên trong có một lớp lót lụa cùng màu giúp cho item này có sự trẻ trung, phối đồ với đa dạng phong cách khác nhau từ chân váy, quần baggy, quần suông đều rất ưng ý.', '2024-11-25 16:06:29', '2024-11-25 16:06:29', 14),
(156, 'Sand Vest - Áo Vest phối khuy kiểu', 500000, NULL, 'Cho dù thời trang có bất kỳ biến số nào xuất hiện, kiểu dáng Vest quyền lực vẫn luôn giữ vững ngôi vương trong hàng trăm thiết kế, mang đến các quý cô vẻ ngoài sang trọng. Thiết kế nằm trong BST EXPRESS tham gia trình diễn tại show thời trang FALL/WINTER 2023, nơi những giá trị đích thực được đánh thức và tỏ bày thông qua các thiết kế cao cấp nhất! Được biến tấu từ dáng Vest cổ điển, Sand Vest nay được bổ sung thêm các chi tiết xếp ly kết hợp kiểu dáng hình thoi ở thân dưới, giúp thể hiện tính thời trang cũng như gu thẩm mỹ thời thượng. Quý cô chỉ cần mix thêm item Gile bên trong là đã có một trang phục xu hướng. ', '2024-11-25 16:08:32', '2024-11-25 16:08:32', 14),
(157, 'Áo khoác Twill dáng lửng', 750000, NULL, 'Áo khoác dài tay dáng ngắn cổ tròn, khuy cài kim loại gam vàng lấp lánh tạo độ ấn tượng cho chiếc áo màu ghi xám đẹp mắt, kèm theo đó là 2 chiếc túi nhỏ trước ngực tạo kiểu. Chất liệu Twill cao cấp và mềm mại, bên trong áo có lớp lụa lót cùng màu. Thiết kế nổi bật, ấn tượng và bắt mắt. ', '2024-11-25 16:09:06', '2024-11-25 16:09:06', 14),
(158, 'Trench coat Beige - Áo măng to 3 khuy', 900000, NULL, 'Trench coat Beige nằm trong BST EXPRESS tham gia trình diễn tại show thời trang EXPRESS - FALL/WINTER 2023 FASHION SHOW, nơi những giá trị đích thực được đánh thức và tỏ bày thông qua các thiết kế cao cấp nhất! Áo khoác thiết kế cổ hai ve bản to, dáng dài cùng màu sắc sang trọng, kiểu dáng vô cùng đẳng cấp. Với chất liệu Tuysi cao cấp bề mặt vải mềm mịn, không gây tích điện và khả năng giữ form cực tốt. Eo sử đụng đai đồng màu kèm hai hàng cúc mặt trước. thân dưới xòe nhẹ giúp người mặc sải bước tự tin khi đi xuống phố, đi làm, hay đi event...', '2024-11-25 16:10:00', '2024-11-25 16:10:00', 14),
(159, 'Áo vest Tweed Kose', 1900000, NULL, 'Nằm trong BST mùa thu đông 2024, “SOLAR - SHINE TOGETHER” được trình làng với giới mộ điệu như một bản hòa ca tôn vinh tinh thần tự do, sự lạc quan và vẻ đẹp rực rỡ của phái đẹp. Đánh dấu sự chuyển mình của phụ nữ trong thời hiện đại, vượt qua những tiêu chuẩn “kép” áp đặt lên họ.Những thiết kế trong BST hướng tới tôn vinh tính nữ hiện đại thông qua từng đường nét – từ sự mềm mại và duyên dáng đến sự mạnh mẽ và tự chủ. Mỗi sản phẩm đều thể hiện tính kiêu hãnh, đồng thời phá bỏ mọi rào cản để phụ nữ tự do thể hiện cá tính riêng, sống đúng với con người thật của mình.Áo vest Tweed Kose là một thiết kế thanh lịch và hiện đại, mang đến vẻ ngoài sang trọng với chất liệu tweed cao cấp, bền bỉ. Thiết kế cổ đức không chân mang đến sự tinh tế, mới mẻ, giúp chiếc áo vừa giữ được nét trang trọng của vest nhưng vẫn tạo cảm giác nhẹ nhàng, thoải mái cho người mặc. Độ dài ngang hông tôn dáng, cân đối và dễ phối đồ. Với kiểu dáng này, bạn có thể dễ dàng kết hợp áo vest với áo sơ mi, chân váy, quần tây hay quần jeans để tạo nên phong cách từ chuyên nghiệp đến thời trang đường phố.', '2024-11-25 16:10:40', '2024-11-25 16:10:40', 14),
(160, 'Áo vest Tuysi You Beige', 1900000, NULL, 'Nằm trong BST mùa thu đông 2024, “SOLAR - SHINE TOGETHER” được trình làng với giới mộ điệu như một bản hòa ca tôn vinh tinh thần tự do, sự lạc quan và vẻ đẹp rực rỡ của phái đẹp. Đánh dấu sự chuyển mình của phụ nữ trong thời hiện đại, vượt qua những tiêu chuẩn “kép” áp đặt lên họ.Những thiết kế trong BST hướng tới tôn vinh tính nữ hiện đại thông qua từng đường nét – từ sự mềm mại và duyên dáng đến sự mạnh mẽ và tự chủ. Mỗi sản phẩm đều thể hiện tính kiêu hãnh, đồng thời phá bỏ mọi rào cản để phụ nữ tự do thể hiện cá tính riêng, sống đúng với con người thật của mình.Tự tin, nổi bật với phong cách chuyên nghiệp, thanh lịch và hiện đại, áo vest là lựa chọn lý tưởng cho môi trường công sở hoặc các dịp trang trọng. Được làm từ chất liệu Tuysi cao cấp, áo vest mềm mại nhưng vẫn giữ phom dáng chuẩn, giúp người mặc thoải mái suốt cả ngày dài. Màu beige trung tính mang đến vẻ ngoài nhã nhặn, dễ phối đồ, phù hợp với nhiều tone màu da và phong cách thời trang khác nhau. ', '2024-11-25 16:11:48', '2024-11-25 16:11:48', 14),
(161, 'Áo Blazer kẻ Serge', 2600000, NULL, 'Thiết kế nằm trong BST “SOLAR - SHINE TOGETHER”, hướng tới tôn vinh tính nữ hiện đại thông qua từng đường nét – từ sự mềm mại và duyên dáng đến sự mạnh mẽ và tự chủ. Mỗi sản phẩm đều thể hiện tính kiêu hãnh, đồng thời phá bỏ mọi rào cản để phụ nữ tự do thể hiện cá tính riêng, sống đúng với con người thật của mình.Áo blazer mang đến vẻ đẹp thanh lịch và hiện đại với thiết kế trẻ trung, thời thượng. Chất liệu vải Serge dệt vân chéo cao cấp không chỉ mềm mại mà còn bền bỉ, giữ được phom dáng chuẩn trong suốt thời gian dài sử dụng. Họa tiết kẻ sọc tinh tế giúp chiếc áo trở nên nổi bật nhưng vẫn dễ phối đồ, tạo nên nhiều phong cách thời trang đa dạng.Thiết kế blazer với đường may chuẩn chỉnh, form dáng vừa vặn tôn lên vóc dáng và giúp người mặc trông thanh thoát, tự tin. Áo có túi hai bên tiện dụng và phần cổ bẻ tạo nên vẻ ngoài chỉn chu, thích hợp cho cả môi trường công sở và các dịp sự kiện. ', '2024-11-25 16:12:37', '2024-11-25 16:12:37', 14),
(162, 'Áo Gile Tuysi Cổ kiểu', 1300000, NULL, 'Thiết kế công sở hiện đại, ghi dấu ấn với tính thẩm mỹ cao cùng sự tinh tế qua các chi tiết tạo điểm nhấn mà không mất đi nét sang trọng vốn có.Áo gile mang đến vẻ đẹp thanh lịch, trẻ trung mà thời thượng. Chất liệu vải Tuysi không chỉ mềm mại mà còn bền bỉ, giữ được phom dáng chuẩn trong suốt thời gian dài sử dụng. Phần cổ đính khuy độc đáo giúp người mặc có thể phối thành 2 kiểu dáng khác nhau, tạo nên nhiều phong cách thời trang đa dạng.Thiết kế gile không tay, dáng ôm vừa vặn, giúp tôn lên vẻ ngoài lịch sự, chuyên nghiệp mà vẫn năng động. Hơn nữa, màu sắc trung tính và họa tiết kẻ tinh tế càng làm cho áo trở thành món đồ thời trang không thể thiếu trong tủ đồ của bạn.', '2024-11-25 16:13:36', '2024-11-25 16:13:36', 14),
(163, 'Áo Tweed kẻ Eagean', 2400000, NULL, 'Thiết kế nằm trong BST SAPPHIRE CHIC, lấy cảm hứng từ sắc xanh quý phái của đá Sapphire với những thiết kế công sở hiện đại, ghi dấu ấn với tính thẩm mỹ cao và sự tinh tế qua các chi tiết tạo điểm nhấn mà không mất đi nét sang trọng vốn có.Áo Tweed kẻ dáng suông thể hiện sự sang trọng và tinh tế, ựa chọn lý tưởng cho nàng yêu thích phong cách thời trang cổ điển. Chất liệu tweed cao cấp với bề mặt dệt kim độc đáo giúp áo vừa có độ bền chắc, vừa mềm mại, ấm áp cho những ngày se lạnh. Họa tiết kẻ xanh quý phái Eagean tạo điểm nhấn thời thượng, dễ dàng phối hợp với các trang phục khác.Thiết kế dáng suông thoải mái, không quá ôm sát, giúp người mặc luôn tự tin trong mọi hoạt động. Cổ tròn và đường viền tỉ mỉ càng tăng thêm vẻ sang trọng và chỉn chu cho chiếc áo. Bạn có thể dễ dàng kết hợp áo với quần tây, chân váy hoặc quần jeans để tạo nên nhiều phong cách khác nhau, từ công sở đến dạo phố.', '2024-11-25 16:14:24', '2024-11-25 16:14:24', 14),
(164, 'Áo Gile kẻ Serge', 1290000, NULL, 'Thiết kế nằm trong BST SAPPHIRE CHIC, lấy cảm hứng từ sắc xanh quý phái của đá Sapphire với những thiết kế công sở hiện đại, ghi dấu ấn với tính thẩm mỹ cao và sự tinh tế qua các chi tiết tạo điểm nhấn mà không mất đi nét sang trọng vốn có.Áo gile mang đến vẻ đẹp thanh lịch và hiện đại với thiết kế trẻ trung, thời thượng. Chất liệu vải Serge dệt vân chéo cao cấp không chỉ mềm mại mà còn bền bỉ, giữ được phom dáng chuẩn trong suốt thời gian dài sử dụng. Họa tiết kẻ sọc tinh tế giúp chiếc áo gile trở nên nổi bật nhưng vẫn dễ phối đồ, tạo nên nhiều phong cách thời trang đa dạng.', '2024-11-25 16:15:17', '2024-11-25 16:15:17', 14),
(165, 'Wool Trench Coat - Áo măng tô dạ lông cừu khâu tay', 9290000, NULL, 'Áo khoác thiết kế cổ chữ K bản to, dáng dài cùng màu sắc sang trọng, kiểu dáng vô cùng đẳng cấp. Với chất liệu áo làm bằng Lông cừu cao cấp, khâu tay 100% với các mũi khâu được khâu tỉ mỉ khéo léo không làm lộ chỉ. Với đặc điểm mềm, mỏng, nhẹ và giữ ấm tuyệt đối. Nắm bắt kịp xu hướng cũng như nhu cầu này, IVY moda đã cho ra đời BST áo khoác dạ ép lông cừu cao cấp đạt chuẩn với nhiều kiểu dáng, màu sắc cho phái đẹp lựa chọn.Lấy cảm hứng từ trang phục của quân đội châu Âu, những chiếc áo trench coat từ lâu đã khẳng định sự “thống trị” trong tủ đồ thời trang thu – đông. Thời thượng, thanh lịch nhưng không kém phần cá tính, áo trench coat dễ dàng làm xiêu lòng cả những quý cô khó tính nhất.', '2024-11-25 16:20:58', '2024-11-25 16:20:58', 14),
(166, 'Áo khoác Khaki Cropped Jacket', 1690000, NULL, 'Áo khoác cổ đức.Thiết kế tay dài.Khuy cài thân trước và gấu tay.Có 2 túi tiện lợi, thời trang', '2024-11-25 16:22:51', '2024-11-25 16:22:51', 5),
(167, 'Classic Bomber - Áo khoác Thu Đông', 1990000, NULL, 'Áo khoác Bomber không chỉ là một sản phẩm mặc giữ ấm mà còn là biểu tượng cho phong cách thời trang hiện đại và sự lịch lãm của Quý anh. Thiết kế chất lượng cao, chú trọng đến chi tiết, lựa chọn đáng giá trong tủ đồ mùa Đông này.', '2024-11-25 16:23:17', '2024-11-25 16:23:17', 5),
(168, 'Áo Khoác Kèm Mũ', 1990000, NULL, 'Mẫu áo khoác kèm mũ MS 70E4031 phù hợp sử dụng trong nhiều trường hợp. Là sự lựa chọn hoàn hảo cho những người thường xuyên phải di chuyển vào mùa ĐôngPhần tay dài kết hợp mũ đội rộng rãi và khóa kéo phía trước tiện lợi, dễ dàng kéo trượt. Cổ tay bo chun giúp cản gió, giữ ấm tuyệt đối trong quá trình sử dụng. .', '2024-11-25 16:23:56', '2024-11-25 16:23:56', 5),
(169, 'Áo khoác suông có mũ', 2290000, NULL, 'Một chiếc áo khoác gió trong tủ đồ luôn là sự chuẩn bị cần thiết trong mọi thời điểm, nhất là khi thời tiết thay đổi. Áo khoác sử dụng vải kỹ thuật chống nước và gió hiệu quả, bên trong có lớp lót giữ nhiệt cơ thể. Cổ cao, kèm mũ trùm đầu điều chỉnh được. Dài tay, cổ tay cài khóa nhám. Có túi cài khóa kéo trước ngực cùng túi hai bên sườn. Thiết kế áo dáng suông, tạo sự thoải mái và linh hoạt cho người mặc. ', '2024-11-25 16:24:48', '2024-11-25 16:24:48', 5),
(170, 'Chino Jacket - Áo khoác nam kéo khóa', 1490000, NULL, 'Áo khoác nam form suông, giúp người mặc thoải mái trong từng cử động, nhưng đồng thời vẫn đảm bảo vừa vặn về số đo vai, độ dài tay áo.Thiết kế tỉ mỉ đến từng chi tiết đem đến những trải nghiệm tuyệt vời nhất cho quý anh lịch lãm trong thời tiết vào thu. Chino Jacket  là sản phẩm bền chắc, bền màu và có độ bóng sáng tự nhiên. Đặc biệt, vải nhẹ và thoáng, giữ nhiệt tốt, hạn chế bám bụi, dễ chăm sóc và bảo quản.', '2024-11-25 16:25:32', '2024-11-25 16:25:32', 5),
(171, 'Áo khoác len lông cừu cổ đức', 1590000, NULL, 'Áo khoác nam form suông, giúp người mặc thoải mái trong từng cử động, nhưng đồng thời vẫn đảm bảo vừa vặn về số đo vai, độ dài tay áo.Thiết kế tỉ mỉ đến từng chi tiết đem đến những trải nghiệm tuyệt vời nhất cho quý anh lịch lãm trong thời tiết vào thu. ', '2024-11-25 16:26:15', '2024-11-25 16:26:15', 5),
(172, 'Áo khoác len', 790000, NULL, 'Áo khoác nam form suông, giúp người mặc thoải mái trong từng cử động, nhưng đồng thời vẫn đảm bảo vừa vặn về số đo vai, độ dài tay áo.Thiết kế tỉ mỉ đến từng chi tiết đem đến những trải nghiệm tuyệt vời nhất cho quý anh lịch lãm trong thời tiết vào thu. ', '2024-11-25 16:26:49', '2024-11-25 16:26:49', 5),
(173, 'Suede Jacket - Áo khoác sơ mi da lộn', 590000, NULL, 'Chất liệu da lộn mềm mại, đều màu, mịn như nhung, đem đến cho người mặc phong cách trẻ trung, cá tính và mang lại cảm giác ấm áp vào mùa đông.Thiết kế áo khoác kiểu dáng sơ mi: cổ đức, áo phối 2 túi hộp, cài bằng hàng khuy phía trước.Dáng regular fit phù hợp với vóc dáng người Việt', '2024-11-25 16:27:42', '2024-11-25 16:27:42', 5),
(174, 'Áo khoác chần bông', 1000000, NULL, 'Chất liệu vải Polyester, áo may chần bông nhân tạo tác dụng giữ ấm cực tốt vào những ngày đại hàn.Áo khoác phao dáng suông, cổ sơ mi, cài bằng hàng khuy phía trước.', '2024-11-25 16:28:25', '2024-11-25 16:28:25', 5),
(175, 'Áo khoác bomber Metagent', 710000, NULL, 'Chất liệu vinylon tổng hợp: 94% polyester, 6% spandex. Tính năng chống gió, chống bụi, giữ ấm cơ thể. Bên trong có lớp lót. Cổ tay và gấu áo may bo vải thun cho giãn giúp giữ nhiệt và giữ phom dáng. Áo khoác dáng regular fit, độ dài ngang hông, sử dụng khóa kéo nhựa cao cấp, 2 túi chéo 2 bên kèm khóa túi tiện lợi. - Ngực may viền tạo kiểu đính cùng logo Metagent.', '2024-11-25 16:29:15', '2024-11-25 16:29:15', 5),
(176, 'Áo khoác', 1190000, NULL, 'Chất liệu vinylon tổng hợp: 94% polyester, 6% spandex. Tính năng chống gió, chống bụi, giữ ấm cơ thể. Bên trong có lớp lót. Cổ tay và gấu áo may bo vải thun cho giãn giúp giữ nhiệt và giữ phom dáng. Áo khoác dáng regular fit, độ dài ngang hông, sử dụng khóa kéo nhựa cao cấp, 2 túi chéo 2 bên kèm khóa túi tiện lợi. - Ngực may viền tạo kiểu đính cùng logo Metagent.', '2024-11-25 16:29:59', '2024-11-25 16:29:59', 5),
(177, 'Áo hoodie nỉ cổ mũ kéo khóa', 1590000, NULL, 'Chất liệu: Sử dụng vải Interlock thành phần gồm 65%Cotton 30% Polyester 5%Spandex. Đây là sự kết hợp giữa sợi cotton và sợi chiết suất tổng hợp có độ co giãn đàn hồi cao. Tính năng chống gió, cách nhiệt giữ ấm cơ thể. Thiết kế áo khoác dáng hoodie cơ bản, dáng oversize trẻ trung năng động: mũ có dây rút, khóa kéo phía trước.', '2024-11-25 16:30:42', '2024-11-25 16:30:42', 5),
(178, 'Áo khoác phao siêu nhẹ', 1090000, NULL, 'Chất liệu vải Polyester, bên trong lót bông tác dụng giữ ấm tốt vào những ngày đại hàn.Áo khoác phao dáng suông, cổ cao, cài bằng khóa kéo phái trước', '2024-11-25 16:31:21', '2024-11-25 16:31:21', 5),
(179, 'Track Jacket - Áo khoác gió dáng cơ bản', 500000, NULL, 'Chất liệu: Polyester tổng hợp dày dặn, tính năng chống gió, chống bụi, giữ ấm cơ thể.  Áo khoác 2 lớp dáng suông, độ dài ngang hông, sử dụng khóa kéo kín mành (chống gió, chống thấm nước) . Áo tay dài,  2 túi chéo 2 bên có khóa kéo tiện lợi, gấu áo phối chun bản to co giãn. Phom dáng regular phù hợp với vóc dáng người Việt.', '2024-11-25 16:32:16', '2024-11-25 16:32:16', 5),
(180, 'Áo khoác gió cổ đức', 2490000, NULL, 'Chất liệu: 94% Polyester 6% Spandex tính năng siêu nhẹ, chống gió, chống bụi, giữ ấm cơ thể. Áo tay dài, cổ đức, 2 túi chéo kéo khóa phía trước tiện lợi. Phom dáng regular phù hợp với vóc dáng người Việt.', '2024-11-25 16:33:24', '2024-11-25 16:33:24', 5),
(181, 'Đầm ôm cổ kiểu Pauline', 2490000, NULL, 'Nằm trong BST mùa thu đông 2024, “SOLAR - SHINE TOGETHER” được trình làng với giới mộ điệu như một bản hòa ca tôn vinh tinh thần tự do, sự lạc quan và vẻ đẹp rực rỡ của phái đẹp. Đánh dấu sự chuyển mình của phụ nữ trong thời hiện đại, vượt qua những tiêu chuẩn “kép” áp đặt lên họ.Những thiết kế trong BST hướng tới tôn vinh tính nữ hiện đại thông qua từng đường nét – từ sự mềm mại và duyên dáng đến sự mạnh mẽ và tự chủ. Mỗi sản phẩm đều thể hiện tính kiêu hãnh, đồng thời phá bỏ mọi rào cản để phụ nữ tự do thể hiện cá tính riêng, sống đúng với con người thật của mình.', '2024-11-26 06:17:08', '2024-11-26 06:17:08', 9),
(182, 'Đầm xòe Rosalie', 2390000, NULL, 'Rosalie  nằm trong BST Her Signature với những chi tiết thiết kế cách điệu tinh tế, kết hợp với họa tiết nhẹ nhàng, thể hiện tuyên ngôn về phong cách thời trang công sở kiểu mới – một phong cách tự tin, thanh lịch nhưng không kém phần duyên dáng.', '2024-11-26 06:17:54', '2024-11-26 06:17:54', 9),
(183, 'Đầm lụa xòe cổ nơ Signature', 2350000, NULL, 'Đầm lụa nằm trong BST Her Signature với những chi tiết thiết kế cách điệu tinh tế, kết hợp với họa tiết nhẹ nhàng, thể hiện tuyên ngôn về phong cách thời trang công sở kiểu mới – một phong cách tự tin, thanh lịch nhưng không kém phần duyên dáng.Chất liệu lụa cao cấp mềm mại, bóng nhẹ, thoáng mát.Thiết kế cổ nơ độc đáo, tạo điểm nhấn thanh lịch và nổi bật.Dáng xòe nhẹ nhàng, mang lại vẻ đẹp nữ tính, uyển chuyển', '2024-11-26 06:18:32', '2024-11-26 06:18:32', 9),
(184, 'Đầm lụa chấm bi Lucille', 1790000, NULL, 'Thời thượng, sang trọng trong nền họa tiết chấm bi bắt mắt, thiết kế đầm lụa mới là lựa chọn hoàn hảo cho buổi tiệc, sự kiện hay dạo phố. Chất liệu lụa cao cấp mềm mại, bóng nhẹ giúp đầm ôm vừa vặn, tạo hiệu ứng uyển chuyển, mượt mà theo từng bước đi. Thiết kế cổ đổ nhẹ nhàng, tay dài phù hợp cho cả những ngày se lạnh. Đầm dễ dàng kết hợp với giày cao gót và các phụ kiện tinh tế để tạo nên vẻ ngoài nổi bật, quyến rũ.', '2024-11-26 06:19:12', '2024-11-26 06:19:12', 9),
(185, 'Đầm ôm xếp ly Viviane', 1790000, NULL, 'Hiện thân của sự quyến rũ và tinh tế, đầm Viviane nằm trong BST Thu Đông mới ra mắt hứa hẹn sẽ sự lựa chọn ưu tiên trong tủ đồ nàng.Được thiết kế với form ôm cơ thể, chiếc đầm giúp tôn lên đường cong cùng vẻ đẹp tự nhiên của vóc dáng người mặc. Chất liệu vải cao cấp co giãn nhẹ, mềm mại mang lại cảm giác thoải mái mà vẫn giữ được form dáng hoàn hảo.Điểm nhấn của chiếc đầm Viviane chính là các đường xếp ly tinh tế được bố trí ở phần thân, giúp đầm trở nên thu hút hơn. Đầm có thiết kế cổ thuyền và dáng tay dài trên nền họa tiết hoa ren thời thượng, giúp bạn luôn nổi bật trong các buổi tiệc, sự kiện hoặc các dịp đặc biệt.', '2024-11-26 06:19:48', '2024-11-26 06:19:48', 9),
(186, 'Gladys Dress - Đầm xòe Tweed', 1990000, NULL, 'Sắc màu Thu - Đông 2024 lộ diện đầy ấn tượng qua hai phiên bản đầm sang trọng và thời thượng. Gladys Dress thiết kế cổ cao, tạo nơ kiểu, tay dài cùng dáng xòe nhẹ, rất thích hợp với những ngày se lạnh. Đầm trơn 2 lớp dưới chất liệu Tweed cao cấp, đứng form, không nhăn cùng màu sắc bắt Trend, chỉ cần phối thêm một vài món phụ kiện đơn giản là nàng đã có thể chiếm spotlight mỗi khi xuất hiện. ', '2024-11-26 06:20:29', '2024-11-26 06:20:29', 9),
(187, 'Đầm lụa xòe tay dài Hoa Pháp', 2290000, NULL, 'Thiết kế nằm trong BST SAPPHIRE CHIC, lấy cảm hứng từ sắc xanh quý phái của đá Sapphire với những thiết kế công sở hiện đại, ghi dấu ấn với tính thẩm mỹ cao và sự tinh tế qua các chi tiết tạo điểm nhấn mà không mất đi nét sang trọng vốn có.Đem đến nét đẹp tươi mới cho phong cách công sở hiện đại, đầm lụa xòe tay dài Hoa Pháp là lựa chọn hoàn hảo cho nàng yêu thích sự thanh lịch.Sở hữu hoạ tiết hoa điệu đà mà không kém phần sang trọng, thiết kế đầm vừa toát lên vẻ trang nhã, vừa khẳng định ngôn ngữ thời trang cao cấp của IVY moda. Đặc biệt, chất liệu lụa mềm mại và kiểu dáng xòe duyên dáng tạo nên sự thoải mái, giúp nàng luôn tỏa sáng thu hút mọi ánh nhìn.', '2024-11-26 06:21:14', '2024-11-26 06:21:14', 9),
(188, 'Eser Dress - Set đầm dạo phố', 3490000, NULL, 'Phô diễn thần thái kiêu sa, thời thượng qua ấn phẩm Eser Dress trong BST EXPRESS, nơi những giá trị đích thực được đánh thức và tỏ bày thông qua các thiết kế cao cấp nhất!Outfit gồm áo khoác kiểu blazer croptop hiện đại cùng đầm hai dây bán nguyệt quyến rũ. Set bộ thiết kế dài tay, độ dài ngang gối rất thích hợp với tiết trời sang Thu. Bên cạnh đó, khi lựa chọn dáng váy xòe xếp ly bồng bềnh tăng sự mềm mại và uyển chuyển cho thiết kế. Bản phối được làm trên nền chất liệu Twill cao cấp, giữ form tốt, mang đến cảm giác thoải mái khi mặc. Để thêm phần nổi bật, Eser Dress đã được nhấn nhá thêm chi tiết hoa ngực, nàng chỉ cần lựa chọn phụ kiện đi kèm phù hợp là đã  có ngay một bản phối để  bắt đầu ngày mới. ', '2024-11-26 06:21:59', '2024-11-26 06:21:59', 9),
(189, 'Đầm A xếp ly Rose Red', 1790000, NULL, 'Với phong cách công sở hiện đại, vẻ đẹp được định nghĩa bởi chính sự tối giản! Khám phá ngay thiết kế Đầm A xếp ly Rose Red từ BST Sapphire Chic. Không cầu kỳ, kiểu cách, dáng đầm chữ A vẫn khiến nàng thêm muôn phần cuốn hút nhờ được tô điểm với phần xếp ly đầy nữ tính. Đặc biệt, sắc xanh Cobalt tinh tế không chỉ mang đến sự tươi mới mà còn thể hiện phong thái tự tin và quý phái cho nàng.', '2024-11-26 06:22:40', '2024-11-26 06:22:40', 9),
(190, 'Đầm A xếp ly Rose Cobalt', 1790000, NULL, 'Với phong cách công sở hiện đại, vẻ đẹp được định nghĩa bởi chính sự tối giản! Khám phá ngay thiết kế Đầm A xếp ly Rose Red từ BST Sapphire Chic. Không cầu kỳ, kiểu cách, dáng đầm chữ A vẫn khiến nàng thêm muôn phần cuốn hút nhờ được tô điểm với phần xếp ly đầy nữ tính. Đặc biệt, sắc xanh Cobalt tinh tế không chỉ mang đến sự tươi mới mà còn thể hiện phong thái tự tin và quý phái cho nàng.', '2024-11-26 06:23:12', '2024-11-26 06:23:12', 9),
(191, 'Maddy Dress - Đầm Tweed cách điệu', 2290000, NULL, 'Giữ ý tưởng chủ đạo qua kiểu dáng đầm xòe cổ điển, thiết kế đã được biến tấu linh hoạt thêm những điểm nhấn nổi bật ở phần cổ, đai eo, tùng xòe để tạo nên phiên bản đầm thời thượng nhất. Đầm đính 4  khuy sang trọng bên trên phần chiết eo ôm gọn vòng 2 quyến rũ. Dáng tùng xếp nếp đều, tạo độ bồng nhẹ đủ để thấy nét  dịu dàng, nhẹ nhàng của một quý cô.  ', '2024-11-26 06:23:55', '2024-11-26 06:23:55', 9),
(192, 'Eser Dress - Set đầm dạo phố', 3480000, NULL, 'Phô diễn thần thái kiêu sa, thời thượng qua ấn phẩm Eser Dress trong BST EXPRESS, nơi những giá trị đích thực được đánh thức và tỏ bày thông qua các thiết kế cao cấp nhất!Bản phối được làm trên nền chất liệu Twill cao cấp, giữ form tốt, mang đến cảm giác thoải mái khi mặc. Để thêm phần nổi bật, Eser Dress đã được nhấn nhá thêm chi tiết hoa ngực, nàng chỉ cần lựa chọn phụ kiện đi kèm phù hợp là đã  có ngay một bản phối để  bắt đầu ngày mới. ', '2024-11-26 06:24:40', '2024-11-26 06:24:40', 9),
(193, 'Đầm suông Tweed', 2490000, NULL, 'Đầm kiểu dáng suông, tạo cảm giác rộng rãi và thoải mái, giúp bạn dễ dàng di chuyển khi mặc. Đầm được thiết kế với các chi tiết thời trang như cổ tròn, tay dài phối ren, kèm 2 túi nhỏ đính khuy. Các chi tiết góp thêm vẻ cá tính và phong cách cho chiếc đầm.Thiết kế tạo ra một phong cách thời trang cổ điển, sang trọng, phù hợp cho nhiều dịp khác nhau từ công việc đến dự tiệc hay các sự kiện xã hội.', '2024-11-26 06:25:22', '2024-11-26 06:25:22', 9),
(194, 'Đầm kẻ 2 lớp Tuysi', 2290000, NULL, 'Mượn thiết kế Vest cổ điển, đầm biến tấu dáng xòe cách điệu, độ dài trên đầu gối và có hai túi sườn. Điểm nhấn là chi tiết xếp ly phồng ở tay trên nền họa tiết kẻ thời thượng. Đầm ôm eo xòe nhẹ 2 bên vừa tôn dáng nàng vừa có tách dụng che khuyết điểm phần hông tốt.Chất liệu được sử dụng là chất vải tuysi cao cấp. Đây là sự lựa chọn hàng đầu của các nhà mốt dành cho các thiết kế đòi hỏi sự thanh lịch, sang trọng mà vẫn đảm bảo tính thoải mái. Đầm 2 lớp chất liệu vải tuysi mềm nhẹ, thoáng mát, ít nhăn và giữ form dáng tốt. ', '2024-11-26 06:26:02', '2024-11-26 06:26:02', 9),
(195, 'Gladys Dress - Đầm xòe Tweed', 1990000, NULL, 'Đầm trơn 2 lớp dưới chất liệu Tweed cao cấp, đứng form, không nhăn cùng màu sắc bắt Trend, chỉ cần phối thêm một vài món phụ kiện đơn giản là nàng đã có thể chiếm spotlight mỗi khi xuất hiện. ', '2024-11-26 06:26:38', '2024-11-26 06:26:38', 9),
(196, 'Đầm lụa phối bèo - xếp ly', 2990000, NULL, 'Thân trên đầm thiết kế cổ tim, tay dài tái hiện sự trang nhã, thanh cao,  thích hợp với thời tiết se lạnh. Chi tiết phối bèo trước ngực giúp tạo điểm nhấn, tăng nét quyến rũ cho chiếc đầm. Thân dưới tạo dáng váy xèo nhẹ, được xếp ly khéo léo, tỉ mỉ, che khuyết điểm tốt. ', '2024-11-26 06:27:23', '2024-11-26 06:27:23', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(1, 1, '3655dd1c-3238-489e-9fb6-dab82ab89926_1.webp'),
(2, 1, '508972f6-26f1-488e-a7ff-1fbf46076d5a_2.webp'),
(3, 1, 'dc1ff5e6-0b33-421e-9163-7c3ea20defaf_3.webp'),
(4, 1, '24d40b2b-cef4-4ee2-99af-e8afcf987bd6_4.webp'),
(5, 2, '73aef109-912a-4fb3-8373-eb5b27183eff_5.webp'),
(6, 2, '95c786e7-a66d-49a1-9adc-ad5c4e39ea6b_6.webp'),
(7, 2, '64e4ddfb-b8f7-4a23-87e5-ebc99bdf8cb8_7.webp'),
(8, 2, '29af27de-5e40-412a-a97b-567ac7d5496a_8.webp'),
(9, 2, 'ce6289d3-03c0-4715-a8d0-215f1a02514a_9.webp'),
(10, 2, '4d288fd5-dac4-4b8e-9b96-5f1d41d98cd1_10.webp'),
(11, 3, 'f526a8f9-2ef3-4d28-8fff-9efd08508d8a_9.webp'),
(12, 3, '9b72d0a3-d840-4957-8428-39e02d3aab45_10.webp'),
(13, 3, '9605b01c-4200-4d8e-b162-60c9b6087e81_11.webp'),
(14, 3, '81507127-bbd8-4d29-bb68-4d9c25b60bfe_12.webp'),
(15, 4, '8faed6ff-5a9a-41d1-8bfc-668bdd423c87_13.webp'),
(16, 4, 'a65753a4-6c6e-473a-8f9b-87b62d978422_14.webp'),
(17, 4, '674876ca-03c6-4eba-be67-0a0027c1c0b5_15.webp'),
(18, 4, '313d7ba6-3cf3-4baa-80d3-9734f32f8e7e_16.webp'),
(19, 5, '6b16d80f-0c0f-44a0-a6d3-069cae82e77f_17.webp'),
(20, 5, 'db14fbe0-49d4-4522-ad2e-f7b57f7e68f4_18.webp'),
(21, 5, '31b5f2c7-15d1-4553-b550-c5721580f8f3_19.webp'),
(22, 5, 'ee33b291-bc60-4495-a048-38d0065f86ae_20.webp'),
(23, 6, '5c72f605-bb9f-4dab-ac8c-8278c2d5ee16_21.webp'),
(24, 6, '4f487888-a699-4f1d-b496-546e4956c32d_22.webp'),
(25, 6, '95ab268c-a672-4a2e-bb28-02cb9ac98339_23.webp'),
(26, 6, '08e8c04e-fdaf-43ad-9080-62d9cf84f60c_24.webp'),
(27, 7, '97b4a4b9-ff91-4214-bffb-eeef5cec441b_25.webp'),
(28, 7, '44af27fe-88a0-4a06-a9d2-b283db80ad4d_26.webp'),
(29, 7, '0500ed70-3b43-4ffc-a70d-86593f2bad87_27.webp'),
(30, 7, '16dec2b5-1b2f-4449-a293-037acf7009ae_28.webp'),
(31, 8, '3a9b978e-f7e8-4af9-bd2a-5cc0928b97f2_29.webp'),
(32, 8, 'b00fd76f-bbc3-4d11-85a2-9e0cc43893b2_30.webp'),
(33, 8, '0352b31f-f18f-4fe6-85d2-4fcb730ce760_31.webp'),
(34, 8, 'ecfaf545-086a-4d6a-bb8c-fb469c3d777d_32.webp'),
(35, 9, '40c4ede6-4f7c-495b-96f6-8fb84898b374_33.webp'),
(36, 9, '3ce9afa5-edb2-4035-aefc-6fb1afb22fba_34.webp'),
(37, 9, '3fb7e997-8280-4b96-ae24-e99186dcda01_35.webp'),
(38, 9, 'e4d3afbb-1510-4d33-9ee6-f91db46cae38_36.webp'),
(39, 10, '4e10d5d7-f051-44bb-8478-712f3ec64e68_37.webp'),
(40, 10, '7ff8e4a6-517c-4d7f-b1e1-7257154668a1_38.webp'),
(41, 10, '11297362-fca2-47aa-8873-ed8b47ab219f_39.webp'),
(42, 10, '178f81c9-a99c-4d00-87f8-1755e1be41b1_40.webp'),
(43, 11, '9b69d3b7-4912-4532-ad32-83c4a1176ff8_41.webp'),
(44, 11, 'd8ca31f9-955e-4f3f-ad14-ad5c4e5bc64c_42.webp'),
(45, 11, '3c78db89-e2d4-49aa-b64b-7965143222a9_43.webp'),
(46, 11, '2d27d8ea-91c4-4803-8113-1bf0dd1422ef_44.webp'),
(47, 12, '163a3ee8-a977-4e49-91bd-28e86e0f8da4_45.webp'),
(48, 12, 'f3a8a904-009b-4ced-ae60-85d480978ab8_46.webp'),
(49, 12, '060cfea5-0d12-4705-a839-125b5fbdb64f_47.webp'),
(50, 12, 'fc23f42d-a474-4e60-8710-513f131fc599_48.webp'),
(51, 13, '9f72ece0-eece-46df-b0e6-cb2108f55df4_49.webp'),
(52, 13, '871796b7-9373-458b-baf5-085d41467ae4_50.webp'),
(53, 13, '5c8eec84-12f5-4473-bb22-9c0f51ae014b_51.webp'),
(54, 13, 'e0358674-6317-4069-ab7c-5d1b9363f61f_52.webp'),
(55, 14, '42aa801e-cab8-44c5-a6db-affe28195704_53.webp'),
(56, 14, '5d0cdf37-2eb1-41cb-acb0-9609e0c07377_54.webp'),
(57, 14, '6cdd61c7-1048-49e2-93cf-8361b3aef5bc_55.webp'),
(58, 14, 'e1c4f0f0-fb63-4496-bf1f-77dbcdef2032_56.webp'),
(59, 15, '361a8ecf-fd3d-4d80-9ee3-60ff5659f47a_57.webp'),
(60, 15, 'e9d65a30-76e6-40b6-b0e8-b4d73381e564_58.webp'),
(61, 15, '4fb09179-a81a-4e47-b1ab-bd3751f9a449_59.webp'),
(62, 15, '4da79a5b-cc55-482d-9391-f9cb0656cd75_60.webp'),
(63, 16, '4bdf1807-5026-483b-900d-e279695fb0c2_61.webp'),
(64, 16, '525afd23-f596-4e5e-ba28-df724e11edaa_62.webp'),
(65, 16, '8030607b-f4ff-417a-8cd9-5504b354804c_63.webp'),
(66, 16, '4ed4dbea-eb09-4032-b2f6-3a7ad95578c1_64.webp'),
(67, 17, '59dd70fb-d77c-4143-9bee-a7e572e73c1c_65.webp'),
(68, 17, 'ecace2ef-60f2-4e70-b9f6-25c6bcc08650_66.webp'),
(69, 17, 'bfaff054-a13f-4f29-ad47-e0f094df3de2_67.webp'),
(70, 17, '624fa6ee-2016-44dc-b7fa-13499f6298f3_68.webp'),
(71, 18, '87f1984b-1f7d-410c-be4b-00b9b9ac153b_69.webp'),
(72, 18, '51fc261d-cef6-4637-b756-8b059f1bc8e6_70.webp'),
(73, 18, '1949aa0a-5682-4fb2-adad-e7c5b002553e_71.webp'),
(74, 18, '2b536f31-afd8-4121-b1e5-522ba4444265_72.webp'),
(75, 19, 'cc5b5c32-5edd-4413-9292-6c4c3084d354_73.webp'),
(76, 19, '4773348e-f530-4146-836a-a6ab853e8b97_74.webp'),
(77, 19, 'a5878fdb-501b-407e-98e7-e5dd985cfb8b_75.webp'),
(78, 19, 'a52c5651-e630-43ce-a60b-22213f262680_76.webp'),
(79, 20, '2ea129a5-3859-417a-af1d-c95d2243af5e_77.webp'),
(80, 20, '8cd7a3ed-a88e-4691-8514-4bc53e8e2ce9_78.webp'),
(81, 20, 'c06d7b88-7dda-4469-b4bf-3046c090e309_79.webp'),
(82, 20, 'f46790ae-5bac-4158-9de5-fc830d0024f4_80.webp'),
(83, 21, '39d81ea2-928d-4654-8f41-1ee78e7d0687_81.webp'),
(84, 21, 'dddadbc5-f9ec-4a3b-8a30-501f24b095c0_82.webp'),
(85, 21, 'aef3bc6a-b9fe-485b-8888-f5bdbb0f2af7_83.webp'),
(86, 21, 'a448f5bf-e856-4364-b356-0a95cb4c8b18_84.webp'),
(87, 22, 'c6d33040-5d59-4f04-81d5-aab26f31608d_85.webp'),
(88, 22, '5a0eb87f-9547-4c82-bb11-ebacc3027755_86.webp'),
(89, 22, 'c5f5e948-21fa-4e9d-af82-6b348d4ea3c4_87.webp'),
(90, 22, '7c82fcf9-1dbb-4e05-87ae-508ec1bb770a_88.webp'),
(91, 23, '0ce401f2-7a1b-4346-a21d-b9269a01b25c_89.webp'),
(92, 23, '5e935659-59cd-4dc2-8e1f-c4454d2d5bc8_90.webp'),
(93, 23, 'bb86c650-ba15-47f2-bb87-ce9d587a8165_91.webp'),
(94, 23, '3e4cf254-f8a6-49a8-9217-ec3c89cf8364_92.webp'),
(95, 24, 'fbc074a6-6a9d-4ddc-8dec-34b0cc2a1e69_93.webp'),
(96, 24, '1e516398-3acb-4814-b3a5-29accf2f8166_94.webp'),
(97, 24, '4404468d-20bf-414d-9a06-b3e13e29800b_95.webp'),
(98, 24, '884119c7-7680-40d5-91db-d48f43ec0d2e_96.webp'),
(99, 25, '26870b0b-cde4-47a0-91ec-df3e925c9bd2_97.webp'),
(100, 25, 'f831262f-bbec-41d8-ac91-ca5a0f3bcf5d_98.webp'),
(101, 25, 'f9988f66-b199-4427-9ca8-d7fc2d280c2e_99.webp'),
(102, 25, 'ea3c6bf3-a680-4f01-8b50-4098f317ebf9_100.webp'),
(103, 26, '703d7b9b-8d59-49d1-9b18-609c4c833e4a_101.webp'),
(104, 26, '17124566-be2a-4726-88b5-aeb41d584b02_102.webp'),
(105, 26, 'b61785b6-d759-4398-a4fd-be508bc2c87e_103.webp'),
(106, 26, '3b810167-0fcd-4b35-a875-f1aba3a45343_104.webp'),
(107, 27, 'ca4e56ca-3ee5-4a3c-85b6-a2f8c11e8eb4_105.webp'),
(108, 27, 'e736441e-99ff-4266-a60e-60b34a05945a_106.webp'),
(109, 27, 'a195f7cc-c6b1-4b25-ae17-4466ddb99dad_107.webp'),
(110, 27, '8c3a0595-56ca-4aa6-b279-bd8a5cbe9736_108.webp'),
(111, 28, '4e57597b-7cac-4a6d-b96d-632258731468_109.webp'),
(112, 28, 'f36eaca0-e46a-4813-abb8-2c04aa3d831a_110.webp'),
(113, 28, '447d49db-5bb1-40d7-8a05-4f627d8f0272_111.webp'),
(114, 28, '54f71359-fa3e-4eb0-8640-8f65da92c707_112.webp'),
(115, 29, '3a1157f2-8023-462a-90b6-ac6f6b192066_113.webp'),
(116, 29, '564156ac-260d-4883-b306-5dee3d4705c4_114.webp'),
(117, 29, '5047489a-bde1-41c1-8f1a-7b2378810b99_115.webp'),
(118, 29, '6b8c6eb6-9852-4618-8dd7-67ef6a041889_116.webp'),
(119, 30, '551263f3-d24b-40a5-96f7-f310e7e9f242_117.webp'),
(120, 30, '567d683d-ba36-4759-a147-c3a33c4da4b8_118.webp'),
(121, 30, 'ba8811c7-7b66-4c23-9395-a23dabb03b8a_119.webp'),
(122, 30, '585f3ce3-f839-4dc5-a29c-c94d9300cfa5_120.webp'),
(123, 31, '7503f640-a2ca-4da4-95c8-4ef008e7bd28_121.webp'),
(124, 31, 'c060f2d2-9b78-423c-85b5-55d7f077e0fc_122.webp'),
(125, 31, 'fa0e6739-f7ff-44a0-b48d-5770ffe85218_123.webp'),
(126, 31, 'a00c2a01-803b-416c-b9b3-4470aec84c4b_124.webp'),
(127, 32, '2d4512ca-5ccb-42fe-8bcb-22534b9f1cd1_125.webp'),
(128, 32, '18bf7423-8493-42d6-b8a0-f2b4888aae85_126.webp'),
(129, 32, '551ea95a-691f-4f05-a9b3-b9761c0e14a0_127.webp'),
(130, 32, '6b2b84bc-d5f3-4108-9c56-ecd9fe269845_128.webp'),
(131, 33, 'aa21ad68-74a9-4451-b4ec-ce79e3b445a3_129.webp'),
(132, 33, 'ff4024ab-ff9e-470b-a04a-ed690b63191e_130.webp'),
(133, 33, '13d3ac08-37a0-4cff-ac71-60acdb268f68_131.webp'),
(134, 33, '0b1e1011-314f-4e72-8164-04e1767a0d71_132.webp'),
(135, 34, '1fe5c8ef-8739-4671-99f5-8eea94f32565_133.webp'),
(136, 34, 'c360cd09-4b0d-4bfc-afd6-e6a2501825ff_134.webp'),
(137, 34, '48cc15fc-1d27-443b-9eb6-f01ba85682cf_135.webp'),
(138, 34, '30666140-0bb2-4ccb-952b-ff18e12f39db_136.webp'),
(139, 35, '61e2db50-abae-4143-8405-1f8fbacc68e0_137.webp'),
(140, 35, '741e0c78-4832-4020-84de-0f05766d451a_138.webp'),
(141, 35, '6e363026-73e1-496f-acd4-865edf88485b_139.webp'),
(142, 35, '4343861d-4e64-4409-a6ed-313b87d90f3e_140.webp'),
(143, 36, '06139de8-cf1c-46f0-9d8d-c477ffb1d38f_144.webp'),
(144, 36, '517f66d4-f00d-4ecf-b548-8e14d7478601_141.webp'),
(145, 36, '35748809-9bc2-4b40-8e0c-cc5e8c304333_142.webp'),
(146, 36, 'd14601ff-6ebd-45d2-b729-1ecb1eca2067_143.webp'),
(147, 37, '43e8c1b0-6606-4957-9c2e-bee7530f6ba8_145.webp'),
(148, 37, '6d0fe4a8-3869-4c35-b74e-ca14bef3e29b_146.webp'),
(149, 37, '31f95741-f2b2-4961-97ef-89367a16002d_147.webp'),
(150, 37, '9076d46f-b203-4747-8a0c-8bb7b7c6727d_148.webp'),
(151, 38, '56529f2f-4f56-4c96-a51d-88a4453cdafd_149.webp'),
(152, 38, '30c5ffed-6ad9-4d45-8f33-50198e017d07_150.webp'),
(153, 38, '5654261b-5e5d-4101-8748-33cd26fe7b11_151.webp'),
(154, 38, 'b48937b2-d523-40a1-860b-97db3c429efd_152.webp'),
(155, 39, '0e416f43-8f6c-4726-87ce-9ae2a3df0f70_153.webp'),
(156, 39, 'fbda6c05-e94c-4633-ba46-fe379e4a8739_154.webp'),
(157, 39, 'f64c310d-84eb-4148-8cb7-4670e1eea11e_155.webp'),
(158, 39, '21b5b435-989d-42b4-ac7a-adbb9ee08332_156.webp'),
(159, 40, '77769af8-d528-4c8c-a512-fdb77b80a469_157.webp'),
(160, 40, '0a2cd321-0ff4-42a7-937d-7e4839a12c74_158.webp'),
(161, 40, 'f6275fca-33ad-496a-8873-85176908bd2e_159.webp'),
(162, 40, '8ebad93f-b2f0-4fef-bade-e118e7915589_160.webp'),
(163, 41, '5c271256-7ca3-4166-8d15-ff4b8f70d205_161.webp'),
(164, 41, 'c09baf86-2398-4345-8f01-b01e6bd5967c_162.webp'),
(165, 41, 'b62718f6-87ba-4ec0-a7c6-08d4ecc2c154_163.webp'),
(166, 41, '4a72a329-4abe-4fa3-a6ff-2eee5b5e9b64_164.webp'),
(167, 42, 'a56630ae-92c7-4ce2-98a4-d62ee2a22e19_165.webp'),
(168, 42, 'b50a32cc-0c3a-45b5-bfb2-f98a48ef2cb6_166.webp'),
(169, 42, '7f39c199-2eff-4ebe-aca8-215b15e31863_167.webp'),
(170, 42, 'aaf5b2c7-01e3-4d15-b226-0a863b85a390_168.webp'),
(171, 43, 'b96a5742-fc9c-4dd5-a46b-bbcd1438647e_169.webp'),
(172, 43, '0d91afd1-2ff4-4ca3-9c2d-5fb6aca09d1e_170.webp'),
(173, 43, '699c114a-ed28-46ea-9a9a-d03726c96024_171.webp'),
(174, 43, 'e13d7e12-c99f-4b87-87b8-4a5299601c32_172.webp'),
(175, 44, 'e1525323-2c3d-4b8d-812d-593fe4643a0c_173.webp'),
(176, 44, '2faef25e-0cf7-41fc-b8e3-0a6ca531b13e_174.webp'),
(177, 44, 'e17ba787-c549-40a3-8969-f749e045d070_175.webp'),
(178, 44, 'd32dac74-261e-45dd-96e4-c01bd3333d26_176.webp'),
(179, 45, 'ed8fd8dd-b6fa-4b0e-a69b-ee828523b20b_177.webp'),
(180, 45, 'e3e08b86-14bd-4e13-8f35-75d2d715a06a_178.webp'),
(181, 45, '6a8f8733-d8c4-46e6-89ba-ad652cdaa80a_179.webp'),
(182, 45, '20d30e4c-5c43-4622-8fb5-39078097a81d_180.webp'),
(183, 46, '51bce124-acb1-42e7-9b68-80bea5e9b7f5_181.webp'),
(184, 46, '880721d7-9d0f-4d7d-9dab-f8abfdd63da8_182.webp'),
(185, 46, '63e0f9b2-5fe1-4453-a44d-9168309b293a_183.webp'),
(186, 46, 'cbad123f-a14b-4cc2-83fa-0a7e21e64ede_184.webp'),
(187, 47, 'f07455f5-c808-447d-b326-f7172885d20b_185.webp'),
(188, 47, '2a589eaf-a194-4df3-8e27-a0bda2cedc0c_186.webp'),
(189, 47, 'd4666fce-7a37-4864-b9a9-98dad948653a_187.webp'),
(190, 47, 'f795cf9b-0a9d-4fb7-a78f-a7b3d71a9225_188.webp'),
(191, 48, '1a1ceddd-0cd9-439b-82de-fa49e45a4f6e_189.webp'),
(192, 48, 'b2eba213-31dc-4755-8962-63f6e9381c69_190.webp'),
(193, 48, 'cbae7957-acc3-45ed-b5ca-df6bf2031bd7_191.webp'),
(194, 48, 'e49fb36c-e132-4314-8bcd-9e553e2b96eb_192.webp'),
(195, 49, 'c6c1f250-1227-4d5c-8634-2a5c73dd5804_193.webp'),
(196, 49, '761ed84d-10e6-45df-9242-e6cd56f26254_194.webp'),
(197, 49, '210c6245-ffac-48af-8da3-6d864f3e9278_195.webp'),
(198, 49, '9a9babc5-f1d4-4685-9474-39d292d224d6_196.webp'),
(199, 50, 'a47d3444-f672-412b-bb01-a23174e542c9_205.webp'),
(200, 50, 'bc70d963-2fcc-4a94-a10d-ae476e2aef96_206.webp'),
(201, 50, 'fda434f0-05a0-4095-b98a-9c50576ce5f7_207.webp'),
(202, 50, '5fee6430-72de-43ff-ac30-fd8585cf7997_208.webp'),
(203, 51, '6c1dabc5-7849-4b83-8a12-3262ec8be054_4.webp'),
(204, 51, '610687bd-bddc-4f01-882f-d2181b14f88b_1.webp'),
(205, 51, 'c6bd3e4e-cbdc-430e-9341-1974898d5507_2.webp'),
(206, 51, 'db8523b7-1c35-4126-bac6-156761625264_3.webp'),
(207, 52, 'f7e1b93a-194a-4081-9b6e-0abe3de64c5b_5.webp'),
(208, 52, 'e8bbc0db-b11a-41c9-bfa6-0c03f508b6a8_6.webp'),
(209, 52, '8afa830d-79ad-4e97-8992-c2a23098e33f_7.webp'),
(210, 52, '35d709d8-d4f4-4c29-a38d-2324f8552fdb_8.webp'),
(211, 53, 'f67d0140-55a5-413e-96db-5b2b3f2027d1_9.webp'),
(212, 53, 'b92e31c3-acaa-42b8-8d68-4e7c18f42183_10.webp'),
(213, 53, '5a23f2b7-5214-4a6a-b252-7e40238160b8_11.webp'),
(214, 53, 'f361e48b-f698-490b-8f9c-09e6bbd6b2f0_12.webp'),
(215, 54, '8ba65182-738d-40e7-8331-b0df0ec47d32_13.webp'),
(216, 54, '3a267e5d-adbf-49e5-87de-93c37d37104a_14.webp'),
(217, 54, '9bb7a8c3-6e27-40fa-acd6-1af217944fc6_15.webp'),
(218, 54, '99db854b-7662-4365-9cce-7a748df5fb30_16.webp'),
(219, 55, 'b6db3088-af08-4071-8c78-807a760bd94c_17.webp'),
(220, 55, 'e15ebabd-4656-4df7-b508-c5e021cd2429_18.webp'),
(221, 55, '511d4ceb-ad82-46f9-baba-1b71f5186b4f_19.webp'),
(222, 55, 'fdae831c-98f7-46b4-839e-4995adad9036_20.webp'),
(223, 56, '178a3069-776b-4c9e-82e3-754779f4ee7d_21.webp'),
(224, 56, '469bb4ce-1ac3-4117-9982-3837fbf644ee_22.webp'),
(225, 56, 'af3c978a-4736-4576-965b-be1d0e500bd4_23.webp'),
(226, 56, '6ce8318f-362f-40ec-a1d3-d0b501210fad_24.webp'),
(227, 57, '477eba82-5649-4ccc-b2d4-08a660cc8f7c_25.webp'),
(228, 57, '964e4078-bf9f-424e-9e85-7f8f1caa804a_26.webp'),
(229, 57, 'bb8458da-73ee-48ef-82b0-8c71d06d7cd4_27.webp'),
(230, 57, 'e37398eb-8530-49e1-8a3c-086cf2dd9b72_28.webp'),
(231, 58, 'd617e2e6-4a81-4aae-acfe-47e080002efc_29.webp'),
(232, 58, '3d0fa41b-1e1f-4ac5-a0d8-3c50ea6fb7a2_30.webp'),
(233, 58, 'e32f2c90-fb05-41df-9555-fa635747b48a_31.webp'),
(234, 58, '6792681a-d778-440d-bef2-006e3d609b79_32.webp'),
(235, 59, '8accddbe-15f1-4474-8422-e77825fb046e_33.webp'),
(236, 59, '74bc3e6d-6b12-48ba-8141-0db3c8eff3b5_34.webp'),
(237, 59, '52ded0f7-7a1d-4ad4-a2ad-0954d105da7b_35.webp'),
(238, 59, 'aa96df01-d9fe-445e-8ac7-5c0df09cd0a3_36.webp'),
(239, 60, '6d137f82-586e-435f-ba66-113254588925_37.webp'),
(240, 60, '82ba0a95-d7ab-480d-a10f-960a43245012_38.webp'),
(241, 60, '1914b783-b034-4f5e-9dbe-4c191578b953_39.webp'),
(242, 60, '96c404c2-6d35-43e7-a746-e0ceb338c315_40.webp'),
(243, 61, '11be0b48-a6e5-4db0-8a52-8b700595ca63_41.webp'),
(244, 61, 'eae46495-340b-438b-a3fc-d37cb94c320a_42.webp'),
(245, 61, '421d75b5-9821-4a99-ac1a-4f8cb307529e_43.webp'),
(246, 61, '36378a68-515b-460a-a13b-474dd3760fb7_44.webp'),
(247, 62, '27913f2b-7741-4cb0-9806-b69724bcdc87_61.webp'),
(248, 62, 'a99cd4a0-2ab3-436c-bb98-c11ab63a8767_62.webp'),
(249, 62, '7480beb1-d156-4704-9d72-2221175f126f_63.webp'),
(250, 62, '1811da60-c633-449e-843f-eae36a74e508_64.webp'),
(251, 63, 'c468101b-21bc-45ca-a65e-87e5631ef1dd_49.webp'),
(252, 63, 'e9c652dd-1993-4add-bbed-54b3338d9a8b_50.webp'),
(253, 63, '123d3449-d25e-44bc-a7f9-487da13aea21_51.webp'),
(254, 63, '0279f1a1-a70e-4d40-9b33-75a4c74fedc2_52.webp'),
(255, 64, '69d552a0-a8c1-4480-a577-be8b3cecc1bc_53.webp'),
(256, 64, '86b9756d-2d41-47d5-ba04-46761b51156f_54.webp'),
(257, 64, 'ddf35a61-71ae-45ae-ab7c-ca2b42b901a6_55.webp'),
(258, 64, 'aa1c6705-da8f-497b-b9b2-9dec9f8dd4c7_56.webp'),
(259, 65, '3552a70c-eba0-4c9a-8551-10de3678681b_57.webp'),
(260, 65, '53b30e02-0dcd-47ca-a2d1-43964ca63ae0_58.webp'),
(261, 65, '170fb439-5695-4195-9531-fc2351ec61c8_59.webp'),
(262, 65, '32675737-d806-4f97-8856-dc47ba7922ed_60.webp'),
(263, 66, '20ca2f9e-e018-4fdf-913d-40685e4f13f2_61.webp'),
(264, 66, 'e61c17ec-4e3c-4f7a-bfbb-42e8a882aa5b_62.webp'),
(265, 66, 'b1ceb212-842d-4522-a8d1-4cce96cea253_63.webp'),
(266, 66, '12a58e6b-0be0-4252-9bd7-2cfc0e325203_64.webp'),
(267, 67, '8213f0ea-ae57-4b7f-aa64-5d3696dab6c8_65.webp'),
(268, 67, '3d17ea6d-8dbd-43e3-81b0-6b2240b4e165_66.webp'),
(269, 67, '5232bfaf-7f83-4dd1-aaa5-9c4960595269_67.webp'),
(270, 67, 'e5752148-3db2-46d9-9ff8-e96bc3421f90_68.webp'),
(271, 68, '17bdac36-1b44-4d5d-af4f-689e915fd45b_69.webp'),
(272, 68, '5d4e4e3a-b0f1-4934-8ce6-bd706e0cd9f8_70.webp'),
(273, 68, '3227a170-ae5c-4bb8-bded-6b4813b10144_71.webp'),
(274, 68, '35dcf84f-7261-4f7e-ac02-bd7ad2e37a17_72.webp'),
(275, 69, '69ef40cb-fd2d-4e6a-80a4-887117ed64d1_73.webp'),
(276, 69, '76b1c262-39b2-45fe-b444-799c516ecbd6_74.webp'),
(277, 69, '80accb93-431b-4cdc-8464-496b774d0287_75.webp'),
(278, 69, '53759b1a-8901-4e79-a1f1-fee9a7785d32_76.webp'),
(279, 70, '6e3278d3-abc9-440e-8eac-599e896a0708_77.webp'),
(280, 70, 'b3bcb3f5-9e4a-4259-a5fb-0c204e4d65fb_78.webp'),
(281, 70, '4f80c934-7771-4d5f-a8d1-c8f32b45c8a2_79.webp'),
(282, 70, 'ded63061-1536-45b3-9115-d98c27e01bb8_80.webp'),
(283, 71, '69733911-6f46-4ebf-94d8-17dc563e5245_81.webp'),
(284, 71, 'f32914f9-b13c-42d8-bacd-ddc11c8d471a_82.webp'),
(285, 71, 'a879787f-acc3-419e-870f-5cf770cbedbe_83.webp'),
(286, 71, '4ed914a8-d3dd-4fc7-a2e2-61bbf2e89ed7_84.webp'),
(287, 72, '4027956b-88ea-4dcc-a003-7baca2312205_85.webp'),
(288, 72, '0364a57d-3b85-4702-80a2-4ec61fee9adb_86.webp'),
(289, 72, '36d240c1-3b7f-41c9-990b-4e31b3d63b90_87.webp'),
(290, 72, '23e7dce1-2eb1-4c5a-ac82-621d95ed0f85_88.webp'),
(291, 73, '8f84b721-a754-41fb-9fa9-4cff264d12ed_89.webp'),
(292, 73, '26b8e05b-5f7c-4241-a5a3-34228aef2011_90.webp'),
(293, 73, '6bec21b3-8a72-41c4-8171-1349a5da2ac8_91.webp'),
(294, 73, '5fcb517e-789b-4a79-89ae-30917b4cd7ac_92.webp'),
(295, 74, '3d36204b-afd7-4bb4-9a2f-2877e0a441ff_93.webp'),
(296, 74, 'bd16a0ca-1618-425e-a8ca-a4447351d9c6_94.webp'),
(297, 74, '9c4a80d0-3a92-42d3-88cd-59dd9c602ee0_95.webp'),
(298, 74, 'd66e4b57-4ecd-4d9f-a3de-cb9ebe5f9ebc_96.webp'),
(299, 75, 'bc9b5dfa-8875-4d5a-a898-f8d060fc5a50_97.webp'),
(300, 75, 'e2eb320b-6f17-4955-ac4e-10b2587f186d_98.webp'),
(301, 75, 'ac482bbe-7e49-4865-9171-4e562332775b_99.webp'),
(302, 75, '65f1687b-2dac-4d42-b37b-a54f8ad62e03_100.webp'),
(303, 76, '1afa0d4d-2b8f-4389-88fc-b03b40643fef_101.webp'),
(304, 76, '91b84909-ebaa-426a-8348-dc0d96d38f40_102.webp'),
(305, 76, 'a0195630-08fe-4a76-94a5-c850592f7fe7_103.webp'),
(306, 76, '118b0e26-e7a2-436f-9513-f4a7d630d53a_104.webp'),
(307, 77, 'bd76974b-07e3-4ba3-a967-c826dc5a89ef_105.webp'),
(308, 77, 'a0debf49-a307-49db-9e93-66f405abac64_106.webp'),
(309, 77, 'b6b12b0a-6e9e-4ba2-9a9a-2169366f4602_107.webp'),
(310, 77, '4f175cff-ff39-45d4-89d7-3a84f76fdc37_108.webp'),
(311, 78, '2a414f88-4550-49fb-ab81-e30f8fb097a3_109.webp'),
(312, 78, '9b4cbca3-bead-4937-88f3-8148bbc9eb97_110.webp'),
(313, 78, '90182cc5-f892-4ecb-883e-4373aa587713_111.webp'),
(314, 78, 'd4dc4dfd-ba57-41e3-ab30-432c51ddba73_112.webp'),
(315, 79, '8e2d34ef-3dab-4c6c-930b-30f8d857feaa_1.webp'),
(316, 79, '606c5fb1-0071-4737-a556-370a86d41048_2.webp'),
(317, 79, '7b87997c-6c79-4d25-ab55-53cbd8b133d8_3.webp'),
(318, 79, '0195f453-0fb0-4e6f-9af7-559574ce1f15_4.webp'),
(321, 80, 'c6d4b0cd-4dbe-420c-969e-da945e0d5d91_5.jpg'),
(322, 80, '0dcbe706-f84e-4087-aae8-50c621bd3ab5_6.jpg'),
(323, 80, 'f03c41ea-9c78-4b3c-b595-b09846c1dcd6_7.jpg'),
(324, 80, '125c672f-8f81-411c-832e-7188469ced9a_8.jpg'),
(325, 81, 'ae477d60-6a20-4cf1-a9c3-995e1b1af83c_9.jpg'),
(326, 81, '2ba0f432-4b0b-4a29-8359-72dc5d8b36b0_10.jpg'),
(327, 81, 'a47e06d4-bcfe-453a-bd69-f0a457304ec0_11.jpg'),
(328, 81, '24336eeb-565c-483a-a5bd-1a18514c7118_12.jpg'),
(329, 82, 'de25fb73-ec2b-4914-8daa-80cbf80ed833_13.jpg'),
(330, 82, '8c036659-a0f7-4237-a9ea-5e10eb5a8d88_14.jpg'),
(331, 82, 'cfd06931-7623-48be-865c-1acae5f85841_15.jpg'),
(332, 82, '943463c7-ba5f-426a-b1bf-b2cb4dac9f25_16.jpg'),
(333, 83, 'eb550ff5-c159-41b7-be8c-b7dba0b73bd9_17.webp'),
(334, 83, 'd8cb30b2-3f74-49e0-a8e7-c5188f9eecdc_18.webp'),
(335, 83, 'f1ccf38a-210e-469d-a346-3d34b1edca41_19.webp'),
(336, 83, '6d523191-f533-4722-8aa6-f74274f0dc21_20.webp'),
(337, 84, '74fb6703-82ac-4018-a3f9-089b21da5bd3_21.jpg'),
(338, 84, '439aa8f0-ecd6-4b9e-86cb-c0a9edbb46ef_22.jpg'),
(339, 84, '8cdcf463-1123-41db-ae00-b6466ad8ccc7_23.jpg'),
(340, 84, '6e85c111-da27-472e-8b90-7c18caa94afc_24.jpg'),
(341, 85, '43b66d43-0f0a-46a1-b8e1-2a585f9e471d_25.jpg'),
(342, 85, 'b89c08ea-81d7-4417-b8fe-429cf0cba5cb_26.jpg'),
(343, 85, 'f2b3659e-6079-465f-ba58-8ef904a3fd1a_27.jpg'),
(344, 85, '1b8cec76-d696-48d7-8ea1-28b4a574922a_28.jpg'),
(345, 86, '17afb188-dffe-43e4-be54-1654fa43a741_29.jpg'),
(346, 86, '2c7879c5-e3c2-4677-8bf4-ebc29533fdca_30.jpg'),
(347, 86, '8b62215c-5b55-4572-8098-5f4aabb4af75_31.jpg'),
(348, 86, 'b2f01996-6438-46ad-9485-943f6475be7d_32.jpg'),
(349, 87, '0fe5d46f-bef4-4455-af04-7f5e12bd8cf9_33.jpg'),
(350, 87, '58b6c9d2-0fa6-4d19-bf10-817f16b619a8_34.jpg'),
(351, 87, '9c9659d0-6452-4e95-90dd-9e0476a30769_35.jpg'),
(352, 87, '7c1462a7-2f48-4b50-90f8-b4f88d5b4889_36.jpg'),
(353, 88, '81398bde-bfd0-46d8-addb-ccfb0ec7fc27_37.jpg'),
(354, 88, '5af0d14e-e712-414e-a171-a2938d5a67e3_38.jpg'),
(355, 88, '320ee876-f9e6-4fe5-b6bf-243af0032563_39.jpg'),
(356, 88, '2320a18d-2ee9-4833-9604-934876142fad_40.jpg'),
(357, 89, '41317877-abb0-4929-bb70-a5432bae02f0_37.jpg'),
(358, 89, 'b93cfa7c-910d-4c2b-9da1-8b3880e7aebf_38.jpg'),
(359, 89, '0f62dcce-23bf-43b4-8a7f-2d44b46f312b_39.jpg'),
(360, 89, '41178663-c212-459f-8ceb-5edf905811f0_40.jpg'),
(361, 90, 'aa26e7a7-109d-481d-b920-55a6582d4856_41.jpg'),
(362, 90, '61dccf1c-c178-4448-bec6-72972811148b_42.jpg'),
(363, 90, '96dfd731-758a-4fa8-90a8-8030411b8c7b_43.jpg'),
(364, 90, '11f09509-15d9-4752-bc06-bcbac97c23c8_44.jpg'),
(365, 91, 'd107d0c0-98c4-4cca-a27b-40c26c98cd36_1.jpg'),
(366, 91, '54e45caa-2796-4fdd-951b-8752db7db5db_2.jpg'),
(367, 91, 'b72085c3-ecda-4d6c-b40d-bed91732cc82_3.jpg'),
(368, 91, 'e64a9c4f-51aa-491a-bee7-dae6fcc8ea83_4.jpg'),
(369, 92, '4095719a-c55d-4a18-bcfa-36964bc5726a_5.jpg'),
(370, 92, 'd8f2e76c-d357-4f95-b1a6-f2acec35e15d_6.jpg'),
(371, 92, 'daad3602-84d8-4db3-a90e-7a1f28f16c29_7.jpg'),
(372, 92, '2d2deaea-cf0a-458d-8e2d-f99f41a2c3fa_8.jpg'),
(373, 93, 'e97dbe9e-c2d4-46ff-93af-d98991fa6e13_9.webp'),
(374, 93, '08865d4a-f65f-4713-97cc-b4d8da276d7b_10.webp'),
(375, 93, '73212485-4ef3-407f-9ff6-69a59df9d6aa_11.webp'),
(376, 93, 'a1d64b5b-8eb1-4a75-9fbd-a5567bc8cddd_12.webp'),
(377, 94, '64511c7c-8b06-42fb-bbd4-06e852f55ae8_13.jpg'),
(378, 94, '1a619fdb-61af-4d0a-a8d0-2c618ecb6828_14.jpg'),
(379, 94, '41936bf9-b65e-47a5-ba96-273bb5fb7e25_15.jpg'),
(380, 94, '5b5f98f3-7b16-41f2-9222-a7ef60b81499_16.jpg'),
(381, 95, '1e776963-7dab-4d01-9c87-27dd1099c365_17.jpg'),
(382, 95, '9df44be9-4177-4e95-96ed-5bde61841387_18.jpg'),
(383, 95, '17487550-af14-4528-bfee-287111b2ee1c_19.jpg'),
(384, 95, '5cb00451-8930-4836-a32f-bc2f77cac237_20.jpg'),
(385, 96, 'aad3f6c1-39d4-448b-a3e0-5100eec7cd55_21.jpg'),
(386, 96, '41e0f40d-1c60-437e-8ac8-443bb28f944f_22.jpg'),
(387, 96, '6dfcbf6a-26b2-4f42-b1c8-37c1ae03e9f9_23.jpg'),
(388, 96, '10d653ef-fdce-4164-8275-07716ce1fb76_24.jpg'),
(389, 97, '960b2a4d-46bd-41ce-b766-174d8c62fde4_25.jpg'),
(390, 97, '7417902a-6375-4a2d-8613-cf2591f1618b_26.jpg'),
(391, 97, 'd5c55ba9-ed8c-4f34-932d-c0d1956c2237_27.jpg'),
(392, 97, '94f18c3a-0db1-431a-b847-09e642043db4_28.jpg'),
(393, 98, '515b1f79-d27f-4f40-9aac-e11f2d6b4c72_29.jpg'),
(394, 98, '3a4714ba-998f-472b-b990-2acaded76aa6_30.jpg'),
(395, 98, '792ed17b-172a-44e0-a610-ae5c20245cb7_31.jpg'),
(396, 98, '9b56ec62-637a-49d1-ba58-4a311d5e3a0d_32.jpg'),
(397, 99, '38eb7913-28b9-4638-b14e-0fa710f7b09b_33.jpg'),
(398, 99, '7bdc4cdc-bf02-450b-bb35-7f09cf04bf7f_34.jpg'),
(399, 99, '9dd8b793-196a-4cc4-a5fb-7eac08e16f2b_35.jpg'),
(400, 99, 'bd4abde1-bed4-4377-8c35-ed15979a1fbe_36.jpg'),
(401, 100, 'a095dae5-b4ef-4184-8b56-1dc355cab005_37.jpg'),
(402, 100, 'c94c4e40-de6a-4f04-83ac-8318e515ac70_38.jpg'),
(403, 100, '402257e6-d31e-4979-9d0d-f7db147da80c_39.jpg'),
(404, 101, '98eee510-8d21-4648-836a-e7b4fa575d54_40.jpg'),
(405, 101, '469743dc-ebb2-4d5c-b4fc-8512566a61f6_41.jpg'),
(406, 101, '7c39ec81-c9d5-489b-a8c0-cd9ef2f80113_42.jpg'),
(407, 102, 'f03581aa-ade4-4ec9-bb7b-f7ca345ae535_43.jpg'),
(408, 102, 'c4c0abff-1d4f-4a4b-a8a6-bab5db0e2f21_44.jpg'),
(409, 102, 'bfb212c6-626f-4983-9c3e-ef94146179e4_45.jpg'),
(410, 102, 'daea5ed7-5a0c-45f8-be42-6e88bd56701c_46.jpg'),
(411, 103, '1a759fa6-6083-4a8d-ad08-3398444da9f5_47.jpg'),
(412, 103, '03e92394-e33c-4c9f-b893-ea576797e2ee_48.jpg'),
(413, 103, 'dfb13451-e0fd-4ed8-9027-25395fd5a226_49.jpg'),
(414, 103, '60a41d24-b14d-47d2-a40f-9dedaa12f23e_50.jpg'),
(415, 104, 'c072a1b5-ec62-4275-9a93-79342cd5680c_51.jpg'),
(416, 104, 'ef759734-2f5f-4c3f-8887-acbe70c0cc02_52.jpg'),
(417, 104, '9678531e-e6ea-4679-a28f-e96ba6f7d430_53.jpg'),
(418, 104, 'd417ed3f-ff64-4061-ab57-218f88db905c_54.jpg'),
(419, 105, '65040a4e-617a-49d2-9057-4b97d6350d95_1.jpg'),
(420, 105, '4a076181-6b59-4821-937d-7bcd229d0ceb_2.jpg'),
(421, 105, 'b32dab2d-e4fb-4186-8d6a-3ae437360063_3.jpg'),
(422, 105, '845e79d1-a9c5-4a4d-8252-f3ebb7fa8d56_4.jpg'),
(423, 106, 'd46dc081-832e-4d83-8d08-884492f82eb9_5.jpg'),
(424, 106, '1b5217bf-e310-4ee5-832c-2647b9e94891_6.jpg'),
(425, 106, 'ce779222-52d3-4a77-94bf-a901196af9b3_7.jpg'),
(426, 106, '372b9c68-a8c3-4909-9d57-ba7932b273af_8.jpg'),
(427, 107, '35b50c65-0be5-444e-8474-70ee1e192ab3_9.jpg'),
(428, 107, '9bb00b15-0812-411e-be02-9baf7281c7f7_10.jpg'),
(429, 107, 'a66dfd82-3b85-4040-8f60-ffc35f7cabea_11.jpg'),
(430, 107, '27346ec9-0525-4f14-8c28-75bf686d1018_12.jpg'),
(431, 108, '73611fba-efbf-45d0-aa10-782e4b35b138_13.jpg'),
(432, 108, '840b79fc-58a3-43fe-bf0f-8e3af72c8425_14.jpg'),
(433, 108, '276b5e50-525f-498c-82f8-def83adfa418_15.jpg'),
(434, 108, '2e2cf11a-042f-44e0-b067-3e78b6436b69_16.jpg'),
(435, 109, '8c27cfba-5603-472a-b3a8-53e25779f1dd_1.jpg'),
(436, 109, 'bd6969d2-d3f1-478d-8dbc-ef1e15e6225e_2.jpg'),
(437, 109, '3d9a3b05-dee7-458f-a052-6fa03eb9789b_3.jpg'),
(438, 109, '4b41789d-b74c-4748-a938-8d1a7fff9ede_4.jpg'),
(439, 110, 'f5ef64ba-fcaf-4d3e-907d-ae59715b71fe_5.jpg'),
(440, 110, '49a946ff-b754-4664-be22-ea303528f96f_6.jpg'),
(441, 110, '7628dd55-434b-4eb0-8283-f0e479d1bba5_7.jpg'),
(442, 110, '62e28b8c-f0dc-4a7f-a931-aa38b3e0562b_8.jpg'),
(443, 111, '6e9f4f47-d273-4ffa-9829-bf8dd2d0fb77_9.jpg'),
(444, 111, '3321d7f4-386a-43b4-ab7f-2d38c3f6f384_10.jpg'),
(445, 111, '78d22fca-3ed7-40d4-81dc-b2c3bdc1e4b1_11.jpg'),
(446, 111, 'c6034af3-84b8-4bba-9d6d-fe8e62766e68_12.jpg'),
(447, 112, '291f10aa-93b7-4411-8542-d9427a259323_13.webp'),
(448, 112, 'db2d2604-f83e-482c-b8ae-1e8fca830d11_14.webp'),
(449, 112, '2142c13a-580a-4efd-9611-4e4f5668c5e3_15.webp'),
(450, 112, 'de094d4c-b614-4028-a2e8-c6bcd7dc8237_16.webp'),
(451, 113, 'b1038089-d024-4f63-b646-645e85ba23b4_17.jpg'),
(452, 113, '9e36a1fb-c100-476f-881d-6fa871358040_18.jpg'),
(453, 113, 'e6944842-5a81-40e1-8f0d-447b1c7bce29_19.jpg'),
(454, 113, 'bd6f7806-d9a8-4f47-b355-6c504512722d_20.jpg'),
(455, 114, 'd306f185-593d-423a-88ac-5e6661bed627_21.jpg'),
(456, 114, '2bef19c6-b046-44e6-9ca6-feb9127653f3_22.jpg'),
(457, 114, 'ddf198e6-13ec-4ba5-a14d-3866261ccb19_23.jpg'),
(458, 114, '2b4c559f-8f44-47b3-8634-77f0c13f9976_24.jpg'),
(459, 115, 'a2ad9503-bc8e-4c4f-aa77-922583618e36_25.jpg'),
(460, 115, '1a7d6c25-375c-43ee-8193-ef9efc64f401_26.jpg'),
(461, 115, '9b32d66e-f70c-4ee8-9a04-743048728e7e_27.jpg'),
(462, 115, '9d56823a-8dcc-45a4-b0f3-12bc21ab1f38_28.jpg'),
(463, 116, '751fcecd-bdff-4b76-ad46-cc586f6f924f_29.jpg'),
(464, 116, 'dae53cbf-98eb-4d81-a42c-8d5289083156_30.jpg'),
(465, 116, '15c1b259-e9f7-49ca-97a3-772ab30f42c0_31.jpg'),
(466, 116, '7825f1fe-24c9-4fa4-92f1-596a956b0fd3_32.jpg'),
(467, 117, 'c08c1e8a-fc39-4e85-8dd4-1f00461efa32_33.jpg'),
(468, 117, '531b5c66-db36-4985-b7ed-ea43cda709b0_34.jpg'),
(469, 117, '873fd611-d2d9-4a3c-a7c1-8d5f7402c3be_36.jpg'),
(470, 117, '8bc8afe1-ad41-4a40-8765-a8a7bf2629dd_45.jpg'),
(471, 118, '4da8449e-8575-408f-9a01-20ca4fc72b8b_37.jpg'),
(472, 118, '911e51bb-d97a-4b63-b0c8-7774e52cc420_38.jpg'),
(473, 118, '34e7129b-5439-4be0-b573-ade3c0448876_39.jpg'),
(474, 118, '56cf56f5-5ef9-4574-80d0-c3e61f79c42a_40.jpg'),
(475, 119, 'cc4e121b-e2d9-4948-a0ed-901052ba67da_1.jpg'),
(476, 119, 'c488a301-4e9a-49a9-832d-deb1e79009f0_2.jpg'),
(477, 119, '5f056e80-0afa-4ab7-91dd-8c24012aa595_3.jpg'),
(478, 120, '33541854-5753-49ba-b6d1-efe4ecc4f655_4.jpg'),
(479, 120, '4fad4b32-5992-4bb6-9c9e-d381a03e1c28_5.jpg'),
(480, 120, '87161da4-7d5d-4ae5-b44b-7bdbbe0f3239_6.jpg'),
(481, 120, '1d3ef745-3843-4e70-aac4-da27091ca90c_7.jpg'),
(482, 121, '1dc822a8-8c84-4aa6-a76e-a4358c90a732_8.jpg'),
(483, 121, '5182dff5-a1f5-43a3-8367-e7fedbd02c05_9.jpg'),
(484, 121, 'f0ef9125-8ce1-4ea1-a68a-b36d2b2260f6_10.jpg'),
(485, 121, '6ebc5896-e16c-44eb-a5da-63c1a7639f48_11.jpg'),
(488, 122, 'beecd900-1c18-4114-85ab-8ee8a500887d_12.jpg'),
(489, 122, '43384713-157c-4447-b524-a3db586cb0d4_13.jpg'),
(490, 122, 'ebfc0d07-6cf9-4cdc-a945-693a1d98dc65_14.jpg'),
(491, 122, '49603bba-12d6-4530-a17e-94e027cd730e_15.jpg'),
(492, 123, 'd8f4bc3c-fdf2-44fd-a007-e3f9bad4cec2_16.jpg'),
(493, 123, 'ce69e248-38dc-4362-80b3-d36630e5c9c2_17.jpg'),
(494, 123, 'cd52f155-db42-4fc3-aa51-231ed769fe2d_18.jpg'),
(495, 123, '7521f44f-70ab-4243-bdaa-269e62067797_19.jpg'),
(498, 124, '07724c30-615b-425f-a131-0e189933c1a0_20.jpg'),
(499, 124, '901115bf-8013-498e-8c2c-0dcef1033cae_21.jpg'),
(500, 124, 'b891ec68-521f-4b43-8b87-55615a1493c6_22.jpg'),
(501, 124, 'c3b95bb1-2045-43be-b5d4-945f55a47a96_23.jpg'),
(502, 125, 'f606848b-f079-4519-ad18-d80ba6e8f475_24.webp'),
(503, 125, '3197782d-dc2d-4ede-aaf1-6ade158e38ac_25.webp'),
(504, 125, '65e0ccb7-5bcc-42e8-b48a-5cdc61336ace_26.webp'),
(505, 125, '6fb68bd9-dea9-468e-8874-f0dbb0ccfeaf_27.webp'),
(506, 126, 'ad17bdc3-0170-4c7c-85ba-6dd160f2b811_28.webp'),
(507, 126, '1581d380-eeba-461d-a58b-a04a7d146f2f_29.webp'),
(508, 126, '9753f65f-075c-461a-9c4e-8517a13e80e8_30.webp'),
(509, 126, '8e5599e0-f067-46e3-8033-5a33a5ffdeb0_31.webp'),
(510, 127, 'bb35a5f4-bda1-43b2-80cb-032f1ac38374_32.jpg'),
(511, 127, '7452144c-1435-49fe-ba74-286dd6b5e459_33.jpg'),
(512, 127, 'd5ec1dcb-1aad-4612-b14b-ff5399f34662_34.jpg'),
(513, 127, '2153c822-523f-4401-a693-e991a9c41688_35.jpg'),
(514, 128, '6752cc44-e723-47e7-9201-2a6684cb4f1f_36.jpg'),
(515, 128, 'b5772e3a-c49f-4eff-aa5a-ee2b5f37cbf4_37.jpg'),
(516, 128, '448cfe73-f82c-43a6-ba39-1f584c9ccb96_38.jpg'),
(517, 128, 'b8716470-20a1-47e3-8f63-a21f07dc6e77_39.jpg'),
(518, 129, '58a213c2-5ae1-4f22-9dd4-c2687ee2c828_40 - Copy.jpg'),
(519, 129, 'b456b7a5-df25-4849-9d73-14bafcb02caf_41 - Copy.jpg'),
(520, 129, 'ac946e4a-d34f-48ec-9d19-81fcf5be694e_42 - Copy.jpg'),
(521, 129, 'a3e11300-bc13-4223-9860-df20f3f85487_43.jpg'),
(522, 130, '046a61f6-73a4-49a0-88d9-9a7c31c66299_44.jpg'),
(523, 130, 'd49c30bd-7315-4629-b445-f29f04d79df2_45.jpg'),
(524, 130, '2dc2fd52-6b33-4555-af67-27eb725724f7_46.jpg'),
(525, 130, 'e0a7dffe-3c94-4959-b538-e2030c34e5ca_47.jpg'),
(526, 131, '2e63c85d-8cca-49df-8269-ee5054dbaaa1_48.jpg'),
(527, 131, 'c1cf1bee-cf53-4169-89a5-8b7c9d5ace86_49.jpg'),
(528, 131, 'e5dec0fe-2ac2-4611-a4fd-4ae2439261c4_50.jpg'),
(529, 131, '50bceb09-3a57-4210-908d-7f5b2fe4f164_51.jpg'),
(530, 132, '8f9109de-903b-48bf-a9ed-ce254bc6aec2_52.jpg'),
(531, 132, '3808be7c-5d8c-49d1-ba87-b5508d3603b4_53.jpg'),
(532, 132, 'cff221e6-8e5a-4344-a94d-ebd7b2590702_54.jpg'),
(533, 132, 'd10ae235-a3dd-4292-9048-1d4228c80ce2_55.jpg'),
(534, 133, 'bfbe3351-a22b-4eba-b36f-cfdc720d5234_56.jpg'),
(535, 133, 'ac5b2339-7047-44e7-970e-c5eb9f121e4d_57.jpg'),
(536, 133, '85ee2c43-25a6-49c2-b548-1b69b3d141f5_58.jpg'),
(537, 133, '2074b360-b2a7-4c5d-abef-f47d68bedea8_59.jpg'),
(538, 134, 'fc452e36-11d8-4f09-aa16-a0f30d777161_1.jpg'),
(539, 134, 'a4075ea2-653a-4073-bb9b-0f8a825e63af_2.jpg'),
(540, 134, '4c83cb90-2901-4d8d-836d-f3199e152ea9_3.jpg'),
(541, 134, 'a4a7e44d-4bfa-41ff-9648-33d55008a59a_4.jpg'),
(542, 135, 'b7d20035-2f89-4b83-be69-3494780c67d8_5.jpg'),
(543, 135, '688c5207-32ec-4d99-a6f5-a845971126f7_6.jpg'),
(544, 135, 'eb25495a-fce9-4dfc-9f99-59eb231e7633_7.jpg'),
(545, 135, 'a73596cf-44d8-4112-854a-77aea3913d2f_8.jpg'),
(546, 136, 'e90fc1a5-0241-4e12-bc83-cf5c32596828_9.jpg'),
(547, 136, '8bbc28f3-31fd-4f40-a0b0-ab8e27f5d24b_10.jpg'),
(548, 136, '12b1d284-ba46-4461-b98d-6483733a8100_11.jpg'),
(549, 136, '85520f7c-07b0-4799-bf86-b672ffa2a59e_12.jpg'),
(550, 137, '993afa5f-6f19-4f5b-92cd-3b3df671116a_13.jpg'),
(551, 137, 'e3fef1ac-c9a8-4d2b-a659-fcea691f6841_14.jpg'),
(552, 137, '6536638c-b3ea-46fc-8b39-481b29cd7ad9_15.jpg'),
(553, 137, 'e519581e-4131-44db-83ce-0bfc93f76dc3_16.jpg'),
(554, 138, '4b187251-94b3-4eb6-9a31-04ca4d071e3c_17.jpg'),
(555, 138, '1e7ab7dc-2685-4194-b678-a114af265e74_18.jpg'),
(556, 138, '4ba274f0-5562-4a84-84a1-14b7fa888d3a_19.jpg'),
(557, 138, '3c3b9015-fecd-4e24-96d7-75c59cda533e_20.jpg'),
(558, 139, 'cde5c315-b39c-4bbb-8c21-c9e627d52202_21.jpg'),
(559, 139, '5782cc05-f46d-491a-9246-faca6e394554_22.jpg'),
(560, 139, '189a673c-db34-4cc7-87f6-21f60fb45230_23.jpg'),
(561, 139, '72caa236-2112-45d2-b214-aecb3d548ea4_24.jpg'),
(562, 140, '164d85ea-87a2-4bcd-b873-59be36210ae3_25.jpg'),
(563, 140, 'c48c2205-0c1c-48a2-a7d1-48fbd5276c53_26.jpg'),
(564, 140, 'abe5fb99-de11-4c9c-ae79-7337ec597666_27.jpg'),
(565, 140, '1c399ecc-b3a7-44cd-84dd-f95e14de63ba_28.jpg'),
(566, 141, '8cc365da-f524-4ef0-a337-f6fa0c67dcfa_29.jpg'),
(567, 141, '704425fe-4a8c-44e1-9ceb-2498ae9c7f61_30.jpg'),
(568, 141, '502b59f1-e499-48d0-95bc-4624987e575c_31.jpg'),
(569, 141, '47cbc738-097f-481b-a490-7a894e70daf6_32.jpg'),
(570, 142, 'fb87e527-ff53-4155-82bb-4985db788674_33.jpg'),
(571, 142, 'ceed4a16-bd3e-4d53-9257-f6a32a5c3501_34.jpg'),
(572, 142, 'a03fe0b8-7fde-4371-8028-963ad5b17299_35.jpg'),
(573, 142, 'a6de05f7-073b-469a-8aba-00eacf2f7d2d_36.jpg'),
(574, 143, '5878bcd7-a854-49f4-9f6f-894c8509a18b_37.jpg'),
(575, 143, '2465c4b6-edc8-475c-a209-d2ad0e4b5d7b_38.jpg'),
(576, 143, '9fd2d793-6a93-472a-8e35-a2eeca5b3c15_39.jpg'),
(577, 143, '0c311f67-e212-4397-b3f8-9b83d2b55e1f_40.jpg'),
(578, 144, 'e6a12716-e62a-4c56-8a71-0a3f5ab07626_41.jpg'),
(579, 144, '2107430c-96e1-419c-9aa4-9603d2036543_42.jpg'),
(580, 144, '0480852a-8938-4bb6-91b8-ade0c446ef2b_43.jpg'),
(581, 144, 'eec823e5-d6c7-4b8a-9f11-4f1b0f018306_44.jpg'),
(582, 145, 'aaeb94e6-b5c6-46af-b6d4-c0da51227c2d_45.jpg'),
(583, 145, 'a12f940b-897f-4376-aa27-0621820ddbf6_46.jpg'),
(584, 145, '13d2183e-7585-44c3-a665-ca39d4bf6c29_47.jpg'),
(585, 145, 'fedf1059-0434-4468-999c-78786669a03b_48.jpg'),
(586, 146, '1fb3de9d-fdff-460d-95c3-3e1a0d20ad6c_49.jpg'),
(587, 146, '11c979c7-f468-497c-9129-7a8613b0c494_50.jpg'),
(588, 146, 'ddeb4c41-bc34-4ecf-b8d2-2fbab0824c3b_51.jpg'),
(589, 146, 'b9735ab7-4a8a-4722-90a4-dc775e2a953d_52.jpg'),
(590, 147, 'adb985a1-c798-4302-984c-46b6b874e36a_53.jpg'),
(591, 147, '0a3f127f-3135-49a4-b1b4-1021c9cbed38_54.jpg'),
(592, 147, '4d1347dc-ca1f-42a1-819b-86c7b9c7b638_55.jpg'),
(593, 147, 'fbc96414-2d3b-44a6-ad3a-6be62fef2a81_56.jpg'),
(594, 148, '4672d1db-2bfe-4530-a323-ed2dd5aaa5b2_57.jpg'),
(595, 148, '4e8cbc2f-23a8-4fc2-a9c0-0b5d2d69664f_58.jpg'),
(596, 148, 'a351ff44-0c3b-4605-86a5-492778ac3ad9_59.jpg'),
(597, 148, 'ca5bb181-f1f6-483b-9fb5-e0a4ada3f23b_60.jpg'),
(598, 149, 'a4ddb4c9-d970-44ac-82aa-aba6c83f058a_61.jpg'),
(599, 149, '59fafebc-9f65-45e6-8817-5a976e94715d_62.jpg'),
(600, 149, '9bd06fea-3e93-46d8-ac02-04be42ab2531_63.jpg'),
(601, 149, '9040bd69-2acd-4b34-9dc2-d2f85c9b9f7a_64.jpg'),
(602, 150, '40e37266-c759-4878-b0bd-e5689abe6123_65.jpg'),
(603, 150, '849cd913-5a13-462c-869c-35512d577008_66.jpg'),
(604, 150, '00461389-6905-46b2-a575-75f4b5db4dff_67.jpg'),
(605, 150, 'ebe20625-87a4-4d48-a42a-f379894a2816_68.jpg'),
(606, 151, '821e669e-f17e-4c88-89f1-3e5aa3a7d358_1.webp'),
(607, 151, '31360b5b-ca35-4dc5-9235-f5f3c76d3257_2.webp'),
(608, 151, 'bafb8092-4643-41fa-8940-49ef9e8c87f2_3.webp'),
(609, 151, '2ab86314-b68e-4051-ae8d-3f8aee1fd95b_4.webp'),
(610, 152, '6ba40550-f3d4-4ddf-ad8b-69a32a6d5ce4_5.webp'),
(611, 152, 'd79e4c12-c421-4e66-b54c-25dd8fa5da15_6.webp'),
(612, 152, '33d8305c-19ed-4dbc-a456-3fb897d4d4d3_7.webp'),
(613, 152, '4cb71284-9f3a-45b3-812c-3496fb3af689_8.webp'),
(614, 153, '0ef32c22-44d5-4707-955f-e3df0d5b5d79_9.webp'),
(615, 153, 'd7c021e7-94a1-40c8-b7f2-d969be481728_10.webp'),
(616, 153, '53aa19a9-52f3-4f05-b782-4c675e2429f8_11.webp'),
(617, 153, 'd9a3cccd-c906-4c1d-b373-c59305fa9ef9_12.webp'),
(618, 154, 'b9d4cc61-78dd-4044-b78e-b263f20c2d75_13.webp'),
(619, 154, '453036fc-04a6-4504-ba2c-83295c087452_14.webp'),
(620, 154, 'cbd48033-93e5-4223-9fb2-5663975e93d6_15.webp'),
(621, 154, '647b1823-3c20-467c-8cd8-acda3eaf3a2a_16.webp'),
(622, 155, 'a348262b-054c-42ed-91ee-5895886af064_17.webp'),
(623, 155, '003f7df2-2d03-4e66-a3ce-2a5b2666e4c8_18.webp'),
(624, 155, '76c675ad-ed0c-4cf6-a159-2072cbd0b5cf_19.webp'),
(625, 155, 'e48efea6-e6e6-4e44-8bc6-7d743bbf1276_20.webp'),
(626, 156, 'a3e623bb-81af-4a3a-b183-28e679305b83_21.webp'),
(627, 156, '1e94afc0-83e1-476e-a54e-cf308e56acea_22.webp'),
(628, 156, 'ceded592-c9fd-4804-9d81-616ad2129181_23.webp'),
(629, 156, 'fe0d48d1-447d-4218-a826-f200d06cb989_24.webp'),
(630, 157, 'b30a658d-e02d-478c-9d38-2f5ac7ba20f3_25.webp'),
(631, 157, 'b4ce40af-59b2-4eb3-abd2-3f10b41fbdc0_26.webp'),
(632, 157, 'aa5f3e19-1fc9-4ac5-86b4-73cf1992a268_27.webp'),
(633, 157, '172a665f-fd94-4bc9-b7a3-d13509939e78_28.webp'),
(634, 158, '92e4f1af-5523-4d6b-815c-2b6b6e6cad28_29.webp'),
(635, 158, '04083479-1a10-491f-97f5-7392ca9d01a0_30.webp'),
(636, 158, '983c2d39-e021-401e-a52a-52138daf72a9_31.webp'),
(637, 158, '64a3424d-7727-44a9-a5b8-66274348ed5b_32.webp'),
(638, 159, 'c89bc8e6-c6b8-48f9-b7c3-d26c5e36f79b_33.webp'),
(639, 159, 'f7d33939-9931-4e79-9059-0d450a6f07e4_34.webp'),
(640, 159, 'f7fb22ca-7f99-4c8d-bbf8-6faa99018a23_35.webp'),
(641, 159, '22aaa098-6431-4032-b6db-58b854cfeaf7_36.webp'),
(642, 160, 'fca9f29d-f9d0-4ca3-a205-234257f95c9f_37.webp'),
(643, 160, '53c2f736-3096-4b6c-9087-f640d538efea_38.webp'),
(644, 160, 'ea3b96c2-24bf-47a4-8d70-c7eac6e07a89_39.webp'),
(645, 160, 'a7d24dc7-c3ab-432d-91ea-3989ef37c999_40.webp'),
(646, 161, 'e21f9d3b-1252-426b-a00e-62c36d34f2b9_41.webp'),
(647, 161, 'd40d7686-e2b7-47b4-b111-b4a4e9c14369_42.webp'),
(648, 161, 'b1127388-e9e8-4c2b-aa19-9b736a42d2ff_43.webp'),
(649, 161, '5facb89f-7b2b-4051-b31b-51d3c93c4b4c_44.webp'),
(650, 162, '9fd0cf4b-a2fd-499d-a4b4-46df1f14a488_45.webp'),
(651, 162, '05d71f96-62c2-4005-aea8-68fec7f363d6_46.webp'),
(652, 162, '06dafd09-4a14-4478-8422-ae2ab42f48ce_47.webp'),
(653, 162, '54f7919d-4664-4bb1-bc6e-96b739403c64_48.webp'),
(654, 163, 'aec0503f-3210-4a23-ac66-2ebb9fda6753_49.webp'),
(655, 163, 'c61cd0d3-af86-4b6c-957c-dadeb788b36c_50.webp'),
(656, 163, '70acd4db-d812-4576-a21d-05df877b620c_51.webp'),
(657, 163, '21745d90-3844-4a52-a404-7f4ace91bc79_52.webp'),
(658, 164, 'e8e5949c-042a-4c1a-adbb-48fe2d1452b0_53.webp'),
(659, 164, 'cff5cf40-5aa5-4dc6-aded-a3a39e47cc7a_54.webp'),
(660, 164, '3df5a669-1679-4fd6-ba58-624c6488aa7d_55.webp'),
(661, 164, '6046b2eb-7c73-46a6-82c3-d4ddb1b49842_56.webp'),
(662, 165, '50e9c82f-228e-48bd-8102-6c412f17a99c_57.webp'),
(663, 165, '7a8d6b96-d77c-4f80-8505-f981ef5c2e7d_58.webp'),
(664, 165, '001bc46d-e8dd-411e-ab74-0b6108642d09_59.webp'),
(665, 165, '6afc93f3-7fe0-43bb-8630-b1de707fdc6d_60.jpg'),
(666, 166, '761dd151-e12d-431f-9867-02ff399ec286_1.jpg'),
(667, 166, '5baf561b-b5b2-4252-9de7-5c817d8c5df1_2.jpg'),
(668, 166, 'f70c84c0-83f5-46c9-a603-f0e4c2e25f5a_3.jpg'),
(669, 166, 'aad9828b-0fcf-43b5-9411-4084449217eb_4.jpg'),
(670, 167, '7a649efd-e45c-48b7-bc48-8bfdf65891f7_5.jpg'),
(671, 167, '9f07c483-5608-4627-a586-ea8db9136ab8_6.jpg'),
(672, 167, '7b54a6dd-5c82-4325-9409-56ccfed9cc15_7.jpg'),
(673, 167, '461a09ef-c9db-4a02-8c16-3a6d33692acb_8.jpg'),
(674, 168, 'bca99298-9213-46e9-9ac6-01755f930ce2_9.jpg'),
(675, 168, '78fe24aa-2ed9-4231-a315-f31fa6de974b_10.jpg'),
(676, 168, 'c913de6f-6c54-474c-aada-5587696b8e34_11.jpg'),
(677, 168, '81ecba18-4ccf-4c7f-ad82-443caba3b47c_12.jpg'),
(678, 169, 'bbe15e07-e944-4742-83e5-0ba6097f1bd2_13.jpg'),
(679, 169, '825b2adc-16e4-4128-91c1-cbb128c296a7_14.jpg'),
(680, 169, '87538bd5-396b-42fc-890b-025446acac78_15.jpg'),
(681, 169, '7ac6a20d-ef36-44fb-9d5f-94856deb75a3_16.jpg'),
(682, 170, 'ecac49be-b446-472e-8c71-820921df96de_17.jpg'),
(683, 170, '8e443334-093a-4fa1-9dee-06c971b096ab_18.jpg'),
(684, 170, 'faf6b845-9abe-483f-a628-1517186a2d4f_19.jpg'),
(685, 170, '31c422cc-2b0f-4406-8f06-f6eb89145a27_20.jpg'),
(686, 171, '6e0e9b4e-724f-4582-80c3-7dfdd6f97f85_21.jpg'),
(687, 171, 'a5c0e164-bbd6-416f-8b00-9db1cd2cf049_22.jpg'),
(688, 171, '73870a4b-90d6-46b8-8a45-9f0165bcb047_23.jpg'),
(689, 171, '7170f12d-0ae8-4465-a3f0-ea06a3115387_24.jpg'),
(690, 172, 'b57a33f8-91aa-451c-8c09-33d1bc3db692_25.jpg'),
(691, 172, '923abf87-3ace-4178-b803-9b4a4aca7967_26.jpg'),
(692, 172, '4ca79c10-d09b-47bb-8622-85491ab1c816_27.jpg'),
(693, 172, '27b11bc7-85bf-4fff-8a02-dab09fe3ed94_28.jpg'),
(694, 173, '5420e0bf-26be-44bb-91f6-be3ebeae798d_29.jpg'),
(695, 173, '36abe141-f94b-4efd-9ef2-3d4363bfa100_30.jpg'),
(696, 173, '36b0b8a2-2884-4fd2-a8b4-ddff63bc90e3_31.jpg'),
(697, 173, 'a05516ba-442b-43b2-b538-d8d8752e9881_32.jpg'),
(698, 174, 'f12deaa1-9968-436a-ba16-36a17988afae_33.jpg'),
(699, 174, 'fc55efdd-ddf2-4862-abeb-b4a339cebc46_34.jpg'),
(700, 174, '0ed355a7-5667-4c63-bf77-294d9be4ba0a_35.jpg'),
(701, 174, '61c85fc1-17e8-4b5a-8c45-06670954a74c_36.jpg'),
(702, 175, 'caf5d51b-8a28-4323-8e34-57eea8dcb2a4_37.jpg'),
(703, 175, '10cccabb-ae39-484d-9c02-5335152f8b34_38.jpg'),
(704, 175, '299f7ba6-665f-44ef-8e68-aa2801a6c0d9_39.jpg'),
(705, 175, '4efff02c-2e00-4a10-9661-bab9f239bfcb_40.jpg'),
(706, 176, '29ded295-5256-4bf1-b920-12fcf7a26a25_41.jpg'),
(707, 176, 'a821e5d4-8363-4297-bbe1-706ac492cb89_42.jpg'),
(708, 176, '086c9986-262f-49b6-83dd-fc232cea2387_43.jpg'),
(709, 176, '035a6a16-cfac-47b9-8717-2bdc71386568_44.jpg'),
(710, 177, 'd86c88aa-2300-4591-b3ad-c29238f3cde6_45.jpg'),
(711, 177, '69d05c24-46e6-4c91-bb41-c05eb62d77b8_46.jpg'),
(712, 177, '33d57a3c-c844-4c37-8550-7dc0624fadff_47.jpg'),
(713, 177, '53033ea4-6fb1-401f-9fcb-a18c0decd747_48.jpg'),
(714, 178, 'c99ba5d9-9e92-4cba-9ea8-821f2f15e0e4_49.jpg'),
(715, 178, '6d225d98-0eeb-4861-b169-2af2e5ccc79e_50.jpg'),
(716, 178, 'e1a30d51-7f07-4e1e-8b0c-d6b3a461b7df_51.jpg'),
(717, 178, 'c14db8fe-4fdf-4bdd-9d9d-ad0a939b21cd_52.jpg'),
(718, 179, '37f46cd8-ceb2-4901-8b0f-d3381e3da9e2_53.jpg'),
(719, 179, '4a98ea44-65b2-45e5-8f20-160c9a5e1272_54.jpg'),
(720, 179, '32a5966b-a27b-456e-b1aa-c2e6565bceb0_55.jpg'),
(721, 179, '5e22b3fd-16c5-4564-ad48-d0f76e9410cd_56.jpg'),
(722, 180, '6cfe0f67-f3c0-4fb2-9841-43d1203e860a_57.jpg'),
(723, 180, '64a929e1-10ce-4536-b56f-edbb2dc8df40_58.jpg'),
(724, 180, '7e35b4ca-b853-4fb4-8e38-c465a1107de2_59.jpg'),
(725, 180, '0c05b27c-8964-4a1e-9356-32a76baef4da_60.jpg'),
(726, 181, '3b82c73f-7ce1-4281-aa14-596610b3e59a_1.webp'),
(727, 181, '434fc643-0499-45a3-9b17-b4a3fd0e17eb_2.webp'),
(728, 181, 'cec58af7-6155-462a-9ccf-c9ae0906424f_3.webp'),
(729, 181, 'f759bea3-19e8-44da-b8c4-442c245771f7_4.webp'),
(730, 182, '5d9c207b-2ca2-4724-a7e7-a852d9e52d26_5.webp'),
(731, 182, '02ebcd7e-1ecf-4bdb-9e27-18e984a0999d_6.webp'),
(732, 182, 'a71646be-e692-4d61-b644-9bf90b644e8b_7.webp'),
(733, 182, '1353cdd4-05ea-400b-8c75-b2dda6530e5f_8.webp'),
(734, 183, '282dcdb0-949a-4337-a087-48b6bbd765a6_9.webp'),
(735, 183, '30c84327-d6d7-412c-b772-22dc92f972b2_10.webp'),
(736, 183, 'b0515cc3-6b89-42c5-b958-755afee27033_11.webp'),
(737, 183, '0bb3baa2-8712-46e9-be80-a15b62c36696_12.webp'),
(738, 184, 'e67ca69b-b292-412f-8ef7-c2f14dd4461b_13.webp'),
(739, 184, 'b4f16d5b-b7bd-4c96-a163-b4c84c1ac0b7_14.webp'),
(740, 184, '7e7072c5-f8ec-44b2-9f3a-dd368791b33e_15.webp'),
(741, 184, 'f89a82a5-95cc-4ef7-ae60-cfcc7be1dafc_16.webp'),
(742, 185, '2aec29cc-25e6-4636-8d5a-f2812460d1d0_17.webp'),
(743, 185, 'a63bc2c0-76b1-46ed-86b8-8ae44d0c8ca9_18.webp'),
(744, 185, 'e205053d-af60-49a7-af73-409898b80bbf_19.webp'),
(745, 185, '8a2ea929-1235-443f-83d9-65e207c2164c_20.webp'),
(746, 186, '21798331-406b-4811-a076-19be8b7f8605_21.webp'),
(747, 186, 'e9ca717a-206f-4882-9022-06347c49335d_22.webp'),
(748, 186, '0b969219-9718-4eb8-b8f7-a9ae5d7cc30e_23.webp'),
(749, 186, 'b3982c40-b38a-45eb-b5b9-55c6fafeeb64_24.jpg'),
(750, 187, 'e1679470-2231-4abc-a0ac-d183a043cf68_25.webp'),
(751, 187, 'b64f9f2f-bb9f-4d40-90ec-bd644798a0b2_26.webp'),
(752, 187, '6e655967-0eda-439a-b7aa-cec2e14036ec_27.webp'),
(753, 187, '19a83fbb-1486-4acb-b6f0-b8d1a2ef50be_28.webp'),
(754, 188, '5c8a98ae-d733-43e8-8314-6db9e4142acf_29.webp'),
(755, 188, 'e5921110-bc71-4f7a-ac7e-6ef7595045e9_30.webp'),
(756, 188, '06302e57-22c3-4300-9a34-d40f3810e33d_31.webp'),
(757, 188, '02b3dafc-f75a-4083-a6cf-e86541c3db41_32.jpg'),
(758, 189, '7c58bb15-f6bd-4c5d-a35b-a83934952d9b_33.webp'),
(759, 189, '3d52f347-bead-4564-9b22-771f4daf9c40_34.webp'),
(760, 189, '5147a160-5efd-4deb-8d71-47b8b1f7eccb_35.webp'),
(761, 189, 'bf7ea843-0d07-4f1a-a8cd-0ec5222e2818_36.webp'),
(762, 190, '76c63e80-f85a-42ed-81a3-ae7a3886753f_37.webp'),
(763, 190, 'a5b7fe76-9b13-4986-8e55-940328813081_38.webp'),
(764, 190, 'ef505872-f30d-41c2-8ce8-764de34d466b_39.webp'),
(765, 190, '2f54952f-6ad3-4197-aa9c-ef3fa7fa81e7_40.webp'),
(766, 191, '89141f8d-44d8-4920-ba71-367260f87d60_41.jpg'),
(767, 191, '91b74d83-97fa-4111-a91e-830f5bb9bcc7_42.jpg'),
(768, 191, '8f6b53e0-6bd5-4349-b94d-508c83bab5df_43.jpg'),
(769, 191, '5c97761c-868a-4347-8b4c-4ba782c609dd_44.jpg'),
(770, 192, 'bca159cd-463c-4b78-9709-c62fdbd23f28_45.jpg'),
(771, 192, '48f93d3e-6980-4ebb-a3f9-f32d7f7df0ca_46.jpg'),
(772, 192, 'e371930a-92b2-4a1c-96c3-e386e0ee1f0a_47.jpg'),
(773, 192, '8bd03c5e-da95-4934-b773-6cf1acfa6303_48.jpg'),
(774, 193, 'df2f814a-6851-4917-8b26-684025541141_49.jpg'),
(775, 193, '49cf6154-8eed-409b-9eaa-56e591b293e3_50.jpg'),
(776, 193, 'edb12dbf-cbf8-43ae-979e-b94eb503eca4_51.jpg'),
(777, 193, 'c749d5d4-e148-4ef6-9ca0-1e0e7b705f55_52.jpg'),
(778, 194, 'd2f4958c-3522-4086-904a-066e1e50afa8_53.jpg'),
(779, 194, '9740a8b8-7707-41a1-a860-2d920ebe583f_54.jpg'),
(780, 194, '5ba8abd0-8a04-4ca7-82df-ec38c8110c75_55.jpg'),
(781, 194, 'e4d1f73e-8ca2-44a4-b0a4-bcdaff10c5e3_56.jpg'),
(782, 195, '96841606-e140-499f-9f7f-b6009260b1d0_57.jpg'),
(783, 195, '9d340b0e-99e1-4a3d-9847-d7c3b5ca4ff3_58.jpg'),
(784, 195, '502e7f3d-6f98-4460-a8a2-d864124ba539_59.jpg'),
(785, 195, '8d30a433-578a-49dc-8b3e-caaeb8c213c0_60.jpg'),
(786, 196, 'd30b2ac2-e2ae-4273-972e-8ccd18ad8c8f_61.jpg'),
(787, 196, 'ced43ff7-0448-4e61-bb70-5f8f4702a059_62.jpg'),
(788, 196, 'd65341f2-1bc1-48a6-82e1-ff338b338cdc_63.jpg'),
(789, 196, 'aea4a2fc-bb06-4c4f-803d-16cc7cfab374_64.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'USER'),
(2, 'ADMIN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(11) NOT NULL,
  `provider` varchar(20) NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) NOT NULL COMMENT 'Tên người dùng',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(50) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT '',
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` int(11) DEFAULT 0,
  `google_account_id` int(11) DEFAULT 0,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`) VALUES
(2, 'Nguyen Duy Quang', '011229832', '211 Khuong Trung', '123456', '2024-11-16 07:14:27', '2024-11-16 07:14:27', '2002-10-10', 0, 0, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_details_order_id` (`order_id`),
  ADD KEY `fk_order_details_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_social_accounts_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `fk_tokens_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=790;

--
-- AUTO_INCREMENT cho bảng `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_details_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `fk_social_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `fk_tokens_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
