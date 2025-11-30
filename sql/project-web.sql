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

INSERT INTO categories (`id`, `name`, `status`) VALUES
(1, 'Đồng hồ xà cừ', 1),
(2, 'Phiên bản giới hạn', 1),
(3, 'Đồng hồ kim cương', 1),
(4, 'Đồng hồ siêu mỏng', 1),
(5, 'Đồng hồ Skeleton', 1),
(6, 'Đồng hồ vàng 18k', 1);

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
(1, 1, 'Lê Công Chiến', 'congchien@gmail.com', '0367757743', 'Sản phẩm rất chất lượng', '2024-11-12 07:32:34', 0),
(2, 33, 'Lê Công Chiến', 'congchien@gmail.com', '0334556789', 'Tôi rất thích đồng hồ của shop ^^', '2024-11-01 23:53:19', 1),
(3, 33, 'Lê Công Chiến', 'congchien@gmail.com', '0367757743', 'Đồng hồ rất đẹp', '2024-11-08 23:54:40', 0),
(4, 33, 'Lê Công Chiến', 'congchien@gmail.com', '0367757743', 'Đồng hồ rất đẹp', '2024-11-25 03:59:50', 0),
(5, 33, 'Lê Công Chiến 123', '', '0367757743', '', '2024-11-25 11:10:07', 0),
(6, 33, 'Lê Công Chiến 11', '', '0367757743', '', '2024-11-25 14:18:55', 0);

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
-- Dumping data for table `order_detail

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
(1, 'Đồng hồ Xà Cừ Premium A1', 3990000, 3590000, 'dongho1.avif', 1, NOW(), 1, 10, 'Mặt số xà cừ thiên nhiên cao cấp, dây da thật, chống nước 3ATM.', 1, 0),
(2, 'Đồng hồ Xà Cừ Luxury A2', 4690000, 4290000, 'dongho2.avif', 1, NOW(), 1, 12, 'Thiết kế viền thép không gỉ, mặt xà cừ ánh hồng sang trọng.', 1, 0),
(3, 'Đồng hồ Xà Cừ Classic A3', 3290000, 2890000, 'dongho3.avif', 1, NOW(), 1, 20, 'Phong cách cổ điển với mặt xà cừ tự nhiên, máy Quartz Nhật.', 1, 0),
(4, 'Đồng hồ Xà Cừ Nữ Hoàng A4', 5490000, 4990000, 'dongho4.avif', 1, NOW(), 1, 8, 'Thiết kế nữ tính, viền đính đá nhẹ, phù hợp dự tiệc.', 1, 0),
(5, 'Đồng hồ Xà Cừ Diamond A5', 6190000, 5690000, 'dongho5.avif', 1, NOW(), 1, 6, 'Mặt xà cừ sắc nét, viền đá CZ cao cấp, dây kim loại mạ vàng.', 1, 0),
(6, 'Frederique Constant Classics FC-303RMLN5B6', 61930000, 61930000, 'dongho6.avif', 1, NOW(), 2, 5, 'Phiên bản giới hạn 1888 chiếc, hợp tác cùng Hội Lịch sử Riva, cảm hứng từ chiếc thuyền Runabout huyền thoại, mặt số 42mm, Automatic, kính Sapphire, trữ cót 38 giờ.', 1, 0),
(7, 'Frederique Constant Classics Vintage Rally FC-397HLBN5B6', 133800000, 133800000, 'dongho7.avif', 1, NOW(), 2, 3, 'Phiên bản giới hạn 1888 chiếc, Chronograph Small Seconds, mặt số 42mm, Automatic, kính Sapphire, tôn vinh di sản và niềm đam mê xe cổ.', 1, 0),
(8, 'Titoni Seascoper 300 – 83300 B-BK-R-718', 76580000, 76580000, 'dongho8.avif', 1, NOW(), 2, 2, 'Phiên bản giới hạn 200 chiếc toàn cầu, Automatic Sellita SW200-1, Diver 300m, mặt số Ice Blue, gốm Ceramic mạ DLC, chứng nhận COSC.', 1, 0),
(9, 'Orient Contemporary Semi Skeleton RA-AR0012N30B', 12580000, 12580000, 'dongho9.avif', 1, NOW(), 2, 8, 'Phiên bản kỷ niệm 75 năm thương hiệu, giới hạn 2800 chiếc, Automatic, Semi Skeleton, mặt số 40.8mm, chống nước 5ATM.', 1, 0),
(10, 'Seiko 5 Sports SRPK41K1', 13200000, 13200000, 'dongho10.avif', 1, NOW(), 2, 10, 'Bản kỷ niệm 110 năm, giới hạn 6000 chiếc, máy cơ in-house trữ cót 41 giờ, Hardlex Cong, chính xác và bền bỉ.', 1, 0),
(11, 'Doxa Executive Slim D156RSV', 25170000, 25170000, 'dongho11.avif', 1, NOW(), 3, 5, 'Mẫu Doxa D156RSV mỏng gọn, thiết kế đương đại, mạ vàng hồng PVD, mặt số 29mm, Quartz, kính Sapphire, Swiss Made, chống nước 3 ATM, sang trọng và chuyên nghiệp.', 1, 0),
(12, 'Daniel Wellington MOP Quadro Special Edition DW00100510', 5860000, 5860000, 'dongho12.avif', 1, NOW(), 3, 8, 'Phiên bản mặt số chữ nhật phối tone hồng xà cừ trẻ trung, Quartz pin, siêu mỏng 6mm.', 1, 0),
(13, 'Daniel Wellington Quadro DW00100434', 4530000, 4530000, 'dongho13.avif', 1, NOW(), 3, 10, 'Mặt số vuông trắng nhỏ nhắn, thời trang nữ, Quartz pin, siêu mỏng 6mm, phong cách tối giản thanh lịch.', 1, 0),
(14, 'Daniel Wellington Quadro MOP DW00100578', 6360000, 6360000, 'dongho14.avif', 1, NOW(), 3, 6, 'Mặt số hình chữ nhật, đính 12 viên pha lê tương ứng 12 múi giờ, Quartz pin, tone trắng xà cừ, thiết kế sang trọng.', 1, 0),
(15, 'Daniel Wellington Classic Petite DW00100219', 4530000, 4530000, 'dongho15.avif', 1, NOW(), 3, 9, 'Mạ vàng hồng PVD, thiết kế tối giản, thanh lịch, siêu mỏng 6mm, dây lưới vàng hồng, phong cách trẻ trung thời trang.', 1, 0),
(16, 'Orient Contemporary Semi Skeleton RA-AR0012N30B', 12580000, 12580000, 'dongho16.avif', 1, NOW(), 4, 7, 'Bộ máy Automatic trữ cót 40 giờ, thiết kế Semi Skeleton phức tạp. Phiên bản kỷ niệm 75 năm thương hiệu, giới hạn 2800 chiếc, Mặt số 40.8mm, chống nước 5ATM.', 1, 0),
(17, 'Fossil Heritage ME3264', 8580000, 8580000, 'dongho17.avif', 1, NOW(), 4, 10, 'Mặt số Skeleton lộ cơ, Automatic Japan Movt, kính Sapphire, chống nước 5ATM, Dress Watch phong cách hiện đại, hợp thời cho phái mạnh.', 1, 0),
(18, 'Orient Star Joker Skeleton RE-AV0006Y00B', 26350000, 26350000, 'dongho18.avif', 1, NOW(), 4, 5, 'Máy F6F44 Automatic, mặt Joker độc đáo, trữ cót 50 giờ, dây da cao cấp vân cá sấu, lịch lãm và cuốn hút.', 1, 0),
(19, 'Orient Star RE-AV0B08L00B', 28680000, 28680000, 'dongho19.avif', 1, NOW(), 4, 6, 'Máy Automatic, kính Sapphire, mặt số 41mm đa tầng xanh navy, trữ cót 50 giờ, chống nước 10ATM, lấy cảm hứng từ may đo Veston, diện mạo lịch lãm.', 1, 0),
(20, 'DS Action Lady Diamonds C032.051.11.036.00', 17280000, 17280000, 'dongho20.avif', 1, NOW(), 5, 5, 'Quartz (Pin), Mặt số 34mm, Kính Sapphire chống lóa, đính 3 viên kim cương, chống nước 20ATM. Thiết kế sang trọng cho phái nữ thành đạt, đạt chuẩn Swiss Made.', 1, 0),
(21, 'Rado Florence R48903733', 59660000, 59660000, 'dongho21.avif', 1, NOW(), 5, 3, 'Automatic, Mặt số 39mm, Kính Sapphire, đính 4 viên kim cương, trữ cót 80 giờ, dây tóc chống từ Nivachron™, thiết kế thanh lịch, độ mỏng 11mm.', 1, 0),
(22, 'Rado Florence R48903723', 61540000, 61540000, 'dongho22.avif', 1, NOW(), 5, 3, 'Automatic, Mặt số 39mm, Kính Sapphire, đính 4 viên kim cương, trữ cót 80 giờ, dây demi PVD vàng sang trọng, chống từ Nivachron™, thiết kế thanh lịch, độ mỏng 11mm.', 1, 0),
(23, 'Doxa Noble D174TSX', 42140000, 42140000, 'dongho23.avif', 1, NOW(), 5, 5, 'Quartz (Pin), Mặt số 29mm, Kính Sapphire, đính 23 viên kim cương, mạ vàng PVD, phiên bản sang trọng cho phái đẹp cổ tay nhỏ.', 1, 0),
(24, 'Longines Conquest L3.830.4.97.6', 79200000, 79200000, 'dongho24.avif', 1, NOW(), 5, 3, 'Automatic, Mặt số 41mm xanh dương Sunburst, Kính Sapphire chống lóa, đính 15 viên kim cương Top Wesselton VS-SI tổng 0,064 carat, trữ cót 72 giờ, phong cách thể thao thanh lịch.', 1, 0),
(25, 'Doxa Precious D121RWD', 207280000, 207280000, 'dongho25.avif', 1, NOW(), 6, 3, 'Nữ, Automatic, Mặt số 31mm, Vàng hồng 18K, Kính Sapphire, đính 68 viên kim cương tự nhiên, họa tiết Guilloche Côtes de Genève, thiết kế tinh xảo và sang trọng.', 1, 0),
(26, 'Doxa Grandemetre D138TCMW', 135870000, 135870000, 'dongho26.avif', 1, NOW(), 6, 3, 'Nam, Automatic, Mặt số 40mm, Vàng 18K nguyên khối, chứng nhận COSC, phiên bản giới hạn 500 chiếc, dây da cá sấu, thiết kế đẳng cấp dành cho Quý ông.', 1, 0),
(27, 'Doxa Executive D208RSD', 99870000, 99870000, 'dongho27.avif', 1, NOW(), 6, 3, 'Nam, Automatic, Mặt số 41mm, 27 viên kim cương, Swiss Made, vàng hồng 18K, kỹ thuật khắc Guilloche tinh xảo, bộ máy automatic chất lượng cao.', 1, 0),
(28, 'Longines Conquest Heritage L1.649.4.72.2', 87450000, 87450000, 'dongho28.avif', 1, NOW(), 6, 3, 'Nam/Nữ, Automatic, Mặt số 38mm, Vàng 18K, Swiss Super-LumiNova®, nắp lưng huy chương, Power Reserve 72 giờ, thiết kế di sản đẳng cấp.', 1, 0),
(29, 'Longines Conquest Heritage L1.649.4.52.2', 87450000, 87450000, 'dongho29.avif', 1, NOW(), 6, 3, 'Nam/Nữ, Automatic, Mặt số 38mm, Vàng 18K, Swiss Super-LumiNova®, nắp lưng huy chương, Power Reserve 72 giờ, thiết kế di sản đẳng cấp.', 1, 0),
(30, 'Longines Flagship Heritage Moonphase L4.815.4.78.2', 97350000, 97350000, 'dongho30.avif', 1, NOW(), 6, 3, 'Nam, Automatic, Mặt số 38.5mm, Vàng 18K, bộ sưu tập Heritage, Moonphase, mặt số Champagne, kim chỉ báo lịch ngày, huy chương mặt sau tráng men, thiết kế vô cùng đẳng cấp.', 1, 0);
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
(1, 'admin@gmail.com', 'Lê Công chiến', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 'Hà Nội', '0123456789'),
(33, 'congchien@gmail.com', 'Lê Công chiến', '2024-10-09', '202cb962ac59075b964b07152d234b70', 2, 1, 'Mộc Châu - Sơn La', '0123456789');

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
