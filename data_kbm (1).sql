-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2024 at 06:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_kbm`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `no_pengajar` int(50) NOT NULL,
  `nama_guru` varchar(200) DEFAULT NULL,
  `tahun_pengajaran` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`no_pengajar`, `nama_guru`, `tahun_pengajaran`) VALUES
(101, 'Ahmad', 2020),
(102, 'Yani', 2020),
(103, 'Gabid', NULL),
(104, 'Adrian', 2023),
(105, 'Tea', NULL),
(360, 'Ibu imas', 2015),
(366, 'Ibu imas', 2015),
(367, 'Ibu imas', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kbm` int(2) NOT NULL,
  `NIS` int(50) DEFAULT NULL,
  `no_pengajar` int(50) DEFAULT NULL,
  `no_pelajaran` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kbm`, `NIS`, `no_pengajar`, `no_pelajaran`) VALUES
(1, 801, 101, 5),
(2, 805, 101, 5),
(3, 802, 105, 3),
(4, 802, 104, 5),
(5, 802, 103, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran`
--

CREATE TABLE `pelajaran` (
  `no_pelajaran` int(2) NOT NULL,
  `mapel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelajaran`
--

INSERT INTO `pelajaran` (`no_pelajaran`, `mapel`) VALUES
(1, 'Bahasa Indonesia'),
(2, 'Bahasa Inggris'),
(3, 'Matematika'),
(4, 'Sejarah'),
(5, 'Budi Pekerti');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `NIS` int(50) NOT NULL,
  `nama_siswa` varchar(200) DEFAULT NULL,
  `alamat_siswa` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`NIS`, `nama_siswa`, `alamat_siswa`) VALUES
(801, 'Jaya Artana', 'Kota jawa'),
(802, 'Rana Maria', 'Bandung'),
(803, 'Maya Indira', 'Kota Bandung'),
(804, 'Indra Jegel', 'jawa'),
(805, 'Tarka Rama', 'binong jati'),
(807, 'agus supriadi', 'Kota jawa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`no_pengajar`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kbm`),
  ADD KEY `no_pengajar` (`no_pengajar`),
  ADD KEY `no_pelajaran` (`no_pelajaran`),
  ADD KEY `NIS` (`NIS`);

--
-- Indexes for table `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD PRIMARY KEY (`no_pelajaran`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NIS`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`no_pengajar`) REFERENCES `guru` (`no_pengajar`),
  ADD CONSTRAINT `kelas_ibfk_3` FOREIGN KEY (`no_pelajaran`) REFERENCES `pelajaran` (`no_pelajaran`),
  ADD CONSTRAINT `kelas_ibfk_4` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
