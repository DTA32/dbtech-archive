-- PRAKTIKUM UTS

-- NO 1 
CREATE DATABASE toko_sepatu;
USE toko_sepatu;

-- NO 2
CREATE TABLE pembeli(
	id_pembeli INT PRIMARY KEY NOT NULL,
    nama_pembeli VARCHAR(50) NOT NULL,
    alamat_pembeli VARCHAR(100) NOT NULL,
	no_telp CHAR(11) NOT NULL,
    email VARCHAR(50) NULL
);

CREATE TABLE sepatu(
	id_sepatu INT PRIMARY KEY NOT NULL,
    nama_sepatu VARCHAR(50) NOT NULL,
	merk_sepatu VARCHAR(50) NOT NULL,
    no_sepatu INT NOT NULL,
    harga_sepatu INT NOT NULL,
    stok INT NULL,
    tanggal_produksi DATE NOT NULL
);

CREATE TABLE transaksi(
	no_nota INT PRIMARY KEY NOT NULL,
	tanggal_nota DATE NOT NULL,
	id_pembeli INT NOT NULL,
	id_sepatu INT NOT NULL,
    jumlah_sepatu INT NOT NULL,
    total_harga INT NOT NULL,
    tgl_garansi DATE NULL,
    FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli),
	FOREIGN KEY (id_sepatu) REFERENCES sepatu(id_sepatu)
);

-- NO 3
INSERT INTO pembeli VALUES(22100001, 'Abraham Kusnadi', 'Jln. Setiabudi, no. 56, Bandung', '02264758264',  'abraham@gmail.com');
INSERT INTO pembeli VALUES(22100002, 'Irfan Maulana', 'Jln. Sudirman, no. 143, Surabaya', '03189546272', 'irfan@gmail.com');
INSERT INTO pembeli VALUES(22100003, 'Andi Zulhikam', 'Jln. Ahmad Yani, no. 55, Surabaya', '03142850182', 'andi@gmail.com');
INSERT INTO pembeli VALUES(22100004, 'Ratna Puspasari', 'Jln. Karet, no. 38, Surabaya', '08324891088', 'ratna@gmail.com');
INSERT INTO pembeli VALUES(22100005, 'Ulya Hasanah', 'Jln. Bengawan, no. 21, Bandung', '08170771179', 'ulya@gmail.com');
INSERT INTO pembeli VALUES(22100006, 'Reza Ardief', 'Jln. Biawak, no. 57, Medan', '06141492693', 'reza@gmail.com');
INSERT INTO pembeli VALUES(22100007, 'Ammar Satria', 'Jln. Melayu Besar, no. 68, Jakarta', '02183097295', 'ammar@gmail.com');
INSERT INTO pembeli VALUES(22100008, 'Marza Hamdan', 'Jln. Kridanggo, no. 1, Semarang', '02435597537', 'marza@gmail.com');
INSERT INTO pembeli VALUES(22100009, 'Gita Devi', 'Jln. Matraman Raya, no. 126, Jakarta', '02185909154', 'gita@gmail.com');
INSERT INTO pembeli VALUES(22100010, 'Dessita Monica', 'Jln. Pecenongan, no. 72, Jakarta', '02135043145', 'dessita@gmail.com');

INSERT INTO sepatu VALUES(21220001, 'White Eagle', 'Baginda', 45, 270000, 25, '2020-05-19');
INSERT INTO sepatu VALUES(21220010, 'Super Sonic', 'Champion', 42, 250000, 10, '2021-11-20');
INSERT INTO sepatu VALUES(21220009, 'Blue Dragon', 'Champion', 43, 450000, 35, '2022-01-05');
INSERT INTO sepatu VALUES(21220002, 'Brown Bear', 'Baginda', 36, 290000, 8, '2022-07-18');
INSERT INTO sepatu VALUES(21220003, 'Amazing Tiger', 'Champion', 37, 450000, 6, '2020-08-08');
INSERT INTO sepatu VALUES(21220004, 'Rapid Cheetah', 'Baginda', 36, 580000, 21, '2021-06-09');
INSERT INTO sepatu VALUES(21220005, 'Groovy Alpaca', 'Juara', 42, 500000, 16, '2020-10-25');
INSERT INTO sepatu VALUES(21220006, 'Unique Hyena', 'Legenda', 44, 370000, 4, '2022-02-03');
INSERT INTO sepatu VALUES(21220007, 'Silky Silverfish', 'Legenda', 42, 150000, 0, '2021-05-27');
INSERT INTO sepatu VALUES(21220008, 'Exotic Raccoon', 'Juara', 38, 330000, 21, '2021-01-31');

INSERT INTO transaksi VALUES(221010001, '2022-04-15', 22100001, 21220003, 1, 450000, '2022-04-26');
INSERT INTO transaksi VALUES(221010002, '2022-07-02', 22100002, 21220001, 2, 540000, '2022-07-09');
INSERT INTO transaksi VALUES(221010003, '2022-09-25', 22100003, 21220003, 5, 2250000, '2022-10-02');
INSERT INTO transaksi VALUES(221010004, '2022-06-22', 22100006, 21220005, 2, 1000000, '2022-07-20');
INSERT INTO transaksi VALUES(221010005, '2022-01-19', 22100009, 21220006, 3, 1110000, '2022-02-16');
INSERT INTO transaksi VALUES(221010006, '2022-09-15', 22100005, 21220008, 7, 2310000, '2022-10-13');
INSERT INTO transaksi VALUES(221010007, '2022-07-11', 22100007, 21220002, 5, 1450000, '2022-08-08');
INSERT INTO transaksi VALUES(221010008, '2022-05-10', 22100008, 21220010, 1, 250000, '2022-06-07');
INSERT INTO transaksi VALUES(221010009, '2022-03-18', 22100010, 21220006, 3, 1110000, '2022-04-15');
INSERT INTO transaksi VALUES(221010010, '2022-01-13', 22100006, 21220004, 4, 2320000, '2022-02-10');

-- NO 4
SELECT * FROM sepatu WHERE harga_sepatu > 300000;
SELECT * FROM sepatu WHERE tanggal_produksi > '2022-01-01' OR stok > 20;
SELECT * FROM sepatu WHERE no_sepatu < 40 AND harga_sepatu < 400000;
SELECT * FROM sepatu WHERE no_sepatu > 42 AND stok > 10 OR tanggal_produksi > '2021-06-01';
SELECT * FROM sepatu WHERE NOT(harga_sepatu < 450000);
SELECT * FROM sepatu WHERE nama_sepatu LIKE "__o%";
SELECT * FROM sepatu WHERE merk_sepatu IN('Champion', 'Juara');

SELECT * FROM transaksi WHERE total_harga > 1000000;
SELECT * FROM transaksi WHERE jumlah_sepatu < 4 OR total_harga < 500000;
SELECT * FROM transaksi WHERE tgl_garansi > '2022-06-01' AND jumlah_sepatu > 4;
SELECT * FROM transaksi WHERE tanggal_nota < '2022-06-01' AND total_harga > 750000 OR jumlah_sepatu < 4;
SELECT * FROM transaksi WHERE NOT(jumlah_sepatu < 4);
SELECT * FROM transaksi WHERE total_harga LIKE "1%";
SELECT * FROM transaksi WHERE id_sepatu IN(21220003, 21220006, 21220008);

-- NO 5 
UPDATE transaksi SET jumlah_sepatu = 2 WHERE no_nota = 221010001;
UPDATE transaksi SET total_harga = 900000 WHERE no_nota = 221010001;
UPDATE transaksi SET id_pembeli = 22100004 WHERE no_nota = 221010004;

-- NO 6
DELETE FROM transaksi WHERE no_nota = 221010008;
DELETE FROM transaksi WHERE no_nota = 221010010;

DELETE FROM pembeli WHERE id_pembeli = 22100008;
DELETE FROM pembeli WHERE id_pembeli = 22100006;

DELETE FROM sepatu WHERE id_sepatu = 21220010;
DELETE FROM sepatu WHERE id_sepatu = 21220004;

-- NO 7
DROP DATABASE toko_sepatu;


-- ETC
SELECT * FROM pembeli;
SELECT * FROM sepatu;
SELECT * FROM transaksi;

DROP TABLE transaksi;
DROP TABLE pembeli;
DROP TABLE sepatu;