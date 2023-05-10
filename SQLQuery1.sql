
CREATE TABLE Suppliers
(
	SupplierId INT IDENTITY NOT NULL,
	[NAME] NVARCHAR(30) NOT NULL,

	ProductId INT NOT NULL,

	PRIMARY KEY (SupplierId)
);

ALTER TABLE Suppliers
	ADD CONSTRAINT FK_Suppliers_ProductId_Products_ProductId FOREIGN KEY (ProductId)
		REFERENCES Products(ProductsId)


CREATE TABLE Orders
(
	OrderId INT IDENTITY NOT NULL,
	[Date] DATE NOT NULL,
	Price INT NOT NULL,

	BuyerId INT NOT NULL,
	OrderDetailId INT NOT NULL,

	PRIMARY KEY (OrderId)
);

CREATE TABLE OrderDetails
(
	OrderDetailId INT IDENTITY NOT NULL,
	Quantity INT NOT NULL,

	OrderId INT NOT NULL,
	ProductId INT NOT NULL,

	PRIMARY KEY (OrderDetailId)
);

CREATE TABLE Buyers
(
	BuyerId INT IDENTITY NOT NULL,
	[Name] DATE NOT NULL,

	OrderId INT NOT NULL,

	PRIMARY KEY (BuyerId)
);


ALTER TABLE Orders
	ADD CONSTRAINT FK_Orders_BuyerId_Buyers_BuyerId FOREIGN KEY (BuyerId)
		REFERENCES Buyers(BuyerId)

ALTER TABLE Orders
	ADD CONSTRAINT FK_Orders_OrderDetailId_OrderDetails_OrderDetailId FOREIGN KEY (OrderDetailId)
		REFERENCES OrderDetails(OrderDetailId)

ALTER TABLE OrderDetails
	ADD CONSTRAINT FK_OrderDetails_OrderId_Orders_OrderId FOREIGN KEY (OrderId)
		REFERENCES Orders(OrderId)

ALTER TABLE OrderDetails
	ADD CONSTRAINT FK_OrderDetails_ProductId_Products_ProductId FOREIGN KEY (ProductId)
		REFERENCES Products(ProductsId)

ALTER TABLE Buyers
	ADD CONSTRAINT FK_Buyers_OrderId_Orders_OrderId FOREIGN KEY (OrderId)
		REFERENCES Orders(OrderId)