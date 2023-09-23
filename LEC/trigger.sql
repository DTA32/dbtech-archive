CREATE DATABASE rekap_nilai;
USE rekap_nilai;
CREATE TABLE trekap(
	kode INT PRIMARY KEY,
    nilai INT,
    tgl DATE NULL
);

DELIMITER $$
CREATE TRIGGER trigger_tgl_masuk
BEFORE INSERT
	ON trekap
    FOR EACH ROW
BEGIN
	SET new.tgl = now();
END$$
DELIMITER ;

INSERT INTO trekap (kode, nilai) VALUES(1,70);
INSERT INTO trekap (kode, nilai) VALUES(2,85);
INSERT INTO trekap (kode, nilai) VALUES(3,60);
INSERT INTO trekap (kode, nilai) VALUES(4,90);
INSERT INTO trekap (kode, nilai) VALUES(5,80);

SELECT * FROM trekap;

SHOW triggers;

DROP TRIGGER trigger_tgl_masuk;

DROP TABLE trekap;