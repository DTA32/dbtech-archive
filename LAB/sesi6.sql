USE perpustakaan_baru;

SELECT * FROM peminjaman;

SELECT * FROM BUKU 
WHERE status_peminjaman IS NULL;

RENAME TABLE anggota_perpustakaan TO anggota_perpus;

ALTER TABLE anggota_perpus MODIFY nama_anggota CHAR(100);

ALTER TABLE anggota_perpus CHANGE alamat alamat_anggota CHAR(100);

ALTER TABLE buku ADD catatan VARCHAR(100) AFTER jumlah;

ALTER TABLE buku DROP catatan;

CREATE TABLE peminjaman2(
	id_peminjaman INT,
    id_anggota INT,
    id_buku INT,
    PRIMARY KEY (id_peminjaman),
    CONSTRAINT fk_id_anggota FOREIGN KEY(id_anggota) REFERENCES anggota_perpus(id_anggota),
    CONSTRAINT fk_id_buku FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);

ALTER TABLE peminjaman
ADD CONSTRAINT fk2_id_anggota FOREIGN KEY(id_anggota) 
REFERENCES anggota_perpus(id_anggota),
ADD CONSTRAINT fk2_id_buku FOREIGN KEY(id_buku)
REFERENCES buku(id_buku); 

ALTER TABLE peminjaman DROP FOREIGN KEY fk2_id_anggota;

ALTER TABLE peminjaman2 DROP FOREIGN KEY fk_id_anggota;
ALTER TABLE peminjaman2 DROP INDEX fk_id_anggota;

-- SELECT * FROM peminjaman WHERE id_anggota = '19050002' or true--''; 

CREATE TABLE buku2(
	id_buku INT,
    judul VARCHAR(100),
    pengarang VARCHAR(100),
    tahun_terbit YEAR,
    CONSTRAINT PRIMARY KEY(id_buku),
    INDEX judul_idx(judul),
    INDEX pengarang_idx(pengarang),
    Index tahun_terbit_idx(tahun_terbit),
    INDEX kombinasi_idx(judul,pengarang,tahun_terbit)
);

SHOW CREATE TABLE buku2;

ALTER TABLE buku
	ADD INDEX kombinasi_idx(
    id_buku, judul, pengarang, penerbit, jenis_buku
);

ALTER TABLE buku DROP INDEX kombinasi_idx;

-- No 1
RENAME TABLE buku TO buku_terbaru;
ALTER TABLE buku_terbaru CHANGE pengarang pengarang_terkini VARCHAR(50);
ALTER TABLE buku_terbaru MODIFY jenis_buku CHAR(100) AFTER tahun_terbit;
ALTER TABLE buku_terbaru ADD kondisi CHAR(8);
ALTER TABLE buku_terbaru DROP kondisi;

SELECT * FROM buku_terbaru;

-- No 2
CREATE TABLE produk_mini_market(
	id_produk INT,
    nama_produk VARCHAR(100),
    jenis VARCHAR(50),
    tgl_kadaluarsa DATE,
    harga INT,
    stok INT,
    supplier VARCHAR(100),
    tgl_masuk DATE,
    PRIMARY KEY(id_produk)
);

CREATE TABLE transaksi(
	id_transaksi INT,
    id_customer INT,
    id_produk INT,
    jumlah_pembelian INT,
    tgl_transaksi DATE,
    total_harga INT,
    PRIMARY KEY(id_transaksi),
    CONSTRAINT fk_id_produk FOREIGN KEY (id_produk) REFERENCES produk_mini_market(id_produk)
);

SHOW CREATE TABLE transaksi;