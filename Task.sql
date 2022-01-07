use sys;
create table hastaneler
(
ID char(5) primary key,
ISIM varchar(20),
SEHIR varchar(20),
OZEL varchar(4)
);

insert into hastaneler values('H101','ACI MADEM HASTANESI','ISTANBUL','Y');
insert into hastaneler values('H102','HASZEKI HASTANESI','ISTANBUL','N');
insert into hastaneler values('H103','MEDIKOL HASTANESI','IZMIR','Y');
insert into hastaneler values('H104','NEMORYIL HASTANESI','ANKARA','Y');

create table hastalar
(
KIMLIK_NO char(20) primary key,
ISIM varchar(20),
TESHIS varchar(20)
);

insert into hastalar values('12345678901','ALI CAN','GIZLI SEKER');
insert into hastalar values('45678901121','AYSE YILMAZ','HIPER TANSIYON');
insert into hastalar values('78901123451','STEVE JOB','PANKREATIT');
insert into hastalar values('12344321251','TOM HANKS','COVID19');

create table bolumler
(
BOLUM_ID char(20) primary key,
BOLUM_ADI varchar(20)
);

insert into bolumler values('DHL','Dahiliye');
insert into bolumler values('KBB','Kulak-Burun-Bogaz');
insert into bolumler values('NRJ','Noroloji');
insert into bolumler values('GAST','Gastroloji');
insert into bolumler values('KRD','Kardiyoloji');
insert into bolumler values('PSK','Psikiyatri');
insert into bolumler values('GOZ','Goz Hastaliklari');

create table hasta_kayitlar
(
KIMLIK_NO char(20) primary key,
HAST_ISIM varchar(20) ,
HASTANE_ADI varchar(20) null,
BOLUM_ADI varchar(20) null,
TESHIS varchar(20) null
);
insert into hasta_kayitlar values('1111','NO NAME','NULL','NULL','NULL');
insert into hasta_kayitlar values('2222','NO NAME','NULL','NULL','NULL');
insert into hasta_kayitlar values('3333','NO NAME','NULL','NULL','NULL');

update hasta_kayitlar set hast_isim='Salvadore Dali', HASTANE_ADI='John Hopins', bolum_adi='Noroloji',
 teshis='Parkinson', kimlik_no='99991111222' where KIMLIK_NO='3333';
 SELECT * FROM hasta_kayitlar;
 
 update hasta_kayitlar set HAST_ISIM=(select isim from hastalar where isim='Ali Can')
 where KIMLIK_NO='1111';
 
 -- hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile 
 
 update hasta_kayitlar set HASTANE_ADI=(select ISIM from hastaneler where ID='H104')
 where KIMLIK_NO='1111';
 
 -- bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
 
 update hasta_kayitlar set bolum_adi=(select bolum_adi from bolumler WHERE BOLUM_ID='DHL')
 where KIMLIK_NO='1111';
 
 -- teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile
 
 update hasta_kayitlar set TESHIS=(select TESHIS from hastalar where isim='Ali Can')
 where KIMLIK_NO='1111';
 
 -- kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile 
 
 update hasta_kayitlar set kimlik_no=(select kimlik_no from hastalar where ISIM='Ali Can')
 WHERE KIMLIK_NO='1111';
 
 -- hasta_kayıtlar tablosundaki ‘2222’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.  
 -- hasta_isim :  hastalar tablosundaki ‘Ayşe Yılmaz’ ismi ile
 
 update hasta_kayitlar set HAST_ISIM=(select ISIM from hastalar where ISIM='Ayse Yilmaz')
 where KIMLIK_NO='2222';
 
 -- hastane_adi: hastaneler tablosundaki 'H103' bolum_id kodlu hastanenin ismi ile
 update hasta_kayitlar set hastane_adi=(select isim from hastaneler where id='H103')
 WHERE KIMLIK_NO='2222';
SELECT * FROM hasta_kayitlar;

-- bolum_adi: bolumler tablosundaki ‘KBB’ bolum_id kodlu bolum_adi ile 

update hasta_kayitlar set bolum_adi=(select bolum_id from bolumler where BOLUM_ID='KBB')
WHERE KIMLIK_NO='2222';
SELECT * FROM hasta_kayitlar;
 
-- teshis: hastalar tablosundaki ‘Tom Hanks' isimli hastanın teshis bilgisi ile 
update hasta_kayitlar set teshis=(select teshis from hastalar where isim='Tom Hanks')
WHERE KIMLIK_NO='2222';
SELECT * FROM hasta_kayitlar;

-- kimlik_no: hastalar tablosundaki 'Stevev Job' isimli hastanın kimlik_no kodu ile
update hasta_kayitlar set kimlik_no=(select kimlik_no from hastalar where isim='Steve Job')
WHERE KIMLIK_NO='2222';
SELECT * FROM hasta_kayitlar;