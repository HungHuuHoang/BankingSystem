CREATE DATABASE DBBankingSystem;

-- 1. CustomerTypes table
CREATE TABLE CustomerTypes
(
    CustomerTypesCode varchar(15) NOT NULL PRIMARY KEY,
    CustomerTypesName varchar(40) NOT NULL,
    CustomerTypesDescription varchar(255)
);

-- 2. Customers table
CREATE TABLE Customers
(
    CustomerID int NOT NULL PRIMARY KEY,
    CustomerName varchar(50) NOT NULL,
    Birthday date NOT NULL,
	Address varchar(255),
	Email varchar(40),
	Phone int,
	UserName varchar(32) NOT NULL,
	Password varchar(32) NOT NULL,
	CustomerTypesCode varchar(15) NOT NULL FOREIGN KEY REFERENCES CustomerTypes(CustomerTypesCode)
);

-- 3. AccountTypes table
CREATE TABLE AccountTypes
(
    AccountTypesCode varchar(15) NOT NULL PRIMARY KEY,
    AccountTypesName varchar(40) NOT NULL,
    AccountTypesDescription varchar(255)
);

-- 4. Accounts table
CREATE TABLE Accounts
(
    AccountID int NOT NULL PRIMARY KEY,
    AccountName varchar(50) NOT NULL,
    DateOpened date NOT NULL,
	Balance int NOT NULL,
    AvailableBalance int,
    Interest float NOT NULL,
    MaturityDate date,
	AccountStatus varchar(10),
	CustomerID int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID),
	AccountTypesCode varchar(15) NOT NULL FOREIGN KEY REFERENCES AccountTypes(AccountTypesCode)
);

-- 5. TransactionTypes table
CREATE TABLE TransactionTypes
(
    TransactionTypesCode varchar(15) NOT NULL PRIMARY KEY,
    TransactionTypesName varchar(40) NOT NULL,
    AccountTypesDescription varchar(255)
);

-- 6. Transactions table
CREATE TABLE Transactions
(
    TransactionID int NOT NULL PRIMARY KEY,
    DateTransaction date NOT NULL,
	AmountOfTransaction int NOT NULL,
	OtherDetails varchar(255),
	AccountID int NOT NULL FOREIGN KEY REFERENCES Accounts(AccountID),
	TransactionTypesCode varchar(15) NOT NULL FOREIGN KEY REFERENCES TransactionTypes(TransactionTypesCode)
);

-- 7. Admin Table
CREATE TABLE Admin
(
    AdminID varchar(15) NOT NULL PRIMARY KEY,
    AdminName varchar(50) NOT NULL,
    Birthday date,
    Address varchar(255),
    OtherDetails varchar(255),
    Email varchar(40),
	Phone int
);

-- 8. Users Table
CREATE TABLE Users
(
    UserName varchar(32) NOT NULL PRIMARY KEY,
	Password varchar(32) NOT NULL,
    UserTypesCode varchar(15) NOT NULL FOREIGN KEY REFERENCES UserTypes(UserTypesCode)
);

-- 9. UserTypes Table
CREATE TABLE UserTypes
(
    UserTypesCode varchar(15) NOT NULL PRIMARY KEY,
    UserTypesName varchar(15) NOT NULL,
    UserTypesDescription varchar(255)
);

-- 10. Cards Table
CREATE TABLE Cards
(
    CardNumber varchar(20) NOT NULL PRIMARY KEY,
	CustomerName varchar(50),
    DateOfIssue date NOT NULL,
    ExpiredDate date NOT NULL,
    CardStatus varchar(15),
    CardTypesCode varchar(20) NOT NULL FOREIGN KEY REFERENCES CardTypes(CardTypesCode),
    AccountID int NOT NULL FOREIGN KEY REFERENCES Accounts(AccountID)
);

-- 11. CardTypes Table
CREATE TABLE CardTypes
(
    CardTypesCode varchar(20) NOT NULL PRIMARY KEY,
	CardTypesName varchar(50) NOT NULL,
    CardTypesDescription varchar(255)
);
