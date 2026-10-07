-- 1. Таблица GeoIPCache (Одобрено ментором)
-- Движок MEMORY для максимальной скорости в RAM.
CREATE TABLE GeoIPCache (
    ID INT NOT NULL AUTO_INCREMENT,
    IPRange VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- 2. Таблица ProductDescription (Исправлено на InnoDB)
-- Движок InnoDB обеспечивает защиту от потери данных при перезагрузке.
CREATE TABLE ProductDescription (
    ID INT NOT NULL AUTO_INCREMENT,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 3. Таблица Logs (Исправлены имена колонок на Message и Timestamp)
-- Движок BLACKHOLE: принимает данные, но ничего не сохраняет на диск.
CREATE TABLE Logs (
    ID INT NOT NULL,
    Message TEXT NOT NULL,
    Timestamp DATETIME NOT NULL
) ENGINE=BLACKHOLE;

-- 4. Таблица ProductReporting (Исправлена структура: Date, ProductName, Orders)
-- Движок CSV: хранит данные в текстовом файле. Все поля должны быть NOT NULL.
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
