-- Убедитесь, что вы подключены к вашей базе данных ShopDB
-- USE ShopDB;

-- 1. Таблица GeoIPCache (Одобрено ментором)
-- Движок MEMORY для максимальной скорости в RAM, данные могут быть утеряны при перезагрузке.
CREATE TABLE GeoIPCache (
    ID INT NOT NULL AUTO_INCREMENT,
    IPRange VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- 2. Таблица ProductDescription (ИСПРАВЛЕНО на InnoDB)
-- Движок InnoDB обеспечивает защиту от потери данных при перезагрузке и оптимизирован для чтения.
CREATE TABLE ProductDescription (
    ID INT NOT NULL AUTO_INCREMENT,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 3. Таблица Logs (ДОБАВЛЕНО)
-- Движок BLACKHOLE: принимает данные, но ничего не сохраняет на диск.
CREATE TABLE Logs (
    ID INT NOT NULL,
    LogMessage TEXT NOT NULL,
    LogDate DATETIME NOT NULL
) ENGINE=BLACKHOLE;

-- 4. Таблица ProductReporting (ДОБАВЛЕНО)
-- Движок CSV: хранит данные в текстовом файле. Все поля должны быть NOT NULL.
CREATE TABLE ProductReporting (
    ID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    TotalSales INT NOT NULL,
    ReportDate DATE NOT NULL
) ENGINE=CSV;
