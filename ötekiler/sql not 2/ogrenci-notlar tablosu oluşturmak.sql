create database ogrenci;
use ogrenci;
create table ogrenci(
isim varchar(35),
soyisim varchar(35));
alter table ogrenci add column ogr_no varchar(2);
select*from ogrenci;
insert into ogrenci(isim,soyisim,ogr_no) values("Mert","Yılmaz","10");
create view ogrencisim as select isim from ogrenci;
select*from ogrencisim;

create table notlar(
ogr_no varchar(3),
not_id varchar(3));

insert into ogrenci values ("Eymen","Navdar","11");
select*from ogrenci;

insert into notlar values("10","001"),("11","002");
insert into notlar values("","003");

select isim,not_id,ogrenci.ogr_no from ogrenci,notlar
where ogrenci.ogr_no=notlar.ogr_no;

insert into ogrenci values("Mert","Aydemirr","12");
select*from ogrenci;
update ogrenci set soyisim="Aydemir"
where ogr_no="12";

set sql_safe_updates=0;




