-- Убедитесь, что вы подключены к нужной базе данных
-- USE ShopDB;

-- 1. Создание таблицы GeoIPCache с движком MEMORY
CREATE TABLE GeoIPCache (
    ID INT NOT NULL AUTO_INCREMENT,
    IPRange VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- 2. Создание таблицы ProductDescription с движком MyISAM
CREATE TABLE ProductDescription (
    ID INT NOT NULL AUTO_INCREMENT,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;
-- 1. Заполняем справочник стран (InnoDB)
INSERT INTO Countries (ID, Name) VALUES
(1, 'USA'),
(2, 'Germany'),
(3, 'Kazakhstan');

-- 2. Заполняем кэш IP-адресов (MEMORY)
INSERT INTO GeoIPCache (IPRange, CountryID) VALUES
('192.168.1.0-192.168.1.255', 1),
('10.0.0.0-10.0.0.255', 2),
('95.56.0.0-95.57.255.255', 3);

-- 3. Заполняем описания товаров на разных языках (MyISAM)
INSERT INTO ProductDescription (Description, ProductID, CountryID) VALUES
('Smartphone with great camera', 101, 1),
('Smartphone mit toller Kamera', 101, 2),
('Смартфон с отличной камерой', 101, 3);
