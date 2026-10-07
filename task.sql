-- Создаем базу данных, если её еще нет в системе
CREATE DATABASE IF NOT EXISTS ShopDB;

-- Переключаемся на неё
USE ShopDB;

-- 1. Таблица GeoIPCache (Движок MEMORY для максимальной скорости в RAM)
CREATE TABLE GeoIPCache (
    ID INT NOT NULL AUTO_INCREMENT,
    IPRange VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- 2. Таблица ProductDescription (Движок InnoDB для защиты данных от потери)
CREATE TABLE ProductDescription (
    ID INT NOT NULL AUTO_INCREMENT,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 3. Таблица Logs (Движок BLACKHOLE, колонки Message и Timestamp)
CREATE TABLE Logs (
    ID INT NOT NULL,
    Message TEXT NOT NULL,
    Timestamp DATETIME NOT NULL
) ENGINE=BLACKHOLE;

-- 4. Таблица ProductReporting (Движок CSV, колонки Date, ProductName, Orders)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

