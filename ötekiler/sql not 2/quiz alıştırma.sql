create database quiz;
use quiz;
create table ogr(
isim varchar(35),
soyisim varchar(35),
tel_no varchar(14) default "Girilmedi");

insert into ogr(isim,soyisim) values("Mert","Aydemir");
select*from ogr;

create table notlar(
vize int not null check(vize>=0 and vize<=100));

insert into notlar values(100);
select*from notlar;
truncate table notlar;

create table deneme(
id int,
id2 int,
constraint check (id>=0 and id2>=0));
select*from deneme;
insert into deneme(id,id2) values(2,10);

create table deneme2(
ogrkol varchar(35));
alter table deneme2 rename column ogrkol to ogrkol1;

select*from ogr where isim in('Mert');

select isim,soyisim as'Öğrenci İsim Ve Soyisim' from ogr;

set@sehir='Kahramanmaras';
select@sehir as 'Declare';
set@sayi=100;
select@sayi;

DELIMITER //
CREATE PROCEDURE Prosedur()
BEGIN
  DECLARE benim_adim VARCHAR(50) DEFAULT '';
  SET benim_adim = 'Mert Aydemir';
  
END//
DELIMITER ;
select *from ogr;
insert into ogr(isim,soyisim) values ("Murat","Aydemir");


DELIMITER //
create procedure denemep()
BEGIN
select *from ogr where isim='Mert';
END//
DELIMITER ;

DELIMITER //
create procedure ogr_gir(isim_giris varchar(35),soyisim_giris varchar(35))
BEGIN
declare isim varchar(35) default "Girilmedi";
declare soyisim varchar(35) default "Girilmedi";
set isim=isim_giris;
set soyisim=soyisim_giris;
insert into ogr(isim,soyisim) values(isim,soyisim);
END//
DELIMITER ;

call ogr_gir("Burak","Eyyüpoğlu");
call ogr_gir("Mert","Demiray");

drop procedure ogr_gir;
select *from ogr;

select count(isim) from ogr group by ogr.isim having count(isim)>1;

select isim , soyisim from ogr order by 1;

select *from ogr where isim like "Sel%";

select * from ogr where isim in(select isim from ogr group by isim having count(*)>1);

select isim from ogr union select soyisim from ogr;

select lower(isim) from ogr;
select upper(isim) from ogr;
select ltrim(isim) from ogr;
select trim(isim) from ogr;

DELIMITER //
create procedure ogr_gir2(isim_giris varchar(35),soyisim_giris varchar(35))
BEGIN
insert into ogr(isim,soyisim) values(isim_giris,soyisim_giris);
END//
DELIMITER ;      -- ogr_gir'in daha kısa olan hali bu aradaki declare'lar kaldırılarak yapıldı.

select * from ogr;

set sql_safe_updates=0;









