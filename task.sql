-- Создаем базу данных и заходим в неё
CREATE DATABASE ShopDB;
USE ShopDB;

-- 1. Таблица GeoIPCache (MEMORY)
CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;

-- 2. Таблица ProductDescription (InnoDB)
-- Никаких NOT NULL и TEXT. Используем стандартный VARCHAR(50)
CREATE TABLE ProductDescription (
    ID INT,
    Description VARCHAR(50),
    ProductID INT,
    CountryID INT
) ENGINE=InnoDB;

-- 3. Таблица Logs (BLACKHOLE)
-- Только стандартные типы без ограничений и ключей
CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message VARCHAR(50)
) ENGINE=BLACKHOLE;

-- 4. Таблица ProductReporting (CSV)
-- Для CSV движка MySQL требует NOT NULL, оставляем только его
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
