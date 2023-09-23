USE sekolah;

SELECT * FROM guru;
SELECT * FROM mata_pelajaran;
SELECT * FROM siswa;

-- CATATAN
ALTER TABLE siswa ADD nilai_rerata DECIMAL(3,1);
UPDATE siswa SET nilai_rerata = 89.3 WHERE id_siswa = 171810010;
UPDATE siswa SET nilai_rerata = 91.5 WHERE id_siswa = 181910010;
UPDATE siswa SET nilai_rerata = 83.8 WHERE id_siswa = 181910011;
UPDATE siswa SET nilai_rerata = 82.4 WHERE id_siswa = 181910012;
UPDATE siswa SET nilai_rerata = 85.7 WHERE id_siswa = 192010010;
UPDATE siswa SET nilai_rerata = 90.8 WHERE id_siswa = 192010011;
UPDATE siswa SET nilai_rerata = 84.1 WHERE id_siswa = 192010012;

ALTER TABLE mata_pelajaran ADD nilai_kkm INT NOT NULL;
UPDATE mata_pelajaran SET nilai_kkm = 75 WHERE id_matpel = 1718901;
UPDATE mata_pelajaran SET nilai_kkm = 78 WHERE id_matpel = 1920901;
UPDATE mata_pelajaran SET nilai_kkm = 76 WHERE id_matpel = 1920902;
UPDATE mata_pelajaran SET nilai_kkm = 73 WHERE id_matpel = 1920903;
UPDATE mata_pelajaran SET nilai_kkm = 80 WHERE id_matpel = 1920904;
UPDATE mata_pelajaran SET nilai_kkm = 77 WHERE id_matpel = 1920905;
UPDATE mata_pelajaran SET nilai_kkm = 74 WHERE id_matpel = 1920906;


-- NO 1
-- INSERT siswa 5 data
INSERT INTO siswa VALUES (171810011, 'Chandra', 'L', '2002-03-14', '08138912383', 'Jl. Mangga No. 14', '2017', '0', 88.4); 
INSERT INTO siswa VALUES (181910013, 'Safa', 'P', '2004-01-13', '08991245134', 'Jl. Soekarno Hatta No. 543', '2018', '1', 86.5);
INSERT INTO siswa VALUES (181910014, 'Azka', 'L', '2002-11-27', '08771249124', 'Jl. Layar No. 34', '2018', '1', 93.4);
INSERT INTO siswa VALUES (192010013, 'Bintang', 'L', '2003-12-03', '08173210412', 'Jl. Kenanga No. 88', '2019', '1', 90.1);
INSERT INTO siswa VALUES (192010014, 'Santi', 'P', '2005-01-05', '08331249128', 'Jl. Merkurius No. 13', '2019', '1', 84.3);

-- INSERT guru 5 data
INSERT INTO guru VALUES (32181006, 'Agus', 'L', '08412891230', 'Jl. Cikini No. 13', '0');
INSERT INTO guru VALUES (32182007, 'Retno', 'P', '08981325038', 'Jl. Rajawali No. 41', '1');
INSERT INTO guru VALUES (32182008, 'Fajar', 'L', '08851270343', 'Jl. Pajajaran No. 98', '1');
INSERT INTO guru VALUES (32182009, 'Nurul', 'P', '08124975144', 'Jl. Putri No. 76', '1');
INSERT INTO guru VALUES (32182010, 'Rini', 'P', '08513870894', 'Jl. Saluyu No. 33', '1');

-- Insert matpel 5 data
INSERT INTO mata_pelajaran VALUES (1718902, 'TIK', '32181006', '2017-2018', 70);
INSERT INTO mata_pelajaran VALUES (1920907, 'Bahasa Inggris', '32182010', '2019-2020', 79);
INSERT INTO mata_pelajaran VALUES (1920908, 'Ekonomi', '32182009', '2019-2020', 74);
INSERT INTO mata_pelajaran VALUES (1920909, 'Geografi', '32182008', '2019-2020', 75);
INSERT INTO mata_pelajaran VALUES (1920910, 'Akuntansi', '32182007', '2019-2020', 73);

-- NO 2
CREATE TABLE siswa_lama(
	id_siswa INT PRIMARY KEY NOT NULL,
    nama_siswa VARCHAR(50) NOT NULL,
    jenis_kelamin CHAR(1) NOT NULL,
    tgl_lahir DATE NOT NULL,
    no_telp CHAR(13) NOT NULL,
    alamat VARCHAR(100) NOT NULL,
    tahun_masuk YEAR NOT NULL,
    status_aktif INT NOT NULL
);

CREATE TABLE guru_lama(
	id_guru INT PRIMARY KEY NOT NULL,
    nama_guru VARCHAR(50) NOT NULL,
    jenis_kelamin CHAR(1) NOT NULL,
    no_telp CHAR(13) NOT NULL,
    alamat VARCHAR(100) NOT NULL,
    status_aktif INT NOT NULL
);

DROP TABLE siswa_lama;
DROP TABLE guru_lama;

-- NO 3
-- Tabel siswa
SELECT * FROM siswa WHERE id_siswa < 192010010 AND status_aktif = 1;
SELECT id_siswa, nama_siswa, jenis_kelamin, status_aktif FROM siswa WHERE NOT(status_aktif = 1) OR jenis_kelamin = 'L';
SELECT id_siswa, nama_siswa, tgl_lahir FROM siswa WHERE tgl_lahir BETWEEN '2003-01-01' AND '2004-01-01' AND nama_siswa IN('Cinta','Budi','Asih');
SELECT * FROM siswa WHERE nilai_rerata BETWEEN 88.0 AND 92.0 AND tahun_masuk NOT IN('2017','2018') AND id_siswa IN(192010010,192010011,192010012,192010013,192010014);
SELECT id_siswa, nama_siswa, CONCAT(nama_siswa, ' tinggal di ', alamat, ', merupakan siswa di sekolah ini sejak ', tahun_masuk, ' dan memiliki nilai rata-rata sebesar ', nilai_rerata) AS keterangan FROM siswa;
-- Tabel mata_pelajaran
SELECT * FROM mata_pelajaran WHERE periode = '2019-2020' AND nilai_kkm >= 77 ;
SELECT id_matpel, nama_matpel, nilai_kkm FROM mata_pelajaran WHERE NOT(nilai_kkm > 78) OR id_matpel < 1920905;
SELECT * FROM mata_pelajaran WHERE id_guru BETWEEN 32182005 AND 32182009 AND nama_matpel IN('Sejarah', 'Ekonomi', 'Bahasa Inggris');
SELECT * FROM mata_pelajaran WHERE nilai_kkm BETWEEN 73 AND 78 AND nama_matpel NOT IN('Fisika', 'Sejarah') AND id_matpel IN('1920901','1920902','1920903','1920904','1920905');
SELECT id_matpel, CONCAT(nama_matpel, ' merupakan mata pelajaran pada periode ajar ', periode, ' dan nilai kkmnya adalah ', nilai_kkm) AS keterangan FROM mata_pelajaran;

-- NO 4
-- Tabel siswa
SELECT MIN(nilai_rerata) AS nilai_terkecil, MAX(nilai_rerata) AS nilai_terbesar FROM siswa;
SELECT COUNT(id_siswa) AS jumlah_matpel, AVG(nilai_rerata) AS average_rerata, SUM(nilai_rerata) AS total_rerata FROM siswa;
SELECT * FROM siswa WHERE nama_siswa LIKE "B%";
SELECT * FROM siswa WHERE nama_siswa LIKE "A_%";
UPDATE siswa SET nilai_rerata = 87.5 WHERE id_siswa = 192010010;
UPDATE siswa SET tgl_lahir = '2004-01-05' WHERE id_siswa = 192010014;
UPDATE siswa SET no_telp = 08132112112 WHERE id_siswa = 171810010;
DELETE FROM siswa WHERE id_siswa = 171810010;

-- Tabel mata_pelajaran
SELECT MIN(nilai_kkm) AS kkm_terkecil, MAX(nilai_kkm) AS kkm_terbesar FROM mata_pelajaran;
SELECT COUNT(id_matpel) AS jumlah_matpel, AVG(nilai_kkm) AS average_kkm, SUM(nilai_kkm) AS total_kkm FROM mata_pelajaran;
SELECT * FROM mata_pelajaran WHERE nama_matpel LIKE "B%";
SELECT * FROM mata_pelajaran WHERE nama_matpel LIKE "_i%";
UPDATE mata_pelajaran SET nilai_kkm = 81 WHERE id_matpel = 1920904;
UPDATE mata_pelajaran SET nama_matpel = 'Sejarah Indonesia' WHERE id_matpel = 1920905;
UPDATE mata_pelajaran SET nilai_kkm = 78 WHERE id_matpel = 1920907;
DELETE FROM mata_pelajaran WHERE id_matpel = 1718901;