CREATE DATABASE HASTANE
; 
use hastane;
CREATE TABLE HASTALAR
( hasta_id varchar(5) not null
, adi varchar(35) not null,
soyadi varchar(35) not null,
tc_kimlik varchar(11) unique,
adres varchar(55) ,
ot_il_kodu varchar(2) not null, 
bas_bolno varchar(2) default '10',
primary key(hasta_id));

insert into hastalar(hasta_id,adi,soyadi,tc_kimlik,ot_il_kodu) values('14','Ahmet','demir','3456','16');

select * from hastalar;

CREATE TABLE BOLUMLER( 
bol_no varchar(2) primary key,
bol_adi varchar(26) not null
);
CREATE TABLE RANDEVU (
ran_id int(11) auto_increment primary key,

ran_hasta_no varchar(5) not null ,
tckimlik_no varchar(11) not null,
bol_kodu varchar(2) not null,
dr_no varchar(9) not null,
ran_tarih date not null, ran_saati varchar(5));

ALTER TABLE HASTALAR modify column  bas_bolno  varchar(2) not null;
CREATE TABLE ILLER
(il_kodu varchar(2) primary key,
 il_Adi varchar(29))
 ;
 SELECT hasta_id,adi,soyadi,bol_adi,il_adi
 
 FROM HASTALAR,BOLUMLER,ILLER
 where HASTALAR.ot_il_kodu=ILLER.il_kodu and
 HASTALAr.bas_bolno=BOLUMLER.BOL_NO;
 ;
 
 DELIMITER //
 
 Create PROCEDURE hastagetir()
  Begin 
 SELECT hasta_id,adi,soyadi,bol_adi,il_adi
  FROM HASTALAR,BOLUMLER,ILLER
 where HASTALAR.ot_il_kodu=ILLER.il_kodu and
 HASTALAr.bas_bolno=BOLUMLER.BOL_NO;
 End//
 delimiter ;
 
set @country='90 ';
set @sehirsayisi1=0;

DELIMITER //

  CREATE PROCEDURE ilsayisi1(IN country CHAR(3), OUT sehirsayisi1 INT)
       BEGIN
	SELECT COUNT(*) INTO sehirsayisi1
    FROM ILLER WHERE ulkekodu = country;
       END// 
       DELimiter;
     
        

