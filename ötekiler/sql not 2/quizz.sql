create database quiz;
use quiz;

Create table diller (
dil_kodu varchar(2) PRIMARY KEY,
dil_adi varchar(25));

Create table bolum (
bol_no varchar(3) PRIMARY KEY,
bol_adi varchar(25));

create table Personel (
pers_no varchar(5) PRIMARY KEY,
tckimlik_no varchar(11),
adi varchar (20),
soyadi varchar(20),
dog_tar date,
bolum_no varchar(6),
is_bas_tar date,
yab_dil_kodu varchar(4),
ot_il_kodu varchar(2),
bransi varchar(25),
gorevi varchar(25));

create table maaslar(
pers_no varchar(6),
maas_tar date,
gun_ucret int,
gun_sayısı int,
avans int,
iban varchar(26),
brut_ucret int,
net_ucret int,
PRIMARY KEY (pers_no,maas_tar));-- 2 tane birincil anahtar oluşturmuş olduk.

create table iller (
il_kodu varchar(2) PRIMARY KEY,
il_adi varchar (15));

insert into personel (pers_no,tckimlik_no,adi,soyadi,bolum_no,yab_dil_kodu,ot_il_kodu)
values("57894","34273130430", "Mert","Yılmaz", "14","2","16"),
("74185","12345678903", "Orhan","Kara", "17","4","51"),
("96358","36925814701", "Turgay","Yalçın", "11","3","19");

insert into diller values("1","İngilizce"),("2","Almanca"),("3","Fransızca");
insert into iller values("34","İstanbul"),("16","Bursa"),("41","Kocaeli");
insert into bolum values("14","Yazılım"),("18","Donanım"),("11","Bilgi İşlem");

INSERT INTO maaslar (pers_no, maas_tar, gun_ucret, gun_sayısı, avans,iban,brut_ucret,net_ucret) VALUES ("57894", "2022-05-14", "160", "30", "1000","320010009999901234567890","1071","858");
INSERT INTO maaslar (pers_no, maas_tar, gun_ucret, gun_sayısı, avans,iban,brut_ucret,net_ucret) VALUES ("57894", "2022-05-14", "170", "30", "1100","894560009999901234567890","1200","950");
INSERT INTO maaslar (pers_no, maas_tar, gun_ucret, gun_sayısı, avans,iban,brut_ucret,net_ucret) VALUES ("57894", "2022-05-14", "180", "30", "1000","320010009999901234567890","1250","975");

Select adi,soyadi,tckimlik_no,bol_adi,dil_adi from personel,diller,bolum where
yab_dil_kodu = dil_kodu and bol_no =bolum_no order by tckimlik_no;--tabloda tc kimlik numarasına göre artış göstermesi(asc)

SELECT count(*) FROM personel where bolum_no ='11' group by bolum_no;-- personel tablosundan bolum_no'dan 11 numaralı kişiyi listeleyiniz.

Select adi,soyadi,bol_adi,dil_adi,gorevi from personel,bolum,diller 
where bol_no =bolum_no and dil_kodu = yab_dil_kodu;--personelin bildiği dillerin ne olduğu hangi bölümlerde ve hangi görevde olduğunu listeler.

select personel.pers_no,adi,soyadi,net_ucret,iban,maas_tar from personel,maaslar
where maas_tar= "2022-05-14" and personel.pers_no;--maaş bilgileri tablosuna göre bu ay (15/04/22) tarihinde maaş alacak kişilerin belirli şeylere göre listelemesi(pers_no,adi,soyadi)

select personel.pers_no,adi,soyadi,net_ucret,iban,maas_tar from personel,maaslar
where maas_tar= "2022-05-14" and maaslar.pers_no;
