create database sinav1;
use sinav1;

create table ogrenci(
adi varchar(25),
soyadi varchar(25),
adres varchar(50),
bolum_no varchar(10),
ogr_no varchar(10));

create table ogretmen(
ogret_adi varchar(25),
ogret_soyadi varchar(25),
mail varchar(50),
tel varchar(11),
bolum_no varchar(10),
sicil_no varchar(8));

create table notlar(
ogr_no varchar(10),
vize varchar(3),
final varchar(3),
ders_id varchar(5));

create table notlar1(
ogr_no varchar(10),
vize varchar(3),
final varchar(3),
ders_id varchar(5),
ders_kodu varchar(15));

create table bolum(
bolum_no varchar(10),
bolum_adi varchar(20));

create table ders(
ders_id varchar(5),
ders_ad varchar(20),
ders_kodu varchar(15));

insert into ogrenci values("Mert","Yılmaz","Bursa","0587","1067");
insert into ogrenci values("Kerem","Atar","Isparta","0589","619");
insert into ogrenci values("Ahmet","İşcan","Ankara","0591","434");
insert into ogrenci values("Hamit","Kalaycı","Trabzon","0593","22");

insert into ogretmen values("Serkan","Varan","serkanvaran@hotmail.com","12345678910","1234","98748599");
insert into ogretmen values("Murat","Akcan","muratakcan@hotmail.com","10987654321","5678","78548500");
insert into ogretmen values("Halit","Duran","halitduran@hotmail.com","95123574185","9632","85238501");
insert into ogretmen values("Kemal","Akan","kemalakan@hotmail.com","74123568934","7412","96328502");
insert into ogretmen values("Tuğba","Cansu","tugbacansu@hotmail.com","36985214705","7896","74125896");


insert into notlar values("1067","30","70","150");
insert into notlar values("619","80","50","170");
insert into notlar values("434","60","30","180");
insert into notlar values("22","80","90","190");

insert into notlar1 values("1067","30","70","150","123");
insert into notlar1 values("619","80","50","170","456");
insert into notlar1 values("434","60","30","180","789");
insert into notlar1 values("22","80","90","190","741");

insert into bolum (bolum_no,bolum_adi) values("0587","Bilişim");
insert into bolum (bolum_no,bolum_adi) values("0589","Muhasebe");
insert into bolum (bolum_no,bolum_adi) values("0591","Makine");
insert into bolum (bolum_no,bolum_adi) values("0593","Elektrik");

insert into ders values("150","Veri Tabanı","123");
insert into ders values("170","Mikro İktisat","456");
insert into ders values("180","Teknik Resim","789");
insert into ders values("190","Temel Elektronik","741");


select ogrenci.adi, ogrenci.soyadi, notlar.vize, notlar.final from ogrenci, notlar
where ogrenci.ogr_no = notlar.ogr_no;

select adi from ogrenci where ogr_no IN (SELECT ogr_no from notlar where ders_id
= (select ders_id from ders where ders_ad = "Veri Tabanı"));

select adi, soyadi from ogrenci where adres IN ("bursa","ısparta","ankara,","trabzon");

select count(*), ders_id from notlar group by ders_id;

select mail, tel from ogretmen;

select DISTINCT(adres) from ogrenci;

select max(final) from notlar;

select ogr_no from notlar1 where ders_kodu = (select ders_kodu from ders where
sicil_no = (select sicil_no from ogretmen where ogret_adi = "Tuğba" and ogret_soyadi = "Cansu"));

select vize, final from notlar where ogr_no IN (select ogr_no from ogrenci where adi =
"ahmet");

select ders_ad from ders where sicil_no = (select sicil_no from ogretmen where
ogret_adi = "Serkan" and ogret_soyadi = "Varan");

select * from ogrenci where adres NOT IN ("İstanbul");

select LEN(ogret_adi) from ogretmen;

select ogrenci.adi, ogrenci.soyadi, ogrenci.ogr_no from ogrenci, notlar1, ders
where notlar1.ders_kodu = "123" and ders.ders_kodu = notlar1.ders_kodu and
notlar1.ogr_no = ogrenci.ogr_no;

select UPPER(LEFT(ogret_adi,2)) from ogretmen;

select UPPER(RIGHT(ogret_adi,2)) from ogretmen;






