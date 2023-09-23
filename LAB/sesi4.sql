USE perpustakaan;
SELECT MIN(points) AS min_points FROM anggota_perpustakaan;
SELECT MAX(jumlah) AS jumlah_max FROM buku;
SELECT COUNT(id_anggota) AS jumlah_anggota FROM anggota_perpustakaan;
SELECT AVG(points) AS avg_points FROM anggota_perpustakaan;
SELECT SUM(jumlah) AS jumlah_buku FROM buku;
SELECT * FROM anggota_perpustakaan WHERE nama_anggota LIKE "%d%";
SELECT * FROM buku WHERE judul LIKE "__m%";

SELECT MIN(points) AS min_points FROM anggota_perpustakaan;
SELECT MAX(points) AS max_points FROM anggota_perpustakaan;
SELECT COUNT(id_anggota) AS total_row FROM anggota_perpustakaan;
SELECT AVG(points) AS average FROM anggota_perpustakaan;
SELECT SUM(points) AS total_points FROM anggota_perpustakaan;

SELECT MIN(points) AS min_points, MAX(points) AS max_points, COUNT(id_anggota) AS total_row, AVG(points) AS average, SUM(points) AS total_points FROM anggota_perpustakaan;

SELECT pengarang FROM buku;

SELECT judul, pengarang, tahun_terbit, jenis_buku FROM buku;
SELECT * FROM buku WHERE pengarang LIKE "%Dani%" AND tahun_terbit > 2019;

UPDATE anggota_perpustakaan SET nama_anggota = "Rama Fajriani" WHERE id_anggota = 15060002;

SELECT * FROM anggota_perpustakaan;

UPDATE anggota_perpustakaan SET alamat = "jln. talaga bodas, no. 205", tgl_lahir = "1982-08-15", pekerjaan = "Sales" WHERE id_anggota = 17060002;

SELECT * FROM anggota_perpustakaan WHERE id_anggota = "22050002";

DELETE FROM anggota_perpustakaan WHERE id_anggota = "22050002";

SELECT id_anggota, nama_anggota, alamat, kota, no_telp FROM anggota_perpustakaan;

SELECT * FROM anggota_perpustakaan WHERE id_anggota = "22040001";

UPDATE anggota_perpustakaan SET nama_anggota = "vina yuliani", alamat = "jln. Siliwangi, no. 15", kota = "tasik", no_telp = "0821453756765" WHERE id_anggota = "22040001";

SELECT * FROM peminjaman WHERE nomor_peminjaman = "210819001";

DELETE FROM peminjaman WHERE nomor_peminjaman = "210819001";

