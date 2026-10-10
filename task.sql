-- Create GeoIPCache table with MEMORY engine for maximum performance (data loss on restart is fine)
CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Create ProductDescription table with InnoDB engine for data protection and high read performance
CREATE TABLE ProductDescription (
    ID INT,
    Description TEXT,
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create Logs table with BLACKHOLE engine to accept data without storing it
CREATE TABLE Logs (
    ID INT,
    Timestamp TIMESTAMP,
    Message TEXT
) ENGINE=BLACKHOLE;

-- Create ProductReporting table with CSV engine to store data as a comma-separated flat file
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
