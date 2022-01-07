use sys;
CREATE TABLE calisanlar 
  ( 
        id CHAR(4), 
        isim VARCHAR(50), 
        maas int(5), 
        CONSTRAINT id_pk PRIMARY KEY (id) 
    ); 
 
    INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000); 
    INSERT INTO calisanlar VALUES( '1002', 'Mehmet Yılmaz' ,12000); 
    INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215); 
    INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000); 
  
    CREATE TABLE aileler 
    ( 
        id CHAR(4), 
        cocuk_sayisi VARCHAR(50), 
        ek_gelir int(5), 
        CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id) 
    ); 
     
    INSERT INTO aileler VALUES('1001', 4, 2000); 
    INSERT INTO aileler VALUES('1002', 2, 1500); 
    INSERT INTO aileler VALUES('1003', 1, 2200); 
    INSERT INTO aileler VALUES('1004', 3, 2400);
    
    -- Veli  Han'ın  maaşına  %20  zam  yapacak  update  komutunu  yazınız.  
    update calisanlar set maas=maas+maas*20/100 where isim='Veli Han'; 
    select * from calisanlar;
    
    -- Maaşı  ortalamanın  altında  olan  çalışanların  maaşına  %20  zam  yapınız. 
	update calisanlar set maas=maas+maas*20/100 where maas< (select avg(maas) 
    from (select maas from calisanlar)vs);
    
    -- Çalışanların  isim  ve  cocuk_sayisi'ni  listeleyen  bir  sorgu  yazınız. 
    
    
    -- calisanlar' ın  id, isim ve toplam_gelir'lerini gösteren bir sorgu yazınız.  
      toplam_gelir = calisanlar.maas + aileler.ek_gelir 
      
	-- Eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın 
    -- maaşına ek %10 aile yardım zammı yapınız.  
    -- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
  