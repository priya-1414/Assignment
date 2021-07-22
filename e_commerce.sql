-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2021 at 05:09 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `cust_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cust_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cust_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cust_FirstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cust_LastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` int(11) NOT NULL,
  `cust_PhoneNo` double NOT NULL,
  `cust_Address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cust_Address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verification_Status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `cust_name`, `cust_email`, `cust_pass`, `cust_FirstName`, `cust_LastName`, `city`, `state`, `zip_code`, `cust_PhoneNo`, `cust_Address1`, `cust_Address2`, `verification_Status`) VALUES
(1, 'priya', 'priya@gmai.com', 'priya1', 'priya', 'wakhare', 'partur', 'maharashtra', 431501, 9860628269, 'sarwaswati colony', 'main road', 1),
(2, 'neha', 'neha@gmai.com', 'neha2', 'neha', 'wakhare', 'jalna', 'maharashtra', 431505, 9860868269, 'adharsh colony', 'shivaji road', 1),
(3, 'gayatri', 'gayu@gmai.com', 'gayatri3', 'gayatri', 'ambekar', 'pune', 'maharashtra', 291901, 9801928269, 'shiv house', 'adharsh school', 1),
(4, 'somesh', 'somesh@gmai.com', 'somesh4', 'somesh', 'somani', 'partur', 'maharashtra', 431501, 8080628269, 'vardha colony', 'naval hospital', 1),
(5, 'teju', 'teju@gmai.com', 'teju5', 'teju5', 'gandhi', 'aurngabd', 'maharashtra', 891501, 987628269, 'sangita niwas', 'main road', 1),
(6, 'vaishu', 'vaishu@gmai.com', 'vaishu6', 'vaishu', 'varade', 'latur', 'maharashtra', 878501, 9896767269, 'shivaji colony', 'highway road', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_Id` int(11) NOT NULL,
  `total_Qty` int(11) NOT NULL,
  `total_Price` int(11) NOT NULL,
  `sub_Items` int(11) NOT NULL,
  `payment_Mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tracking_Id` int(11) NOT NULL,
  `order_Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_Id`, `total_Qty`, `total_Price`, `sub_Items`, `payment_Mode`, `tracking_Id`, `order_Date`) VALUES
(1, 1, 2, 1000, 2, 'online', 1234, '2021-07-21 18:07:21'),
(2, 2, 2, 2000, 2, 'cash on delivery', 1224, '2021-07-21 18:11:48'),
(3, 3, 3, 3000, 3, 'online', 1334, '2021-07-21 18:12:25'),
(4, 4, 1, 1000, 1, 'cash on delivery', 1244, '2021-07-21 18:13:05'),
(5, 5, 1, 1000, 1, 'online', 1134, '2021-07-21 18:13:30'),
(6, 6, 1, 3000, 1, 'online', 2234, '2021-07-21 18:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_detaiil`
--

CREATE TABLE `order_detaiil` (
  `id` int(11) NOT NULL,
  `order_Id` int(11) NOT NULL,
  `p_Id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `seller_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_detaiil`
--

INSERT INTO `order_detaiil` (`id`, `order_Id`, `p_Id`, `price`, `qty`, `seller_Id`) VALUES
(1, 10, 100, 1000, 2, 400),
(2, 20, 200, 2000, 2, 400),
(3, 30, 300, 3000, 3, 401),
(4, 40, 400, 1000, 1, 401),
(5, 50, 500, 1000, 1, 400),
(6, 60, 600, 3000, 1, 402);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `p_Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `p_Desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `p_Cat_Id` int(11) NOT NULL,
  `p_Img1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `p_Img2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `p_Discount` int(11) NOT NULL,
  `p_Offer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `p_Seller_Id` int(11) NOT NULL,
  `p_Price` double NOT NULL,
  `p_Oty` int(11) NOT NULL,
  `p_Review_Rating` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `recommended` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `p_Name`, `p_Desc`, `p_Cat_Id`, `p_Img1`, `p_Img2`, `p_Discount`, `p_Offer`, `p_Seller_Id`, `p_Price`, `p_Oty`, `p_Review_Rating`, `featured`, `recommended`) VALUES
(100, 'apolo shoes', 'best, white colour', 101, 'https://www.google.com/search?q=shoes+png+image&client=firefox-b-d&bih=615&biw=1366&hl=en&sxsrf=ALeKk00FHlD4pV7VUyjzxewouWOcQSoH2Q:1626894157533&tbm=isch&source=iu&ictx=1&fir=70erkXARpjKT9M%252CrtnPfhL3l9LlgM%252C_&vet=1&usg=AI4_-kS11vjqQmNPbAX_-4MD2x7xmn', 'https://www.google.com/search?q=shoes+png+image&client=firefox-b-d&bih=615&biw=1366&hl=en&sxsrf=ALeKk00FHlD4pV7VUyjzxewouWOcQSoH2Q:1626894157533&tbm=isch&source=iu&ictx=1&fir=6WYgtIvf2gqZBM%252Csn3PZjPnF0ZYuM%252C_&vet=1&usg=AI4_-kTv_OTcbxfJTwcmxpvg0ZMUJw', 0, 'diwali offer', 401, 1000, 2, 4, 1, 1),
(200, 'womens kurti', 'soft cloth, red colour', 102, 'https://www.google.com/search?q=womens+kurti+png&client=firefox-b-d&sxsrf=ALeKk02ATVDD047mprHz5jh_x12Z6yAzmw:1626894226395&tbm=isch&source=iu&ictx=1&fir=_ifxBKHUpFQLoM%252CczB9h48YnzcfmM%252C_&vet=1&usg=AI4_-kTB8JoC-Oy1xyzUhO3ikuVV8Gkkaw&sa=X&ved=2ahUKEwi', 'https://www.google.com/search?q=womens+kurti+png&client=firefox-b-d&sxsrf=ALeKk02ATVDD047mprHz5jh_x12Z6yAzmw:1626894226395&tbm=isch&source=iu&ictx=1&fir=8su092_b2t_yOM%252COzMgS3fT9qabDM%252C_&vet=1&usg=AI4_-kTrHQ2uAa-dVospthKoHqpQZ1NKHA&sa=X&ved=2ahUKEwi', 10, 'diwali offer', 401, 2000, 2, 4, 1, 1),
(300, 'baby dress', 'soft cloth, black colour', 103, 'https://www.google.com/search?q=baby+dress+png&client=firefox-b-d&sxsrf=ALeKk00rTD_kccivd0CJSJ_rqtbblwPizQ:1626894304322&tbm=isch&source=iu&ictx=1&fir=LKRXSCL4SrQSoM%252CKQIlig6xm0eYfM%252C_&vet=1&usg=AI4_-kRZ_HRh7rkuuRmWW5cjLoWcRNNenA&sa=X&ved=2ahUKEwjAg', 'https://www.google.com/search?q=baby+dress+png&client=firefox-b-d&sxsrf=ALeKk00rTD_kccivd0CJSJ_rqtbblwPizQ:1626894304322&tbm=isch&source=iu&ictx=1&fir=hb4pto7QYLFDaM%252ChuY4f0NZG8DnAM%252C_&vet=1&usg=AI4_-kRkXyD4CWyDLapYl3-DTQ4HwWMdOg&sa=X&ved=2ahUKEwjAg', 0, 'no offer', 400, 3000, 3, 3, 0, 1),
(400, 'himalaya shampoo', 'best qulity, smothning', 104, 'https://www.google.com/search?q=himalaya+shampoo+png&client=firefox-b-d&sxsrf=ALeKk02NQOy4x0LJPAxwz6DlqrNnevfKGQ:1626894387757&tbm=isch&source=iu&ictx=1&fir=L-crY0Rpvpz_cM%252CHABpDxUh_J6dsM%252C_&vet=1&usg=AI4_-kS8cZKHPDKYFA3JnYy63LT2qmwVfw&sa=X&ved=2ahU', 'https://www.google.com/search?q=himalaya+shampoo+png&client=firefox-b-d&sxsrf=ALeKk02NQOy4x0LJPAxwz6DlqrNnevfKGQ:1626894387757&tbm=isch&source=iu&ictx=1&fir=WSQHCCk5yMy-2M%252CEvTriQVeh3F6UM%252C_&vet=1&usg=AI4_-kQH6jEz_NMEowoiMi8bWyyK5bxQ4g&sa=X&ved=2ahU', 50, 'diwali offer', 402, 1000, 1, 2, 1, 1),
(500, 'z-washing machine', 'best qulity, white colour', 105, 'https://www.google.com/search?q=washing+machine+png&client=firefox-b-d&sxsrf=ALeKk00fJ4Ph7gc5a6I-pQzOhH-Zq843Jg:1626894442272&tbm=isch&source=iu&ictx=1&fir=8LaJxz7-_v64cM%252C6z9jY_l3JdlV8M%252C_&vet=1&usg=AI4_-kRPHRolYlJqy2aOq-h2bcIlGup9AQ&sa=X&ved=2ahUK', 'https://www.google.com/search?q=washing+machine+png&client=firefox-b-d&sxsrf=ALeKk00fJ4Ph7gc5a6I-pQzOhH-Zq843Jg:1626894442272&tbm=isch&source=iu&ictx=1&fir=jSEzJ1YD9iIfJM%252CXYabMciBikOFdM%252C_&vet=1&usg=AI4_-kS-50uUdo10v_t1AjO4aVOZW_B7iQ&sa=X&ved=2ahUK', 10, 'no offer', 402, 1000, 1, 4, 0, 0),
(600, 'nira shoes', 'best qulity, red black combo colour', 106, 'https://www.google.com/search?q=red+black+shoes+png&client=firefox-b-d&sxsrf=ALeKk03q88VdE2anXuZ8DmBsmrbpJfqvCw:1626894505505&tbm=isch&source=iu&ictx=1&fir=bfckwmSbUzJ_nM%252CMDtDhra8Pon6iM%252C_&vet=1&usg=AI4_-kQA5K4_Id697fYRBmQ-APyEwGG3uw&sa=X&ved=2ahUK', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fe7.pngegg.com%2Fpngimages%2F723%2F143%2Fpng-clipart-shoe-nike-free-air-force-nike-shoes-image-file-formats-fashion-thumbnail.png&imgrefurl=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fpng-bhina&tbnid=4WxFbS3aN4S_X', 0, 'no offer', 400, 3000, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`) VALUES
(101, 'shoes'),
(102, 'women wear'),
(103, 'baby wear'),
(104, 'hair products'),
(105, 'electronics'),
(106, 'shoes');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `seller_firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seller_LastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seller_Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seller_PhoneNo` double NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` int(11) NOT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `seller_firstName`, `seller_LastName`, `seller_Email`, `seller_PhoneNo`, `city`, `state`, `zip_code`, `address1`, `address2`) VALUES
(400, 'john', 'parle', 'john@gmail.com', 9876297399, 'delhi', 'delhi', 938922, 'amar nagar', 'nana chowk'),
(401, 'mohan', 'dass', 'mohan@gmail.com', 9876297399, 'mumbai', 'maharashtra', 189922, 'vikas building', 'vella chowk'),
(403, 'mona', 'roy', 'mona@gmail.com', 9080797399, 'aurangabad', 'maharashtra', 878902, 'neru housing', 'jain school');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detaiil`
--
ALTER TABLE `order_detaiil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_detaiil`
--
ALTER TABLE `order_detaiil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
