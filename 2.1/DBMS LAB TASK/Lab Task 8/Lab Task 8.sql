
CREATE TABLE Item (
    ItemID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    UnitPrice DECIMAL(10, 2)
);

CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Division (
    DivisionID INT PRIMARY KEY,
    Name VARCHAR(255),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE District (
    DistrictID INT PRIMARY KEY,
    Name VARCHAR(255),
    FOREIGN KEY (DivisionID) REFERENCES Division(DivisionID)
);

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    Name VARCHAR(255),
    DistrictID INT,
    FOREIGN KEY (DistrictID) REFERENCES District(DistrictID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    DOB DATE,
    ContactNo VARCHAR(15),
    Branch INT,
    Department VARCHAR(255),
    FOREIGN KEY (Branch) REFERENCES Branch(BranchID)
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactNo VARCHAR(15),
    Address VARCHAR(15)
);