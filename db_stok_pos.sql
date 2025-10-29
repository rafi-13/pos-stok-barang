-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2025 pada 04.47
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_stok_pos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `jumlah` int(30) DEFAULT 0,
  `harga` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id`, `id_kategori`, `nama`, `gambar`, `jumlah`, `harga`) VALUES
(28, 10, 'Indomie Soto', '17de47aa6c91acd391568d93cf89c3bd.jpg', 5, 2500),
(31, 10, 'Indomie Goreng', '2499a.jpg', 65, 2500),
(35, 10, 'Indomie kari', 'c4d7ea66-d169-46f2-8de2-e6d6026152ee.jpg', 10, 2300);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id` int(11) NOT NULL,
  `nama_kt` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id`, `nama_kt`, `keterangan`) VALUES
(10, 'makanan', 'makanan siap saji'),
(12, 'minuman', 'minuman kemasan '),
(15, 'baju', 'pakaian');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi_keluar`
--

CREATE TABLE `tb_transaksi_keluar` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_transaksi_keluar`
--

INSERT INTO `tb_transaksi_keluar` (`id`, `id_barang`, `jumlah`, `tgl`) VALUES
(12, 28, 5, '2023-12-18'),
(15, 28, 5, '2023-12-19'),
(16, 28, 5, '2023-12-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi_masuk`
--

CREATE TABLE `tb_transaksi_masuk` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_transaksi_masuk`
--

INSERT INTO `tb_transaksi_masuk` (`id`, `id_barang`, `jumlah`, `tgl`) VALUES
(40, 28, 5, '2023-12-18'),
(42, 28, 10, '2023-12-18'),
(45, 35, 5, '2023-12-19'),
(46, 28, 5, '2023-12-06'),
(47, 35, 5, '2023-12-18'),
(48, 31, 10, '2023-12-19'),
(50, 31, 55, '2025-10-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `role`) VALUES
('admin', '$2y$10$M10VlQqTIbwEGErnofpFVezULDSxO1p2XmfDSz3sZrXFwm5ctxejK', 1),
('ayam', '$2y$10$cb.fjvOyhjAkEKkJP5IGTOA.llMwEBCJUGnJJEHq.v.NzV.neWY.m', 0),
('gerald', '$2y$10$LiZZx6bqnifUM./psxLy2eUiv2nvdyrfdU/fwvyEJe1ouRcC8oowK', 0),
('rafi', '$2y$10$g5FzFov4PgAX5ueaxCY4juhELYNHYSUDIi/yroYzOEMH0/96zOa1W', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_transaksi_keluar`
--
ALTER TABLE `tb_transaksi_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `tb_transaksi_masuk`
--
ALTER TABLE `tb_transaksi_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi_keluar`
--
ALTER TABLE `tb_transaksi_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi_masuk`
--
ALTER TABLE `tb_transaksi_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tb_transaksi_keluar`
--
ALTER TABLE `tb_transaksi_keluar`
  ADD CONSTRAINT `tb_transaksi_keluar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tb_transaksi_masuk`
--
ALTER TABLE `tb_transaksi_masuk`
  ADD CONSTRAINT `tb_transaksi_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
