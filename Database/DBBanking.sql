CREATE DATABASE DBBankingSystem;

-- CustomerTypes table
CREATE TABLE CustomerTypes 
(
    CustomerTypesCode varchar(15) NOT NULL PRIMARY KEY,
    CustomerTypesName varchar(40) NOT NULL,
    CustomerTypesDescription varchar(255),
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

