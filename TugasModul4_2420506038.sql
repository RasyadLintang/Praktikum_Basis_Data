-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2025 pada 18.21
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
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_mahasiswa`
--

CREATE TABLE `data_mahasiswa` (
  `NPM` char(10) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `Kode_Jurusan` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_mahasiswa`
--

INSERT INTO `data_mahasiswa` (`NPM`, `nama`, `Kode_Jurusan`) VALUES
('2420506080', 'Billie', '1'),
('2420506081', 'Jimmy', '1'),
('2420607081', 'Iwan', '2'),
('2420607082', 'Chester', '2'),
('2420708082', 'Emily', '3'),
('2420708083', 'Cobain', '3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `Kode` char(5) NOT NULL,
  `nama` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`Kode`, `nama`) VALUES
('1', 'S1 Teknik Elektro'),
('2', 'S1 Teknik Mekatronika'),
('3', 'S1 Teknologi Informasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `khs`
--

CREATE TABLE `khs` (
  `Kode` int(11) NOT NULL,
  `NPM` char(10) NOT NULL,
  `Kode_Matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `khs`
--

INSERT INTO `khs` (`Kode`, `NPM`, `Kode_Matkul`) VALUES
(1, '2420506080', 101),
(2, '2420506080', 102),
(3, '2420506080', 103),
(4, '2420506081', 103),
(5, '2420506081', 102),
(6, '2420506081', 101),
(7, '2420607081', 104),
(8, '2420607081', 105),
(9, '2420607082', 105),
(10, '2420708082', 105),
(11, '2420708083', 103);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `Kode` int(11) NOT NULL,
  `nama` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`Kode`, `nama`) VALUES
(101, 'Fisika'),
(102, 'Bahasa Inggris'),
(103, 'Praktikum Struktur Data'),
(104, 'Basis Data'),
(105, 'Kalkulus');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `Kode` int(11) NOT NULL,
  `NPM` char(10) NOT NULL,
  `Kode_Matkul` int(11) NOT NULL,
  `nilai` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`Kode`, `NPM`, `Kode_Matkul`, `nilai`) VALUES
(1, '2420506080', 101, 99.99),
(2, '2420506080', 102, 79.00),
(3, '2420506080', 103, 89.00),
(4, '2420506081', 103, 88.99),
(5, '2420506081', 102, 88.99),
(6, '2420506081', 101, 88.99),
(7, '2420607081', 104, 90.99),
(8, '2420607081', 105, 90.99),
(9, '2420607082', 105, 99.99),
(10, '2420708082', 105, 99.99),
(11, '2420708083', 103, 79.99);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_mahasiswa`
--
ALTER TABLE `data_mahasiswa`
  ADD PRIMARY KEY (`NPM`),
  ADD KEY `Kode_Jurusan` (`Kode_Jurusan`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`Kode`);

--
-- Indeks untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD PRIMARY KEY (`Kode`),
  ADD KEY `NPM` (`NPM`),
  ADD KEY `Kode_Matkul` (`Kode_Matkul`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`Kode`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`Kode`),
  ADD KEY `NPM` (`NPM`),
  ADD KEY `Kode_Matkul` (`Kode_Matkul`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_mahasiswa`
--
ALTER TABLE `data_mahasiswa`
  ADD CONSTRAINT `data_mahasiswa_ibfk_1` FOREIGN KEY (`Kode_Jurusan`) REFERENCES `jurusan` (`Kode`);

--
-- Ketidakleluasaan untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `data_mahasiswa` (`NPM`),
  ADD CONSTRAINT `khs_ibfk_2` FOREIGN KEY (`Kode_Matkul`) REFERENCES `matkul` (`Kode`);

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `data_mahasiswa` (`NPM`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Kode_Matkul`) REFERENCES `matkul` (`Kode`),
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`Kode_Matkul`) REFERENCES `matkul` (`Kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
