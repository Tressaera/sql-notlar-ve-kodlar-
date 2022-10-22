CREATE DATABASE KUTUP;
USE KUTUP;
CREATE TABLE ODUNC
(odunc_id int auto_increment primary key,
uye_no varchar(11),
kitap_no varchar(10),
alis_tar date not null,
iade_tar date ,
ceza_puani int);

CREATE or replace view CEZAPUANGOR  As 
SELECT ODUNC.uye_no,adi,uyeler.soyadi,kitap_no,ceza_puani
FROM ODUNC,UYELER
where ODUNC.uye_no=UYELER.uye_no and DURUM='BORÇLU';
DROP view cezapuangor;
TRUNCATE    cezapuangor;

CREATE   TABLE UYELER  
( uye_no varchar(11),
 adi varchar(25),
 soyadi varchar(35),
 primary key(uye_no))
 ;
 INSERT INTO ODUNC(uye_no,alis_tar ) SELECT uye_no,curdate() from UYELER ;
 
 
 SELECT sum(ceza_puani) FROM kutup.odunc;
select  DURUM,count(*) FROM ODUNC GROUP BY durum;


select U.uye_no,sum(ceza_puani),u.adi 
FROM ODUNC,UYELER U
WHERE ODUNC.uye_no=U.uye_no
 GROUP BY ODUNC.uye_no
 HAving sum(ceza_puani)<>NULL or sum(ceza_puani)>0;
 
 
 select uye_no,sum(ceza_puani) FROM ODUNC
 GROUP BY uye_no;
 
 SELECT uye_no,ceza_puani from  cezapuangor
 where uye_no in(Select uye_no from uyeler where adi='ali');
 
 
 CREATE TABLE DENEME  AS 
 select ODUNC.uye_no,adi,soyadi,durum,ceza_puani 
 from ODUNC,UYELER where ODUNC.uye_no=UYELER.uye_no;
 
 insert into deneme(uye_no) select uye_no from uyeler;
 
 SELECT * FROM kutup.odunc
;
ALTER TABLE ODUNC ADD durum varchar(10) default 'BORÇLU';
INSERT INTO  odunc (uye_no,kitap_no,alis_tar,iade_tar)
values ('134','25',curdate(),date_add(curdate(),interval 25 day));

CREATE   TABLE UYELER  
( uye_no varchar(11),
 adi varchar(25),
 soyadi varchar(35),
 primary key(uye_no))
 ;
 INSERT INTO ODUNC(uye_no,alis_tar ) SELECT uye_no,curdate() from UYELER ;
 