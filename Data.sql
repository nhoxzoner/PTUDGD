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

INSERT INTO dbo.Account
	(UserName,
	DisplayName,
	Password,
	Type
	)
VALUES ( N'STAFF',--USERNAME
		N'STAFF',--DISPLAYNAME
		N'1',--PASSWORD
		0--TYPE INT
)
INSERT INTO dbo.Account
	(UserName,
	DisplayName,
	Password,
	Type
	)
VALUES ( N'admin',--USERNAME
		N'admin',--DISPLAYNAME
		N'123',--PASSWORD
		1--TYPE INT
)

SELECT * FROM dbo.Account 

CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO

EXECUTE dbo.USP_GetAccountByUserName @userName = N'admin' --nvarchar(100)
GO
Create PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND Password = @passWord
END
GO
--Thêm Category
DECLARE @i INT = 0
WHILE @i <= 10 
BEGIN

	INSERT dbo.TableDrinks(name) VALUES (N'Bàn '+ CAST (@i as nvarchar(100)))
	SET @i = @i +1
END
GO
SELECT * FROM dbo.TableDrinks

CREATE PROC USP_GetTableList 
AS SELECT * from dbo.TableDrinks
GO

UPDATE dbo.TableDrinks set status =N'Có người' where id = 9

EXEC dbo.USP_GetTableList
GO
--Thêm Category
INSERT dbo.DrinksCategory
			(name)
VALUES (N'MILK TEA' --name - nvarchar(100)
		)
INSERT dbo.DrinksCategory
			(name)
VALUES (N'HOT DRINKS')

INSERT dbo.DrinksCategory
			(name)
VALUES (N'FRUIT TEA')
INSERT dbo.DrinksCategory
			(name)
VALUES (N'TOPPINGS')
GO
--Thêm nước uống
SELECT * FROM dbo.Drinks
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Chocolate',53,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Mocha',53,20000)

INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Caramel',53,20000)

INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Pearl Milk Tea',53,25000)

INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Coffee Strawberry Mango',53,25000)

INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Tiramisu',53,25000)

INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Caffe Macchiato',53,25000)

INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Matcha',53,25000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Green Apple',55,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Raspberry',55,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Mango',55,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Peach Mango',55,20000)
GO
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Apple Juice',55,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Coffee',54,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Milk',54,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Tea',54,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Lemon',54,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Cookies',56,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Chocolate',56,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Soft Candy',56,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Oreo',56,20000)
INSERT dbo.Drinks
			(name,idCategory,price)
VALUES (N'Cream',56,20000)

--Thêm bill
SELECT * FROM dbo.Bill
INSERT dbo.Bill
		( DateCheckIn,
		  DateCheckOut,
		  idTable,
		  status
		)
VALUES	( GETDATE(),--DateCheckIn - date
		  null,--DateCheckOut - date
		  1, -- idTable - int
		  0 -- status - int
		)
INSERT dbo.Bill
		( DateCheckIn,
		  DateCheckOut,
		  idTable,
		  status
		)
VALUES	( GETDATE(),--DateCheckIn - date
		  null,--DateCheckOut - date
		  2, -- idTable - int
		  0 -- status - int
		)
INSERT dbo.Bill
		( DateCheckIn,
		  DateCheckOut,
		  idTable,
		  status
		)
VALUES	( GETDATE(),--DateCheckIn - date
		  GETDATE(),--DateCheckOut - date
		  2, -- idTable - int
		  1 -- status - int
		)
GO
--thêm billinfo
INSERT dbo.BillInfo
		( idBill,idDrinks,count )
VALUES (31, --idBill - int
		187, --idDrinks - int
		2 --count - int
		)
INSERT dbo.BillInfo
		( idBill,idDrinks,count )
VALUES (33, --idBill - int
		186, --idDrinks - int
		4 --count - int
		)
INSERT dbo.BillInfo
		( idBill,idDrinks,count )
VALUES (31, --idBill - int
		185, --idDrinks - int
		1 --count - int
		)
INSERT dbo.BillInfo
		( idBill,idDrinks,count )
VALUES (32, --idBill - int
		184, --idDrinks - int
		2 --count - int
		)
INSERT dbo.BillInfo
		( idBill,idDrinks,count )
VALUES (33, --idBill - int
		182, --idDrinks - int
		2 --count - int
		)
INSERT dbo.BillInfo
		( idBill,idDrinks,count )
VALUES (32, --idBill - int
		183, --idDrinks - int
		2 --count - int
		)
GO

SELECT * FROM dbo.BillInfo WHERE idBill=2

SELECT d.name,bi.count,d.price,d.price*bi.count as totalPrice FROM dbo.BillInfo as bi, dbo.Bill as b,dbo.Drinks as d
WHERE bi.idBill=b.id and bi.idDrinks = d.id and b.status=0 and b.idTable = 2
SELECT * FROM dbo.TableDrinks
SELECT * FROM dbo.Bill
SELECT * FROM dbo.BillInfo
SELECT * FROM dbo.Drinks
SELECT * FROM dbo.DrinksCategory

--Delete dbo.Bill
--Delete dbo.BillInfo
--Delete dbo.Drinks
--Delete dbo.DrinksCategory

ALTER PROC USP_InsertBill
@idTable INT
as
begin
	insert into dbo.Bill
	(
		DateCheckIn,
		DateCheckOut,
		idTable,
		status,
		discount
	)
	values (getdate(),--datecheckin - date
			null, --datecheckout-date
			@idTable,--idTable -int
			0, -- status - int
			0	
			)
end
go 
ALTER PROC USP_InsertBillInfo

@idBill INT , @idDrinks INT , @count INT
AS
BEGIN

	DECLARE @isExitBillInfo INT;
	DECLARE @drinksCount INT = 1

	SELECT @isExitBillInfo = id,@drinksCount=b.count 
	FROM dbo.BillInfo as b
	WHERE idBill = @idBill and idDrinks = @idDrinks

		IF (@isExitBillInfo > 0)
		BEGIN
			DECLARE @newCount INT = @drinksCount + @count 
			IF (@newCount > 0 )
				UPDATE dbo.BillInfo SET count = @drinksCount + @count WHERE idDrinks=@idDrinks
			ELSE 
				DELETE dbo.BillInfo WHERE idBill = @idBill	and idDrinks = @idDrinks
		END
		ELSE
		BEGIN
			INSERT dbo.BillInfo
			( idBill,idDrinks,count )
			VALUES (@idBill, --idBill - int
			@idDrinks, --idDrinks - int
			@count --count - int
			)
		END

END
GO

ALTER TRIGGER UTG_UpdateBillInfo
ON dbo.BillInfo FOR INSERT, UPDATE
AS
BEGIN 
	DECLARE @idBill INT
	
	SELECT @idBill=idBill FROM inserted

	DECLARE @idTable INT 

	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0


	DECLARE @count INT
	SELECT @count = COUNT (*) FROM dbo.BillInfo WHERE id = @idBill

	IF (@count > 0)
	UPDATE dbo.TableDrinks SET status= N'Trống' WHERE id = @idTable
	ELSE 
	UPDATE dbo.TableDrinks SET status= N'Có người' WHERE id = @idTable
	
END 
GO


ALTER TRIGGER UTG_UpdateBill
ON dbo.Bill FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT

	SELECT @idBill = id FROM inserted

	DECLARE @idTable INT

	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill

	DECLARE @count int = 0
	
	SELECT COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0

	IF (@count = 0)
		UPDATE dbo.TableDrinks SET status = N'Trống' WHERE id = @idTable
END 
GO

ALTER TABLE dbo.Bill
ADD discount INT 



ALTER PROC USP_SwitchTable 
@idTable1 INT, @idTable2 INT
AS BEGIN

	DECLARE @idFirstBill INT
	DECLARE @idSecondBill INT

	DECLARE @isFirstTableEmpty INT = 1
	DECLARE @isSecondTableEmpty INT = 1


	SELECT @idSecondBill= id  FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0 
	SELECT @idFirstBill= id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0 
	
	IF (@idFirstBill IS NULL)
	BEGIN
		INSERT dbo.Bill
				(DateCheckIn,
				 DateCheckOut,
				 idTable,
				 status
				)
		VALUES ( GETDATE(),
				 NULL,
				 @idTable1,
				 0
				 )
		SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
		

	END
	SELECT @isFirstTableEmpty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill
	IF (@idSecondBill IS NULL)
	BEGIN
		INSERT dbo.Bill
				(DateCheckIn,
				 DateCheckOut,
				 idTable,
				 status
				)
		VALUES ( GETDATE(),
				 NULL,
				 @idTable2,
				 0
				 )
		SELECT @idSecondBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		
	END
	
	SELECT @isSecondTableEmpty = COUNT(*) FROM dbo.BillInfo WHERE idBill= @idSecondBill

	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSecondBill
	
	UPDATE dbo.BillInfo SET idBill = @idSecondBill WHERE idBill= @idFirstBill

	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)

	DROP TABLE IDBillInfoTable
	
	IF (@isFirstTableEmpty = 0)
		UPDATE dbo.TableDrinks SET status = N'Trống' WHERE id = @idTable2
	IF (@isSecondTableEmpty = 0)
	UPDATE dbo.TableDrinks SET status = N'Trống' WHERE id = @idTable1
END
GO
UPDATE dbo.TableDrinks SET status = N'Trống'
UPDATE dbo.Bill SET discount = 0