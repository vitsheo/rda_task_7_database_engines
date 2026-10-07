-- 0. Просто создаем базу данных и заходим в неё
CREATE DATABASE ShopDB;
USE ShopDB;

-- 1. Таблица GeoIPCache (Движок MEMORY)
CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;

-- 2. Таблица ProductDescription (Движок InnoDB)
CREATE TABLE ProductDescription (
    ID INT,
    Description VARCHAR(50),
    ProductID INT,
    CountryID INT
) ENGINE=InnoDB;

-- 3. Таблица Logs (Движок BLACKHOLE)
CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message VARCHAR(50)
) ENGINE=BLACKHOLE;

-- 4. Таблица ProductReporting (Движок CSV)
-- Важно: для движка CSV по правилам MySQL поля Обязаны быть NOT NULL, иначе база выдаст ошибку
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
