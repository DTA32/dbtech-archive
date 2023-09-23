-- Muhammad Raditya - 2502032144

CREATE DATABASE IF NOT EXISTS universitas;
USE universitas;

-- NO 1

CREATE TABLE mahasiswa(
    id_mahasiswa INT UNSIGNED PRIMARY KEY NOT NULL, -- PK
    nama_mahasiswa VARCHAR(100) NOT NULL,
    alamat_mahasiswa VARCHAR(100) NOT NULL,
    kota VARCHAR(100) NOT NULL,
    tgl_lahir DATE NOT NULL,
    usia INT NOT NULL,
    no_kontak VARCHAR(13) NOT NULL,
    email VARCHAR(50) NOT NULL,
    jurusan VARCHAR(3) NOT NULL,
    nama_wali VARCHAR(50) NOT NULL,
    tgl_terdaftar DATE NOT NULL,
    prestasi_1 VARCHAR(100) NULL, -- NULL
    prestasi_2 VARCHAR(100) NULL -- NULL
);

CREATE TABLE mata_kuliah(
    id_mata_kuliah VARCHAR(10) PRIMARY KEY NOT NULL, -- PK
    nama_mata_kuliah VARCHAR(100) NOT NULL,
    jurusan VARCHAR(3) NOT NULL,
    kelas CHAR(4) NOT NULL,
    tahun_ajaran INT NOT NULL, 
    semester INT NOT NULL,
    jenis CHAR(3) NOT NULL,
    kode_dosen CHAR(5) NOT NULL,
    nama_dosen VARCHAR(100) NOT NULL,
    kuota_maks INT NOT NULL,
    kuota_tersisa INT NULL, -- NULL
    model_perkuliahan CHAR(6) NOT NULL,
    status VARCHAR(8) NOT NULL,
    durasi INT NOT NULL,
    maks_sks INT NOT NULL
);

CREATE TABLE transaksi(
    id_transaksi INT PRIMARY KEY NOT NULL, -- PK
    id_mahasiswa INT UNSIGNED NOT NULL,
    id_mata_kuliah VARCHAR(10) NOT NULL,
    jurusan VARCHAR(3) NOT NULL,
    timestamp_transaksi DATETIME NOT NULL,
    jumlah_sks INT NOT NULL,
    total_biaya INT NOT NULL,
    virtual_account BIGINT NOT NULL,
    status_pembayaran VARCHAR(11) NOT NULL,
    jatuh_tempo DATE NOT NULL,
    potongan_biaya DECIMAL(3,2) NULL -- NULL
);

INSERT INTO mahasiswa VALUES(2501123456, "Asep Maulana", "Jl. Belitung no. 53", "Bandung", "2003-03-15", 19, "08382256373", "asep@binus.ac.id", "IT", "Josep Maulana", "2021-09-13", "juara 1 lomba hackathon", NULL);
INSERT INTO mahasiswa VALUES(2301862696, "Marya Aulia","Jl. Sukaluyu no. 15", "Bandung", "2001-04-30", 21, "081384037069", "marya@binus.ac.id", "DKV", "Vina Muliani", "2019-09-10", NULL, NULL);
INSERT INTO mahasiswa VALUES(2401985645, "Deri Sanusi","Jl. Kalidan no. 25", "Cimahi", "2002-06-05", 20, "08572746511", "deri@binus.ac.id", "DI", "Sito Sanusi", "2020-09-07", "juara 1 lomba desain ruang", "juara 2 3D design");

INSERT INTO mata_kuliah VALUES("COMP45434","Algorithm and Programming","IT","LA65",2022,1,"LEC","D9000","Maria Auleria",50,32,"Online","tersedia",120,2);
INSERT INTO mata_kuliah VALUES("COMP684701","Database Technology", "IT", "BA75",2022, 3,"LAB","D6764", "Vito Hafizh",25,25,"Onsite","penuh", 90,2);
INSERT INTO mata_kuliah VALUES("ARTS602203","Photography","DKV","BG90",2022,5,"LAB","D1472","Krisna Ahmad",25,15,"Onsite","tersedia",90,1);
INSERT INTO mata_kuliah VALUES("DSGN66960","3-Dimension Layout","DI","LF45",2022,5,"LEC","D6076","Anisa Putri",45,27,"Online","tersedia",120,2);
INSERT INTO mata_kuliah VALUES("COMP684702","Database Technology","IT","BB75",2022,3,"LAB","D6274","Husni Iskandar Pohan",26,20,"Onsite","tersedia",90,1);

INSERT INTO transaksi VALUES(15060001,2401985645,"DSGN66960","DI","2022-12-24 07:00:00",2,500000,7623523425,"belum lunas","2023-01-15",NULL);
INSERT INTO transaksi VALUES(17060002,2501123456,"COMP684702","IT","2022-12-27 22:00:00",1,250000,7623878979,"lunas","2023-01-16",0.1);
INSERT INTO transaksi VALUES(17060003,2301862696,"ARTS602203","DKV","2022-12-30 01:00:00",1,250000,7623974678,"lunas","2023-01-15",NULL);

-- NO 2
-- TABEL MAHASISWA
INSERT INTO mahasiswa (id_mahasiswa, nama_mahasiswa, alamat_mahasiswa , kota , tgl_lahir, usia, no_kontak, email, jurusan, nama_wali, tgl_terdaftar, prestasi_1, prestasi_2 ) VALUES
	(2301612083, "Agus Tavorn", "Jl. Cijambe no. 37", "Bandung", "2001-07-12", 21, "0878450069", "agus@binus.ac.id", "IT", "Josep Maulana", "2019-09-10", "juara 1 hackathon 2021", NULL),
	(2302124147, "Rascal Asep", "Jl. Dago no. 248", "Bandung", "2001-01-04", 21, "0875440569", "rascal@binus.ac.id", "DKV", "Sito Sanusi", "2019-09-10", "juara 2 FLS2N", NULL),
	(2401931284, "Lucas Mangkubumi", "Jl. Sukapura no. 59", "Bandung", "2002-09-06", 20, "0889932069", "lucas@binus.ac.id", "IT", "Vina Muliani", "2020-09-07", "juara 3 design gedung kreatif", "finalis lomba desain "),
	(2402125788, "Naufal Cahyadi", "Jl. Salam Raya no. 66", "Jakarta", "2002-10-30", 20, "0872950469", "naufal@binus.ac.id", "DKV", "Josep Maulana", "2020-09-07", NULL, NULL),
	(2402813297, "Bella Sintia", "Jl. Cigadung no. 2", "Bandung", "2002-03-23", 20, "0812242069", "Bella@binus.ac.id", "DI", "Sito Sanusi", "2020-09-07", "juara 1 harapan competitive programming", NULL),
	(2501472123, "Rachel Susanto", "Jl. Ciumbuleuit no. 12", "Bandung", "2003-06-14", 19, "0874355769", "rachel@binus.ac.id", "IT", "Vina Muliani", "2021-09-13", "juara 3 mapres binus 2021", "runner up icpc "),
	(2502412389, "Yusuf Rahardian", "Jl. Jakarta no. 32", "Sukabumi", "2003-12-21", 19, "0876590069", "yusuf@binus.ac.id", "DKV", "Josep Maulana", "2021-09-13", "juara 2 harapan nirmana", NULL),
	(2502326963, "Sigit Afia", "Jl. Ciganitri no.99", "Bandung", "2003-07-07", 19, "0832264846", "sigit@binus.ac.id", "DI", "Vina Muliani", "2021-09-13", NULL, NULL);

-- TABEL MATAKULIAH
INSERT INTO mata_kuliah (id_mata_kuliah, nama_mata_kuliah, jurusan, kelas, tahun_ajaran, semester , jenis, kode_dosen, nama_dosen, kuota_maks , kuota_tersisa, model_perkuliahan, status, durasi , maks_sks ) VALUES
	("COMP684831", "Object Oriented Programming", "IT", "BC75", 2022, 3, "LAB", "D1203", "Benny Chaniago", 25, 0, "Onsite", "penuh", 90, 1),
	("COMP683931", "Program Design Methods", "IT", "LB65", 2022, 1, "LEC", "D2147", "Suhal Prayoga", 50, 12, "Online", "tersedia", 120, 2),
	("DSGN665607", "Design Methods", "DKV", "LG90", 2022, 5, "LEC", "D1832", "Bagoes Aditya", 40, 23, "Onsite", "tersedia", 180, 4),
	("DSGN674407", "3D Art and Interaction", "DKV", "LH80", 2022, 3, "LEC", "D6213", "Antonius Putra", 45, 17, "Onsite", "tersedia", 180, 4),
	("DSGN664707", "Drawing for Design", "DKV", "BI70", 2022, 1, "LAB", "D6012", "Dwi Sulistiyo", 30, 12, "Onsite", "tersedia", 120, 2),
	("ARTS600108", "Art Principles", "DI", "LG65", 2022, 1, "LEC", "D3128", "Surya Mijaya", 45, 37, "Onsite", "tersedia", 120, 2),
	("DSGN619808", "Computer 2D Drawing", "DI", "BH75", 2022, 3, "LAB", "D9128", "Boy Iskandar", 20, 8, "Online", "tersedia", 120, 2),
	("DSGN603408", "Interior Design and Technology", "DI", "LG85", 2022, 5, "LEC", "D1172", "Dadang Kusmayadi", 40, 0, "Online", "penuh", 120, 2);

-- TABEL TRANSAKSI
INSERT INTO transaksi (id_transaksi, id_mahasiswa, id_mata_kuliah, jurusan, timestamp_transaksi, jumlah_sks , total_biaya, virtual_account , status_pembayaran, jatuh_tempo, potongan_biaya ) VALUES
	(16060004, 2301612083, "COMP684831", "IT", "2022-12-03 16:30", 1, 250000, 7623612083, "lunas", "2023-01-06", 0.05),
	(17060005, 2302124147, "DSGN665607", "DKV", "2022-12-10 04:30", 4, 1000000, 7623124147, "lunas", "2023-01-09", 0.1),
	(17060006, 2401931284, "COMP684701", "IT", "2022-12-20 12:15", 2, 500000, 7623931284, "belum lunas", "2023-01-20", NULL),
	(16060007, 2402125788, "DSGN674407", "DKV", "2022-12-07 19:00", 4, 1000000, 7623125788, "belum lunas", "2023-01-29", NULL),
	(16060008, 2402813297, "DSGN619808", "DI", "2022-12-05 07:00", 2, 500000, 7623813297, "lunas", "2023-01-13", NULL),
	(15060009, 2501472123, "COMP45434", "IT", "2022-12-26 13:30", 2, 500000, 7623472123, "lunas", "2023-01-01", 0.1),
	(15060010, 2502412389, "DSGN664707", "DKV", "2022-12-09 06:30", 2, 500000, 7623412389, "belum lunas", "2023-01-20", NULL),
	(17060011, 2502326963, "ARTS600108", "DI", "2022-12-22 17:00", 2, 500000, 7623326963, "lunas", "2023-01-11", NULL);

-- NO 3

SELECT * FROM mata_kuliah WHERE kuota_tersisa > 20 AND semester >= 3 OR jurusan = "DKV";
SELECT * FROM mata_kuliah WHERE id_mata_kuliah NOT LIKE "COMP%";
SELECT * FROM mata_kuliah WHERE kelas LIKE "__75" AND jurusan IN ("IT", "DKV");
SELECT * FROM mata_kuliah WHERE NOT(status = "tersedia") OR durasi IN (90, 180);

SELECT * FROM transaksi WHERE jumlah_sks > 2 AND total_biaya > 500000 OR jurusan = "DI";
SELECT * FROM transaksi WHERE id_mata_kuliah NOT LIKE "DSGN%";
SELECT * FROM transaksi WHERE id_mahasiswa LIKE "25%" AND potongan_biaya IN (0.05, 0.1);
SELECT * FROM transaksi WHERE NOT(status_pembayaran = "belum lunas") OR total_biaya IN(250000, 1000000);

-- NO 4

CREATE TABLE pegawai(
    id_pegawai CHAR(5) PRIMARY KEY NOT NULL,
    nama_pegawai VARCHAR(100) NOT NULL,
    pemberian_pelaporan_kepada CHAR(5) NULL
);

INSERT INTO pegawai (id_pegawai, nama_pegawai, pemberian_pelaporan_kepada ) VALUES
	("D9000", "Maria Auleria", "D6764"),
	("D6764", "Vito Hafizh", NULL),
	("D1472", "Krisna Ahmad", "D6764"),
	("D1203", "Benny Chaniago", NULL),
	("D2147", "Suhal Prayoga", "D1203");

-- NO 5
-- Inner Join
SELECT
    id_transaksi,
    nama_mata_kuliah,
    kelas,
    id_mahasiswa,
    jumlah_sks
    FROM transaksi
    INNER JOIN mata_kuliah
    ON mata_kuliah.id_mata_kuliah = transaksi.id_mata_kuliah;
-- Left Join
SELECT
    id_transaksi,
    nama_mahasiswa,
    mahasiswa.jurusan,
    status_pembayaran,
    jatuh_tempo
    FROM transaksi
    LEFT JOIN mahasiswa
    ON mahasiswa.id_mahasiswa = transaksi.id_mahasiswa;
-- Right Join
SELECT
    id_transaksi,
    nama_mata_kuliah,
    kelas,
    timestamp_transaksi,
    total_biaya
    FROM transaksi
    RIGHT JOIN mata_kuliah
    ON mata_kuliah.id_mata_kuliah = transaksi.id_mata_kuliah;
-- Full Outer Join
SELECT
    id_transaksi,
    nama_mahasiswa,
    mahasiswa.jurusan,
    virtual_account,
    CONCAT(FLOOR(potongan_biaya * 100),'%') AS potongan_biaya
    FROM transaksi
    LEFT JOIN mahasiswa
    ON mahasiswa.id_mahasiswa = transaksi.id_mahasiswa
UNION
SELECT
    id_transaksi,
    nama_mahasiswa,
    mahasiswa.jurusan,
    virtual_account,
    CONCAT(FLOOR(potongan_biaya * 100),'%') AS potongan_biaya
    FROM transaksi
    RIGHT JOIN mahasiswa
    ON mahasiswa.id_mahasiswa = transaksi.id_mahasiswa;
-- Self Join
SELECT
    pegawai.id_pegawai,
    pegawai.nama_pegawai,
    pegawai.pemberian_pelaporan_kepada AS id_atasan,
    atasan.nama_pegawai AS nama_atasan
FROM pegawai AS pegawai
JOIN pegawai AS atasan
    ON pegawai.pemberian_pelaporan_kepada = atasan.id_pegawai;
-- Multiple Join
SELECT
    id_transaksi, nama_mahasiswa,
    mhs.jurusan, nama_mata_kuliah,
    kelas, jenis,
    nama_dosen, model_perkuliahan,
    jumlah_sks, total_biaya,
    virtual_account, status_pembayaran,
    CONCAT(FLOOR(potongan_biaya * 100),'%') AS potongan_harga,
    jatuh_tempo, timestamp_transaksi
FROM transaksi as t
JOIN mahasiswa as mhs
    ON t.id_mahasiswa = mhs.id_mahasiswa
JOIN mata_kuliah as mk
    ON t.id_mata_kuliah = mk.id_mata_kuliah
ORDER BY timestamp_transaksi ASC;

-- NO 6

RENAME TABLE mata_kuliah TO mata_kuliah_baru; 
RENAME TABLE mata_kuliah_baru TO mata_kuliah;

ALTER TABLE mata_kuliah MODIFY kelas VARCHAR(4);
ALTER TABLE mata_kuliah CHANGE durasi durasi_perkuliahan INT;
ALTER TABLE mata_kuliah MODIFY model_perkuliahan CHAR(6) AFTER jenis;
ALTER TABLE mata_kuliah ADD maks_absensi INT AFTER maks_sks;
ALTER TABLE mata_kuliah DROP maks_absensi;
-- 
RENAME TABLE transaksi TO transaksi_baru;
RENAME TABLE transaksi_baru TO transaksi;

ALTER TABLE transaksi MODIFY virtual_account CHAR(10);
ALTER TABLE transaksi CHANGE potongan_biaya diskon DECIMAL(3,2);
ALTER TABLE transaksi MODIFY diskon DECIMAL(3,2) AFTER total_biaya;
ALTER TABLE transaksi ADD disetujui_prodi VARCHAR(5) AFTER jatuh_tempo;
ALTER TABLE transaksi DROP disetujui_prodi;

-- NO 7 

ALTER TABLE transaksi
    ADD CONSTRAINT fk_id_mahasiswa FOREIGN KEY(id_mahasiswa)
    REFERENCES mahasiswa(id_mahasiswa);
ALTER TABLE transaksi
    ADD CONSTRAINT fk_id_mata_kuliah FOREIGN KEY(id_mata_kuliah)
    REFERENCES mata_kuliah(id_mata_kuliah);

-- NO 8

START TRANSACTION;
    UPDATE mata_kuliah SET kuota_tersisa = kuota_tersisa - 1 WHERE id_mata_kuliah = "COMP683931";
    INSERT INTO transaksi VALUES(17060012, 2501472123, "COMP683931", "IT", "2022-12-31 22:00", 2, 500000, 0.10, 7623472123, "lunas", "2023-01-20");
    UPDATE mata_kuliah SET kuota_tersisa = kuota_tersisa - 1 WHERE id_mata_kuliah = "DSGN674407";
    INSERT INTO transaksi VALUES(17060013, 2402125788, "DSGN674407", "DKV", "2022-12-16 08:00", 4, 1000000, NULL, 7623125788, "belum lunas", "2023-01-28");
COMMIT;

-- NO 9

ALTER TABLE mahasiswa
    ADD INDEX identitas_mahasiswa(id_mahasiswa, nama_mahasiswa, jurusan);
SHOW INDEX FROM mahasiswa;

ALTER TABLE mata_kuliah
    ADD INDEX simplified_matkul(nama_mata_kuliah, kelas, nama_dosen);
SHOW INDEX FROM mata_kuliah;

-- RANDOM

SELECT * FROM mahasiswa;
SELECT * FROM mata_kuliah;
SELECT * FROM transaksi;
SELECT * FROM pegawai;
SELECT CONCAT(FLOOR(potongan_biaya * 100),'%') AS potongan_biaya FROM transaksi;

DROP DATABASE universitas;

UPDATE mata_kuliah SET id_mata_kuliah = "DSGN66960" WHERE id_mata_kuliah = "DSGN66950";
UPDATE transaksi SET id_mata_kuliah = "COMP684701" WHERE id_transaksi = "17060006";

ROLLBACK;