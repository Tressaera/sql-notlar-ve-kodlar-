create database ders;
use ders;

create table ogrenci(
adi varchar(50),
soyadi varchar(50),
adres varchar(50));

create table ogretmen(
ogret_adi varchar(50),
ogret_soyadi varchar(50),
mail varchar(50),
tel varchar(50));

create table notlar(
ogr_no varchar(5),
vize varchar(3),
final varchar(3),
ders_id varchar(4));

create table bolumler(
bol_no varchar(10),
bol_adi varchar(15));

create table ders(
ders_adi varchar(25));

create table urunler(
urun_miktari int,
kategori_no int,
fiyat int,
u_no int);

insert into ogrenci values("Mert","Yılmaz","Bursa");
insert into ogrenci values("Semih","Aksay","Osmaniye");
insert into ogrenci values("Turgay","Yalçın","Bursa");
insert into ogrenci values("Mücahit","Balcı","Erzurum");

insert into ogretmen values("Erdem ","Arslan","erdemarslan@hotmail.com","12345678912");
insert into ogretmen values("Alihan ","Dalgıç","alihandalgic@hotmail.com","12345678912");
insert into ogretmen values("Muharrem ","Tekin","muharremtekinn@hotmail.com","12345678912");
insert into ogretmen values("Ahmet","Işık","ahmetisk@hotmail.com","12345678912");


insert into bolumler values("01","Makine");
insert into bolumler values("02","Elektrik");
insert into bolumler values("03","Bilişim");
insert into bolumler values("04","Muhasebe");
insert into bolumler values("05","Grafik Tasarım");

insert into ders values("Tarih");
insert into ders values("Coğrafya");
insert into ders values("Matematik");
insert into ders values("Türkçe");
insert into ders values("Felsefe");
insert into ders values("Fizik");
insert into ders values("Kimya");
insert into ders values("Biyoloji");

insert into urunler values("1000","01","350","04");
insert into urunler values("1100","03","500","12");
insert into urunler values("1200","05","900","20");
insert into urunler values("1300","07","1200","28");
insert into urunler values("1400","09","1500","35");
insert into urunler values("1500","11","1800","42");
insert into urunler values("1600","13","2100","49");
insert into urunler values("1700","15","2400","56");
insert into urunler values("1800","17","2700","64");
insert into urunler values("1900","19","3000","72");


insert into notlar values("1067","50","55","289");
insert into notlar values("619","30","65","1007");
insert into notlar values("434","70","20","648");
insert into notlar values("22","80","10","09");

select * from ogrenci;

select mail, tel from ogretmen;

select ogr_no from notlar where vize < 50;

Select ogr_no from notlar where final between 20 and 80;

select count(*) from ogrenci;

select adi from ogrenci order by adi ASC;

select DISTINCT(adres) from ogrenci;

select ad, soyad from ogrenci where adres IN ("Erzurum","Osmaniye");


select SUM(vize) from notlar;

select AVG(vize), ders_id from notlar group by ders_id having AVG(vize) > 60;

select SUM(fiyat), kategori_no from urunler where fiyat>100 Group By kategori_no
Having SUM(fiyat)>5000;

select count(*), kategori_no from urunler Group By kategori_no Having Count(*) > 10;

select SUM(fiyat), kategori_no from urunler where fiyat >= 250 group by kategori_no;

select SUM(fiyat), kategori_no from urunler where fiyat > 100 group
by kategori_no having SUM(fiyat) > 1500;

select adi, Count(*) from ogrenci Group by adi;

select adres, count(*) from ogrenci Group by adres;

select count(*), ogret_adi from ogretmen where ogret_adi LIKE 'E%' Group by ogret_adi;

create table kiralama(
plaka varchar(20));

insert into kiralama values("16 ASP 590");
insert into kiralama values("16 ASP 590");
insert into kiralama values("16 ASP 590");
insert into kiralama values("25 KRAL 02");
insert into kiralama values("25 KRAL 02");
insert into kiralama values("38 AA 5900");

select plaka, count(*) from kiralama Group by plaka;

create table rezervasyon(
oda_no varchar(5));

insert into rezervasyon values("05");
insert into rezervasyon values("05");
insert into rezervasyon values("07");
insert into rezervasyon values("07");
insert into rezervasyon values("07");
insert into rezervasyon values("03");

select oda_no, count(*) from rezervasyon Group by oda_no;

create table araclar(
model_id int,
ucret int);

insert into araclar values("01","2000");
insert into araclar values("08","700");
insert into araclar values("04","1500");
insert into araclar values("05","1200");

select SUM(ucret), model_id from araclar group by model_id;

create table musteriler(
m_no int,
ad varchar(20),
soyad varchar(20),
adres varchar(50),
tel varchar(11),
mail varchar(35));

create table urunler1(
u_no int,
u_ad varchar(25),
fiyat int,
stok int,
kategori_no int);

create table kategoriler(
k_no int,
k_adi varchar(25));

create table siparis(
m_no int,
u_no int,
adet int,
fiyat int,
siparis_tar date,
teslim_tar date,
odeme_sekli varchar(5));

create table personel(
depart_no int,
maas int,
cinsiyet varchar(5));

insert into personel values("01","5000","Kadın");
insert into personel values("05","7500","Erkek");
insert into personel values("07","12500","Erkek");
insert into personel values("09","15000","Kadın");

select depart_no, MAX(maas), cinsiyet from personel Group by depart_no,
cinsiyet;
select cinsiyet,count(*) from personel;





