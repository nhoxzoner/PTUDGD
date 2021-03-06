USE [master]
GO
/****** Object:  Database [QuanLyQuanTraSua]    Script Date: 07-11-2020 6:32:44 SA ******/
CREATE DATABASE [QuanLyQuanTraSua]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanTraSua', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyQuanTraSua.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanTraSua_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyQuanTraSua_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyQuanTraSua] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanTraSua].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanTraSua] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanTraSua] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyQuanTraSua] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyQuanTraSua', N'ON'
GO
ALTER DATABASE [QuanLyQuanTraSua] SET QUERY_STORE = OFF
GO
USE [QuanLyQuanTraSua]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 07-11-2020 6:32:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 07-11-2020 6:32:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL,
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idDrinks] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drinks]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drinks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrinksCategory]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrinksCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableDrinks]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDrinks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'admin', N'admin', N'123', 1)
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'STAFF', N'STAFF', N'1', 0)
GO
SET IDENTITY_INSERT [dbo].[Drinks] ON 

INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (1, N'Chocolate', 1, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (2, N'Mocha', 1, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (3, N'Caramel', 1, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (4, N'Pearl Milk Tea', 1, 25000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (5, N'Coffee Strawberry Mango', 1, 25000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (6, N'Tiramisu', 1, 25000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (7, N'Caffe Macchiato', 1, 25000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (8, N'Matcha', 1, 25000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (9, N'Green Apple', 3, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (10, N'Raspberry', 3, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (11, N'Mango', 3, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (12, N'Peach Mango', 3, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (13, N'Apple Juice', 3, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (14, N'Coffee', 2, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (15, N'Milk', 2, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (16, N'Tea', 2, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (17, N'Lemon', 2, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (18, N'Cookies', 4, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (19, N'Chocolate', 4, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (20, N'Soft Candy', 4, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (21, N'Oreo', 4, 20000)
INSERT [dbo].[Drinks] ([id], [name], [idCategory], [price]) VALUES (22, N'Cream', 4, 20000)
SET IDENTITY_INSERT [dbo].[Drinks] OFF
GO
SET IDENTITY_INSERT [dbo].[DrinksCategory] ON 

INSERT [dbo].[DrinksCategory] ([id], [name]) VALUES (1, N'MILK TEA')
INSERT [dbo].[DrinksCategory] ([id], [name]) VALUES (2, N'HOT DRINKS')
INSERT [dbo].[DrinksCategory] ([id], [name]) VALUES (3, N'FRUIT TEA')
INSERT [dbo].[DrinksCategory] ([id], [name]) VALUES (4, N'TOPPINGS')
SET IDENTITY_INSERT [dbo].[DrinksCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[TableDrinks] ON 

INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (1, N'Bàn 0', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (2, N'Bàn 1', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (3, N'Bàn 2', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (4, N'Bàn 3', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (5, N'Bàn 4', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (6, N'Bàn 5', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (7, N'Bàn 6', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (8, N'Bàn 7', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (9, N'Bàn 8', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (10, N'Bàn 9', N'Trống')
INSERT [dbo].[TableDrinks] ([id], [name], [status]) VALUES (11, N'Bàn 10', N'Trống')
SET IDENTITY_INSERT [dbo].[TableDrinks] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Unknown User') FOR [DisplayName]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [DateCheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[Drinks] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[Drinks] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[DrinksCategory] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[TableDrinks] ADD  DEFAULT (N'Bảng chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[TableDrinks] ADD  DEFAULT (N'Trống') FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TableDrinks] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idDrinks])
REFERENCES [dbo].[Drinks] ([id])
GO
ALTER TABLE [dbo].[Drinks]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[DrinksCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetAccountByUserName]
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListBillByDate]
@checkIn date, @checkOut date 
AS
BEGIN
SELECT t.name as [Tên bàn], b.totalPrice as  [Tổng tiền], DateCheckIn as [Ngày vào],DateCheckOut[Ngày ra],discount as [Giảm giá] 
FROM dbo.Bill as b,dbo.TableDrinks as t
WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
AND t.id=b.idTable
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetTableList] 
AS SELECT * from dbo.TableDrinks
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBill]
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
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBillInfo]

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
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[USP_Login]
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND Password = @passWord
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[USP_SwitchTable] 
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 07-11-2020 6:32:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdateAccount]
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT 

	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND Password = @password
	IF (@isRightPass =1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName= @displayName WHERE UserName = @userName
		END
		ELSE 
			UPDATE dbo.Account SET DisplayName= @displayName,Password=@newPassword WHERE UserName = @userName
		
	end
END
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanTraSua] SET  READ_WRITE 
GO
