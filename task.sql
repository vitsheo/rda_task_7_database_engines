-- Создаем базу данных и переключаемся на неё
CREATE DATABASE ShopDB;
USE ShopDB;

-- 1. Таблица GeoIPCache (Движок MEMORY)
CREATE TABLE GeoIPCache (
    ID INT NOT NULL,
    IPRange VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL
) ENGINE=MEMORY;

-- 2. Таблица ProductDescription (Движок InnoDB, для описания используем чистый TEXT)
CREATE TABLE ProductDescription (
    ID INT NOT NULL,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL
) ENGINE=InnoDB;

-- 3. Таблица Logs (Движок BLACKHOLE)
CREATE TABLE Logs (
    ID INT NOT NULL,
    Timestamp DATETIME NOT NULL,
    Message VARCHAR(50) NOT NULL
) ENGINE=BLACKHOLE;

-- 4. Таблица ProductReporting (Движок CSV)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
