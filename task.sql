CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(100),
    CountryID INT
) ENGINE=MEMORY;

CREATE TABLE ProductDescription (
    ID INT,
    Description TEXT,
    ProductID INT,
    CountryID INT
) ENGINE=InnoDB;

CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message TEXT
) ENGINE=BLACKHOLE;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
