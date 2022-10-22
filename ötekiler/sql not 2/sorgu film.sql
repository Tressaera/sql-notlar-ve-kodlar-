create database sorgu;
use sorgu;

create table filmler(
Film_ID int PRIMARY KEY not null,
Ad varchar(50),
Tarih date,
IMDB_Puan int);

create table Film_Tur(
Film_ID int,
Tur_ID int);

create table Oyuncu_Film(
Oyuncu_ID int,
Film_ID int);

create table Turler(
Tur_ID int PRIMARY KEY not null,
Ad varchar(50));

create table Oyuncular(
Oyuncu_ID int PRIMARY KEY not null,
Ad varchar(50),
soyad varchar(50));

insert into filmler values("001","Forrest Gump","2008-05-14","8");
insert into filmler values("002","Yüzüklerin Efendisi","2009-04-13","7");
insert into filmler values("003","Enigma","2012-08-19","8");
insert into filmler values("004","47 Ronin","2011-02-11","6");

insert into Film_Tur values("001","047");
insert into Film_Tur values("002","048");
insert into Film_Tur values("003","049");
insert into Film_Tur values("004","050");

insert into Oyuncu_Film values("100","001");
insert into Oyuncu_Film values("101","002");
insert into Oyuncu_Film values("102","003");
insert into Oyuncu_Film values("103","004");

insert into Turler values("047","Dram");
insert into Turler values("048","Fantastik");
insert into Turler values("049","Bilim Kurgu");
insert into Turler values("050","Savaş");

insert into Oyuncular values("100","Tom","Hanks");
insert into Oyuncular values("102","Natalia","Portman");
insert into Oyuncular values("103","Keira","Knightley");
insert into Oyuncular values("104","Yuto", "Nagatomo");

Bu sorgu bize Tom Hanks’in oynadığı filmleri getirsin ;
SELECT Ad FROM Filmler WHERE Film_ID IN (SELECT Film_ID FROM Oyuncu_Film WHERE Oyuncu_ID=(SELECT Oyuncu_ID FROM Oyuncular WHERE Ad = "Tom" AND soyad = "Hanks"));

Türü dram olan filmlerin Adlarını ve IMDB Puanlarını listeleyelim ;
SELECT Ad, IMDB_Puan FROM Filmler WHERE Film_ID IN (SELECT Film_ID FROM Film_Tur WHERE Tur_ID IN (SELECT Tur_ID FROM Turler WHERE Ad = "Dram"));

Natalia Portman’ın oynadığı film sayısını bulalım ;
SELECT COUNT(Film_ID) AS Film_Sayisi FROM Filmler WHERE Film_ID IN ( SELECT Film_ID FROM Oyuncu_Film  WHERE Oyuncu_ID IN (SELECT Oyuncu_ID FROM Oyuncular WHERE Ad = "Natalia" AND Soyad = "Portman"));

IMDB Puanı, tüm filmlerin IMDB Puanlarının ortalamasından büyük olan dram filmlerin adlarını, IMDB puanlarını ve tarihlerini listeleyelim ;
SELECT Ad, Tarih, IMDB_Puan FROM Filmler WHERE IMDB_Puan >(SELECT AVG(IMDB_Puan) FROM Filmler )
AND Film_ID IN (SELECT Film_ID  FROM Film_Tur WHERE Tur_ID IN (SELECT Tur_ID  FROM Turler WHERE Ad = "Dram"));

Tom Hanks’in oynadığı dramatik filmlere bakalım ;
SELECT Ad FROM Filmler WHERE Film_ID IN (SELECT Film_ID FROM Oyuncu_Film WHERE Oyuncu_ID =(SELECT Oyuncu_ID  FROM Oyuncular  WHERE Ad LIKE "Tom%" ) )
AND Film_ID IN ( SELECT Film_ID FROM Film_Tur WHERE Tur_ID = (SELECT Tur_ID  FROM Turler WHERE Ad LIKE "Dra%" ));

 
   
  
   
  
      

 
 
     


 

     
    
  

  
      
    
     




 




  

