-- ОБОВ'ЯЗКОВО: Обираємо базу даних перед створенням таблиць, щоб тести в CI пройшли успішно
USE ShopDB;

-- 1. Таблиця GeoIPCache (Одобрено ментором)
-- Движок MEMORY для максимальної швидкості в RAM.
CREATE TABLE GeoIPCache (
    ID INT NOT NULL AUTO_INCREMENT,
    IPRange VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- 2. Таблиця ProductDescription (Виправлено за рев'ю)
-- Движок InnoDB захищає дані від втрати та оптимізований під читання.
CREATE TABLE ProductDescription (
    ID INT NOT NULL AUTO_INCREMENT,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 3. Таблиця Logs (Виправлено назви колонок на Message та Timestamp)
-- Движок BLACKHOLE: приймає дані, але нічого не зберігає.
CREATE TABLE Logs (
    ID INT NOT NULL,
    Message TEXT NOT NULL,
    Timestamp DATETIME NOT NULL
) ENGINE=BLACKHOLE;

-- 4. Таблиця ProductReporting (Виправлено структуру за рев'ю: Date, ProductName, Orders)
-- Движок CSV: зберігає дані у текстовому файлі. Усі поля мають бути NOT NULL.
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
