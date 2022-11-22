-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 05:38 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengajuan`
--

-- --------------------------------------------------------

--
-- Table structure for table `berkas`
--

CREATE TABLE `berkas` (
  `idberkas` int(11) NOT NULL,
  `pengajuan_surat_id` int(11) DEFAULT NULL,
  `surat_syarat_id` int(11) NOT NULL,
  `nama_berkas` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `berkas`
--

INSERT INTO `berkas` (`idberkas`, `pengajuan_surat_id`, `surat_syarat_id`, `nama_berkas`) VALUES
(84, 87, 9, 'b63f55b448fc8248d722787d023039b0.jpg'),
(85, 87, 13, '86beb6895a3a6c7f5a87040baa62dcf3.JPG'),
(86, 88, 9, '6b7fcc4584a2c348315dba53acb90430.pdf'),
(87, 88, 9, '98d14a7cde0398ea1cad15eac6261572.pdf'),
(88, 89, 9, '3e156988682d3a59e8561fdb217a358e.pdf'),
(89, 98, 16, '8114cd1e06bbfc4bd5275eb81b2ffb06.pdf'),
(90, 99, 16, 'b68ded9d446ad890535003ca9c2bba3c.jpg'),
(91, 100, 16, 'db6a1f28f4143f4bf2df27236247eb59.jpg'),
(92, 101, 16, '23f52a12b20b66b22adee59a98334868.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_surat`
--

CREATE TABLE `pengajuan_surat` (
  `idpengajuansurat` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `surat_id` int(11) DEFAULT NULL,
  `status` enum('Buat','Pengajuan','Proses','Selesai') DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengajuan_surat`
--

INSERT INTO `pengajuan_surat` (`idpengajuansurat`, `user_id`, `surat_id`, `status`, `create_by`, `update_by`) VALUES
(98, 101, 7, 'Selesai', 101, NULL),
(99, 101, 7, 'Selesai', 101, NULL),
(100, 100, 7, 'Buat', 100, NULL),
(101, 100, 7, 'Selesai', 100, NULL),
(102, 100, 8, '', 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `idsurat` int(11) NOT NULL,
  `nama_surat` varchar(128) DEFAULT NULL,
  `keterangan` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`idsurat`, `nama_surat`, `keterangan`) VALUES
(7, 'Pembuatan TTE', 'pembuatan Tanda tangan elektronik'),
(8, 'Test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `surat_syarat`
--

CREATE TABLE `surat_syarat` (
  `idsurat_syarat` int(11) NOT NULL,
  `surat_id` int(11) DEFAULT NULL,
  `nama_syarat` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `surat_syarat`
--

INSERT INTO `surat_syarat` (`idsurat_syarat`, `surat_id`, `nama_syarat`) VALUES
(16, 7, 'KTP');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `level` enum('admin','user') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idusers`, `username`, `password`, `level`) VALUES
(1, 'admin', '$2y$10$A1kVNFN7DrMpBk2WrLIBnepeNm7cS4HZFdgml9q6dOiZ6S/7/pkJG', 'admin'),
(44, '3214141907990001', '$2y$10$JmJpENzTcThn57hfiqCFcOwE6xzPE172BH/aGxl0PYyZDNCFps.Ze', 'user'),
(45, 'irfan', '$2y$10$sRwnKFC9QPFIyQcDNvjNIuIMQMsw3XRpd3gaPXHFJfe2sqD.Eu7he', 'admin'),
(100, 'kiki', '$2y$10$KfjvUZZ4gpDjdXDIXkRFKOWgm.bKfR.MalVU.r5Zt1m.UwtdE27nG', 'admin'),
(101, '123', '$2y$10$8IUAqFb/n5T95zPWCXfCYOJbDvtRPU/nXzYuo4AlDVfqk7po3Itui', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `iduser_profile` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `pangkat` varchar(10) NOT NULL,
  `jabatan` varchar(15) NOT NULL,
  `unitkerja` varchar(15) NOT NULL,
  `instansi` varchar(15) NOT NULL,
  `nama_lengkap` varchar(128) DEFAULT NULL,
  `tempat_lahir` varchar(64) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Pria','Wanita') DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `nomorhp` varchar(13) NOT NULL,
  `alamat` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`iduser_profile`, `users_id`, `nik`, `nip`, `pangkat`, `jabatan`, `unitkerja`, `instansi`, `nama_lengkap`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `agama`, `email`, `nomorhp`, `alamat`) VALUES
(1, 1, 'administrator', NULL, '', '', '', '', 'administrator', NULL, NULL, NULL, NULL, '', '', NULL),
(2, 45, '', '4239872489', 'Bendahara', 'Kepala seksi', 'Sekretariat Dae', 'pemkab. Purwaka', 'irfan asendra', 'Purwakarta', '0000-00-00', 'Pria', 'Islam', 'irfan.asendra04@gmail.com', '0894537776662', ''),
(53, 100, 'kiki', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL),
(54, 101, '123', '123123123123123', 'Bendahara', 'leader', '', '', 'Rizki', 'Purwakarta', '2022-11-23', 'Pria', 'Islam', 'iwasyou16@gmail.com', '08777788', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berkas`
--
ALTER TABLE `berkas`
  ADD PRIMARY KEY (`idberkas`);

--
-- Indexes for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  ADD PRIMARY KEY (`idpengajuansurat`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`idsurat`);

--
-- Indexes for table `surat_syarat`
--
ALTER TABLE `surat_syarat`
  ADD PRIMARY KEY (`idsurat_syarat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`iduser_profile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berkas`
--
ALTER TABLE `berkas`
  MODIFY `idberkas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  MODIFY `idpengajuansurat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `idsurat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `surat_syarat`
--
ALTER TABLE `surat_syarat`
  MODIFY `idsurat_syarat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `iduser_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
