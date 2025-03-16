-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 25, 2024 at 02:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project-web`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(62, 33, 13, 1, 'Cường lực tự dán RỒNG VIỆT', 200000, 'cuongluc3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(1, 'Bộ sạc', 1),
(2, 'Cường lực', 1),
(3, 'Ốp lưng', 1),
(4, 'Sạc dự phòng', 1),
(5, 'Phụ kiện', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `userId`, `name`, `email`, `phone`, `message`, `created_at`, `status`) VALUES
(1, 1, 'Tú Lê Anh', 'anhtumc9ass@gmail.com', '0367234670', 'Sản phẩm rất chất lượng', '2024-11-12 07:32:34', 0),
(2, 34, 'Thái Quỳnh Ngân', 'qngan@gmail.com', '0367234671', 'Tôi rất thích ốp của shop ^^', '2024-11-01 23:53:19', 1),
(3, 33, 'Lê Anh Tú', 'anhtumc9ass@gmail.com', '0367234670', 'Sạc dự phòng giao về không đúng màu', '2024-11-08 23:54:40', 0),
(4, 33, 'Tú Lê Anh', 'anhtumc9ass@gmail.com', '0367234670', 'this is message', '2024-11-25 03:59:50', 0),
(5, 33, 'Lê Anh Tú 123', '', '0367234670', '', '2024-11-25 11:10:07', 0),
(6, 33, 'Lê Anh Tú 11', '', '0367234670', '', '2024-11-25 14:18:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(46, 33, '2024-11-10', '2024-11-10', 'Complete'),
(47, 33, '2024-11-10', '2024-11-15', 'Delivering'),
(48, 33, '2024-11-10', '2024-11-11', 'Complete'),
(49, 33, '2024-11-11', '2024-11-15', 'Delivering'),
(50, 1, '2024-11-12', NULL, 'Processing'),
(51, 33, '2024-11-12', NULL, 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(47, 46, 1, 1, 549000, 'Combo sạc nhanh 65W củ 3in1 + cáp 4in1', 'bosac1.jpg'),
(48, 47, 1, 4, 549000, 'Combo sạc nhanh 65W củ 3in1 + cáp 4in1', 'bosac1.jpg'),
(49, 48, 8, 5, 349000, 'Sạc dự phòng Magsafe tích hợp 4 cáp sạc nhỏ gọn', 'sacduphong1.jpg'),
(50, 49, 12, 3, 299000, 'Sạc dự phòng siêu nhỏ gọn Basefast 10.000mAh', 'sacduphong2.jpg'),
(51, 50, 22, 1, 189000, 'Loa Bluetooth kèm mic Karaoke', 'phukien8.jpg'),
(52, 51, 9, 1, 109000, 'Kính cường lực khung tự dán KingKong\r\n', 'cuongluc2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(1, 'Combo sạc nhanh 65W củ 3in1 + cáp 4in1', 599000, 549000, 'bosac1.jpg', 1, '2023-11-16', 1, 15, 'Mô tả sản phẩm Combo sạc nhanh 65W:\r\n\r\nCombo sạc nhanh 65W mang đến giải pháp sạc tối ưu cho các thiết bị công nghệ hiện đại với tốc độ vượt trội và tính linh hoạt cao. Bộ sản phẩm bao gồm:\r\n\r\nCủ sạc 65W – 2 cổng Type-C và 1 cổng USB: Công suất mạnh mẽ lên đến 65W, hỗ trợ sạc nhanh cho các dòng laptop, điện thoại, máy tính bảng và các thiết bị khác. Hai cổng Type-C cho phép sạc đồng thời nhiều thiết bị với tốc độ cao, trong khi cổng USB hỗ trợ các thiết bị sử dụng cổng sạc truyền thống. Thiết kế nhỏ gọn và an toàn với các tính năng bảo vệ quá tải và quá nhiệt.\r\n\r\nDây sạc 4 in 1 C to C sạc nhanh 65W: Dây sạc đa năng với khả năng sạc nhanh 65W, tích hợp các đầu chuyển linh hoạt giúp bạn sạc nhiều loại thiết bị khác nhau. Đầu chính Type-C phù hợp với các thiết bị sạc nhanh, cùng với các đầu chuyển khác (Lightning) đáp ứng đầy đủ nhu cầu kết nối của bạn. Dây sạc bền bỉ, chống rối, dễ dàng sử dụng và mang theo mọi lúc mọi nơi.\r\n\r\nVới combo sạc nhanh 65W, bạn có thể yên tâm về tốc độ sạc, sự an toàn và tính tiện lợi, đáp ứng hoàn hảo cho mọi thiết bị từ điện thoại đến laptop!', 1, 14),
(2, 'Cáp sạc nhanh từ tính sáng tạo 35W', 399000, 399000, 'bosac2.jpg', 1, '2020-11-04', 1, 10, 'Dây sạc nhanh từ tính sáng tạo C to L 35W & C to C 100W dành cho IP, Android, Laptop\r\n\r\nĐộ dài: 1m\r\n\r\nPhân loại: C to L, C to C\r\n\r\nCông suất: C to L 35W, C to C 100W\r\n\r\n– Dây cáp từ tính không bị rối, không lộn xộn\r\n\r\n– Tự động cuộn gọn gàng, dễ dàng mang đi, tạm biệt với sự vừa bộn\r\n\r\n– Chiều dài có thể điều chính, sử dụng thuận tiện hơn\r\n\r\n– Từ tính siêu mạnh 500N\r\n\r\nSạc Nhanh: Với công suất lên đến 35W cho C-L và 100W cho C-C, bạn có thể sạc thiết bị của mình một cách hiệu quả và nhanh chóng.\r\n\r\nĐa Năng: Sản phẩm phù hợp với đa dạng các thiết bị từ điện thoại IP, SS đến laptop.\r\n\r\nBảo hành 6 tháng', 1, 35),
(3, 'Cáp sạc 4 in 1 Cyperbunk bọc dù 65W', 219000, 199000, 'bosac3.jpg', 1, '2023-11-14', 1, 30, '???? Bạn đã sẵn sàng trải nghiệm sự tiên tiến và tiện ích với Cáp Sạc Nhanh 4 Đầu Đa Năng – sản phẩm đột phá, không chỉ là một thiết bị sạc thông thường mà còn là biểu tượng của phong cách CyberPunk đầy cá tính.\r\n\r\n???? Với khả năng sạc nhanh PD từ 20W đến 65W, cáp này không chỉ hỗ trợ sạc nhanh cho nhiều thiết bị mà còn đáp ứng được nhu cầu sạc của cả laptop và smartphone.\r\n\r\n???? Thiết kế được lấy cảm hứng từ thế giới CyberPunk, cáp sạc này mang lại sự hiện đại, độc đáo và không gian tương lai ngập tràn trong mỗi đường nét.\r\n\r\n???? Sản phẩm được làm từ chất liệu cao cấp ABS kết hợp với dây dù chắc chắn và đầu cáp kim loại bền bỉ, đảm bảo độ bền và độ tin cậy cao.\r\n\r\n???? Với các chân kết nối USB-C và USB, cùng với các chân cắm C-L, C-C, USB-C và USB-L, bạn có thể dễ dàng kết nối với nhiều thiết bị khác nhau mà không cần lo lắng về sự không tương thích.\r\n\r\n⚡ Công suất sạc linh hoạt từ PD 27W cho iPhone đến 65W cho các thiết bị Android và cả laptop, giúp bạn tiết kiệm thời gian và nhanh chóng sạc đầy pin cho thiết bị của mình.\r\n\r\n???? Khả năng truyền tải dữ liệu lên đến 480 Mbps giúp bạn dễ dàng chia sẻ dữ liệu giữa các thiết bị một cách nhanh chóng và thuận tiện.\r\n\r\n???? Chiều dài 1m linh hoạt đủ để bạn sử dụng một cách thoải mái mà không gặp bất kỳ sự ràng buộc nào.\r\n\r\nVới Cáp Sạc Nhanh 4 Đầu Đa Năng, sự tiện lợi và hiệu quả sẽ luôn ở bên bạn, mang lại trải nghiệm sạc không giới hạn và đồng thời thể hiện phong cách của bạn một cách độc đáo.', 1, 20),
(4, 'Bộ sạc nhanh Wekome PD 20W', 249000, 249000, 'bosac4.jpg', 1, '2024-10-03', 1, 12, 'Bộ sạc nhanh Wekome PD 20W là lựa chọn hoàn hảo cho những ai cần một thiết bị sạc tốc độ cao, tiện lợi và an toàn cho các thiết bị di động của mình. Với công nghệ Power Delivery (PD) tiên tiến, bộ sạc này hỗ trợ công suất sạc lên đến 20W, giúp rút ngắn thời gian nạp năng lượng cho thiết bị, cho phép bạn sạc đầy pin nhanh chóng, tiết kiệm thời gian hiệu quả.\r\n\r\nBộ sạc nhanh 20W chính hãng WK: 2 cổng sạc, dây 1m bọc dù mạ vàng, BH 1 đổi 1 trong 12 tháng', 1, 16),
(5, 'Cường lực không viền GOR', 129000, 79000, 'cuongluc1.jpg', 1, '2024-09-05', 2, 15, '**Kính cường lực GOR cho iPhone** mang đến sự bảo vệ tối ưu cho điện thoại của bạn với thiết kế tinh tế, phù hợp với từng dòng máy. Lớp phủ Nano cao cấp giúp mặt kính mượt mà, không che khuất màn hình và giảm thiểu bám vân tay. Sản phẩm được phân phối với 2 tùy chọn:\r\n\r\n– **Full box**: Bao gồm 2 kính cường lực GOR và bộ phụ kiện dán đi kèm.\r\n\r\n– **Lẻ 1 kính**: Bao gồm 1 kính cường lực GOR và bộ phụ kiện dán.\r\n\r\n**Đặc điểm nổi bật:**\r\n\r\n– **Chất liệu**: Kính thủy tinh trong suốt, không full màn hình (gần như full đối với các dòng iPhone 12-15 Pro Max).\r\n\r\n– **Độ bám màn hình cao**, mang lại cảm giác vuốt siêu mượt ngay cả ở phần cạnh cong.\r\n\r\n– **Tương thích với mọi loại ốp lưng** và bao da.\r\n\r\n– **Dễ dán** kể cả cho người dùng mới.\r\n\r\n– **Cạnh vát cong 2,5D** giúp bo tròn mép kính, không gây cấn tay.\r\n\r\n– **Lớp phủ Nano** hạn chế bám vân tay, không che màn hình như các loại kính full viền đen thông thường.\r\n\r\n**Hướng dẫn sử dụng:**\r\n\r\n1. Lau sạch màn hình bằng bộ vệ sinh đi kèm.\r\n\r\n2. Tháo lớp seal dưới kính, căn chỉnh đúng vị trí camera và vuốt để loại bỏ bọt khí.\r\n\r\n3. Nếu còn bọt khí, nhẹ nhàng nhấc kính lên và vuốt ra.\r\n\r\n4. Lau sạch màn hình và sử dụng.\r\n**Quy định bảo hành và đổi trả:**\r\n– Quay video mở gói hàng để bảo đảm quyền lợi nếu sản phẩm gặp lỗi.\r\n– Nếu không quay video, vui lòng chụp lại đơn hàng và sản phẩm để shop hỗ trợ.\r\n\r\n', 1, 20),
(6, 'Ốp silicon dẻo vân vali TRẮNG', 45000, 45000, 'op1.jpg', 1, '2024-11-01', 3, 12, 'Ốp iPhone Silicon dẻo, thiết kế vân vali, chống sốc, chống xước và va đập, chống bám bẩn vân tay Pikapi Store phụ kiện chính hãng\r\n\r\n– **Chất liệu**: Silicon dẻo cao cấp, mang đến cảm giác mềm mại khi cầm nắm và dễ dàng lắp đặt.\r\n\r\n– **Thiết kế**: Vân vali độc đáo, tạo nên vẻ ngoài thời trang và khác biệt cho điện thoại của bạn.\r\n\r\n– **Chống sốc**: Khả năng hấp thụ lực tốt, giảm thiểu hư hỏng khi điện thoại bị rơi hoặc va đập mạnh.\r\n\r\n– **Chống xước**: Bề mặt ốp được xử lý đặc biệt để chống trầy xước, giúp điện thoại luôn giữ được vẻ ngoài như mới.\r\n\r\n– **Chống bám bẩn, vân tay**: Giữ ốp và điện thoại luôn sạch sẽ, không lo lắng về dấu vân tay hay bụi bẩn.\r\n\r\n– **Phù hợp cho**: Các dòng iPhone, đảm bảo ôm sát máy, không gây cản trở các phím bấm hay cổng kết nối.', 1, 35),
(7, 'Cáp sạc nhanh từ tính sáng tạo C to L 100W\r\n', 499000, 399000, 'phukien1.jpg', 1, '2024-08-02', 5, 19, 'Dây sạc nhanh từ tính sáng tạo C to L 35W & C to C 100W dành cho IP, Android, Laptop\r\n\r\nĐộ dài: 1m\r\n\r\nPhân loại: C to L, C to C\r\n\r\nCông suất: C to L 35W, C to C 100W\r\n\r\n– Dây cáp từ tính không bị rối, không lộn xộn\r\n\r\n– Tự động cuộn gọn gàng, dễ dàng mang đi, tạm biệt với sự vừa bộn\r\n\r\n– Chiều dài có thể điều chính, sử dụng thuận tiện hơn\r\n\r\n– Từ tính siêu mạnh 500N\r\n\r\nSạc Nhanh: Với công suất lên đến 35W cho C-L và 100W cho C-C, bạn có thể sạc thiết bị của mình một cách hiệu quả và nhanh chóng.\r\n\r\nĐa Năng: Sản phẩm phù hợp với đa dạng các thiết bị từ điện thoại IP, SS đến laptop.\r\n\r\nBảo hành 6 tháng', 1, 50),
(8, 'Sạc dự phòng Magsafe tích hợp 4 cáp sạc nhỏ gọn', 599000, 349000, 'sacduphong1.jpg', 1, '2024-11-01', 4, 39, '\r\nSạc Dự Phòng MagSafe Tích Hợp 4 Cáp Sạc Nhỏ Gọn là sản phẩm tiện lợi, hiện đại với các tính năng nổi bật:\r\n\r\nThiết kế nhỏ gọn, sang trọng: Dễ dàng mang theo, chất liệu cao cấp bền bỉ.\r\nTích hợp MagSafe: Sạc nhanh cho các thiết bị hỗ trợ MagSafe, nam châm chắc chắn giữ cố định.\r\n4 cáp sạc đa năng: Tích hợp 4 loại đầu cáp (Lightning, USB-C, Micro USB) giúp sạc mọi thiết bị phổ biến.\r\nDung lượng lớn và sạc nhanh: Từ 10,000mAh đến 20,000mAh, sạc nhanh chóng và hiệu quả.\r\nAn toàn và bảo vệ thiết bị: Chống quá tải, ngắt tự động, và đèn LED báo pin tiện lợi.\r\nSản phẩm phù hợp cho người dùng thường xuyên di chuyển, giúp thiết bị luôn đầy năng lượng.', 1, 104),
(9, 'Kính cường lực khung tự dán KingKong\r\n', 109000, 109000, 'cuongluc2.jpg', 1, '2024-11-01', 2, 29, 'Sản phẩm Kính cường lực iPhone khung tự dán KINGKONG: chính hãng WEKOME, tự lấy bụi, chống bụi loa thoại, chống nhìn trộm – PIkapi phụ kiện là một sản phẩm phù hợp cho những ai đang tìm kiếm một giải pháp bảo vệ cho chiếc iPhone của mình.\r\n\r\nKính cường lực KINGKONG: Sản phẩm được làm từ kính cường lực cao cấp giúp bảo vệ màn hình iPhone khỏi trầy xước và va đập.\r\n\r\nKhung tự dán: Được thiết kế với khung dán sẵn, sản phẩm rất dễ sử dụng, không lo dán lệch\r\n\r\nTự lấy bụi: Với tính năng này, bạn không lo ngại việc tạo ra các bóng khí, Sản phẩm được thiết kể để hút các hạt bụi trong quá trình dán\r\n\r\nBảo vệ loa thoại: không lo bụi lọt vào loa thoại trong quá trình sử dụng, chất lương âm thanh không hề bị ảnh hưởng', 1, 17),
(10, 'Ốp silicon dẻo vân vali ĐEN', 79000, 79000, 'op2.jpg', 1, '2024-09-05', 3, 19, 'Ốp iPhone Silicon dẻo, thiết kế vân vali, chống sốc, chống xước và va đập, chống bám bẩn vân tay Pikapi Store phụ kiện chính hãng\r\n\r\n– **Chất liệu**: Silicon dẻo cao cấp, mang đến cảm giác mềm mại khi cầm nắm và dễ dàng lắp đặt.\r\n\r\n– **Thiết kế**: Vân vali độc đáo, tạo nên vẻ ngoài thời trang và khác biệt cho điện thoại của bạn.\r\n\r\n– **Chống sốc**: Khả năng hấp thụ lực tốt, giảm thiểu hư hỏng khi điện thoại bị rơi hoặc va đập mạnh.\r\n\r\n– **Chống xước**: Bề mặt ốp được xử lý đặc biệt để chống trầy xước, giúp điện thoại luôn giữ được vẻ ngoài như mới.\r\n\r\n– **Chống bám bẩn, vân tay**: Giữ ốp và điện thoại luôn sạch sẽ, không lo lắng về dấu vân tay hay bụi bẩn.\r\n\r\n– **Phù hợp cho**: Các dòng iPhone, đảm bảo ôm sát máy, không gây cản trở các phím bấm hay cổng kết nối.', 1, 50),
(11, 'Gậy chụp ảnh Selfie 3 chân', 179000, 129000, 'phukien2.jpg', 1, '2024-10-12', 5, 23, '### Mô Tả Sản Phẩm: Gậy Chụp Ảnh Selfie 3 Chân\r\n\r\n#### Tính Năng Nổi Bật:\r\n\r\n– **Chiều dài kéo dài**: Gậy chụp ảnh có thể kéo dài tới 1m7, giúp bạn dễ dàng chụp ảnh nhóm hoặc góc rộng mà không gặp bất kỳ khó khăn nào.\r\n\r\n– **Đèn flash trợ sáng**: Được tích hợp đèn flash trợ sáng, giúp bạn có được những bức ảnh sắc nét và sáng rõ ngay cả trong điều kiện ánh sáng yếu.\r\n\r\n– **Đế dựng tripod**: Gậy chụp ảnh có thể chuyển đổi dễ dàng thành tripod vững chắc, giúp bạn chụp ảnh hoặc quay video ổn định mà không cần phải cầm tay.\r\n\r\n– **Điều khiển từ xa**: Đi kèm với điều khiển từ xa, bạn có thể dễ dàng chụp ảnh từ xa mà không cần phải chạm vào điện thoại.\r\n\r\n#### Màu Sắc:\r\n\r\n– **Màu Đen**: Sang trọng và hiện đại, phù hợp với mọi phong cách.\r\n\r\n– **Màu Hồng**: Nữ tính và đáng yêu, là lựa chọn hoàn hảo cho các bạn gái.\r\n\r\n#### Lợi Ích Khi Sử Dụng:\r\n\r\n– Giúp bạn tự do sáng tạo các góc chụp ảnh mới lạ và ấn tượng.\r\n\r\n– Thích hợp cho các chuyến du lịch, dã ngoại, hoặc chụp ảnh kỷ niệm cùng gia đình và bạn bè.\r\n\r\n– Đèn flash trợ sáng và đế dựng tripod đảm bảo bạn có được những bức ảnh đẹp và ổn định trong mọi hoàn cảnh.\r\n\r\n#### Thông Số Kỹ Thuật:\r\n\r\n– **Chiều dài tối đa**: 1m7\r\n\r\n– **Màu sắc**: Đen, Hồng\r\n\r\n– **Tính năng**: Đèn flash trợ sáng, đế dựng tripod, điều khiển từ xa\r\n\r\nSản phẩm gậy chụp ảnh selfie 3 chân này là lựa chọn hoàn hảo để bạn có được những bức ảnh tuyệt vời và khoảnh khắc đáng nhớ!', 1, 32),
(12, 'Sạc dự phòng siêu nhỏ gọn Basefast 10.000mAh', 399000, 299000, 'sacduphong2.jpg', 1, '2024-09-19', 4, 27, 'Sạc dự phòng mini Basefast SD80 với công suất sạc nhanh 22.5W và dung lượng 10000mAh là sự lựa chọn hoàn hảo cho những người yêu thích công nghệ và thường xuyên di chuyển. Thiết kế siêu nhỏ gọn và hệ thống bảo vệ an toàn, sản phẩm này mang lại sự tiện lợi và an tâm khi sử dụng cho các thiết bị di động như iPhone, Samsung và nhiều dòng máy khác.\r\n\r\nĐặc điểm nổi bật:\r\n\r\nDung lượng lớn 10000mAh: Đảm bảo sạc đầy nhiều lần cho điện thoại hoặc các thiết bị di động khác, giữ cho bạn luôn kết nối.\r\n\r\nSạc nhanh 22.5W: Đầu vào và đầu ra Type-C hỗ trợ sạc nhanh với tốc độ 5V/3A, cho phép bạn tiết kiệm thời gian sạc.\r\n\r\nKích thước siêu nhỏ gọn: Chỉ với kích thước 826126mm và trọng lượng 200g, dễ dàng mang theo trong túi xách hoặc balo mà không hề cồng kềnh.\r\n\r\nMàn hình LED thông minh: Hiển thị dung lượng pin còn lại, giúp bạn kiểm soát và chủ động khi cần sạc lại thiết bị.\r\n\r\nChất liệu cao cấp: Được làm từ ABS + PC và pin lithium polymer, đảm bảo độ bền và khả năng chống cháy nổ, bảo vệ tối ưu cho thiết bị và người sử dụng.\r\n\r\nHệ thống bảo vệ toàn diện: Sạc an toàn với các tính năng chống quá nhiệt, quá áp, quá dòng và ngắn mạch, bảo vệ thiết bị của bạn khỏi mọi rủi ro.\r\n\r\nThông số kỹ thuật:\r\n\r\nDung lượng: 10000mAh (37Wh)\r\n\r\nĐầu vào Type-C: 5V/2.6A\r\n\r\nĐầu ra Type-C: 5V/3A\r\n\r\nĐầu ra USB: 5V/3A\r\n\r\nChất liệu: ABS + PC + Pin lithium polymer\r\n\r\nMàn hình: Màn hình LED hiển thị dung lượng\r\n\r\nKích thước: 826126mm\r\n\r\nTrọng lượng: 200g\r\n\r\nCam kết sản phẩm:\r\n\r\nAn toàn tuyệt đối: Hệ thống bảo vệ chống cháy nổ và các nguy cơ điện áp bất thường.\r\n\r\nTiện lợi và nhỏ gọn: Phù hợp cho người thường xuyên di chuyển và cần sạc thiết bị nhanh chóng.\r\n\r\nBảo hành 12 tháng: Đổi trả sản phẩm lỗi từ nhà sản xuất.\r\n\r\nSạc dự phòng Basefast SD80 là sự kết hợp hoàn hảo giữa hiệu năng cao và thiết kế nhỏ gọn, là trợ thủ đắc lực cho những ai thường xuyên di chuyển và cần nguồn điện liên tục.', 1, 73),
(13, 'Cường lực tự dán RỒNG VIỆT', 200000, 200000, 'cuongluc3.jpg', 1, '2024-11-01', 2, 19, 'Kính Cường Lực iPhone – Khung Tự Dán, Loại Bỏ Bụi, Độ Cứng 9H, Chống Trầy Xước, Chống Vân Tay\r\n\r\nĐẶC ĐIỂM SẢN PHẨM:\r\n\r\nKhung dán tự động dễ dàng: Không cần canh chỉnh khi dán, giúp bạn dễ dàng dán kính mà không gặp khó khăn.\r\n\r\nPhủ nano cảm ứng: Bề mặt kính được phủ nano giúp cảm ứng mượt mà và hạn chế bám vân tay.\r\n\r\nĐộ trong suốt 100%: Kính siêu rõ, đảm bảo hiển thị chân thực và sắc nét.\r\n\r\nVát viền cong: Thiết kế vát viền cong tạo cảm giác thoải mái, không bị cấn tay khi lướt.\r\n\r\nChống nước và chống trơn: Bề mặt kính chống nước, không trơn rít, giữ cho điện thoại luôn sạch sẽ.\r\n\r\nChất liệu 3 lớp: Kính được cấu tạo từ 3 lớp cứng cáp và chắc chắn, bảo vệ điện thoại khỏi va đập và ngăn ngừa vỡ màn hình.\r\n\r\nTHÔNG TIN CHI TIẾT SẢN PHẨM:\r\n\r\nDòng máy tương thích: iPhone\r\n\r\nChất liệu: Kính và khung dán bằng nhựa\r\n\r\nThiết kế: Viền mỏng, kèm khung dán tự động\r\n\r\nHƯỚNG DẪN DÁN:\r\n\r\nChuẩn bị:\r\n\r\nĐặt điện thoại lên mặt bàn sạch sẽ, không có bụi.\r\n\r\nVệ sinh màn hình điện thoại (nên tháo ốp ra), dùng khăn ướt (miếng số 1) lau sạch màn hình, sau đó dùng khăn khô (miếng số 2) lau khô mặt kính. Đảm bảo không còn bụi trên màn hình.\r\n\r\nDán kính:\r\n\r\nLột lớp nilon ở mặt sau kính và đặt lên điện thoại, ấn nhẹ nhàng theo đường màu đỏ.\r\n\r\nTháo khung hỗ trợ:\r\n\r\nBóc lớp dán màu vàng và lấy khung hỗ trợ dán ra.\r\n\r\nHoàn thiện:\r\n\r\nLột lớp nilon mặt trước và lau lại bằng khăn khô.', 1, 29),
(14, 'Ốp Giả Da siêu mỏng 0.7mm Xám Titan', 189000, 189000, 'op3.jpg', 1, '2024-11-01', 3, 25, 'Mô Tả Sản Phẩm: Ốp Lưng iPhone Siêu Mỏng 0.7mm\r\n\r\nNâng tầm phong cách và bảo vệ tối ưu cho chiếc iPhone của bạn với ốp lưng siêu mỏng 0.7mm. Sản phẩm được thiết kế từ chất liệu nhựa cứng giả da sang trọng, mang lại cảm giác chắc chắn và cao cấp mỗi khi cầm nắm.\r\n\r\nĐặc Điểm Nổi Bật:\r\n\r\nSiêu Mỏng 0.7mm: Thiết kế mỏng nhẹ, ôm sát iPhone, giữ nguyên dáng vẻ thanh lịch của điện thoại.\r\n\r\nChất Liệu Nhựa Cứng Giả Da: Tạo cảm giác sang trọng và đẳng cấp, bền bỉ theo thời gian.\r\n\r\nChống Bám Bẩn và Mồ Hôi: Bề mặt chống bám dấu vân tay, giữ cho ốp lưng luôn sạch sẽ và mới mẻ.\r\n\r\nBảo Vệ Camera: Tích hợp kính bảo vệ camera chống xước, chống va đập, đảm bảo an toàn cho ống kính của bạn.\r\n\r\nMàu Sắc Thời Trang: Có sẵn hai màu sắc tinh tế và hiện đại: Xám Titan và Xanh Sky, dễ dàng lựa chọn theo phong cách cá nhân.\r\n\r\nThông Tin Chi Tiết:\r\n\r\nĐộ Dày: 0.7mm\r\n\r\nChất Liệu: Nhựa cứng giả da\r\n\r\nBảo Vệ: Chống bám bẩn, mồ hôi, dấu vân tay; Kính bảo vệ camera chống xước, chống va đập\r\n\r\nMàu Sắc: Xám Titan, Xanh Sky\r\n\r\nHãy sở hữu ngay ốp lưng iPhone siêu mỏng 0.7mm để trải nghiệm sự khác biệt, vừa bảo vệ hoàn hảo vừa tôn lên phong cách của bạn!\r\n\r\nSau khi nhận hàng và kiểm tra, nếu đơn hàng có bất kỳ vấn đề xin Quý Khách hãy inbox fanpage hoặc gọi lại ngay cho shop. Đội ngũ nhân viên của PIKAPI sẽ luôn đồng hành, cố gắng hỗ trợ bạn một cách tốt nhất  nếu có sự cố xảy ra.', 1, 23),
(15, 'Giá đỡ Pikapi 360', 129000, 129000, 'phukien3.jpg', 1, '2024-11-01', 5, 12, '**Ưu điểm sản phẩm Giá Đỡ Điện Thoại Xoay 360 Xem Phim Livestream**\r\n\r\n– **Công nghệ xoay AR tiên tiến:** Giá đỡ điện thoại sử dụng công nghệ xoay AR mới, mang lại sự ổn định và bền bỉ trong quá trình sử dụng.\r\n\r\n– **Trục xoay 360° linh hoạt:** Kệ điện thoại được trang bị trục xoay 360°, cho phép người dùng dễ dàng điều chỉnh góc nhìn theo ý thích mà không gặp phải giới hạn.\r\n\r\n– **Chất liệu cao cấp:** Sản phẩm được làm từ sắt và hợp kim nhôm CNC nguyên khối, đảm bảo độ tỉ mỉ và hoàn thiện cao, mang đến sự bền bỉ và chắc chắn.\r\n\r\n– **Tải trọng lớn:** Giá đỡ có khả năng chịu được tải trọng lên đến 5kg, phù hợp cho cả điện thoại và máy tính bảng, mang lại sự tiện lợi tối đa.\r\n\r\n– **Kích thước tiêu chuẩn:** Với kích thước 10cm x 6,5cm x 17cm, sản phẩm vừa vặn và dễ dàng bố trí ở nhiều không gian khác nhau, từ bàn làm việc đến phòng khách.', 1, 20),
(16, 'Cường lực 2in1 Tự lấy bụi & Khung tự dán', 69000, 59000, 'cuongluc4.jpg', 1, '2024-11-01', 2, 30, 'Kính cường lực iPhone 2in1 Tự lấy bụi & Khung tự dán: kính iPhone full màn hình, độ cứng 9H, cảm ứng mượt, chống xước\r\n\r\n– Khung tự dán cao cấp, dễ dán cường lực với tất cả mọi người\r\n\r\n– Có miếng dán tự lấy bụi\r\n\r\n– Độ cứng 9H bảo vệ tốt gấp 5 lần kính cường lực thông thường,\r\n\r\n– Siêu mỏng 0,25mm nhưng vẫn đảm bảo khả năng chịu lực.\r\n\r\n– Kính dán lên y hệt màn hình máy, không có mép, không nhìn thấy viền mép dán.\r\n\r\n– Vát cạnh 3D ôm sát màn hình máy, hạn chế bong viền, mẻ viền.\r\n\r\n– Có màng bảo vệ loa thoại, chống xước. chống bụi\r\n\r\nCường lực đủ các đời iPhone X, iPhone Xs, Xr, iPhone Xs Max, iPhone 11, 11 Pro, iPhone 11 Pro Max, 12 mini, iPhone 12, 12 Pro, iPhone 12 Pro Max, 13 mini, 13 Pro, iPhone 13 Pro Max, ịPhone 14, ịPhone 14 Plus, ịPhone 14 Pro, ịPhone 14 Pro Max\r\n\r\n', 1, 20),
(17, 'Ốp siêu mỏng 0.5mm TRẮNG Pikapi Slim', 169000, 169000, 'op4.jpg', 1, '2024-11-01', 3, 12, 'Introducing Pikapi Slim – Ốp iPhone Siêu Mỏng chỉ 0.5mm\r\n\r\nBạn muốn bảo vệ chiếc iPhone yêu quý của mình mà không làm mất đi vẻ mỏng nhẹ và thời trang? Với Pikapi Slim, bạn không chỉ có một lớp bảo vệ siêu mỏng với độ dày chỉ 0.5mm mà còn được trải nghiệm chất lượng vượt trội.\r\n\r\nChất liệu nhựa cứng cao cấp của Pikapi Slim được lựa chọn kỹ lưỡng để đảm bảo sự bền bỉ và không ố vàng sau thời gian sử dụng. Với công nghệ tiên tiến, chúng tôi cam kết rằng ốp của bạn sẽ giữ nguyên vẻ đẹp ban đầu mà không bị ảnh hưởng bởi các yếu tố bên ngoài.\r\n\r\nKhông chỉ là vẻ ngoài, Pikapi Slim còn được thiết kế với lớp nhựa nhám chống bám bẩn từ mồ hôi và vân tay. Bạn sẽ cảm thấy tự tin mỗi khi cầm điện thoại mà không cần lo lắng về việc làm bẩn hoặc trượt tay.\r\n\r\nTích hợp vòng Magsafe cao cấp, Pikapi Slim không chỉ là một ốp bảo vệ mà còn là một phụ kiện tiện ích cho điện thoại của bạn. Với tính năng này, bạn có thể dễ dàng kết nối với các phụ kiện hỗ trợ Magsafe mà không cần tháo ốp ra.', 1, 12),
(18, 'Cáp sạc 4 in 1 Cyperbunk bọc dù 65W', 219000, 199000, 'phukien4.jpg', 1, '2024-11-01', 5, 41, '???? Bạn đã sẵn sàng trải nghiệm sự tiên tiến và tiện ích với Cáp Sạc Nhanh 4 Đầu Đa Năng – sản phẩm đột phá, không chỉ là một thiết bị sạc thông thường mà còn là biểu tượng của phong cách CyberPunk đầy cá tính.\r\n\r\n???? Với khả năng sạc nhanh PD từ 20W đến 65W, cáp này không chỉ hỗ trợ sạc nhanh cho nhiều thiết bị mà còn đáp ứng được nhu cầu sạc của cả laptop và smartphone.\r\n\r\n???? Thiết kế được lấy cảm hứng từ thế giới CyberPunk, cáp sạc này mang lại sự hiện đại, độc đáo và không gian tương lai ngập tràn trong mỗi đường nét.\r\n\r\n???? Sản phẩm được làm từ chất liệu cao cấp ABS kết hợp với dây dù chắc chắn và đầu cáp kim loại bền bỉ, đảm bảo độ bền và độ tin cậy cao.\r\n\r\n???? Với các chân kết nối USB-C và USB, cùng với các chân cắm C-L, C-C, USB-C và USB-L, bạn có thể dễ dàng kết nối với nhiều thiết bị khác nhau mà không cần lo lắng về sự không tương thích.\r\n\r\n⚡ Công suất sạc linh hoạt từ PD 27W cho iPhone đến 65W cho các thiết bị Android và cả laptop, giúp bạn tiết kiệm thời gian và nhanh chóng sạc đầy pin cho thiết bị của mình.\r\n\r\n???? Khả năng truyền tải dữ liệu lên đến 480 Mbps giúp bạn dễ dàng chia sẻ dữ liệu giữa các thiết bị một cách nhanh chóng và thuận tiện.\r\n\r\n???? Chiều dài 1m linh hoạt đủ để bạn sử dụng một cách thoải mái mà không gặp bất kỳ sự ràng buộc nào.\r\n\r\nVới Cáp Sạc Nhanh 4 Đầu Đa Năng, sự tiện lợi và hiệu quả sẽ luôn ở bên bạn, mang lại trải nghiệm sạc không giới hạn và đồng thời thể hiện phong cách của bạn một cách độc đáo.', 1, 35),
(19, 'Cáp sạc nhanh C to L đầu gập 90°', 229000, 229000, 'phukien5.jpg', 1, '2024-11-01', 5, 19, 'Dây sạc nhanh đầu gập cho chơi game của Pikapi Phụ kiện là lựa chọn hoàn hảo cho những ai đam mê game trên điện thoại.\r\n\r\n– Với thiết kế dạng dẹt, dây bọc dù chắc chắn giúp bạn không bị rối và đứt gãy khi sử dụng.\r\n\r\n– Sạc nhanh: Sản phẩm được tích hợp tính năng sạc nhanh, giúp bạn tiết kiệm thời gian và luôn có điện để trải nghiệm các trò chơi yêu thích.\r\n\r\n– Đầu sạc vuông góc: Với đầu sạc vuông góc tiện lợi, bạn có thể thoải mái cầm điện thoại mà không lo bị cản trở khi kết nối vào ổ cắm tường hay các thiết bị khác.Có đèn báo\r\n\r\n– Copy dữ liệu tốc độ cao lên đến 480Mps\r\n\r\n– Độ dài dây 1.2m\r\n\r\nVới loại Bảo hành từ nhà sản xuất 1 đổi 1 trong 12 tháng giúp các yên tâm trong quá trình sử dụng sản phẩm.', 1, 9),
(20, 'Bộ sạc nhanh Wekome PD 20W', 249000, 249000, 'phukien6.jpg', 1, '2024-11-01', 5, 10, 'Bộ sạc nhanh 20W chính hãng WK: 2 cổng sạc, dây 1m bọc dù mạ vàng, BH 1 đổi 1 trong 12 tháng\r\nCủ sạc 20W – 2 cổng Type-C và 1 cổng USB: Công suất mạnh mẽ lên đến 65W, hỗ trợ sạc nhanh cho các dòng laptop, điện thoại, máy tính bảng và các thiết bị khác. Hai cổng Type-C cho phép sạc đồng thời nhiều thiết bị với tốc độ cao, trong khi cổng USB hỗ trợ các thiết bị sử dụng cổng sạc truyền thống. Thiết kế nhỏ gọn và an toàn với các tính năng bảo vệ quá tải và quá nhiệt.', 1, 16),
(21, 'Tai nghe Gaming GM-008', 159000, 99000, 'phukien7.jpg', 1, '2024-11-01', 5, 50, 'Tai nghe gaming Chính Hãng GM-008, tai nghe có mic game thủ chuyên nghiệp chơi game pc giá rẻ Pikapi\r\n\r\n✔️Chi tiết cực kỳ tốt cùng khả năng định hướng không gian giúp dễ dàng xác định vị trí kẻ địch nhờ vào tiếng bước chân khi chơi PUBG hay Call Of Duty.\r\n✔️Âm thanh trung thực, mid và treb tốt, tổng thể chất âm sáng và rõ.\r\n✔️Thiết kế công thái học phù hợp cho việc chơi game trong thời gian dài với phần hook giữ tai cũng như một góc nghiêng 135 độ khi sử dụng.\r\n✔️Jack kết nối dạng chữ L phù hợp sử dụng với smartphone, không gây vướng hay khó chịu khi sử dụng.\r\n✔️Được trang bị đầy đủ các phím: tăng, giảm âm lượng,…\r\n✔️Sản phẩm phù hợp cho anh em game thủ.\r\n\r\nThông tin chi tiết:\r\n– Tên sản phẩm: tai nghe gaming GM-008\r\n– Driver: 10mm\r\n– Âm lượng: 124dB +-5dB\r\n– Dải tần: 20Hz – 20KHz\r\n– Độ dài: 1,2M\r\n– Chân kết nối: 3.5mm\r\n– Được tích hợp đến 2 mic trong đó một mic gắn ngoài và một mic tích hợp sẵn tại khu vực điều khiển giúp trải nghiệm đàm thoại tốt hơn bao giờ hết.\r\n\r\n', 1, 99),
(22, 'Loa Bluetooth kèm mic Karaoke', 199000, 189000, 'phukien8.jpg', 1, '2024-11-01', 5, 43, 'Loa Bluetooth có mic hát Karaoke: Loa to, 2 mic không dây, tính năng lọc vocal, Bảo hành 6 tháng 1 đổi 1\r\n\r\n✔️Công suất lên đến 10W\r\n✔️Thiết kế vô cùng nhỏ gọn\r\n✔️Có thể kết nối 2 mic song song\r\n✔️ Tính năng lọc vocal cực sịn\r\n✔️ Pin sạc chuẩn Type – C\r\n✔️ Hỗ trợ bảo hành 1 đổi 1 trong vòng 6 tháng', 1, 105),
(23, 'Kính cường lực Kingkong 3D', 69000, 69000, 'cuongluc5.jpg', 1, '2024-11-01', 2, 12, 'Kính cường lực iPhone Wekome Kingkong 3D: độ cứng 9H full màn không cấn gợn, lọc bụi loa, cảm ứng mượt, PIKAPI Phụ Kiện\r\n\r\n– Độ cứng 9H bảo vệ tốt gấp 5 lần kính cường lực thông thường,\r\n\r\n– Siêu mỏng 0,25mm nhưng vẫn đảm bảo khả năng chịu lực.\r\n\r\n– Kính dán lên y hệt màn hình máy, không có mép, không nhìn thấy viền mép dán.\r\n\r\n– Vát cạnh 3D ôm sát màn hình máy, hạn chế bong viền, mẻ viền.\r\n\r\nCuộc sống hiện tại việc bảo vệ thông tin cá nhân là vô cùng quan trọng đơn cử như tài khoản ngân hàng, mật khẩu cá nhân, hình ảnh nhạy cảm trong máy hay đơn giản là việc bạn không muốn những người xung quanh dòm ngó mình đang sử dụng điện thoại vào việc gì thì cường lực chống nhìn trộm sẽ là một phụ kiện không thể thiếu đối với bạn, với góc nghiêng chỉ 30 độ thì gần như sẽ không thế thấy được nội dung đang hiển thị trên màn hình.\r\n\r\nCường lực đủ các đời iPhone 7 Plus, 8 Plus, iPhone X, iPhone Xs, Xr, iPhone Xs Max, iPhone 11, 11 Pro, iPhone 11 Pro Max, 12 mini, iPhone 12, 12 Pro, iPhone 12 Pro Max, 13 mini, 13 Pro, iPhone 13 Pro Max, iPhone 14\r\n\r\n, iPhone 14 Pro, iPhone 14 Plus, iPhone 14 Pro Max, iPhone 15, iPhone 15 Plus, iPhone 15 Pro, iPhone 15 Pro Max', 1, 16),
(24, 'Cường lực KingKong Chống nhìn trộm', 119000, 69000, 'cuongluc6.jpg', 1, '2024-11-01', 2, 44, 'Kính cường lực iPhone chống nhìn trộm Wekome KINGKONG 4D, chống va đập, chống xước, Fullbox cao cấp nhất\r\n\r\nCuộc sống hiện tại việc bảo vệ thông tin cá nhân là vô cùng quan trọng đơn cử như tài khoản ngân hàng, mật khẩu cá nhân, hình ảnh nhạy cảm trong máy hay đơn giản là việc bạn không muốn những người xung quanh dòm ngó mình đang sử dụng điện thoại vào việc gì thì cường lực chống nhìn trộm sẽ là một phụ kiện không thể thiếu đối với bạn, với góc nghiêng chỉ 30 độ thì gần như sẽ không thế thấy được nội dung đang hiển thị trên màn hình.\r\n\r\n✔️ Ở góc nghiêng 30 độ sẽ không thể nhìn thấy nội dung trên smartphone\r\n✔️ Không ảnh hưởng đến độ sáng/chất lượng hình ảnh ở góc trực diện\r\n✔️ Không ảnh hưởng đến hoạt động của FaceID\r\n✔️ Cường lực full màn, độ cứng 9H\r\n✔️ Chống xước, hạn chế mồ hôi vân tay\r\n✔️ Thao tác cảm ứng mượt mà không dán đoạn', 1, 50),
(25, 'Cường lực GAO chống nhìn trộm khung tự dán', 129000, 69000, 'cuongluc7.jpg', 1, '2024-11-01', 2, 19, 'Cường lực chống nhìn trộm iPhone Pikapi: Khung tự dán, chống nhìn trộm, , chống va đập.\r\n\r\n✔️ Khung tự dán cao cấp, dễ dán cường lực với tất cả mọi người\r\n✔️ Hộp cao cấp\r\n✔️ Cường lực chống nhìn trộm khung tự dán xịn xò\r\n✔️ Ở góc nghiêng 30 độ sẽ không thể nhìn thấy nội dung trên smartphone\r\n✔️ Không ảnh hưởng đến độ sáng/chất lượng hình ảnh ở góc trực diện ️\r\n✔️  Chống xước, hạn chế mồ hôi vân tay ️\r\n✔️  Thao tác cảm ứng mượt mà không dán đoạn\r\n✔️ Độ cứng 9H bảo vệ tốt gấp 5 lần kính cường lực thông thường,', 1, 63),
(26, 'Ốp siêu mỏng 0.5mm ĐEN Pikapi Slim', 169000, 69000, 'op5.jpg', 1, '2024-11-01', 3, 15, 'Introducing Pikapi Slim – Ốp iPhone Siêu Mỏng chỉ 0.5mm\r\n\r\nBạn muốn bảo vệ chiếc iPhone yêu quý của mình mà không làm mất đi vẻ mỏng nhẹ và thời trang? Với Pikapi Slim, bạn không chỉ có một lớp bảo vệ siêu mỏng với độ dày chỉ 0.5mm mà còn được trải nghiệm chất lượng vượt trội.\r\n\r\nChất liệu nhựa cứng cao cấp của Pikapi Slim được lựa chọn kỹ lưỡng để đảm bảo sự bền bỉ và không ố vàng sau thời gian sử dụng. Với công nghệ tiên tiến, chúng tôi cam kết rằng ốp của bạn sẽ giữ nguyên vẻ đẹp ban đầu mà không bị ảnh hưởng bởi các yếu tố bên ngoài.\r\n\r\nKhông chỉ là vẻ ngoài, Pikapi Slim còn được thiết kế với lớp nhựa nhám chống bám bẩn từ mồ hôi và vân tay. Bạn sẽ cảm thấy tự tin mỗi khi cầm điện thoại mà không cần lo lắng về việc làm bẩn hoặc trượt tay.\r\n\r\nTích hợp vòng Magsafe cao cấp, Pikapi Slim không chỉ là một ốp bảo vệ mà còn là một phụ kiện tiện ích cho điện thoại của bạn. Với tính năng này, bạn có thể dễ dàng kết nối với các phụ kiện hỗ trợ Magsafe mà không cần tháo ốp ra.', 1, 20),
(27, 'Ốp Giả Da siêu mỏng 0.7mm Xanh Sky', 189000, 89000, 'op6.jpg', 1, '2024-11-01', 3, 20, 'Mô Tả Sản Phẩm: Ốp Lưng iPhone Siêu Mỏng 0.7mm\r\n\r\nNâng tầm phong cách và bảo vệ tối ưu cho chiếc iPhone của bạn với ốp lưng siêu mỏng 0.7mm. Sản phẩm được thiết kế từ chất liệu nhựa cứng giả da sang trọng, mang lại cảm giác chắc chắn và cao cấp mỗi khi cầm nắm.\r\n\r\nĐặc Điểm Nổi Bật:\r\n\r\nSiêu Mỏng 0.7mm: Thiết kế mỏng nhẹ, ôm sát iPhone, giữ nguyên dáng vẻ thanh lịch của điện thoại.\r\n\r\nChất Liệu Nhựa Cứng Giả Da: Tạo cảm giác sang trọng và đẳng cấp, bền bỉ theo thời gian.\r\n\r\nChống Bám Bẩn và Mồ Hôi: Bề mặt chống bám dấu vân tay, giữ cho ốp lưng luôn sạch sẽ và mới mẻ.\r\n\r\nBảo Vệ Camera: Tích hợp kính bảo vệ camera chống xước, chống va đập, đảm bảo an toàn cho ống kính của bạn.\r\n\r\nMàu Sắc Thời Trang: Có sẵn hai màu sắc tinh tế và hiện đại: Xám Titan và Xanh Sky, dễ dàng lựa chọn theo phong cách cá nhân.\r\n\r\nThông Tin Chi Tiết:\r\n\r\nĐộ Dày: 0.7mm\r\n\r\nChất Liệu: Nhựa cứng giả da\r\n\r\nBảo Vệ: Chống bám bẩn, mồ hôi, dấu vân tay; Kính bảo vệ camera chống xước, chống va đập\r\n\r\nMàu Sắc: Xám Titan, Xanh Sky\r\n\r\nHãy sở hữu ngay ốp lưng iPhone siêu mỏng 0.7mm để trải nghiệm sự khác biệt, vừa bảo vệ hoàn hảo vừa tôn lên phong cách của bạn!\r\n\r\n', 1, 16),
(28, 'Ốp lưng TRẮNG nhám mờ', 150000, 150000, 'op7.jpg', 1, '2024-11-01', 3, 19, 'Chất liệu silicon nhám mờ cao cấp\r\n\r\nChất liệu: Silicon nhám mờ chống bám bẩn mồ hôi và dấu vân tay, mang lại cảm giác cầm nắm chắc chắn và dễ chịu.\r\n\r\nChống bám bẩn: Với bề mặt nhám mờ, ốp lưng giúp ngăn chặn bụi bẩn, mồ hôi và dấu vân tay, giữ cho điện thoại luôn sạch sẽ và mới mẻ.\r\n\r\nThiết kế chống sốc toàn diện\r\n\r\nĐệm khí ở 4 góc: Viền có đệm khí ở 4 góc giúp bảo vệ điện thoại khỏi những va đập mạnh, giảm thiểu rủi ro hư hỏng khi rơi.\r\n\r\nViền camera nhô cao: Bảo vệ ống kính camera khỏi trầy xước và va đập, đảm bảo chất lượng hình ảnh luôn rõ nét.\r\n\r\nViền màn hình nhô cao: Giúp chống xước và va đập cho màn hình, tăng cường độ bền cho điện thoại.\r\n\r\nTính năng nổi bật\r\n\r\nThiết kế mỏng nhẹ: Ốp lưng được thiết kế mỏng nhẹ nhưng vẫn đảm bảo khả năng bảo vệ tối ưu, không làm tăng kích thước hay trọng lượng của điện thoại.\r\n\r\nDễ dàng tháo lắp: Chất liệu silicon linh hoạt, dễ dàng tháo lắp mà không làm trầy xước điện thoại.\r\n\r\nTương thích với sạc không dây: Ốp lưng không cản trở quá trình sạc không dây, giúp bạn tiện lợi hơn trong quá trình sử dụng.', 1, 16),
(29, 'Ốp lưng Magsafe Không Ố Vàng', 59000, 59000, 'op8.jpg', 1, '2024-11-01', 3, 30, 'Bạn đang tìm kiếm sự bảo vệ độc đáo và chất lượng cho chiếc điện thoại của mình? Sản phẩm Ốp iPhone Magsafe không ố vàng chính là lựa chọn hoàn hảo cho bạn!\r\n\r\n???? Mặt lưng được làm từ nhựa cứng chất lượng cao, không bám ố vàng, mang lại cảm giác mềm mại và chắc chắn khi cầm nắm.\r\n???? Viền silicon đen bền màu với thời gian, không chỉ tạo điểm nhấn thẩm mỹ mà còn bảo vệ điện thoại khỏi trầy xước và va đập.\r\n???? Trang bị vân chống sốc ở 4 góc, giúp giảm thiểu tổn thương khi điện thoại va chạm mạnh.\r\n???? Viền camera và màn hình được thiết kế nhô cao, tăng cường khả năng chống xước và bảo vệ các bộ phận quan trọng của điện thoại.\r\n???? Đi kèm móc khóa thời trang, giúp bạn dễ dàng mang theo điện thoại mà không cần lo lắng về việc mất mát.\r\n???? Miếng dán rồng vàng đi kèm, tôn vinh sự độc đáo và may mắn cho chiếc điện thoại của bạn.\r\n\r\nVới Ốp iPhone Magsafe không ố vàng, bạn không chỉ sở hữu một sản phẩm bảo vệ điện thoại mà còn là một phần của phong cách cá nhân và may mắn trong cuộc sống hàng ngày. ????', 1, 20),
(30, 'Ốp BE Slim 3 siêu mỏng vân vali Magsafe', 209000, 109000, 'op12.jpg', 1, '2024-11-01', 3, 32, 'Ốp lưng iPhone siêu mỏng 0.5mm màu BE\r\n\r\nThiết kế độc đáo: Vân vali nổi bật, mang lại cảm giác sang trọng và phong cách.\r\n\r\nTích hợp từ tính: Hỗ trợ sạc không dây tiện lợi, giữ chắc chắn thiết bị của bạn khi sử dụng với các phụ kiện hít nam châm.\r\n\r\nBảo vệ toàn diện: Viền camera và màn hình nhô cao giúp chống xước, chống va đập hiệu quả, bảo vệ tối đa cho iPhone của bạn.\r\n\r\nSiêu mỏng nhẹ: Với độ dày chỉ 0.5mm, ốp lưng ôm sát, giữ nguyên vẻ đẹp nguyên bản của iPhone mà không làm tăng kích thước hay trọng lượng đáng kể.\r\n\r\nPhù hợp với các dòng iPhone: iPhone 12, iPhone 12 Pro, iPhone 12 Pro Max, iPhone 13, iPhone 13 Pro, iPhone 13 Pro Max, iPhone 14, iPhone 14 Pro, iPhone 14 Plus, iPhone 14 Pro Max, iPhone 15, iPhone 15 Plus,iPhone 15 Pro, iPhone 15 Pro Max\r\n\r\nMàu sắc: Màu BE trang nhã, dễ dàng phối hợp với mọi phong cách.', 1, 68);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `phone`) VALUES
(1, 'admin@gmail.com', 'Lê Anh Tú', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 'Mộc Châu - Sơn La', '0367234670'),
(33, 'anhtumc9ass@gmail.com', 'Lê Anh Tú', '2024-10-09', '202cb962ac59075b964b07152d234b70', 2, 1, 'Mộc Châu - Sơn La', '0367234670'),
(34, 'qngan@gmail.com', 'Quỳnh Ngân', '2024-11-06', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 'TP Vinh - Nghệ An', '0367234671');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
