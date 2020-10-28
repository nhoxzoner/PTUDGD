CREATE DATABASE QuanLyQuanTraSua
GO

USE QuanLyQuanTraSua
GO 

--Drinks
--Table
--DrinksCategory 
--Account
--Bill
--BillInfo

Create Table TableDrinks
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bảng chưa đặt tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống',  --Trống || Có Người
)
GO

Create Table Account
(
	UserName NVARCHAR(100) PRIMARY KEY NOT NULL,
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Unknown User',
	Password NVARCHAR(1000) NOT NULL,
	Type INT NOT NULL DEFAULT 0,--1: admin 0: staff
)
GO

Create Table DrinksCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NUll DEFAULT N'Chưa đặt tên',
)
GO

Create Table Drinks
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NUll DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0,

	FOREIGN KEY (idCategory) REFERENCES dbo.DrinksCategory(id)
)
GO

Create Table Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn Date NOT NULL DEFAULT GETDATE(),
	DateCheckOut Date,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0,--1 : Đã Thanh Toán && 0 : Chưa Thanh Toán

	FOREIGN KEY (idTable) REFERENCES dbo.TableDrinks(id),
)
GO

Create Table BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idDrinks INT NOT NULL,
	count INT NOT NULL DEFAULT 0,

	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idDrinks) REFERENCES dbo.Drinks(id),
)
GO