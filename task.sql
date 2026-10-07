-- Создаем базу данных с нуля, чтобы избежать ошибки Unknown database
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- Воссоздаем предустановленную таблицу Countries из условия
CREATE TABLE IF NOT EXISTS Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 1. Таблица GeoIPCache (Колонки строго по ТЗ: ID, IPRange, CountryID)
CREATE TABLE GeoIPCache (
    ID INT NOT NULL,
    IPRange VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- 2. Таблица ProductDescription (Колонки строго по ТЗ: ID, Description, ProductID, CountryID)
CREATE TABLE ProductDescription (
    ID INT NOT NULL,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 3. Таблица Logs (Колонки строго по ТЗ: ID, Timestamp, Message)
-- Для BLACKHOLE НЕЛЬЗЯ использовать PRIMARY KEY или AUTO_INCREMENT
CREATE TABLE Logs (
    ID INT NOT NULL,
    Timestamp DATETIME NOT NULL,
    Message TEXT NOT NULL
) ENGINE=BLACKHOLE;

-- 4. Таблица ProductReporting (Колонки строго по ТЗ: Date, ProductName, Orders)
-- Для CSV все поля ОБЯЗАНЫ быть NOT NULL
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
