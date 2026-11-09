-- Create Branch table
CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Location VARCHAR2(50),
    Year_of_Establishment INT
);

-- Create Employee table
CREATE TABLE Employee (
    NID CHAR(10) PRIMARY KEY,
    Name VARCHAR2(50),
    BloodGroup CHAR(3),
    Birth_Date DATE,
    Base_Salary DECIMAL(10, 2),
    Housing_Allowance DECIMAL(10, 2),
    Employee_Type VARCHAR2(20),
    BranchID INT REFERENCES Branch(BranchID)
);

-- Create Shift table
CREATE TABLE Shift (
    Shift_ID INT PRIMARY KEY,
    Start_Time TIME,
    Day_of_Week VARCHAR2(10),
    Duration INT
);

-- Create Book table
CREATE TABLE Book (
    ISBN CHAR(13) PRIMARY KEY,
    Title VARCHAR2(50),
    Author VARCHAR2(50),
    Genre VARCHAR2(50),
    Price DECIMAL(10, 2),
    Copies INT,
    Name VARCHAR2(50) REFERENCES Publisher(PublisherName)
);

-- Create Publisher table
CREATE TABLE Publisher (
    Publisher_ID INT PRIMARY KEY,
    Name VARCHAR2(50)
    City VARCHAR2(50),
    Establishment_Year INT
);

-- Create User table
CREATE TABLE User (
    User_ID INT PRIMARY KEY,
    Username VARCHAR2(50) PRIMARY KEY,
    Name VARCHAR2(50),
    Date_of_Birth DATE,
    Hometown VARCHAR2(50),
    Occupation VARCHAR2(50)
);

-- Create Issue table
CREATE TABLE Issue (
    Issue_ID INT PRIMARY KEY,
    Issue_Date DATE,
    Due_Date DATE,
    Return_Date DATE,
    User_ID INT REFERENCES User(Username),
    ISBN CHAR(13) REFERENCES Book(ISBN),
    NID CHAR(10) REFERENCES Employee(NID)
);
