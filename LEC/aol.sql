CREATE DATABASE petshop;
USE petshop;

CREATE TABLE customer(
	CustomerID CHAR(6) PRIMARY KEY NOT NULL,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Address VARCHAR(50),
    PhoneNumber CHAR(13)
);

CREATE TABLE product(
	ProductID CHAR(6) PRIMARY KEY NOT NULL,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Stocks INT,
    Price INT
);

CREATE TABLE kasir(
	CashierID CHAR(6) PRIMARY KEY NOT NULL,
	CashierName VARCHAR(20),
    Address VARCHAR(50),
    PhoneNumber CHAR(13),
    Username VARCHAR(20),
    Pass VARCHAR(20)
);

CREATE TABLE transaction(
	TransactionID CHAR(6),
    TransactionDate DATE,
    CustomerID CHAR(6),
    CashierID CHAR(6),
    Total INT,
    PRIMARY KEY (TransactionID),
    CONSTRAINT fk_cust_id FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
    CONSTRAINT fk_cashier_id FOREIGN KEY (CashierID) REFERENCES kasir(CashierID)
);

CREATE TABLE admin(
	AdminID CHAR(6),
	AdminName VARCHAR(20),
    Username VARCHAR(20),
    Pass VARCHAR(20)
);

CREATE TABLE transaction_detail(
	TrxDetailID CHAR(10),
    TransactionID CHAR(6),
    Quantity INT,
    ProductID CHAR(6),
    PRIMARY KEY (TrxDetailID),
    CONSTRAINT fk_trx_id FOREIGN KEY (TransactionID) REFERENCES transaction(TransactionID),
    CONSTRAINT fk_prd_id FOREIGN KEY (ProductID) REFERENCES product(ProductID)
);