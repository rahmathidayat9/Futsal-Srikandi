-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2023 at 04:11 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `futsal_srikandi`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kode_jadwal` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kode_jadwal`, `jam`, `harga`) VALUES
('A07', '07.00-08.00', 70000),
('A08', '08.00-09.00', 70000),
('A09', '09.00-10.00', 70000),
('A10', '10.00-11.00', 70000),
('A11', '11.00-12.00', 70000),
('A12', '12.00-13.00', 70000),
('A13', '13.00-14.00', 70000),
('A14', '14.00-15.00', 70000),
('A15', '15.00-16.00', 80000),
('A16', '16.00-17.00', 80000),
('A17', '17.00-18.00', 80000),
('A18', '18.00-19.00', 110000),
('A19', '19.00-20.00', 110000),
('A20', '20.00-21.00', 110000),
('A21', '21.00-22.00', 110000),
('A22', '22.00-23.00', 110000),
('B07', '07.00-08.00', 70000),
('B08', '08.00-09.00', 70000),
('B09', '09.00-10.00', 70000),
('B10', '10.00-11.00', 70000),
('B11', '11.00-12.00', 70000),
('B12', '12.00-13.00', 70000),
('B13', '13.00-14.00', 70000),
('B14', '14.00-15.00', 70000),
('B15', '15.00-16.00', 80000),
('B16', '16.00-17.00', 80000),
('B17', '17.00-18.00', 80000),
('B18', '18.00-19.00', 110000),
('B19', '19.00-20.00', 110000),
('B20', '20.00-21.00', 110000),
('B21', '21.00-22.00', 110000),
('B22', '22.00-23.00', 110000),
('T07', '07.00-08.00', 70000),
('T08', '08.00-09.00', 70000),
('T09', '09.00-10.00', 70000),
('T10', '10.00-11.00', 70000),
('T11', '11.00-12.00', 70000),
('T12', '12.00-13.00', 70000),
('T13', '13.00-14.00', 70000),
('T14', '14.00-15.00', 70000),
('T15', '15.00-16.00', 80000),
('T16', '16.00-17.00', 80000),
('T17', '17.00-18.00', 80000),
('T18', '18.00-19.00', 110000),
('T19', '19.00-20.00', 110000),
('T20', '20.00-21.00', 110000),
('T21', '21.00-22.00', 110000),
('T22', '22.00-23.00', 110000);

-- --------------------------------------------------------

--
-- Table structure for table `lapangan`
--

CREATE TABLE `lapangan` (
  `kode_lapangan` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` decimal(10,6) NOT NULL,
  `lng` decimal(10,6) NOT NULL,
  `kode_jadwal` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lapangan`
--

INSERT INTO `lapangan` (`kode_lapangan`, `nama`, `lokasi`, `lat`, `lng`, `kode_jadwal`) VALUES
('LA-07', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A07'),
('LA-08', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A08'),
('LA-09', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A09'),
('LA-10', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A10'),
('LA-11', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A11'),
('LA-12', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A12'),
('LA-13', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A13'),
('LA-14', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A14'),
('LA-15', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A15'),
('LA-16', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A16'),
('LA-17', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A17'),
('LA-18', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A18'),
('LA-19', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A19'),
('LA-20', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A20'),
('LA-21', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A21'),
('LA-22', 'Lapangan Atas', 'Atas', '-5.376350', '105.255730', 'A22'),
('LB-07', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B07'),
('LB-08', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B08'),
('LB-09', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B09'),
('LB-10', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B10'),
('LB-11', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B11'),
('LB-12', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B12'),
('LB-13', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B13'),
('LB-14', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B14'),
('LB-15', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B15'),
('LB-16', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B16'),
('LB-17', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B17'),
('LB-18', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B18'),
('LB-19', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B19'),
('LB-20', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B20'),
('LB-21', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B21'),
('LB-22', 'Lapangan Bawah', 'Bawah', '-5.376141', '105.255585', 'B22'),
('LT-07', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T07'),
('LT-08', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T08'),
('LT-09', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T09'),
('LT-10', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T10'),
('LT-11', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T11'),
('LT-12', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T12'),
('LT-13', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T13'),
('LT-14', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T14'),
('LT-15', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T15'),
('LT-16', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T16'),
('LT-17', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T17'),
('LT-18', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T18'),
('LT-19', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T19'),
('LT-20', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T20'),
('LT-21', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T21'),
('LT-22', 'Lapangan Tengah', 'Tengah', '-5.376303', '105.255432', 'T22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_03_19_175411_make_table', 1),
(2, '2020_03_19_175713_relation_table', 1),
(3, '2020_04_15_184738_change_unique_key', 1),
(4, '2020_04_22_135818_update_lapangan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `kode_operator` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`kode_operator`, `nama`, `password`) VALUES
(1, 'Rivaldo', '$2a$12$yZMkQRMN05oNkjXT7KxpQ.d0JETp/F/k2yaNjv3j5mnhJQdOabN.G'),
(2, 'Iqbal', '$2y$10$nvH/ZwqnEtawXFX7h.QPGe9Nf3KiwA950DQ2EkAKubCgxclm9SUFe'),
(3, 'Jefri', '$2y$10$K.RM4NKBNobfpVT.IPp4te6J.jh5KbTDAhSZnGWIVWShAdPrHQzzu');

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekap`
-- (See below for the actual view)
--
CREATE TABLE `rekap` (
`kode_transaksi` int(10) unsigned
,`tanggal` date
,`kode_lapangan` varchar(5)
,`jam` varchar(15)
,`diskon` int(10) unsigned
,`harga` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tambahsewa`
-- (See below for the actual view)
--
CREATE TABLE `tambahsewa` (
`kode_lapangan` varchar(5)
,`lokasi` varchar(20)
,`kode_jadwal` varchar(5)
,`jam` varchar(15)
,`harga` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_transaksi` int(10) UNSIGNED NOT NULL,
  `kode_operator` int(10) UNSIGNED NOT NULL,
  `kode_user` int(10) UNSIGNED NOT NULL,
  `kode_lapangan` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jadwal` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskon` int(10) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `kode_operator`, `kode_user`, `kode_lapangan`, `kode_jadwal`, `diskon`, `tanggal`) VALUES
(1, 1, 4, 'LA-07', 'A07', 20, '2023-07-28');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `kode_user` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`kode_user`, `nama`, `telepon`) VALUES
(1, 'Budi Budiman', '081122334455'),
(2, 'Caca Macaca', '082233445566'),
(3, 'Andi Surandi', '083344556677'),
(4, 'Adudu', '081890175');

-- --------------------------------------------------------

--
-- Structure for view `rekap`
--
DROP TABLE IF EXISTS `rekap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekap`  AS SELECT `a`.`kode_transaksi` AS `kode_transaksi`, `a`.`tanggal` AS `tanggal`, `a`.`kode_lapangan` AS `kode_lapangan`, `b`.`jam` AS `jam`, `a`.`diskon` AS `diskon`, `b`.`harga` AS `harga` FROM (`transaksi` `a` join `jadwal` `b`) WHERE `a`.`kode_jadwal` = `b`.`kode_jadwal``kode_jadwal`  ;

-- --------------------------------------------------------

--
-- Structure for view `tambahsewa`
--
DROP TABLE IF EXISTS `tambahsewa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tambahsewa`  AS SELECT `a`.`kode_lapangan` AS `kode_lapangan`, `a`.`lokasi` AS `lokasi`, `a`.`kode_jadwal` AS `kode_jadwal`, `b`.`jam` AS `jam`, `b`.`harga` AS `harga` FROM (`lapangan` `a` join `jadwal` `b`) WHERE `a`.`kode_jadwal` = `b`.`kode_jadwal``kode_jadwal`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kode_jadwal`);

--
-- Indexes for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD PRIMARY KEY (`kode_lapangan`),
  ADD KEY `lapangan_kode_jadwal_foreign` (`kode_jadwal`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`kode_operator`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `transaksi_kode_operator_foreign` (`kode_operator`),
  ADD KEY `transaksi_kode_lapangan_foreign` (`kode_lapangan`),
  ADD KEY `transaksi_kode_user_foreign` (`kode_user`),
  ADD KEY `transaksi_kode_jadwal_foreign` (`kode_jadwal`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`kode_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `kode_operator` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `kode_transaksi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `kode_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD CONSTRAINT `lapangan_kode_jadwal_foreign` FOREIGN KEY (`kode_jadwal`) REFERENCES `jadwal` (`kode_jadwal`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_kode_jadwal_foreign` FOREIGN KEY (`kode_jadwal`) REFERENCES `jadwal` (`kode_jadwal`),
  ADD CONSTRAINT `transaksi_kode_lapangan_foreign` FOREIGN KEY (`kode_lapangan`) REFERENCES `lapangan` (`kode_lapangan`),
  ADD CONSTRAINT `transaksi_kode_operator_foreign` FOREIGN KEY (`kode_operator`) REFERENCES `operator` (`kode_operator`),
  ADD CONSTRAINT `transaksi_kode_user_foreign` FOREIGN KEY (`kode_user`) REFERENCES `user` (`kode_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
