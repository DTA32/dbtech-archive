CREATE DATABASE sekolah;
CREATE DATABASE sekolah_lama;

USE sekolah;

DROP DATABASE sekolah_lama;

-- CREATE TABLE 3 tabel
CREATE TABLE siswa(
	id_siswa INT PRIMARY KEY NOT NULL,
    nama_siswa VARCHAR(50) NOT NULL,
    jenis_kelamin CHAR(1) NOT NULL,
    tgl_lahir DATE NOT NULL,
    no_telp CHAR(13) NOT NULL,
    alamat VARCHAR(100) NOT NULL,
    tahun_masuk YEAR NOT NULL,
    status_aktif INT NOT NULL
);

CREATE TABLE guru(
	id_guru INT PRIMARY KEY NOT NULL,
    nama_guru VARCHAR(50) NOT NULL,
    jenis_kelamin CHAR(1) NOT NULL,
    no_telp CHAR(13) NOT NULL,
    alamat VARCHAR(100) NOT NULL,
    status_aktif INT NOT NULL
);

CREATE TABLE mata_pelajaran(
	id_matpel INT PRIMARY KEY NOT NULL,
    nama_matpel VARCHAR(30) NOT NULL,
    id_guru INT NOT NULL,
    periode CHAR(9) NOT NULL
);

-- INSERT siswa 7 data
INSERT INTO siswa VALUES (181910010, 'Budi', 'L', '2003-06-29', '08312345678', 'Jl. Buahbatu No. 23', '2018', '1');
INSERT INTO siswa VALUES (181910011, 'Asih', 'P', '2003-01-17', '08535334073', 'Jl. Bawal No. 35', '2018', '1');
INSERT INTO siswa VALUES (181910012, 'Kusuma', 'L', '2003-04-13', '08832172933', 'Jl. Asia Afrika No. 481', '2018', '1');
INSERT INTO siswa VALUES (192010010, 'Rudi', 'L', '2004-05-04', '08732189300', 'Jl. Dumai No. 17', '2019', '1');
INSERT INTO siswa VALUES (192010011, 'Laras', 'P', '2004-10-17', '08132111400', 'Jl. Anggrek No. 84', '2019', '1');
INSERT INTO siswa VALUES (192010012, 'Bunga', 'P', '2004-07-08', '08993124587', 'Jl. Bambu No. 43', '2019', '1');
INSERT INTO siswa VALUES (171810010, 'Cinta', 'P', '2001-12-18', '08132112100', 'Jl. Ciliwung No. 4', '2017', '0');

-- INSERT guru 7 data
INSERT INTO guru VALUES (32181005, 'Siti', 'P', '08131245789', 'Jl. Cikini No. 13', '0');
INSERT INTO guru VALUES (32182001, 'Dodi', 'L', '08170003021', 'Jl. Burangrang No. 7', '1');
INSERT INTO guru VALUES (32182002, 'Ruhiyat', 'L', '08132111345', 'Jl. Martadinata No. 20', '1');
INSERT INTO guru VALUES (32182003, 'Ida', 'P', '08221314543', 'Jl. Flores No. 192', '1');
INSERT INTO guru VALUES (32182004, 'Pradana', 'L', '08872105332', 'Jl. Imam Bonjol No. 96', '1');
INSERT INTO guru VALUES (32182005, 'Haryati', 'P', '08281040753', 'Jl. Ternate No. 104', '1');
INSERT INTO guru VALUES (32182006, 'Heru', 'L', '08733596455', 'Jl. Basket No. 35', '1');

-- Insert matpel 7 data
INSERT INTO mata_pelajaran VALUES (1718901, 'Matematika', '32181005', '2017-2018');
INSERT INTO mata_pelajaran VALUES (1920901, 'Fisika', '32182001', '2019-2020');
INSERT INTO mata_pelajaran VALUES (1920902, 'Biologi', '32182002', '2019-2020');
INSERT INTO mata_pelajaran VALUES (1920903, 'Kimia', '32182003', '2019-2020');
INSERT INTO mata_pelajaran VALUES (1920904, 'Bahasa Indonesia', '32182004', '2019-2020');
INSERT INTO mata_pelajaran VALUES (1920905, 'Sejarah', '32182005', '2019-2020');
INSERT INTO mata_pelajaran VALUES (1920906, 'Sosiologi', '32182006', '2019-2020');

-- SELECT * FROM siswa;
-- SELECT * FROM guru;
-- SELECT * FROM mata_pelajaran;

-- DROP DATABASE sekolah;