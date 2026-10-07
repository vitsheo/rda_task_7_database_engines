-- 0. Спочатку створюємо саму базу даних і заходимо в неї
CREATE DATABASE ShopDB;
USE ShopDB;

-- 1. Таблиця GeoIPCache (Движок MEMORY)
CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;

-- 2. Таблиця ProductDescription (Движок InnoDB)
CREATE TABLE ProductDescription (
    ID INT,
    Description VARCHAR(50),
    ProductID INT,
    CountryID INT
) ENGINE=InnoDB;

-- 3. Таблиця Logs (Движок BLACKHOLE)
CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message VARCHAR(50)
) ENGINE=BLACKHOLE;

-- 4. Таблиця ProductReporting (Движок CSV)
-- Для CSV обов'язково залишаємо NOT NULL за правилами MySQL
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
