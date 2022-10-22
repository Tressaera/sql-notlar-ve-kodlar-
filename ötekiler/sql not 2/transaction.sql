create database tests;
use tests;
create table tests(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   isim VARCHAR(255) NOT NULL,
   soyisim VARCHAR(255) NOT NULL)
   ENGINE=INNODB;
   START TRANSACTION;
   insert into tests (isim,soyisim) values ('Fatih', 'İRDAY');
   update tests set isim = 'Tunahan' where id = LAST_INSERT_ID();
   commit;