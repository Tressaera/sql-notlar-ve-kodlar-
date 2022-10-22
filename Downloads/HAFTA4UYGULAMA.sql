CREATE DATABASE HASTANE;
CREATE TABLE HASTALAR3
(hasta_no varchar(6) primary key,
adi varchar(50) not null,
soyadi varchar(50) not null, 
dg_tar date not null,
dg_yeri varchar(55) ,
tckimlik varchar(11) not null ,
kan_grubu  varchar(5) DEFAULT 'RH()',
cinsiyet varchar(5),  
CONSTRAINT  CHECK 
(cinsiyet='E' or cinsiyet='K'),
CONSTRAINT unique key(tckimlik)  );
  
DROP TABLE HASTALAR2;

INSERT  INTO HASTALAR3(hasta_no,adi,soyadi,dg_tar,dg_yeri,tckimlik) VALUES(
'13','Ayşe','GEL','2001-1-11','BURSA','144233');
  
ALTER TABLE HASTALAR3 ADD kayit_tar date
  default( current_date());
CREATE TABLE RANDEVU
  ( randevu_id int auto_increment primary key,
  hasta_no varchar(5),
  bolum_no varchar(2)not null,
  pers_no varchar(5) not null,
  ran_tar date default (current_date()),
  kontrol_tar date default (date_add(current_date(),interval 20 day))
  );
insert into randevu(hasta_no,bolum_no,pers_no)
value('14','10','23'),('15','20','25');
  CREATE TABLE  BOLUM
  as select bolum_no from randevu ; 
  
  select   count(ot_il_kodu),ot_il_kodu  from ogrenci  group by ot_il_kodu;
  
  desc bolum;
  select * from bolum4;
  CREATE TABLE  BOLUM4
  
  
  as select bolum_no from randevu ;
  
  
  insert into hastalar(hasta_no,adi,soyadi,dg_yeri,dg_tar,tckimlik) 
   SELEct hasta_no,'ayşe','DENEME','BURSA','2002-01-03',tckimlik
  FROM RANDEVU
  ;
  UPDATE HASTALAR3 set kan_grubu='ABRH-' where hasta_no='13' 
  and kayit_TAR='2022-03-14';
  
  commİT;
  
 set sql_safe_updates=1;
  
  