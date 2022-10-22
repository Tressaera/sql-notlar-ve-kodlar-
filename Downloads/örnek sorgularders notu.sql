create database hastane;
use hastane ;
create table hastalar
( hasta_no varchar(8) ,
adi varchar(55) ,
soyadi varchar(55),
tel varchar(11),
gorevi varchar(25) not null,
bransi varchar(20) not null,
ot_il_kodu varchar(2) not null
);
create table randevu 
(ran_no int AUTO_INCREMENT 
primary key  ,
hast_no varchar(12),
adi varchar(55),
soyadi varchar(55),
ran_tar date,
ot_il_kodu varchar(2) not null,
bolum_no varchar(3) not null);

create table bolum 
(bolum_no varchar(3) ,
bolum_Adi varchar(30) not null);

create table maaslar
(pers_no varchar(8),
maas_tar date,
brut_ucret int,
net_ucret int,
avans int,
iban int,
kesinti int,
primary key (pers_no,maas_tar) );

Create table iller
( il_kodu varchar(2) primary key,
ot_il_adi varchar(55) not null);

ALTER TABLE bolum 
Add primary key(bolum_no)
;

ALTER TABLE personel Add iban int;

Alter Table personel Add 
tckimlik varchar (11);
Alter Table personel Add 
primary key (pers_no);
Alter table bolum add 
primary key (bolum_no);

insert into iller values 
("16","Bursa"),("06","Ankara"),("34","İstanbul");


Select count(*) from personel
Where gorevi="dr" or
gorevi="hemsire" or 
gorevi="hasta bakıcı";

Select count(*)
,ot_il_kodu
from hastalar 
group by ot_il_kodu;

update maaslar
set  maas_tar=adddate(curdate(),interval 16 day)
  where pers_no >="101" and 
maas_tar = date("2022/05/15");
commit;

select personel.pers_no,adi,net_ucret
from personel,maaslar
where  personel.pers_no=maaslar.pers_no
and  personel.pers_no in( 
select pers_no
from maaslar
group by pers_no
having avg(net_ucret) >'5000');

 
 https://www.yazilimbilisim.net/veritabani/mssql/sql-dersleri/
https://huseyinahmetoglu.com.tr/veri-tabani-ders-notlari/
https://acikders.ankara.edu.tr/course/view.php?id=3224





