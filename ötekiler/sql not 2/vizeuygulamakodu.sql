1)--alter table personel  add column bolum_no varchar(10);
alter table personel add column iban varchar(26);
alter table personel add column tckimlik varchar(11);

2)--alter column add primary key(pers_no,iban,tckimlik);

3)--alter table bolumn drop primary key;
alter table bolumler add primary key(bol_kodu),

4)--select count(*) gorevi  from personel where gorevi="doktor" or gorevi="hemşire" or gorevi="hasta bakıcısı" group by gorevi;

5)--select count(*) il_adi  from hastalar,iller
where hastalar.ot_il=il_kodu group by il_adi;

6)--insert into randevu(hasta_no,ran_tar_bolum_no,pers_no);
values("101",curdate(),"35","45678");

7)--update randevu set randevu_tar=curdate()+10
where randevu_tar=curdate()and durumu="Gelmedi";

8)--update randevu set randevu_tar=curdate()+14
where randevu_tar=curdate();

9)--select hastalar.adi,soyadi,bol_adi,personel.adi,soyadi,bransi from hastalar,bolumler,personel
where hastalar.hasta_no=randevu.hasta_no
and personelç.pers_no=randevu.pers_no
and bolumler.bol_kodu=randevu.bolum_no
and randevu_tar=curdate();

10)select hastalar.hasta_no,adi,soyadi,bol_adi,personel.pers_no,randevu_tar,kontrol_tar
 from hastalar,bolumler,personel,randevu
 where randevu.hasta_no=hastalar.hasta_no
 and randevu.pers_no=personel.pers_no
 and randevu bolum_no=bolumler.bol_kodu
 and randevu tar=curdate()+1;
 
 11)--create table maaslar(
 pers_no varchar(10),
 iban varchar(26),
 gun_ucret int,
 cal_gun int,
 brut_ucret,
 net_ucret,
 avans int
 maas_tar date);
 update maaslar set avans=1500;
 
12)--update maaslar set brut=(gun_ucret*cal_gun)
where maas_tar=curdate();
update maaslar set net(brut-(brut-brut*2-avans)
where maas_tar=curdate();

13)--a)--select*from personel where gorevi="doktor"or gorevi="hemsire" avg(net_ucret)>7000;

b)--select personel.pers_no,adi,soyadi,maaslar.net from personel,maaslar
where bolum_no=bol_kodu and maaslar.pers_no=personel.pers_no;




