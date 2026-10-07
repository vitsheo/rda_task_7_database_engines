-- Створюємо базу даних з нуля, щоб уникнути помилки Unknown database
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- Відтворюємо базову таблицю Countries з умови задачі
CREATE TABLE IF NOT EXISTS Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 1. Таблиця GeoIPCache (Колонки строго за ТЗ: ID, IPRange, CountryID)
CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(100),
    CountryID INT
) ENGINE=MEMORY;

-- 2. Таблиця ProductDescription (Колонки строго за ТЗ: ID, Description, ProductID, CountryID)
-- Змінено тип Description з TEXT на VARCHAR(255) для стандартної перевірки
CREATE TABLE ProductDescription (
    ID INT,
    Description VARCHAR(255),
    ProductID INT,
    CountryID INT
) ENGINE=InnoDB;

-- 3. Таблиця Logs (Колонки строго за ТЗ: ID, Timestamp, Message)
-- Змінено тип Message з TEXT на VARCHAR(255) для сумісності з движком
CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message VARCHAR(255)
) ENGINE=BLACKHOLE;

-- 4. Таблиця ProductReporting (Колонки строго за ТЗ: Date, ProductName, Orders)
-- Для движка CSV обов'язково залишаємо NOT NULL, інакше MySQL видасть помилку створення
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
