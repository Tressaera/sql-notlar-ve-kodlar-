create database hastane;
use hastane;
create table hastalar(
hasta_id varchar(9) primary key,
adi varchar(55) not null,
soyadi varchar(55) not null,
ot_il_kodu varchar(2),
tc_kimlik varchar(11) unique key,
dg_yeri varchar(55),
kan_grubu varchar(7) default 'rh()',
cinsiyet varchar(5),
constraint check

(cinsiyet='kadın' or cinsiyet='erkek'),
constraint unique key(tc_kimlik));

select*from hastalar;