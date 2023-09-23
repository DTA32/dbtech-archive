USE perpustakaan1;
SELECT * FROM peminjaman as p INNER JOIN anggota_perpustakaan as ap ON ap.id_anggota = p.id_anggota;
SELECT id_anggota FROM anggota_perpustakaan UNION SELECT id_anggota FROM peminjaman;

SELECT nomor_peminjaman, ap.id_anggota, nama_anggota, id_buku, tgl_pinjam, tgl_kembali
FROM peminjaman as p 
LEFT JOIN anggota_perpustakaan as ap 
ON ap.id_anggota = p.id_anggota
UNION
SELECT nomor_peminjaman, ap.id_anggota, nama_anggota, id_buku, tgl_pinjam, tgl_kembali
FROM peminjaman as p
RIGHT JOIN anggota_perpustakaan as ap
ON ap.id_anggota = p.id_anggota;

SELECT nomor_peminjaman, p.id_buku, judul, tahun_terbit, jenis_buku, tgl_pinjam, tgl_kembali
FROM buku as b 
INNER JOIN peminjaman as p
ON b.id_buku = p.id_buku
ORDER BY judul ASC;

SELECT nomor_peminjaman, id_buku, ap.id_anggota, nama_anggota, alamat, kota, no_telp AS no_hp, points, tgl_pinjam, tgl_kembali
FROM anggota_perpustakaan as ap
INNER JOIN peminjaman as p
ON ap.id_anggota = p.id_anggota
WHERE nomor_peminjaman = 210819001;

-- SLIDE 30

SELECT
	pegawai.id_petugas,
    pegawai.nama_petugas,
    pegawai.melaporkan_kepada,
    kepala.nama_petugas
FROM petugas_perpustakaan as pegawai
JOIN petugas_perpustakaan as kepala
	ON pegawai.melaporkan_kepada = kepala.id_petugas;
    
SELECT
	peminjaman.nomor_peminjaman,
    peminjaman.id_buku,
    anggota.id_anggota,
    anggota.nama_anggota,
    anggota.kota,
    peminjaman.tgl_pinjam,
    peminjaman.tgl_kembali
FROM perpustakaan.peminjaman as peminjaman
JOIN anggota_perpustakaan.anggota_perpustakaan as anggota
	ON peminjaman.id_anggota = anggota.id_anggota;
    
SELECT
	p.nomor_peminjaman,
	ap.id_anggota,
	ap.nama_anggota,
	b.id_buku,
	b.judul,
	p.tgl_pinjam,
	p.tgl_kembali
FROM peminjaman as p
JOIN anggota_perpustakaan as ap
	ON p.id_anggota = ap.id_anggota
JOIN buku b 
	ON p.id_buku = b.id_buku;
    
USE bandara;

SELECT 
	jk.nomor_penerbangan,
    pen.id_penumpang,
    pen.nama_penumpang,
    pes.id_pesawat,
    pes.maskapai,
    pes.tipe_pesawat,
    jk.tujuan,
    jk.jadwal
FROM jadwal_keberangkatan as jk
JOIN penumpang as pen
	ON jk.nomor_penerbangan = pen.nomor_penerbangan
JOIN pesawat as pes
	ON jk.id_pesawat = pes.id_pesawat
ORDER BY nama_penumpang ASC;SELECT * FROM bandara.jadwal_keberangkatan;
