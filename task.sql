-- Создаем базу данных с нуля, чтобы избежать ошибки Unknown database
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- Воссоздаем предустановленную таблицу Countries (указана в условии задачи),
-- так как база данных создается заново
CREATE TABLE IF NOT EXISTS Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 1. Таблица GeoIPCache (Движок MEMORY для максимальной производительности в RAM)
CREATE TABLE GeoIPCache (
    ID INT NOT NULL AUTO_INCREMENT,
    IPRange VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- 2. Таблица ProductDescription (Движок InnoDB для защиты данных от потери при перезагрузке)
CREATE TABLE ProductDescription (
    ID INT NOT NULL AUTO_INCREMENT,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 3. Таблица Logs (Движок BLACKHOLE: принимает данные, но не сохраняет их)
CREATE TABLE Logs (
    ID INT NOT NULL,
    Timestamp DATETIME NOT NULL,
    Message TEXT NOT NULL
) ENGINE=BLACKHOLE;

-- 4. Таблица ProductReporting (Движок CSV: требует NOT NULL для всех полей)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
