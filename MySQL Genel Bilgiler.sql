/* ÖĞRETİCİ 1: CREATE komutu ile database oluşturma */

CREATE DATABASE Github;

/* ÖĞRETİCİ 2: CREATE komutu ile tablo oluşturma */

CREATE TABLE calisanlar (
		id int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
        adi varchar(20),
        soyadi varchar(20),
        departman varchar(20),
        maas int(5) 
);
/* ÖĞRETİCİ 3: ALTER komutu */

ALTER TABLE calisanlar ADD email varchar(50); -- kolon ekledi
ALTER TABLE calisanlar DROP COLUMN email; -- Kolonu sildi

/* ÖĞRETİCİ 4: DROP komutu */

DROP TABLE MisliTable;

/* ÖĞRETİCİ 5: TRUNCATE tablo içerisindeki verileri siler */

TRUNCATE TABLE MisliTable;

/* ÖĞRETİCİ 6: WHERE, OR, AND, İN, LIKE  */

SELECT * FROM calisanlar
WHERE maas>=3000 and adi='Misli'; -- and ve anlamına gelir 

SELECT * FROM Calisanlar
WHERE maas>=3000 or adi='Misli'; -- or ya da anlamına gelir

SELECT * FROM calisanlar
WHERE maas IN (2000, 3000, 4000); -- maas kolonunda 2000, 3000, 4000 değerlere sahip olanları getir

SELECT * FROM calisanlar
WHERE adi LIKE '%a%'; -- içerisinde a harfi bulunan

/* ÖĞRETİCİ 7: INSERT INTO */

INSERT INTO calisanlar (adi, soyadi, departman, maas) VALUES('Misli', 'Çelik', 'Yazılım', 13000);
INSERT INTO calisanlar (id, adi, soyadi) VALUES('Misli','Çelik' , 7000);

/* ÖĞRETİCİ 8: UPDATE Komutu */

UPDATE calisanlar SET maas=10000
Where id=7;

/* ÖĞRETİCİ 9: DELETE Komutu */

DELETE FROM MisliTable WHERE id=5;

/* ÖĞRETİCİ 10: DISTINCT (FARKLI) */

SELECT DISTINCT adi FROM calisanlar; -- isme göre gruplama yaptık. Aynı isimler bir araya toplandı

/* ÖĞRETİCİ 11: ORDER BY Komutu */

SELECT * FROM calisanlar
ORDER BY maas; -- Sıralama komutudur.ASC küçükten büyüğe ve DESC büyükten küçüğe

/* ÖĞREETİCİ 12: AS (gibi, olarak) Komutu */

SELECT adi AS isim FROM calisanlar;

/* ÖĞRETİCİ 13: BETWEEN komutu */

SELECT *
FROM calisanlar
WHERE maas BETWEEN 10000 AND 20000; -- Bu iki sayı arasında
-- Between deyimi Select ve Where deyimleri ile birlikte kullanılan bir deyimdir. 
-- Between deyimi bir veri listesindeki bir alana ait verilerin belli bir alan aralığında, 
-- belli bir değer aralığında olanlarının gösterilmesi için kullanabiliriz.

/* ÖĞRETİCİ 14: LIKE Komutu */

SELECT * FROM calisanlar WHERE adi LIKE "A%"; -- A harfi ile başlayanları getir %A A ile bitenleri getir ...

/* ÖĞRETİCİ 15: Aritmetik Operatörler & Fonksiyonlar */

SELECT 16+6 AS 'TOPLAM', 16-6 AS 'FARK', 16*6 AS 'ÇARPIM', 16/6 AS 'BÖLÜM';
-- Bir tabloymuş gibi getirir.

-- BİRLEŞTİRME FONKSİYONU

SELECT CONCAT(adi,' ', soyadi) AS 'AD SOYAD'  FROM calisanlar;
-- çıktıda MİSLİ ÇELİK gibi sonuçlar elde edilir.

-- SUBSTRİNG 

SELECT SUBSTRING('MİSLİ ÇELİK', 1, 5); -- MİSLİ

-- LEFT

SELECT LEFT('MİSLİ ÇELİK',5); -- MİSLİ

-- RİGHT

SELECT RIGHT('MİSLİ ÇELİK',5); -- ÇELİK

-- LOWER

SELECT LOWER('MİSLİ ÇELİK'); -- Hepsini küçük harfe çevirdi

-- UPPER

SELECT UPPER('misli çelik'); -- Hepsini büyük yaptı

-- LENGTH yani LEN

SELECT LENGTH('Misli Çelik'); -- Kaç karakter olduğunu (karekter sayısını) bize verir

-- REPLACE

SELECT REPLACE('Misli Çelik', 'Misli', 'Mismis'); -- Mismis Çelik
-- REPLACE('değiştirelecek alan', 'alandaki değiştirelecek yer', 'ne olarak değiştirilecekse')

-- REVERSE

SELECT REVERSE('Misli'); -- ilsiM, tersine çevirir

/* ÖĞRETİCİ 16: Sayısal Fonksiyonlar */

-- ABS Mutlak değer

SELECT ABS(-5);

-- CELLİNG sayıyı üste yuvarlar

SELECT CEILING(45.868); -- 46
SELECT CEILING(45.868) AS 'Tutar';

-- FLOOR Aşağıya yuvarlar

SELECT FLOOR(45.868); -- 45
SELECT FLOOR(45.868) AS 'Tutar'; -- 45

-- ROUND En yakın tam sayıya yuvarlama

SELECT ROUND(45.868, 1); -- 45,9
SELECT ROUND(45.868, 2); -- 45,87

-- POWER Üs almak için kullanılır

SELECT POWER(2,4); --  üzeri 4 yani 16

-- SQRT Karekök alma komutu

SELECT SQRT(25); -- 5

-- SUM Toplam komutu

SELECT SUM(maas) FROM calisanlar; -- 60500

-- AVG Ortalama

SELECT AVG(maas) FROM calisanlar; -- 8642.8571

-- Max

SELECT MAX(maas) FROM calisanlar;  -- group by ile

-- Min

SELECT MIN(maas) FROM calisanlar; -- group by ile

-- COUNT Sayaç yani kaç değer varsa döndürür

SELECT COUNT(maas) FROM calisanlar;

/* ÖĞRETİCİ 17: Tarih Fonksiyonları */

-- NOW() anlık tarih ve saat

SELECT NOW(); 

-- CURDATE() şu anki tarihi verir 

SELECT CURDATE();

-- CURTIME() şu anki saati verir

SELECT CURTIME();

-- DATE_ADD() tarihlere gün, ay ve yıl olarak ekleme yapar

SELECT DATE_ADD('1998-06-20', INTERVAL 34 DAY); -- 1998-07-24
SELECT DATE_ADD('1998-06-20', INTERVAL 20 MONTH); -- 2000-02-20
SELECT DATE_ADD('1998-06-20', INTERVAL 3 YEAR); -- 2001-06-20
SELECT DATE_ADD('1998-06-20', INTERVAL 34 WEEK); -- 1999-02-13

-- ADDDATE()KOMUTU DA DATE_ADD Komutuna benzer şekilde kullanılır

SELECT ADDDATE('1998-06-20', INTERVAL 34 DAY); -- 1998-07-24
SELECT ADDDATE('1998-06-20', INTERVAL 34 MONTH); -- 2000-02-20
SELECT ADDDATE('1998-06-20', INTERVAL 34 YEAR); -- 2001-06-20
SELECT ADDDATE('1998-06-20', INTERVAL 34 WEEK); -- 1999-02-13

-- Tarih ve saat ekleme-çıkarma işlemleri
SELECT DATE_ADD('1998-06-20 23:59:59', INTERVAL '1:1' MINUTE_SECOND); -- 1998-06-21 00:01:00
SELECT DATE_SUB('1998-06-20 00:00:00', INTERVAL '1 1:1:1' DAY_SECOND); -- 1998-06-18 22:58:59
SELECT DATE_ADD('1998-06-20 00:00:00', INTERVAL '-1 10' DAY_HOUR); -- 1998-06-18 14:00:00
SELECT DATE_SUB('1998-06-20', INTERVAL 34 DAY); -- 1998-05-17

SELECT '1998-06-20 23:59:59' + INTERVAL 1 SECOND; -- 1998-06-21 00:00:00
SELECT INTERVAL 1 DAY + '1998-06-20'; -- 1998-06-21
SELECT '1998-06-20 ' - INTERVAL 1 SECOND ; -- 1998-06-19 23:59:59

SELECT ADDTIME('1998-06-20 23:59:59.999999', '1 1:1:1.000002'); -- 1998-06-22 01:01:01.000001
SELECT ADDTIME('04:00:00.444', '05:00:00.33336') ; -- 1998-06-22 01:01:01.000001

-- DAYNAME(date) Tarihin gün ismini döndürür.

SELECT DAYNAME('1998-06-20'); -- SATURDAY

-- DATEDİFF Tarihler arasındaki gün farkını verir

SELECT DATEDIFF(CURDATE(), '1998-06-20'); -- 8429

-- EXTRACT(hangi zaman dilimi FROM tarih) Bu fonksiyon ile bir tarihin herhangi bir parçasını alabiliriz

SELECT EXTRACT(YEAR FROM '1998-06-20'); -- 1998
SELECT EXTRACT(YEAR_MONTH FROM '1998-06-20 04:02:03'); -- 199806
SELECT EXTRACT(DAY_MINUTE FROM '1998-06-20 04:02:03'); -- 200402
SELECT EXTRACT(MICROSECOND FROM '1998-06-20 15:30:00.000444'); -- 444


/* ÖĞRETİCİ 18: GROUP BY */

SELECT departman, COUNT(*)
FROM calisanlar
GROUP BY departman; -- Hangi departmanda kaç kişi çalışıyor

SELECT maas, COUNT(*) from calisanlar
GROUP BY maas
HAVING maas>3500; -- maası 3500'den fazla olan departmanlara göre kaç kişi var

SELECT manager_id, COUNT(*) from employees
GROUP BY manager_id
HAVING manager_id IS NOT NULL;

/* ÖĞRETİCİ 19: WHERE ile birleştirme */

SELECT COUNTRY_NAME, COUNTRY_CODE, COUNTRY_ID
FROM COUNTRIES, REGIONS 
WHERE COUNTRİES.ID=REGİONS.COUNTRY_ID;

/* ÖĞRETİCİ 20: INNER JOIN */

SELECT COUNTRY_NAME, COUNTRY_CODE, COUNTRY_ID
FROM COUNTRIES C 
INNER JOIN REGIONS R ON C.ID=R.COUNTRY_ID;
-- İnner Join kesişen bilgileri birleştirir

/* ÖĞRETİCİ 21: JOİN Kullanımları */

-- INNER JOİN TÜM EŞLEŞMELERİ GETİRİR

SELECT c.country_name, c.region_id, r.region_name FROM countries c 
INNER JOIN regions r ON r.region_id=c.region_id;

-- LEFT JOİN HEM KESİŞİMLERİ HEM DE SOL TARAFTAKİ TÜM TABLO VERİLERİNİ GETİRİR

SELECT c.country_name, c.region_id, r.region_name FROM countries c 
LEFT JOIN regions r ON c.region_id=r.region_id;

-- RİGHT JOİN HEM KESİŞİMLERİ HEM DE SAĞ TARAFTAKİ TÜM TABLO VERİLERİNİ GETİRİR

SELECT c.country_name, c.region_id, r.region_name FROM countries c 
RIGHT JOIN regions r ON c.region_id=r.region_id;

/* ÖĞRETİCİ 22: ALT SORGU-SUBQUERY */

-- Alt sorgu bazı join işlemlerinin yetersiz kaldığı 
-- hatta fonksiyonların bile yetersiz kaldığı durumlarda 
-- bir tane daha sorgu oluşturmaktır.

SELECT * FROM calisanlar
WHERE maas=(SELECT MAX(maas) FROM calisanlar);
-- Burada sadece en yüksek maaşı değil en yüksek maaşın kime ait olduğunu göstermiş olduk

SELECT * FROM calisanlar
WHERE maas=(SELECT MAX(maas) FROM calisanlar WHERE departman='Yazılım');
-- Yazılımcı olan çalışanlar içerisinden hangisinin maaşının en yüksek olduğunu bulduk

SELECT adi FROM calisanlar
WHERE maas=(SELECT MAX(maas) FROM calisanlar);
-- En fazla maaş alan kişinin ismi Ayça

SELECT departman FROM calisanlar
WHERE maas=(SELECT MAX(maas) FROM calisanlar);
-- En fazla maaş alan kişinin departmanı Yazılım


/* ÖĞRETİCİ 23: UPDATE Komutu */

UPDATE calisanlar -- UPDATE GÜNCELLEME İŞLEMİ YAPAR
SET adi='Ayça'  -- (SET komutu değişken atamak için kullanılır)
WHERE id=6;


/* ÖĞRETİCİ 24: Değişken Tanımlama */

SET @adi := 'misli' ;
SELECT  @adi;

--

SET @sayi := 10,
	@toplam := @sayi+@sayi;
SELECT @toplam;

--

SET @sayi1 := 30,
	@sayi2 := 20,
	@toplam := @sayi1+@sayi2;
SELECT @toplam;

--

SET @sayi1 := 30,
	@sayi2 := 20,
	@carpim := @sayi1*@sayi2;
SELECT @carpim;

--

SET @sayi1 := 30,
	@sayi2 := 20,
	@cikarma := @sayi1-@sayi2;
SELECT @cikarma;

--

SET @sayi1 := 30,
	@sayi2 := 20,
	@bolme := @sayi1/@sayi2;
SELECT @bolme;

--

SET @sayi1 := 30,
	@sayi2 := 20,
    @toplama := @sayi1+@sayi2,
	@cikarma := @sayi1-@sayi2,
    @carpma := @sayi1*@sayi2,
    @bolme := @sayi1/@sayi2;
SELECT @toplama ,@cikarma, @carpma, @bolme;

--

SELECT @enfazlamaas := max(maas) FROM calisanlar; -- 13000

--

SET @adi:='Misli Çelik';
SELECT LENGTH(@adi);

--

SELECT @enfazlamaas := max(maas) FROM calisanlar;
SELECT * FROM calisanlar WHERE maas=@enfazlamaas;
-- 6, Ayça, Çelik, Yazılım, 13000

--

/* ÖĞRETİCİ 25: İF KOMUTU */

SELECT *, IF( maas > 80000, 'Fazla', 'Yeterli') AS durum FROM calisanlar;
-- tabloda maaşa göre bir fazla ya da yeterli ibaresi konmuştur

/* 	ÖĞRENCİ 26: İF-ELSEİF-ELSE Yapısı */

DELIMITER //
CREATE PROCEDURE son(IN calisan INT, OUT verilen VARCHAR(50))
BEGIN

IF calisan <50 THEN
  SET verilen = 'Şirketiniz yeni olmalı';
ELSEIF calisan = 50 THEN
  SET verilen = 'Şirketinizi geliştirebilmişsiniz';
ELSEIF calisan > 50 THEN
  SET verilen = 'Gelişmiş Bir Şirketsiniz';
ELSE
  SET verilen = 'Bir sorun mu var?';
END IF;

END//
DELIMITER ;

SET @durum = 0;
CALL son(44, @durum);
SELECT @durum;

-- OUT, IN Komutunun tersidir


/* SELECT 
IF     'kosul_ifadesi' THEN 'komutlar1'
ELSEIF 'kosul_ifadesi' THEN 'komutlar2'
ELSE 'komutlar3'
END IF
FROM tablo */

