CREATE DATABASE HASTANE;
CREATE TABLE HASTALAR4
(hasta_no varchar(6) primary key,
adi varchar(50) not null,
soyadi varchar(50) not null, 
dg_tar date not null,
dg_yeri varchar(55) ,
tckimlik varchar(11) not null ,
kan_grubu  varchar(7) DEFAULT 'RH()',
cinsiyet varchar(5),  
CONSTRAINT chkbak CHECK 
(cinsiyet='Erkek' or cinsiyet='Kadın'),
CONSTRAINT unique key(tckimlik)  );
  
ALTER TABLE HASTALAR4 modify column
tckimlik varchar(11);

INSERT  INTO HASTALAR3(hasta_no,adi,soyadi,dg_tar,dg_yeri,tckimlik) VALUES(
'13','Ayşe','GEL','2001-1-11','BURSA','144233');
  
ALTER TABLE HASTALAR4 ADD 
kayit_tar date  default( curdate());
  
  
CREATE TABLE RANDEVU4
  ( randevu_id int auto_increment primary key,
  hasta_no varchar(5),
  bolum_no varchar(2)not null,
  pers_no varchar(5) not null,
  ran_tar date default (curdate()),
 kontrol_tar date default (date_add(current_date(),interval 14 day))
  );
insert into randevu4(hasta_no,bolum_no,pers_no)
value('18','10','23'),('19','20','25');
  
  CREATE table randevusonuclari 
   select hastalar3.tckimlik,soyadi,bol_adi,ran_tar,kontrol_tar
  from hastalar3,randevu,bolum where 
  hastalar3.hasta_no=randevu.hasta_no and
  randevu.bolum_no=bolum.bolum_no; 
  
  select   count(ot_il_kodu),ot_il_kodu  from ogrenci  group by ot_il_kodu;
  
  desc bolum;
  select * from bolum4;
  CREATE TABLE  BOLUM5
  
  
  as select bolum_no,curdate(),curtime() from randevu ;
  
  
  insert into hastalar4(hasta_no,adi,soyadi,dg_yeri,dg_tar) 
   SELEct hasta_no,'ayşe','DENEME','BURSA','2002-01-03'
  FROM RANDEVU4
  ;
  UPDATE HASTALAR3 set kan_grubu='ABRH-' where hasta_no='13' 
  and kayit_TAR='2022-03-14';
  
   
  
  