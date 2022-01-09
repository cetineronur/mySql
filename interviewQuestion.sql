CREATE TABLE
personel
(
id int,
isim varchar (50),
sehir varchar (50),
maas int (20),
sirket varchar(20)
);

INSERT INTO personel VALUES (123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel VALUES (234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel VALUES (245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS');
INSERT INTO personel VALUES (456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO personel VALUES (567890124, 'Eddie Murphy', 'Massachuset', 7000,'MICROSOFT');
INSERT INTO personel VALUES (456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel VALUES (123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');


CREATE TABLE
isciler
(
id int,
isim varchar (50),
sehir varchar (50),
maas int (20),
sirket varchar(20)
);

INSERT INTO isciler VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler VALUES (567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler VALUES (456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO isciler VALUES (123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

select * from personel;
select * from isciler;
-- Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen query
SELECT isim,id FROM personel WHERE id in (SELECT id FROM isciler WHERE isciler.id=personel.id);

-- Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
-- Personel tablosunda kac farkli sehirden personel var?
select count(distinct sehir)as sehir_sayisi  from personel;

-- Personel tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Query yaziniz
select * from personel where mod(id,2)=0;

-- Personel tablosunda kac tane kayit oldugunu gosteren query yazin
select count(id) as kayit_sayisi from personel;

-- Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin 
select * from isciler where maas in(select max(maas) from isciler);

-- Personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
select * from personel where maas in(select min(maas) from personel);

-- Isciler tablosunda ikinci en yuksek maasi gosteren query yazin
select max(maas) from isciler where maas<>(select max(maas) from isciler);

-- Isciler tablosunda ikinci en dusuk maasi alan iscinin tum bilgilerini gosteren query yazin
select min(maas), isim, id, sehir, sirket from isciler where maas<>(select min(maas) from isciler);

-- Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini
select * from isciler where maas<>(select max(maas) from isciler) order by maas desc;

