-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 02:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(12) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahun_terbit` int(12) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `sinopsis` longtext DEFAULT NULL,
  `bahasa` varchar(255) DEFAULT NULL,
  `jumlah_halaman` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `gambar`, `sinopsis`, `bahasa`, `jumlah_halaman`) VALUES
(38, 'naruto', 'masashiii', 'asri', 1990, 'naruto_65db375c8b423.jpg', 'keren', 'jepang', 25),
(39, 'Hitler', 'Nazi', 'USA', 1945, 'hitler_65ddc53dc53ed.jpeg', 'cerita tentang pak hitler', 'inggris', 1990),
(40, 'kimi no nawa', 'zelion', 'zelionBOOK id', 2020, 'kimi_no_nawa_65ddda1a09308.jpeg', 'heheh', 'jerman', 121);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(12) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(14, 'manga'),
(15, 'sejarah');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_buku_relasi`
--

CREATE TABLE `kategori_buku_relasi` (
  `id` int(12) NOT NULL,
  `buku_id` int(12) DEFAULT NULL,
  `kategori_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_buku_relasi`
--

INSERT INTO `kategori_buku_relasi` (`id`, `buku_id`, `kategori_id`) VALUES
(23, 38, 15),
(24, 39, 15),
(25, 40, 14);

-- --------------------------------------------------------

--
-- Table structure for table `koleksi`
--

CREATE TABLE `koleksi` (
  `id` int(12) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `buku_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masukan`
--

CREATE TABLE `masukan` (
  `id` int(12) NOT NULL,
  `masukan` longtext DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masukan`
--

INSERT INTO `masukan` (`id`, `masukan`, `tanggal`, `user_id`) VALUES
(1, 'maaf yah', '2024-02-22', 15),
(2, 'aku cinta engel', '2024-02-22', 16),
(3, 'aku cinta engel', '2022-02-24', 16),
(5, 'hebat', '2024-02-22', 16),
(6, 'bang ardi gacor', '2024-02-26', 15);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(12) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `buku_id` int(12) DEFAULT NULL,
  `tanggal_peminjaman` date DEFAULT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `status_peminjaman` enum('sudah dikembalikan','belum dikembalikan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `user_id`, `buku_id`, `tanggal_peminjaman`, `tanggal_pengembalian`, `status_peminjaman`) VALUES
(8, 15, 38, '2024-02-25', '2024-02-26', 'sudah dikembalikan'),
(9, 15, 38, '2024-02-26', '2024-02-28', 'sudah dikembalikan'),
(10, 15, 38, '2024-02-26', '2024-02-28', 'sudah dikembalikan'),
(11, 15, 38, '2024-02-27', '2024-02-28', 'sudah dikembalikan'),
(12, 15, 38, '2024-02-27', '2024-02-28', 'sudah dikembalikan'),
(13, 15, 38, '2024-02-27', '2024-02-28', 'sudah dikembalikan'),
(14, 15, 38, '2024-02-27', '2024-02-28', 'sudah dikembalikan'),
(15, 15, 38, '2024-02-27', '2024-02-28', 'sudah dikembalikan'),
(16, 15, 38, '2024-02-27', '2024-02-29', 'sudah dikembalikan'),
(17, 15, 38, '2024-02-27', '2024-02-28', 'sudah dikembalikan'),
(18, 15, 38, '2024-02-27', '2024-02-28', 'sudah dikembalikan'),
(19, 15, 38, '2024-02-27', '2024-02-29', 'sudah dikembalikan'),
(20, 15, 38, '2024-02-27', '2024-02-29', 'sudah dikembalikan'),
(21, 15, 38, '2024-02-27', '2024-02-28', 'sudah dikembalikan'),
(22, 15, 39, '2024-02-27', '2024-02-28', 'belum dikembalikan'),
(23, 15, 40, '2024-02-27', '2024-02-28', 'belum dikembalikan'),
(24, 16, 40, '2024-02-27', '2024-02-29', 'belum dikembalikan');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan_buku`
--

CREATE TABLE `ulasan_buku` (
  `id` int(12) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `buku_id` int(12) DEFAULT NULL,
  `ulasan` longtext DEFAULT NULL,
  `rating` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ulasan_buku`
--

INSERT INTO `ulasan_buku` (`id`, `user_id`, `buku_id`, `ulasan`, `rating`) VALUES
(46, 15, 38, 'keren', 4),
(47, 15, 38, 'keren', 4),
(48, 15, 38, 'mantap bang josua\r\n', 5),
(49, 15, 38, 'hehe mas iza', 5),
(50, 15, 38, 'keren banget pak bowo', 3),
(51, 15, 38, 'gacor', 5),
(52, 15, 38, 'keren', 3),
(53, 15, 38, 'keren', 4),
(54, 15, 39, 'keren banget mas hitler', 5),
(55, 16, 39, 'keren zel', 4),
(56, 15, 39, 'hebat', 3),
(57, 16, 40, 'hehe', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','petugas','peminjam') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `username`, `email`, `alamat`, `password`, `role`) VALUES
(14, 'admin', 'admin', 'admin@mail.com', 'admin', '$2y$10$RINNaoU4X3mWCjsqtTXX1ulQmBSqQuSRrfipjqCXuKjfo5FkISDDa', 'admin'),
(15, 'peminjam', 'peminjam', 'peminjam@mail.com', 'peminjam', '$2y$10$bu2nqsqxhHb9sxC/7RUppu8aCcEMKyQh0/ffFSJLt2IJYUmymj6pS', 'peminjam'),
(16, 'josua', 'josua', 'josua@mail.com', 'josua', '$2y$10$u3k1vHGDK04tNhsXtV.X/eZV9Bo7I./wu.MHYXa3cvdtUVKLgD0pm', 'peminjam'),
(17, 'petugas', 'petugas', 'petugas@mail.com', 'petugas', '$2y$10$0Wxv2DWaOHIT6u93EzyJ6eizDuSXY.1/uhjhl/.JZUqloCsKorm7O', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `judul` (`judul`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `kategori_buku_relasi`
--
ALTER TABLE `kategori_buku_relasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buku_id` (`buku_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `koleksi`
--
ALTER TABLE `koleksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `buku_id` (`buku_id`);

--
-- Indexes for table `masukan`
--
ALTER TABLE `masukan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `buku_id` (`buku_id`);

--
-- Indexes for table `ulasan_buku`
--
ALTER TABLE `ulasan_buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `buku_id` (`buku_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kategori_buku_relasi`
--
ALTER TABLE `kategori_buku_relasi`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `koleksi`
--
ALTER TABLE `koleksi`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `masukan`
--
ALTER TABLE `masukan`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ulasan_buku`
--
ALTER TABLE `ulasan_buku`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategori_buku_relasi`
--
ALTER TABLE `kategori_buku_relasi`
  ADD CONSTRAINT `kategori_buku_relasi_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`),
  ADD CONSTRAINT `kategori_buku_relasi_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);

--
-- Constraints for table `koleksi`
--
ALTER TABLE `koleksi`
  ADD CONSTRAINT `koleksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `koleksi_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`);

--
-- Constraints for table `masukan`
--
ALTER TABLE `masukan`
  ADD CONSTRAINT `masukan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`);

--
-- Constraints for table `ulasan_buku`
--
ALTER TABLE `ulasan_buku`
  ADD CONSTRAINT `ulasan_buku_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `ulasan_buku_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
