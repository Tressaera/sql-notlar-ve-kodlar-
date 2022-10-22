Use e_ticaret
go
--Create Table deneme ( id int identity(1,1) primary key not null,
--						ad varchar(20) not null,
--						soyad varchar(30) not null)

--ALter table deneme 
--add adres varchar(100) not null

--insert into deneme (ad,soyad, adres) values ('Ahmet','yýlmaz','samsun')
--Drop Table deneme


Select m_no, count(*) as 'Yapýlan Alýþveriþ Sayýsý' from satis Group by m_no

Select UPPER(ad) +' ' +Upper(soyad) from musteriler

Select distinct(adres) from musteriler

Select Count(*) from urunler

Select SUM(fiyat) from urunler

Select urunler.u_ad, kategoriler.k_ad from urunler, kategoriler Where urunler.kategori_id=kategoriler.k_id and urunler.fiyat between 100 and 500

Select LEFT(ad , LEN(ad)/2) from musteriler

Select kategori_id, avg(fiyat) from urunler Group by kategori_id

Select m_no , count(*) from satis Group by m_no

Select * from musteriler where ad like '%e%' and ad like '%g%'

select ad, soyad from musteriler where ad like '_ _A%'

Select adres,tel from musteriler where ad like '%N'

Select soyad from musteriler Where soyad like '_A_ _ _'

Select Max(fiyat) from urunler

Select * from urunler Where stok=0

Select * from musteriler where adres not in('samsun','ordu','izmir')

Update musteriler set adres='Ýstanbul' where ad='ahmet' and soyad='öztürk'

Delete from urunler where u_barkod='22'

Select urunler.u_ad, urunler.fiyat, kategoriler.k_ad from urunler, kategoriler where urunler.kategori_id=kategoriler.k_id

Select musteriler.ad, urunler.u_ad from urunler, musteriler, satis where musteriler.m_no=satis.m_no and urunler.u_barkod=satis.u_barkod
