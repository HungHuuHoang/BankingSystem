CREATE DATABASE DBBankingSystem;

-- CustomerTypes table
CREATE TABLE CustomerTypes 
(
    CustomerTypesCode varchar(15) NOT NULL PRIMARY KEY,
    CustomerTypesName varchar(40) NOT NULL,
    CustomerTypesDescription varchar(255)
);

-- Customers table
CREATE TABLE Customers 
(
    CustomerID int NOT NULL PRIMARY KEY,
    CustomerName varchar(50) NOT NULL,
    Birthday date NOT NULL,
	Address varchar(100),
	Email varchar(40),
	Phone int,
	UserName varchar(32) NOT NULL,
	Password varchar(32) NOT NULL,
	CustomerTypesCode varchar(15) NOT NULL FOREIGN KEY REFERENCES CustomerTypes(CustomerTypesCode)
);

-- AccountTypes table
CREATE TABLE AccountTypes 
(
    AccountTypesCode varchar(15) NOT NULL PRIMARY KEY,
    AccountTypesName varchar(40) NOT NULL,
    AccountTypesDescription varchar(255)
);

-- Accounts table
CREATE TABLE Accounts 
(
    AccountID int NOT NULL PRIMARY KEY,
    AccountName varchar(50) NOT NULL,
    DateOpened date NOT NULL,
	Balance int NOT NULL,
	AccountStatus varchar(10),
	CustomerID int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID),
	AccountTypesCode varchar(15) NOT NULL FOREIGN KEY REFERENCES AccountTypes(AccountTypesCode)
);

-- TransactionTypes table
CREATE TABLE TransactionTypes
(
    TransactionTypesCode varchar(15) NOT NULL PRIMARY KEY,
    TransactionTypesName varchar(40) NOT NULL,
    AccountTypesDescription varchar(255)
);

-- Transactions table
CREATE TABLE Transactions
(
    TransactionID int NOT NULL PRIMARY KEY,
    DateTransaction date NOT NULL,
	AmountOfTransaction int NOT NULL,
	OtherDetails varchar(255),
	AccountID int NOT NULL FOREIGN KEY REFERENCES Accounts(AccountID),
	TransactionTypesCode varchar(15) NOT NULL FOREIGN KEY REFERENCES TransactionTypes(TransactionTypesCode)
);