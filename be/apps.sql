-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Bulan Mei 2021 pada 10.32
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apps`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `access_token`
--

CREATE TABLE `access_token` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `ipAddress` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `access_token`
--

INSERT INTO `access_token` (`id`, `idUser`, `accessToken`, `ipAddress`, `createdAt`, `updatedAt`) VALUES
(1, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJkZXZlbG9wZXJib2hkYW4wQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiaWF0IjoxNjIwMTE3Mzc2LCJleHAiOjE2MjAyMDM3NzZ9.GjMGCs7Gk83fQWSAYxLnTVd2JocSmz0zXTV_wXR8XuU', '192.168.43.107', '2021-05-04 08:36:16', '2021-05-04 08:36:16'),
(2, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4iLCJlbWFpbCI6ImRldmVsb3BlcmJvaGRhbjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODc4Mjc4NjU0MzciLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwiaWRBZGRyZXNzIjowLCJyb2xlIjoxLCJpYXQiOjE2MjAxMTc2NzIsImV4cCI6MTYyMDIwNDA3Mn0.BNhj8b0hz4Uyu-gGn_S8bJ9XzSavxN7GYOUoFscuqVc', '192.168.43.107', '2021-05-04 08:41:12', '2021-05-04 08:41:12'),
(3, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4iLCJlbWFpbCI6ImRldmVsb3BlcmJvaGRhbjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODc4Mjc4NjU0MzciLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwiaWRBZGRyZXNzIjowLCJyb2xlIjoxLCJpYXQiOjE2MjAxMTk0NDQsImV4cCI6MTYyMDIwNTg0NH0.gk3kLz9LZBaDINrVq0X3nLlGv1HF-_55JaxPORR0u8s', '192.168.43.107', '2021-05-04 09:10:44', '2021-05-04 09:10:44'),
(4, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4iLCJlbWFpbCI6ImRldmVsb3BlcmJvaGRhbjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODc4Mjc4NjU0MzciLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwiaWRBZGRyZXNzIjowLCJyb2xlIjoxLCJpYXQiOjE2MjAxMTk3NjMsImV4cCI6MTYyMDIwNjE2M30.RVjtOeCVQP-UwiNTx3dhPkJji4CESH3dDQ1cNTCw_S8', '192.168.43.107', '2021-05-04 09:16:03', '2021-05-04 09:16:03'),
(5, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4iLCJlbWFpbCI6ImRldmVsb3BlcmJvaGRhbjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODc4Mjc4NjU0MzciLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwiaWRBZGRyZXNzIjowLCJyb2xlIjoxLCJpYXQiOjE2MjAxMjM2NjEsImV4cCI6MTYyMDIxMDA2MX0.ug-p4HZMOwJFnPbYRubnPdwFGKRusO_DigCgDGSWNBk', '192.168.43.232', '2021-05-04 10:21:01', '2021-05-04 10:21:01'),
(6, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE4OTg0NCwiZXhwIjoxNjIwMjc2MjQ0fQ.L7ppW9rnr4-7GIyCZpkwkzerADTWKm-USAqTWDBPiro', '192.168.43.107', '2021-05-05 04:44:04', '2021-05-05 04:44:04'),
(7, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE4OTg1NywiZXhwIjoxNjIwMjc2MjU3fQ.-JCptoaBJjJePqVcusQUNz1YLE6GP_ggFiAFYs-x4fY', '192.168.43.107', '2021-05-05 04:44:17', '2021-05-05 04:44:17'),
(8, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE4OTk5NywiZXhwIjoxNjIwMjc2Mzk3fQ.DG91KqFuHMTwQXCnquWsOCuoyOFH-P2uG4giMTcmBco', '192.168.43.107', '2021-05-05 04:46:37', '2021-05-05 04:46:37'),
(9, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE4OTk5OCwiZXhwIjoxNjIwMjc2Mzk4fQ.GgkItBjwrAqpZp0yr5JeMnjJFtDQZQc1QQDHtEbZ9So', '192.168.43.107', '2021-05-05 04:46:38', '2021-05-05 04:46:38'),
(10, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE5MDAyMCwiZXhwIjoxNjIwMjc2NDIwfQ.mSL_eWmocNPoTsbNc2bQc8rbMvZfYWztFEifj_yKYgo', '192.168.43.107', '2021-05-05 04:47:00', '2021-05-05 04:47:00'),
(11, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE5MDA2MCwiZXhwIjoxNjIwMjc2NDYwfQ.HOWK1BAAvleztEwr5Meezc1tJfdVt6STvVBOFr_8IcI', '192.168.43.107', '2021-05-05 04:47:40', '2021-05-05 04:47:40'),
(12, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE5MDA3MywiZXhwIjoxNjIwMjc2NDczfQ.q7lSn4yGX1SnbjaU-r_qYyx5ODabWgk12AQrBpQAFws', '192.168.43.107', '2021-05-05 04:47:53', '2021-05-05 04:47:53'),
(13, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE5MDA4NSwiZXhwIjoxNjIwMjc2NDg1fQ.PmdoC74KUaChp_TkbyWxbh8c9aNTLUEAWzrxJ1sJ1DQ', '192.168.43.107', '2021-05-05 04:48:05', '2021-05-05 04:48:05'),
(14, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IlJvYmVydCBCb2hkYW4gQ2FuaWFnYSIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4NzgyNzg2NTQzNyIsImdlbmRlciI6Ikxha2ktbGFraSIsImRhdGVPZkJpcnRoIjoiMTAgQWd1c3R1cyAyMDA2IiwiaW1hZ2UiOiJpbWFnZXNcXDE2MjAxMjM5ODQ1OTYtZ2FtYmFyLmpwZyIsInJvbGUiOjEsImlhdCI6MTYyMDE5MDExMiwiZXhwIjoxNjIwMjc2NTEyfQ.9UmIE4KVZmbRlQhIlHYQbIt-5jcow3G01J5HaFF1tU4', '192.168.43.107', '2021-05-05 04:48:32', '2021-05-05 04:48:32'),
(15, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwibmFtZSI6IkNoYWVydWwgTWFyd2FuIiwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MiwiaWF0IjoxNjIwMTkwMTQ0LCJleHAiOjE2MjAyNzY1NDR9.snTnIp5VFb9wmsBilNinXHAY1rizeIyLwyyB98fRGvE', '192.168.43.107', '2021-05-05 04:49:04', '2021-05-05 04:49:04'),
(16, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwibmFtZSI6IkNoYWVydWwgTWFyd2FuIiwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiJOb25lIiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDE5MDg3MCwiZXhwIjoxNjIwMjc3MjcwfQ.XRHwn9ReJYLQl-xs-mnTcpqAVLPax-6xELd9TcI5d8Y', '192.168.43.107', '2021-05-05 05:01:10', '2021-05-05 05:01:10'),
(17, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywibmFtZSI6IlJvYmVydCBCb2hkYW4iLCJlbWFpbCI6ImRldmVsb3BlcmJvaGRhbjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODc4Mjc4NjU0MzkiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MSwiaWF0IjoxNjIwMTkwODg3LCJleHAiOjE2MjAyNzcyODd9.1SX8OpWSRduRTs6qv45tGh-l_ea3rXBq1-x-nC0HgyM', '192.168.43.107', '2021-05-05 05:01:27', '2021-05-05 05:01:27'),
(18, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywibmFtZSI6IlJvYmVydCBCb2hkYW4iLCJlbWFpbCI6ImRldmVsb3BlcmJvaGRhbjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODc4Mjc4NjU0MzkiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MSwiaWF0IjoxNjIwMjIwMTQwLCJleHAiOjE2MjAzMDY1NDB9.VPKcPRt6A7ijJxmcijJdESrnHvHHE8igAeQp8WNCbLU', '192.168.43.107', '2021-05-05 13:09:00', '2021-05-05 13:09:00'),
(19, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywibmFtZSI6IlJvYmVydCBCb2hkYW4iLCJlbWFpbCI6ImRldmVsb3BlcmJvaGRhbjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODc4Mjc4NjU0MzkiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MSwiaWF0IjoxNjIwMjIwMjAyLCJleHAiOjE2MjAzMDY2MDJ9.3P-AkNpFnyz3bj4o96WZlOfcNBzwkJLxH92SVr6Uq8A', '192.168.43.107', '2021-05-05 13:10:02', '2021-05-05 13:10:02'),
(20, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywibmFtZSI6IlJvYmVydCBCb2hkYW4iLCJlbWFpbCI6ImRldmVsb3BlcmJvaGRhbjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODc4Mjc4NjU0MzkiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MSwiaWF0IjoxNjIwMjIwMzcxLCJleHAiOjE2MjAzMDY3NzF9.bNbzrZhs9ncIj9e8ua5QXDTdWlPXv7GEuVLF0C94k-g', '192.168.43.107', '2021-05-05 13:12:51', '2021-05-05 13:12:51'),
(21, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwibmFtZSI6IkNoYWVydWwgTWFyd2FuIiwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiJOb25lIiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDIyMDQwMywiZXhwIjoxNjIwMzA2ODAzfQ.u9w13_mKQnaW8NcaTO0CL651rHez3DIFOZ6VsMJ2EPI', '192.168.43.107', '2021-05-05 13:13:23', '2021-05-05 13:13:23'),
(22, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsIm5hbWUiOiJCb2hkYW4gR2FudGVuZyIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4MjM0NTY3NTg5MCIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjAyMjI1NDgsImV4cCI6MTYyMDMwODk0OH0.JX1TB_X5Qzfd5_JuKTIkQyZ5Uii0NlP_rjILnPeAVAM', '192.168.43.107', '2021-05-05 13:49:08', '2021-05-05 13:49:08'),
(23, 11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoyLCJpYXQiOjE2MjAyMjI1NzAsImV4cCI6MTYyMDMwODk3MH0.ZRSY3KfbzrTiRaYm7nO0J9va7owB14iBFekZe-3Y8UM', '192.168.43.107', '2021-05-05 13:49:30', '2021-05-05 13:49:30'),
(24, 11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoyLCJpYXQiOjE2MjAyMjQyMDcsImV4cCI6MTYyMDMxMDYwN30.eSmmRD6mRieZBE6qW2lUCiRXTXRQMR_aVriCPVMGGSw', '192.168.43.107', '2021-05-05 14:16:47', '2021-05-05 14:16:47'),
(25, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsIm5hbWUiOiJCb2hkYW4gR2FudGVuZyIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4MjM0NTY3NTg5MCIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjAyNzIzNzgsImV4cCI6MTYyMDM1ODc3OH0.n3VZvFksffyJ7rkgfurGXpgY-3ZjGI6Q3vWbQ8pG8Kk', '192.168.43.107', '2021-05-06 03:39:38', '2021-05-06 03:39:38'),
(26, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsIm5hbWUiOiJCb2hkYW4gR2FudGVuZyIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4MjM0NTY3NTg5MCIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjAyNzM2NTksImV4cCI6MTYyMDM2MDA1OX0.7QVsUjezJpYF8sym10iYb4ze8yW1gh_HxPKFvPJHPBk', '192.168.43.232', '2021-05-06 04:00:59', '2021-05-06 04:00:59'),
(27, 11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoyLCJpYXQiOjE2MjAyNzcxOTksImV4cCI6MTYyMDM2MzU5OX0.M6kANh1Q9MrGCbZQ1t2ouIMm7ghezFkO_3zTL8-jqBk', '192.168.43.232', '2021-05-06 04:59:59', '2021-05-06 04:59:59'),
(28, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsIm5hbWUiOiJCb2hkYW4gR2FudGVuZyIsImVtYWlsIjoiZGV2ZWxvcGVyYm9oZGFuMEBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA4MjM0NTY3NTg5MCIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjAyNzcyNDQsImV4cCI6MTYyMDM2MzY0NH0.butMvxIYOZ6_kKd1_2CkV-uCyqVUuXJZayaTqHGgjbw', '192.168.43.232', '2021-05-06 05:00:44', '2021-05-06 05:00:44'),
(29, 11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoyLCJpYXQiOjE2MjAyNzcyNzYsImV4cCI6MTYyMDM2MzY3Nn0.mXy9cmSIIVOAiJODQUKlkWW2l1Ki40ydeHYayYNm5po', '192.168.43.232', '2021-05-06 05:01:16', '2021-05-06 05:01:16'),
(30, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoyLCJpYXQiOjE2MjAzNTM5NDEsImV4cCI6MTYyMDQ0MDM0MX0.x6732I_cOyt0Y4TKjfFhAqygWXFWMbUYp5SADm0vUgA', '192.168.43.107', '2021-05-07 02:19:01', '2021-05-07 02:19:01'),
(31, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoyLCJpYXQiOjE2MjAzNjc4MDEsImV4cCI6MTYyMDQ1NDIwMX0.p5JT5AT8Efp2qrpERpSc9sy4B9X6t66z6XGoGdpOWEk', '192.168.43.107', '2021-05-07 06:10:01', '2021-05-07 06:10:01'),
(32, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoyLCJpYXQiOjE2MjAzNzI2ODMsImV4cCI6MTYyMDQ1OTA4M30.1lVBS19XUSjgK94wJ8H9fmS-lxSc-YzEEzGKGpcX4EY', '192.168.43.107', '2021-05-07 07:31:23', '2021-05-07 07:31:23'),
(33, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoyLCJpYXQiOjE2MjAzNzg2NjYsImV4cCI6MTYyMDQ2NTA2Nn0.I2dTrHiNHAYfIT82Pa3Tr9052_aCrVBfKBK83hCfKjQ', '192.168.43.107', '2021-05-07 09:11:06', '2021-05-07 09:11:06'),
(34, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiTm9uZSIsImdlbmRlciI6IlRpZGFrIGRpZGVmaW5pc2lrYW4iLCJkYXRlT2ZCaXJ0aCI6Ik5vbmUiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjAzNzk0NjgsImV4cCI6MTYyMDQ2NTg2OH0.WR-wwDpCEimVlqgiVFUJq7HjelWz6Yo46i-Jt7MXI2w', '192.168.43.107', '2021-05-07 09:24:28', '2021-05-07 09:24:28'),
(35, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDQzNDg4NywiZXhwIjoxNjIwNTIxMjg3fQ.rYgHytl_MByjsgUjcjd-P1v6VSb9EvmvUpqEe9setAc', '192.168.43.232', '2021-05-08 00:48:07', '2021-05-08 00:48:07'),
(36, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDQzNDkxMSwiZXhwIjoxNjIwNTIxMzExfQ.Z9UF5ebWrei_fwsCeGAe1ALl4qJP-K0Cdfxs33bjxQU', '192.168.43.232', '2021-05-08 00:48:31', '2021-05-08 00:48:31'),
(37, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjEsImlhdCI6MTYyMDQzOTU0OSwiZXhwIjoxNjIwNTI1OTQ5fQ.x5loolF7Og_qCIZr32USY02huxmg8nbbgC40LsemLCY', '192.168.43.232', '2021-05-08 02:05:49', '2021-05-08 02:05:49'),
(38, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDQzOTgwNywiZXhwIjoxNjIwNTI2MjA3fQ.v4soZmDRl5JahtpUXwBNl22Na-aPV3868evCfdolcjg', '192.168.43.232', '2021-05-08 02:10:07', '2021-05-08 02:10:07'),
(39, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDQ0OTI5MCwiZXhwIjoxNjIwNTM1NjkwfQ.mUWuUVWe1dPqjXNk22QjXJiF-jbU-YM2vm3AoWnQgTM', '192.168.43.232', '2021-05-08 04:48:10', '2021-05-08 04:48:10'),
(40, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDQ3ODAzNSwiZXhwIjoxNjIwNTY0NDM1fQ.Q-8m8pkSRt22OcdkQnmzZUnNTHCLnp-4uY1H1UMnUTw', '192.168.43.107', '2021-05-08 12:47:15', '2021-05-08 12:47:15'),
(41, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiTGFraS1sYWtpIiwiZGF0ZU9mQmlydGgiOiIxMCBBZ3VzdHVzIDIwMDYiLCJpbWFnZSI6ImltYWdlc1xcMTYyMDQ3ODMwNTkyNy1kZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDQ5NzcwMywiZXhwIjoxNjIwNTg0MTAzfQ.lR1PMdOc9o-gDAt-C_EO-pb4e6kp2WNgSzyG4VUo_bE', '192.168.43.107', '2021-05-08 18:15:03', '2021-05-08 18:15:03'),
(42, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiTGFraS1sYWtpIiwiZGF0ZU9mQmlydGgiOiIxMCBBZ3VzdHVzIDIwMDYiLCJpbWFnZSI6ImltYWdlc1xcMTYyMDQ3ODMwNTkyNy1kZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDUyOTkwOCwiZXhwIjoxNjIwNjE2MzA4fQ.V4KNicxsoFAO94q_YUZnmcRMOLCKVeDOG5WGYjRZ6oU', '192.168.43.107', '2021-05-09 03:11:48', '2021-05-09 03:11:48'),
(43, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsIm5hbWUiOiJOaWVsIEdvbnphbGVzIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MSwiaWF0IjoxNjIwNTQ5NTg2LCJleHAiOjE2MjA2MzU5ODZ9.OWssLU8nlYbXOK5dijGGPsM-sWiBShOY-9kI7xbE210', '192.168.43.107', '2021-05-09 08:39:46', '2021-05-09 08:39:46'),
(44, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsIm5hbWUiOiJOaWVsIEdvbnphbGVzIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MSwiaWF0IjoxNjIwNTUxMTk3LCJleHAiOjE2MjA2Mzc1OTd9.c1-c4l5YlkvM_Wo0jXGdgoLzh7Rt_9KX2zWg0rDVnXg', '192.168.43.107', '2021-05-09 09:06:37', '2021-05-09 09:06:37'),
(45, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsIm5hbWUiOiJOaWVsIEdvbnphbGVzIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MSwiaWF0IjoxNjIwNTUxNTYwLCJleHAiOjE2MjA2Mzc5NjB9.cGhUbzG1esLZeZUUNsQZ4p-zM-qt8_OhJFsejhAq7SE', '192.168.43.107', '2021-05-09 09:12:40', '2021-05-09 09:12:40'),
(46, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiTGFraS1MYWtpIiwiZGF0ZU9mQmlydGgiOiIxMCBKdWxpIDIwMDAiLCJpbWFnZSI6ImltYWdlc1xcMTYyMDUzNjE0MzQ5OS1ad2FsbGV0LUxvZ2luICgxKS5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjA1NTU0NzAsImV4cCI6MTYyMDY0MTg3MH0.k0C-7m4Pp2qORTvbWgfZvsM7yKYo-1jirZYVTyiAIgo', '192.168.43.107', '2021-05-09 10:17:50', '2021-05-09 10:17:50'),
(47, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiTGFraS1MYWtpIiwiZGF0ZU9mQmlydGgiOiIxMCBKdWxpIDIwMDAiLCJpbWFnZSI6ImltYWdlc1xcMTYyMDUzNjE0MzQ5OS1ad2FsbGV0LUxvZ2luICgxKS5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjA1NjUxNzAsImV4cCI6MTYyMDY1MTU3MH0.agpXtWB0bAuNvtBDDV5c1XVNh_JxUYN-XohXYmFS7rU', '192.168.43.107', '2021-05-09 12:59:30', '2021-05-09 12:59:30'),
(48, 21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsIm5hbWUiOiJNYXJ3YW4gUnVsIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiJOb25lIiwiZ2VuZGVyIjoiVGlkYWsgZGlkZWZpbmlzaWthbiIsImRhdGVPZkJpcnRoIjoiTm9uZSIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDU3NDM3OCwiZXhwIjoxNjIwNjYwNzc4fQ.lCUSJj_XM-rPlRaOqJ5PoVC8V1fDwT_oi6qLMeDd5to', '192.168.43.107', '2021-05-09 15:32:58', '2021-05-09 15:32:58'),
(49, 21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsIm5hbWUiOiJNYXJ3YW4gUnVsIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyNTY3ODkwOTEiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MiwiaWF0IjoxNjIwNjE0Nzg3LCJleHAiOjE2MjA3MDExODd9.DaFDEhV5pHdDSjaZyAts0TLS2W7tdMiCLJ29-xjCryo', '192.168.43.107', '2021-05-10 02:46:27', '2021-05-10 02:46:27'),
(50, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiTGFraS1MYWtpIiwiZGF0ZU9mQmlydGgiOiIxMCBKdWxpIDIwMDAiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjA2MTU3ODQsImV4cCI6MTYyMDcwMjE4NH0._Ono_FoFBK7eDNhGUYMN_sZrTG0ELyWjtFHlc84RS4U', '192.168.43.107', '2021-05-10 03:03:04', '2021-05-10 03:03:04'),
(51, 21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsIm5hbWUiOiJNYXJ3YW4gUnVsIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyNTY3ODkwOTEiLCJnZW5kZXIiOiJUaWRhayBkaWRlZmluaXNpa2FuIiwiZGF0ZU9mQmlydGgiOiJOb25lIiwiaW1hZ2UiOiJpbWFnZXNcXGRlZmF1bHQucG5nIiwicm9sZSI6MiwiaWF0IjoxNjIwNjE2NTYxLCJleHAiOjE2MjA3MDI5NjF9.YFCFzaeXTzVYBQ_kv4fl7331gMtzfAfSOkHVmZ2AL8Y', '192.168.43.107', '2021-05-10 03:16:01', '2021-05-10 03:16:01'),
(52, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiTGFraS1MYWtpIiwiZGF0ZU9mQmlydGgiOiIxMCBKdWxpIDIwMDAiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjA2MTg3MDMsImV4cCI6MTYyMDcwNTEwM30.BnBppTb-BuWOALl3jD42vx6d8WWMHcQY5bVpKT7BD8o', '192.168.43.107', '2021-05-10 03:51:43', '2021-05-10 03:51:43'),
(53, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiTGFraS1MYWtpIiwiZGF0ZU9mQmlydGgiOiIxMCBKdWxpIDIwMDAiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjA3OTAzMDYsImV4cCI6MTYyMDg3NjcwNn0.bdrUtgVkIbRmeozpZmYBWrT7jLjgwxxeoWqdW5uwkNM', '192.168.43.107', '2021-05-12 03:31:46', '2021-05-12 03:31:46'),
(54, 21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsIm5hbWUiOiJNYXJ3YW4gUnVsIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyNTY3ODkwOTEiLCJnZW5kZXIiOiJMYWtpLUxha2kiLCJkYXRlT2ZCaXJ0aCI6IjEwIEFndXN0dXMgMjAwMCIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDc5ODk2OCwiZXhwIjoxNjIwODg1MzY4fQ.Iua6FMQP925zVz8SehvGqnRYEb-WbO8b0MW2wuD4aCs', '192.168.43.107', '2021-05-12 05:56:08', '2021-05-12 05:56:08'),
(55, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJDaGFlcnVsIE1hcndhbiIsImVtYWlsIjoiY2hhZXJ1bG1hcndhbjIwQGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDg3ODI3ODY1NDM3IiwiZ2VuZGVyIjoiTGFraS1MYWtpIiwiZGF0ZU9mQmlydGgiOiIxMCBKdWxpIDIwMDAiLCJpbWFnZSI6ImltYWdlc1xcZGVmYXVsdC5wbmciLCJyb2xlIjoxLCJpYXQiOjE2MjA4MDgyMDksImV4cCI6MTYyMDg5NDYwOX0.Z3aR1GrrZKk-j7QE04vOojyBSpb6J51c5GLE2Gi5c2I', '192.168.43.107', '2021-05-12 08:30:09', '2021-05-12 08:30:09'),
(56, 21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsIm5hbWUiOiJNYXJ3YW4gUnVsIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyNTY3ODkwOTEiLCJnZW5kZXIiOiJMYWtpLUxha2kiLCJkYXRlT2ZCaXJ0aCI6IjEwIEFndXN0dXMgMjAwMCIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDgyNjI3NCwiZXhwIjoxNjIwOTEyNjc0fQ.Qb5mPqx2OKr3Y-RHQYAIKR_ZvdAHap6YiwfKvsUfEiE', '192.168.43.107', '2021-05-12 13:31:15', '2021-05-12 13:31:15'),
(57, 21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsIm5hbWUiOiJNYXJ3YW4gUnVsIiwiZW1haWwiOiJtYXJ3YW5ydWxAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyNTY3ODkwOTEiLCJnZW5kZXIiOiJMYWtpLUxha2kiLCJkYXRlT2ZCaXJ0aCI6IjEwIEFndXN0dXMgMjAwMCIsImltYWdlIjoiaW1hZ2VzXFxkZWZhdWx0LnBuZyIsInJvbGUiOjIsImlhdCI6MTYyMDgyNjkyNSwiZXhwIjoxNjIwOTEzMzI1fQ.LzboSof5CoDgIRQp_NDqAzeCCByGjOpZ7TCCPL0F-1s', '192.168.43.107', '2021-05-12 13:42:05', '2021-05-12 13:42:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `postalCode` varchar(50) NOT NULL,
  `city` varchar(100) NOT NULL,
  `isPrimary` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `address`
--

INSERT INTO `address` (`id`, `idUser`, `type`, `name`, `phoneNumber`, `address`, `postalCode`, `city`, `isPrimary`, `createdAt`, `updatedAt`) VALUES
(41, 17, 'Rumah', 'Chaerul Marwan', '081224685502', 'Ganeas', '2700', 'Sumedang', 1, '2021-05-09 05:41:11', '2021-05-12 03:37:54'),
(45, 17, 'Kantor', 'Agus Mulyana', '085678092347', 'Bandung, Jawa Barat, Indonesia', '301610', 'Bandung', 0, '2021-05-09 07:28:32', '2021-05-12 03:37:54'),
(48, 21, 'Ganeas', 'Chaerul Marwan', '+6281224685502', 'Ganeas', '2700', 'Sumedang', 1, '2021-05-09 15:42:58', '2021-05-12 06:13:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bag`
--

CREATE TABLE `bag` (
  `id` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idStore` int(11) NOT NULL,
  `size` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `color` varchar(50) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `color`, `createdAt`, `updatedAt`) VALUES
(1, 'T-Shirt', 'images\\t-shirt.png', '#CC0B04', '2021-05-06 03:51:20', '2021-05-06 03:51:20'),
(2, 'Jacket', 'images\\jacket.png', '#F67B02', '2021-05-06 03:51:20', '2021-05-06 09:19:17'),
(3, 'Pants', 'images\\pants.png', '#E31F51', '2021-05-06 03:51:52', '2021-05-06 09:19:41'),
(4, 'Shoes', 'images\\shoes.png', '#57CD9E', '2021-05-06 03:51:52', '2021-05-06 09:19:56'),
(5, 'Shorts', 'images\\shorts.png', '#1C3391', '2021-05-06 03:52:13', '2021-05-06 09:20:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaction`
--

CREATE TABLE `detail_transaction` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idTransaction` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `size` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaction`
--

INSERT INTO `detail_transaction` (`id`, `idUser`, `idTransaction`, `idProduct`, `size`, `color`, `qty`, `createdAt`, `updatedAt`) VALUES
(23, 17, 17, 17, 'L', '#1A1A1A', 2, '2021-05-08 09:58:05', '2021-05-08 09:58:05'),
(24, 17, 17, 5, '40', '#1A1A1A', 1, '2021-05-08 09:58:05', '2021-05-08 09:58:05'),
(25, 17, 18, 12, 'M', '#1A1A1A', 1, '2021-05-08 10:02:33', '2021-05-08 10:02:33'),
(26, 17, 19, 17, 'M', '#1A1A1A', 1, '2021-05-08 18:24:20', '2021-05-08 18:24:20'),
(27, 17, 20, 17, 'S', '#D84242', 1, '2021-05-08 18:28:42', '2021-05-08 18:28:42'),
(28, 17, 21, 17, 'S', '#1A1A1A', 1, '2021-05-09 03:45:40', '2021-05-09 03:45:40'),
(29, 17, 22, 17, 'M', '#1A1A1A', 1, '2021-05-09 05:55:20', '2021-05-09 05:55:20'),
(32, 21, 25, 17, 'S', '#1A1A1A', 1, '2021-05-10 02:56:12', '2021-05-10 02:56:12'),
(33, 21, 25, 14, 'S', '#1A1A1A', 1, '2021-05-10 02:56:12', '2021-05-10 02:56:12'),
(34, 21, 26, 16, 'M', '#D84242', 1, '2021-05-12 13:43:14', '2021-05-12 13:43:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id`, `idProduct`, `image`, `createdAt`, `updatedAt`) VALUES
(1, 3, 'images\\LITE%20RACER%202.0.png', '2021-05-05 14:36:50', '2021-05-06 10:14:35'),
(2, 3, 'images\\LITE%20RACER%202.0(2).png', '2021-05-05 14:36:50', '2021-05-06 10:14:40'),
(3, 3, 'images\\LITE%20RACER%202.0(3).png', '2021-05-05 14:36:50', '2021-05-06 10:15:11'),
(4, 3, 'images\\LITE%20RACER%202.0(4).png', '2021-05-05 14:36:50', '2021-05-06 10:15:11'),
(9, 5, 'images\\SUPERSTAR.png', '2021-05-05 14:41:31', '2021-05-06 10:15:11'),
(10, 5, 'images\\SUPERSTAR(2).png', '2021-05-05 14:41:31', '2021-05-06 10:15:11'),
(11, 5, 'images\\SUPERSTAR(3).png', '2021-05-05 14:41:31', '2021-05-06 10:25:31'),
(12, 5, 'images\\SUPERSTAR(4).png', '2021-05-05 14:41:31', '2021-05-06 10:15:52'),
(13, 6, 'images\\FULL-ZIP%20STADIUM%20HOODIE.png', '2021-05-05 14:43:02', '2021-05-06 10:15:52'),
(14, 6, 'images\\FULL-ZIP%20STADIUM%20HOODIE(2).png', '2021-05-05 14:43:02', '2021-05-06 10:15:52'),
(15, 6, 'images\\FULL-ZIP%20STADIUM%20HOODIE(3).png', '2021-05-05 14:43:02', '2021-05-06 10:15:52'),
(16, 6, 'images\\FULL-ZIP%20STADIUM%20HOODIE(4).png', '2021-05-05 14:43:02', '2021-05-06 10:15:52'),
(17, 7, 'images\\PLECKGATE%20TRACK%20JACKET.png', '2021-05-05 14:44:23', '2021-05-06 10:15:52'),
(18, 7, 'images\\PLECKGATE%20TRACK%20JACKET(2).png', '2021-05-05 14:44:23', '2021-05-06 10:15:52'),
(19, 7, 'images\\PLECKGATE%20TRACK%20JACKET(3).png', '2021-05-05 14:44:23', '2021-05-06 10:15:52'),
(20, 7, 'images\\PLECKGATE%20TRACK%20JACKET(4).png', '2021-05-05 14:44:23', '2021-05-06 10:15:52'),
(21, 8, 'images\\BALANTA%2096%20TRACK%20TOP.png', '2021-05-05 14:45:46', '2021-05-06 10:15:52'),
(22, 8, 'images\\BALANTA%2096%20TRACK%20TOP(2).png', '2021-05-05 14:45:46', '2021-05-06 10:15:52'),
(23, 8, 'images\\BALANTA%2096%20TRACK%20TOP(3).png', '2021-05-05 14:45:46', '2021-05-06 10:15:52'),
(24, 8, 'images\\BALANTA%2096%20TRACK%20TOP(4).png', '2021-05-05 14:45:46', '2021-05-06 10:15:52'),
(25, 9, 'images\\BIG%20TREFOIL%20ABSTRACT%20TRACK%20TOP.png', '2021-05-05 14:47:25', '2021-05-06 10:15:52'),
(26, 9, 'images\\BIG%20TREFOIL%20ABSTRACT%20TRACK%20TOP(2).png', '2021-05-05 14:47:25', '2021-05-06 10:26:23'),
(27, 9, 'images\\BIG%20TREFOIL%20ABSTRACT%20TRACK%20TOP(3).png', '2021-05-05 14:47:25', '2021-05-06 10:26:23'),
(28, 9, 'images\\BIG%20TREFOIL%20ABSTRACT%20TRACK%20TOP(4).png', '2021-05-05 14:47:25', '2021-05-06 10:26:23'),
(29, 10, 'images\\Nike%20Sportswear.png', '2021-05-05 14:49:16', '2021-05-06 10:26:23'),
(30, 10, 'images\\Nike%20Sportswear(2).png', '2021-05-05 14:49:16', '2021-05-06 10:26:23'),
(31, 10, 'images\\Nike%20Sportswear(3).png', '2021-05-05 14:49:16', '2021-05-06 10:26:23'),
(32, 10, 'images\\Nike%20Sportswear(4).png', '2021-05-05 14:49:16', '2021-05-06 10:26:23'),
(33, 11, 'images\\Jordan%20Jumpman%20Classics.png', '2021-05-05 14:50:48', '2021-05-06 10:26:23'),
(34, 11, 'images\\Jordan%20Jumpman%20Classics(2).png', '2021-05-05 14:50:48', '2021-05-06 10:26:23'),
(35, 11, 'images\\Jordan%20Jumpman%20Classics(3).png', '2021-05-05 14:50:48', '2021-05-06 10:26:23'),
(36, 11, 'images\\Jordan%20Jumpman%20Classics(4).png', '2021-05-05 14:50:48', '2021-05-06 10:26:23'),
(37, 12, 'images\\RUN%20LOGO%20GRAPHIC%20TEE.png', '2021-05-05 14:51:39', '2021-05-06 10:26:23'),
(38, 14, 'images\\BADGE%20OF%20SPORT%20SHORTS.png', '2021-05-05 14:53:25', '2021-05-06 10:26:23'),
(39, 14, 'images\\BADGE%20OF%20SPORT%20SHORTS(2).png', '2021-05-05 14:53:25', '2021-05-06 10:27:06'),
(40, 14, 'images\\BADGE%20OF%20SPORT%20SHORTS(3).png', '2021-05-05 14:53:25', '2021-05-06 10:27:06'),
(41, 14, 'images\\BADGE%20OF%20SPORT%20SHORTS(4).png', '2021-05-05 14:53:25', '2021-05-06 10:27:06'),
(42, 16, 'images\\OWN%20THE%20RUN%20CELEBRATION%20SHORTS.png', '2021-05-05 14:55:01', '2021-05-06 10:27:06'),
(43, 16, 'images\\OWN%20THE%20RUN%20CELEBRATION%20SHORTS(2).png', '2021-05-05 14:55:01', '2021-05-06 10:27:06'),
(44, 16, 'images\\OWN%20THE%20RUN%20CELEBRATION%20SHORTS(3).png', '2021-05-05 14:55:01', '2021-05-06 10:27:06'),
(45, 16, 'images\\OWN%20THE%20RUN%20CELEBRATION%20SHORTS(4).png', '2021-05-05 14:55:01', '2021-05-06 10:27:06'),
(58, 17, 'images\\Jordan%20Dri-FIT%20Zion.png', '2021-05-05 15:10:54', '2021-05-06 10:27:06'),
(59, 17, 'images\\Jordan%20Dri-FIT%20Zion(2).png', '2021-05-05 15:10:54', '2021-05-06 10:27:34'),
(60, 17, 'images\\Jordan%20Dri-FIT%20Zion(3).png', '2021-05-05 15:10:54', '2021-05-06 10:27:34'),
(61, 17, 'images\\Jordan%20Dri-FIT%20Zion(4).png', '2021-05-05 15:10:54', '2021-05-06 10:27:34'),
(62, 13, 'images\\HEAT.RDY%20RUNNING%20TANK%20TOP.png', '2021-05-05 15:12:38', '2021-05-06 10:27:34'),
(63, 13, 'images\\HEAT.RDY%20RUNNING%20TANK%20TOP(2).png', '2021-05-05 15:12:38', '2021-05-06 10:27:34'),
(64, 13, 'images\\HEAT.RDY%20RUNNING%20TANK%20TOP(3).png', '2021-05-05 15:12:38', '2021-05-06 10:27:34'),
(65, 13, 'images\\HEAT.RDY%20RUNNING%20TANK%20TOP(4).png', '2021-05-05 15:12:38', '2021-05-06 10:27:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `idStore` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `conditions` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `size` longtext NOT NULL,
  `color` longtext NOT NULL,
  `stock` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `isPopular` tinyint(1) NOT NULL,
  `isArchived` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `title`, `idCategory`, `idStore`, `image`, `price`, `conditions`, `description`, `size`, `color`, `stock`, `rating`, `isPopular`, `isArchived`, `createdAt`, `updatedAt`) VALUES
(3, 'LITE RACER 2.0', 4, 8, 'images\\LITE%20RACER%202.0.png', 300000, 'new', 'Bring sport attitude into everyday life. These adidas running-inspired shoes feature a knit upper to keep you cool for school, work or play. Lightweight cushioning adds comfort during power walks and strolls in the park.', '[\"38\", \"39\", \"40\", \"41\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 100, 4, 0, 0, '2021-05-05 13:59:41', '2021-05-12 09:35:27'),
(5, 'SUPERSTAR', 4, 8, 'images\\SUPERSTAR.png', 1000000, 'new', 'Originally made for basketball courts in the \'70s. Celebrated by hip hop royalty in the \'80s. The adidas Superstar shoe is now a lifestyle staple for streetwear enthusiasts. The world-famous shell toe feature remains, providing style and protection. Just like it did on the B-ball courts back in the day. Now, whether at a festival or walking in the street you can enjoy yourself without the fear of being stepped on. The serrated 3-Stripes detail and adidas Superstar box logo adds OG authenticity to your look.', '[\"38\", \"39\", \"40\", \"41\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 50, 4, 1, 0, '2021-05-05 14:07:09', '2021-05-12 09:35:30'),
(6, 'FULL-ZIP STADIUM HOODIE', 2, 8, 'images\\FULL-ZIP%20STADIUM%20HOODIE.png', 1000000, 'new', 'Take a moment to let it all sink in. You gave it your all. You pushed through, mentally and physically. As you sit on that locker room bench lacing up your shoes, still feeling the energy vibrating through your body, remember that you\'re the one who got yourself there. Then zip into this adidas hoodie and go celebrate that. The soft fabric and snug ribbed details reward tired muscles with comfort. You deserve it.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 50, 1, 1, 0, '2021-05-05 14:07:09', '2021-05-08 03:15:57'),
(7, 'PLECKGATE TRACK JACKET', 2, 8, 'images\\PLECKGATE%20TRACK%20JACKET.png', 2800000, 'new', 'Terracewear meets dance hall hardwood. Inspired by the Northern Soul movement that hit England during the 1970s, this adidas track jacket takes a silhouette made famous in the stands and infuses it with carefree attitude. A stand-up collar and a bonded zip bring tailored style to your casual look.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 50, 4, 1, 0, '2021-05-05 14:07:09', '2021-05-08 03:15:53'),
(8, 'BALANTA 96 TRACK TOP', 2, 8, 'images\\BALANTA%2096%20TRACK%20TOP.png', 750000, 'new', 'Pay homage to the spirit of sport. Zip into this track jacket and honour the connection and unity found in shared experience. Wins and losses. The beauty of the game. This lightweight layer blends the striking club colours of Morocco and the Netherlands into an archival design, for a look that keeps your look right on pitch.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 40, 4, 1, 0, '2021-05-05 14:07:09', '2021-05-08 03:15:51'),
(9, 'BIG TREFOIL ABSTRACT TRACK TOP', 2, 8, 'images\\BIG%20TREFOIL%20ABSTRACT%20TRACK%20TOP.png', 900000, 'new', 'You\'re drawn to that quality that never goes out of style. A little edgy, a bit unexpected in its originality. Like the signature adidas track jacket. The classic look of sports heritage has been defined by adidas for decades. Others might build on the 3-Stripes foundation, but can anyone else really compete with an icon?', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 40, 4, 1, 0, '2021-05-05 14:07:09', '2021-05-12 09:35:37'),
(10, 'Nike Sportswear', 1, 8, 'images\\Nike%20Sportswear.png', 399000, 'new', 'Sushi and sneaker connoisseurs behold: The Nike Sportswear T-Shirt sets you up with soft, cotton fabric and a Nike graphic on the chest for total shoeshi fantasy.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 40, 4, 1, 0, '2021-05-05 14:11:27', '2021-05-08 03:15:46'),
(11, 'Jordan Jumpman Classics', 1, 8, 'images\\Jordan%20Jumpman%20Classics.png', 399000, 'new', 'Ready for take-off. The Jordan Jumpman Classics T-Shirt riffs on an iconic Michael Jordan image with a fresh, bold-letter graphic.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 100, 4, 1, 0, '2021-05-05 14:11:27', '2021-05-08 03:15:42'),
(12, 'RUN LOGO GRAPHIC TEE', 1, 8, 'images\\RUN%20LOGO%20GRAPHIC%20TEE.png', 299000, 'new', 'Always one run away from a good mood. Slip on this adidas running t-shirt, and let the endorphins multiply. Not only does it keep you dry with moisture-absorbing AEROREADY, but it\'s also made with the planet in mind. A tee you\'ll feel good wearing for more reasons than one. This product is made with Primegreen, a series of high-performance recycled materials.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 70, 4, 1, 0, '2021-05-05 14:11:27', '2021-05-12 09:35:34'),
(13, 'RUNNING TANK TOP', 1, 8, 'images\\HEAT.RDY%20RUNNING%20TANK%20TOP.png', 550000, 'new', 'No matter how high the temperature rises, you\'re ready. Slip on this light and breathable adidas tank top, knowing HEAT.RDY will manage moisture and keep air flowing with every stride you take. And knowing the recycled content is helping to end plastic waste. This product is made with Primegreen, a series of high-performance recycled materials.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 50, 4, 1, 0, '2021-05-05 14:11:27', '2021-05-12 09:35:42'),
(14, 'BADGE OF SPORT SHORTS', 5, 8, 'images\\BADGE%20OF%20SPORT%20SHORTS.png', 450000, 'new', 'Whether you\'re headed to the gym or out with your crew, pull on these casual shorts. They\'re made of soft cotton-blend French terry in an easy-to-wear fit that\'s not too loose or too tight. The drawcord-adjustable elastic waist lets you personalise the fit.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 50, 4, 1, 0, '2021-05-05 14:14:54', '2021-05-12 09:35:45'),
(16, 'Nike Sportswear City Made', 3, 8, 'images\\OWN%20THE%20RUN%20CELEBRATION%20SHORTS.png', 1249000, 'new', 'The Nike Air Woven Trousers update a style staple with Ripstop fabric and reinforced panels. A tapered leg design and utility details provide a clean, tactical look.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 39, 4, 1, 0, '2021-05-05 14:14:54', '2021-05-12 13:43:14'),
(17, 'Jordan Dri-FIT Zion', 3, 8, 'images\\Jordan%20Dri-FIT%20Zion.png', 100000, 'new', 'Zion likes versatile clothing that he can wear while hanging with family and friends—and then go and hoop in.The Jordan Dri-FIT Zion Trousers tick all boxes, with smooth, sweat-wicking fleece and a design that\'s fit for moving on and off the court.', '[\"S\", \"M\", \"L\", \"XL\"]', '[\"#1A1A1A\", \"#D84242\", \"#4290D8\", \"#42D86C\"]', 20, 5, 1, 0, '2021-05-05 14:14:54', '2021-05-12 09:35:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `store`
--

INSERT INTO `store` (`id`, `idUser`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
(8, 17, 'Zalora', 'Lorem ipsum', '2021-05-06 09:28:13', '2021-05-09 10:23:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idStore` int(11) NOT NULL,
  `address` text NOT NULL,
  `subTotal` int(11) NOT NULL,
  `postage` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `paymentMethod` varchar(100) NOT NULL,
  `status` enum('Completed','Not yet paid','Order cancel','Packed','Sent') NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id`, `idUser`, `idStore`, `address`, `subTotal`, `postage`, `total`, `paymentMethod`, `status`, `createdAt`, `updatedAt`) VALUES
(17, 21, 8, 'Ganeas, Sumedang, Jawa Barat', 1200000, 15000, 1215000, 'Gopay', 'Not yet paid', '2021-05-08 09:58:04', '2021-05-12 06:11:52'),
(18, 21, 8, 'Ganeas, Sumedang, Jawa Barat', 299000, 15000, 314000, 'MasterCard', 'Packed', '2021-05-08 10:02:33', '2021-05-12 06:11:56'),
(19, 21, 8, 'Situraja, Sumedang Jawa Barat', 100000, 15000, 115000, 'Pos Indonesia', 'Sent', '2021-05-08 18:24:20', '2021-05-12 06:12:00'),
(20, 21, 8, 'Darmaraja, Sumedang, Jawa Barat', 100000, 15000, 115000, 'MasterCard', 'Completed', '2021-05-08 18:28:42', '2021-05-12 06:12:05'),
(21, 21, 8, 'Ganeas, Sumedang, Jawa Barat', 100000, 15000, 115000, 'Pos Indonesia', 'Completed', '2021-05-09 03:45:40', '2021-05-12 06:12:10'),
(22, 21, 8, 'Wado, Sumedang, Jawa Barat', 100000, 15000, 115000, 'Gopay', 'Completed', '2021-05-09 05:55:20', '2021-05-12 06:12:14'),
(25, 21, 8, 'Jln. Sumantawaria Ganeas Sumedang Jawa Barat', 550000, 15000, 565000, 'Gopay', 'Not yet paid', '2021-05-10 02:56:12', '2021-05-12 08:38:59'),
(26, 21, 8, 'Ganeas', 1249000, 15000, 1264000, 'Gopay', 'Not yet paid', '2021-05-12 13:43:14', '2021-05-12 13:43:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dateOfBirth` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `role` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phoneNumber`, `gender`, `dateOfBirth`, `image`, `active`, `role`, `createdAt`, `updatedAt`) VALUES
(17, 'Name1 Surname1', 'js25222225+1@gmail.com', '$2b$10$wU9Th0qxrk/f38QaTqK6HORgFd05TFtFMf23g0OIIUZ1SiEj0YTgu', '087827865437', 'Man', '10 Juli 2000', 'images\\default.png', 1, 1, '2021-05-06 05:57:17', '2021-05-09 13:00:11'),
(21, 'Name2 Surname2', 'js25222225+2@gmail.com', '$2b$10$XuI3JTd6fEmwDVRvJer7eOxR.XfkI4lXb9par8eGulq2CX9u9xKnq', '081256789091', 'Man', '10 Agustus 2000', 'images\\default.png', 1, 2, '2021-05-09 15:32:25', '2021-05-10 03:43:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `access_token`
--
ALTER TABLE `access_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indeks untuk tabel `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indeks untuk tabel `bag`
--
ALTER TABLE `bag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idStore` (`idStore`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_transaction`
--
ALTER TABLE `detail_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTransaction` (`idTransaction`,`idProduct`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idUser` (`idUser`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategory` (`idCategory`,`idStore`),
  ADD KEY `idStore` (`idStore`);

--
-- Indeks untuk tabel `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idStore` (`idStore`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `access_token`
--
ALTER TABLE `access_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `bag`
--
ALTER TABLE `bag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `detail_transaction`
--
ALTER TABLE `detail_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bag`
--
ALTER TABLE `bag`
  ADD CONSTRAINT `bag_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bag_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_transaction`
--
ALTER TABLE `detail_transaction`
  ADD CONSTRAINT `detail_transaction_ibfk_1` FOREIGN KEY (`idTransaction`) REFERENCES `transaction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaction_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaction_ibfk_3` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idStore`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`idCategory`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
