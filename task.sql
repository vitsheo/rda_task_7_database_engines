USE ShopDB;

CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
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
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
