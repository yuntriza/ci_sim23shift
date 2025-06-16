-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2025 at 07:35 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latihan23cap`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter_pasien`
--

CREATE TABLE `dokter_pasien` (
  `iddokter` int(11) NOT NULL,
  `dokter` varchar(50) NOT NULL,
  `hari` varchar(50) DEFAULT NULL,
  `jam` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter_pasien`
--

INSERT INTO `dokter_pasien` (`iddokter`, `dokter`, `hari`, `jam`) VALUES
(8, 'dr. Andi Setiawan, Sp.Klinis', 'Senin', '08:00 - 12:00'),
(9, 'dr. Budi Hartono, Sp.Kebidanan', 'Selasa', '09:00 - 13:00'),
(10, 'dr. Citra Anjani, Sp.Diagnostik', 'Rabu', '10:00 - 14:00'),
(11, 'dr. Dian Rahayu, Sp.Rehabilitasi', 'Kamis', '13:00 - 17:00'),
(12, 'dr. Eko Prasetyo, Sp.Jiwa', 'Jumat', '08:00 - 12:00'),
(13, 'dr. Farah Mutiara, Sp.Mental', 'Senin', '14:00 - 18:00'),
(14, 'dr. Guntur Mahesa, Sp.THT', 'Selasa', '08:00 - 11:00'),
(15, 'dr. Hani Pradipta, Sp.Mata', 'Rabu', '09:00 - 12:00'),
(16, 'dr. Irfan Nugroho, Sp.Bedah', 'Kamis', '10:00 - 14:00'),
(17, 'dr. Juwita Larasati, Sp.Anak', 'Jumat', '13:00 - 17:00'),
(18, 'dr. Kevin Syahputra, Sp.Penyakit Dalam', 'Sabtu', '08:00 - 12:00'),
(19, 'dr. Laila Nurul, Sp.Saraf', 'Minggu', '09:00 - 12:00'),
(20, 'dr. Mahendra Wijaya, Sp.Ortopedi', 'Senin', '10:00 - 14:00'),
(21, 'dr. Nadia Alifah, Sp.Kulit', 'Selasa', '13:00 - 17:00'),
(22, 'dr. Oki Ramadhan, Sp.Paru', 'Rabu', '08:00 - 11:00');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pasien`
--

CREATE TABLE `kategori_pasien` (
  `idkategori` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_pasien`
--

INSERT INTO `kategori_pasien` (`idkategori`, `kategori`) VALUES
(6, 'Dalam Proses'),
(1, 'Disetujui'),
(2, 'Ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `idpasien` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `kategori` varchar(58) NOT NULL,
  `dokter` varchar(100) NOT NULL,
  `tgl_lahir` varchar(56) NOT NULL,
  `alamat` varchar(56) NOT NULL,
  `no_tlpn` varchar(56) NOT NULL,
  `keluhan` varchar(56) NOT NULL,
  `tgl_kunjungan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`idpasien`, `user_id`, `nama`, `kategori`, `dokter`, `tgl_lahir`, `alamat`, `no_tlpn`, `keluhan`, `tgl_kunjungan`) VALUES
(10, 4, 'yantos', 'Dalam Proses', 'dr. Hani Pradipta, Sp.Mata', '937498', 'cssc', '786767', '<p>sd</p>', '2025-06-13'),
(11, 4, 'Ahmad Fauzi', 'proses', 'dr. Siti Aisyah, Sp.PD', '1990-03-15', 'Jl. Merpati No. 10', '081234567890', 'Batuk dan demam', '2025-06-10'),
(12, 4, 'Siti Aminah', 'disetujui', 'dr. Andi Wijaya, Sp.OG', '1988-08-22', 'Jl. Melati No. 5', '081298765432', 'Sakit perut', '2025-06-11'),
(13, 4, 'Budi Santoso', 'Disetujui', 'dr. Ratna Dewi, Sp.THT', '1980-11-03', 'Jl. Kenanga No. 2', '081377654321', 'Gangguan pendengaran', '2025-06-12'),
(14, 4, 'Dewi Lestari', 'proses', 'dr. Indra Gunawan, Sp.JP', '1993-02-10', 'Jl. Anggrek No. 17', '081234009876', 'Jantung berdebar', '2025-06-13'),
(15, 4, 'Rudi Hartono', 'disetujui', 'dr. Lina Marlina, Sp.M', '1985-07-19', 'Jl. Mawar No. 22', '082233445566', 'Penglihatan kabur', '2025-06-14'),
(16, 4, 'Intan Permata', 'proses', 'dr. Yudi Saputra, Sp.B', '1998-01-04', 'Jl. Teratai No. 3', '085612345678', 'Nyeri perut kanan bawah', '2025-06-15'),
(17, 4, 'Agus Salim', 'Disetujui', 'dr. Hendra Setiawan, Sp.An', '1975-09-27', 'Jl. Cemara No. 11', '087811223344', 'Cemas saat operasi', '2025-06-16'),
(18, 4, 'Nina Kartika', 'disetujui', 'dr. Lilis Nuraini, Sp.KK', '1992-05-12', 'Jl. Flamboyan No. 8', '081923456789', 'Ruam kulit', '2025-06-17'),
(19, 4, 'Yusuf Maulana', 'proses', 'dr. Bambang Suharto, Sp.OT', '1981-10-20', 'Jl. Dahlia No. 6', '081276543210', 'Lutut nyeri', '2025-06-18'),
(20, 4, 'Rina Anggraini', 'proses', 'dr. Dedi Firmansyah, Sp.KJ', '1989-06-01', 'Jl. Kamboja No. 4', '081998877665', 'Cemas berlebihan', '2025-06-19'),
(21, 4, 'Zaki Rahman', 'disetujui', 'dr. Siti Aisyah, Sp.PD', '1990-01-01', 'Jl. Melur No. 1', '081212121212', 'Demam tinggi', '2025-06-20'),
(22, 4, 'Alya Khairunnisa', 'ditolak', 'dr. Andi Wijaya, Sp.OG', '1994-02-14', 'Jl. Jambu No. 23', '081322223334', 'Mual saat hamil', '2025-06-21'),
(23, 4, 'Fadli Akbar', 'proses', 'dr. Ratna Dewi, Sp.THT', '1983-12-05', 'Jl. Nangka No. 9', '081344556677', 'Telinga berdenging', '2025-06-22'),
(24, 4, 'Meisya Putri', 'disetujui', 'dr. Indra Gunawan, Sp.JP', '1991-03-23', 'Jl. Pisang No. 10', '081355566677', 'Jantung tidak stabil', '2025-06-23'),
(25, 4, 'Surya Darma', 'proses', 'dr. Lina Marlina, Sp.M', '1978-11-11', 'Jl. Pepaya No. 2', '081366677788', 'Kabur saat membaca', '2025-06-24'),
(26, 4, 'Putri Wulandari', 'ditolak', 'dr. Yudi Saputra, Sp.B', '1997-07-07', 'Jl. Durian No. 5', '081377788899', 'Nyeri lambung', '2025-06-25'),
(27, 4, 'Rio Febrian', 'disetujui', 'dr. Hendra Setiawan, Sp.An', '1986-08-30', 'Jl. Semangka No. 6', '081388899900', 'Pusing dan mual', '2025-06-26'),
(28, 4, 'Ayu Larasati', 'proses', 'dr. Lilis Nuraini, Sp.KK', '1995-04-18', 'Jl. Rambutan No. 3', '081399900011', 'Kulit gatal', '2025-06-27'),
(29, 4, 'Galang Pratama', 'proses', 'dr. Bambang Suharto, Sp.OT', '1982-06-06', 'Jl. Apel No. 15', '081311112222', 'Keseleo', '2025-06-28'),
(30, 4, 'Nadya Azzahra', 'ditolak', 'dr. Dedi Firmansyah, Sp.KJ', '1999-12-30', 'Jl. Mangga No. 17', '081322233344', 'Sering panik', '2025-06-29'),
(31, 4, 'Maya', 'disetujui', 'dr. Siti Aisyah, Sp.PD', '1990-10-10', 'Jl. Kamboja No. 15', '081388855566', 'Batuk berdarah', '2025-06-30'),
(32, 4, 'Dimas', 'proses', 'dr. Andi Wijaya, Sp.OG', '1987-01-01', 'Jl. Kemuning No. 3', '081300011122', 'Nyeri dada', '2025-07-01'),
(33, 4, 'Riko', 'disetujui', 'dr. Ratna Dewi, Sp.THT', '1991-02-03', 'Jl. Angsana No. 8', '081311122233', 'Hidung tersumbat', '2025-07-02'),
(34, 4, 'Tia', 'ditolak', 'dr. Indra Gunawan, Sp.JP', '1996-09-15', 'Jl. Beringin No. 19', '081322233344', 'Detak jantung cepat', '2025-07-03'),
(35, 4, 'Lutfi', 'proses', 'dr. Lina Marlina, Sp.M', '1989-11-20', 'Jl. Pinus No. 12', '081333344455', 'Mata kering', '2025-07-04'),
(36, 4, 'Aurel', 'disetujui', 'dr. Yudi Saputra, Sp.B', '1995-03-30', 'Jl. Waru No. 9', '081344455566', 'Sakit perut kanan', '2025-07-05'),
(37, 4, 'Kiki', 'proses', 'dr. Hendra Setiawan, Sp.An', '1992-06-05', 'Jl. Jati No. 20', '081355566677', 'Cemas pasca operasi', '2025-07-06'),
(38, 4, 'Fikri', 'disetujui', 'dr. Lilis Nuraini, Sp.KK', '1988-05-17', 'Jl. Sengon No. 6', '081366677788', 'Kulit mengelupas', '2025-07-07'),
(39, 4, 'Zahra', 'ditolak', 'dr. Bambang Suharto, Sp.OT', '1993-08-08', 'Jl. Damar No. 21', '081377788899', 'Cedera kaki', '2025-07-08'),
(40, 4, 'Anwar', 'proses', 'dr. Dedi Firmansyah, Sp.KJ', '1979-02-25', 'Jl. Akasia No. 11', '081388899900', 'Gangguan tidur', '2025-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user','','') NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `create_at`) VALUES
(4, 'admin', '$2y$10$Xg0q/i8ZI5j1Ae81ml13Pe6UN9rETrm5gm.AXJjs7x65pU/2evQc6', 'admin', '2025-06-03 01:32:18'),
(8, 'user', '$2y$10$dVnchRfLe2iGqtn5DRnqZ.avSBJSKELnLzMCsO8X8YzTK.61BuDaq', 'user', '2025-06-04 09:11:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter_pasien`
--
ALTER TABLE `dokter_pasien`
  ADD PRIMARY KEY (`iddokter`);

--
-- Indexes for table `kategori_pasien`
--
ALTER TABLE `kategori_pasien`
  ADD PRIMARY KEY (`idkategori`),
  ADD UNIQUE KEY `kategori` (`kategori`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`idpasien`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter_pasien`
--
ALTER TABLE `dokter_pasien`
  MODIFY `iddokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `kategori_pasien`
--
ALTER TABLE `kategori_pasien`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `idpasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
