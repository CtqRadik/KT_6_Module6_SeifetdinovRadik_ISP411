USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 29.10.2024 12:00:13 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] NOT NULL,
	[ManufacturerName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[UserNameId] [int] NULL,
 CONSTRAINT [PK__Order__C3905BAF06AF03C9] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Count] [int] NOT NULL,
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickPoint]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickPoint](
	[PickPointId] [int] NOT NULL,
	[PickPointIndex] [nvarchar](50) NOT NULL,
	[PickPointCityId] [int] NOT NULL,
	[PickPointStreetId] [int] NOT NULL,
	[PickPointHome] [nvarchar](50) NULL,
 CONSTRAINT [PK_PickPoint] PRIMARY KEY CLUSTERED 
(
	[PickPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductSupplaer] [int] NULL,
	[ProductDiscountNow] [tinyint] NOT NULL,
	[ProductPhotoName] [nvarchar](50) NULL,
	[ProductPhoto] [image] NULL,
 CONSTRAINT [PK__Product__2EA7DCD5F6914A61] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductName]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductName](
	[ProductNameId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductName] PRIMARY KEY CLUSTERED 
(
	[ProductNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[StreetId] [int] NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[StreetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplaer]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplaer](
	[SupplaerId] [int] NOT NULL,
	[SupplaerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplaer] PRIMARY KEY CLUSTERED 
(
	[SupplaerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.10.2024 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Для животных')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Товары для собак')
GO
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (1, N'  Нефтеюганск')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (2, N'Chappy')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (4, N'Dreames')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (6, N'LIKER')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (7, N'Nobby')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (9, N'TitBit')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (10, N'Triol')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (11, N'trixie')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (12, N'True Touch')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (13, N'ZooM')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserNameId]) VALUES (11, 2, CAST(N'2022-05-12T00:00:00.000' AS DateTime), 25, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserNameId]) VALUES (12, 2, CAST(N'2022-05-12T00:00:00.000' AS DateTime), 20, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserNameId]) VALUES (14, 1, CAST(N'2022-05-14T00:00:00.000' AS DateTime), 24, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserNameId]) VALUES (15, 1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 25, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserNameId]) VALUES (17, 2, CAST(N'2022-05-18T00:00:00.000' AS DateTime), 36, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserNameId]) VALUES (18, 2, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 32, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (1, N'344288', 1, 26, N'1')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (2, N'614164', 1, 30, N'30')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (3, N'394242', 1, 6, N'43')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (4, N'660540', 1, 22, N'25')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (5, N'125837', 1, 28, N'40')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (6, N'125703', 1, 15, N'49')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (7, N'625283', 1, 16, N'46')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (8, N'614611', 1, 10, N'50')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (9, N'454311', 1, 13, N'19')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (10, N'660007', 1, 14, N'19')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (11, N'603036', 1, 19, N'4')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (12, N'450983', 1, 7, N'26')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (13, N'394782', 1, 26, N'3')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (14, N'603002', 1, 4, N'28')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (15, N'450558', 1, 11, N'30')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (16, N'394060', 1, 24, N'43')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (17, N'410661', 1, 27, N'50')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (18, N'625590', 1, 6, N'20')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (19, N'625683', 1, 1, NULL)
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (20, N'400562', 1, 5, N'32')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (21, N'614510', 1, 8, N'47')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (22, N'410542', 1, 20, N'46')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (23, N'620839', 1, 25, N'8')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (24, N'443890', 1, 6, N'1')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (25, N'603379', 1, 23, N'46')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (26, N'603721', 1, 3, N'41')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (27, N'410172', 1, 21, N'13')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (28, N'420151', 1, 2, N'32')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (29, N'125061', 1, 17, N'8')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (30, N'630370', 1, 28, N'24')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (31, N'614753', 1, 18, N'35')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (32, N'426030', 1, 8, N'44')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (33, N'450375', 1, 29, N'44')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (34, N'625560', 1, 12, N'12')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (35, N'630201', 1, 7, N'17')
INSERT [dbo].[PickPoint] ([PickPointId], [PickPointIndex], [PickPointCityId], [PickPointStreetId], [PickPointHome]) VALUES (36, N'190949', 1, 9, N'26')
GO
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (1, N'А112Т4', 3, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', 2, 4, CAST(123.0000 AS Decimal(19, 4)), 30, 6, 1, 3, N'А112Т4.png', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (2, N'G453T5', 8, N'Щетка-варежка True Touch для вычесывания шерсти, синий', 1, 12, CAST(149.0000 AS Decimal(19, 4)), 15, 7, 2, 2, N'G453T5.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (3, N'F432F4', 7, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', 2, 8, CAST(1200.0000 AS Decimal(19, 4)), 10, 15, 2, 3, N'F432F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (4, N'Y324F4', 3, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', 3, 9, CAST(86.0000 AS Decimal(19, 4)), 5, 17, 1, 4, N'Y324F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (5, N'E532Q5', 3, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', 3, 9, CAST(166.0000 AS Decimal(19, 4)), 15, 18, 1, 5, N'E532Q5.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (6, N'T432F4', 7, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', 3, 2, CAST(1700.0000 AS Decimal(19, 4)), 25, 5, 2, 2, N'T432F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (7, N'G345E4', 6, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', 3, 6, CAST(300.0000 AS Decimal(19, 4)), 5, 19, 2, 3, N'G345E4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (8, N'E345R4', 1, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', 2, 5, CAST(199.0000 AS Decimal(19, 4)), 5, 7, 2, 5, N'E345R4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (9, N'R356F4', 5, N'Миска Nobby с рисунком Dog для собак 130 мл красный', 3, 7, CAST(234.0000 AS Decimal(19, 4)), 10, 17, 1, 3, N'R356F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (10, N'E431R5', 3, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', 3, 10, CAST(170.0000 AS Decimal(19, 4)), 5, 5, 2, 5, N'E431R5.png', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (11, N'D563F4', 1, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', 3, 10, CAST(600.0000 AS Decimal(19, 4)), 10, 5, 1, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (12, N'H436R4', 1, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', 3, 10, CAST(300.0000 AS Decimal(19, 4)), 15, 15, 1, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (13, N'D643B5', 7, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', 2, 1, CAST(4100.0000 AS Decimal(19, 4)), 30, 9, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (14, N'H432F4', 5, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', 1, 10, CAST(385.0000 AS Decimal(19, 4)), 10, 17, 2, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (15, N'S245R4', 7, N'Сухой корм для кошек CAT CHOW', 2, 1, CAST(280.0000 AS Decimal(19, 4)), 15, 8, 2, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (16, N'V352R4', 7, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', 3, 2, CAST(1700.0000 AS Decimal(19, 4)), 25, 9, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (17, N'H342F5', 1, N'Игрушка для собак Triol Енот 41 см 12141063 серый', 3, 10, CAST(510.0000 AS Decimal(19, 4)), 5, 17, 2, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (18, N'Q245F5', 1, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', 3, 10, CAST(510.0000 AS Decimal(19, 4)), 5, 17, 2, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (19, N'G542F5', 7, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', 3, 8, CAST(2190.0000 AS Decimal(19, 4)), 30, 7, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (20, N'H542R6', 3, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', 3, 10, CAST(177.0000 AS Decimal(19, 4)), 15, 15, 2, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (21, N'K436T5', 6, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', 3, 10, CAST(100.0000 AS Decimal(19, 4)), 5, 21, 2, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (22, N'V527T5', 1, N'Игрушка для собак Triol Ящерица 39 см коричневый', 3, 10, CAST(640.0000 AS Decimal(19, 4)), 5, 4, 1, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (23, N'K452T5', 4, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', 3, 13, CAST(800.0000 AS Decimal(19, 4)), 25, 17, 2, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (24, N'E466T6', 2, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', 3, 10, CAST(3500.0000 AS Decimal(19, 4)), 30, 3, 2, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (25, N'B427R5', 5, N'Миска для животных Triol "Стрекоза", 450 мл', 1, 10, CAST(400.0000 AS Decimal(19, 4)), 15, 5, 2, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (26, N'H643W2', 5, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', 1, 10, CAST(292.0000 AS Decimal(19, 4)), 25, 13, 1, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (27, N'D356R4', 6, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', 3, 11, CAST(600.0000 AS Decimal(19, 4)), 15, 16, 1, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (28, N'E434U6', 3, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', 3, 9, CAST(140.0000 AS Decimal(19, 4)), 20, 19, 2, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (29, N'M356R4', 3, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', 3, 9, CAST(50.0000 AS Decimal(19, 4)), 5, 6, 2, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductSupplaer], [ProductDiscountNow], [ProductPhotoName], [ProductPhoto]) VALUES (30, N'W548O7', 7, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', 3, 3, CAST(600.0000 AS Decimal(19, 4)), 15, 15, 1, 5, NULL, NULL)
GO
INSERT [dbo].[ProductName] ([ProductNameId], [Name]) VALUES (1, N'Игрушка')
INSERT [dbo].[ProductName] ([ProductNameId], [Name]) VALUES (2, N'Клетка')
INSERT [dbo].[ProductName] ([ProductNameId], [Name]) VALUES (3, N'Лакомство')
INSERT [dbo].[ProductName] ([ProductNameId], [Name]) VALUES (4, N'Лежак')
INSERT [dbo].[ProductName] ([ProductNameId], [Name]) VALUES (5, N'Миска')
INSERT [dbo].[ProductName] ([ProductNameId], [Name]) VALUES (6, N'Мячик')
INSERT [dbo].[ProductName] ([ProductNameId], [Name]) VALUES (7, N'Сухой корм')
INSERT [dbo].[ProductName] ([ProductNameId], [Name]) VALUES (8, N'Щетка-варежка')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (1, N'Завершен')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (2, N'Новый ')
GO
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (1, N'  8 Марта')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (2, N'  Вишневая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (3, N'  Гоголя')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (4, N'  Дзержинского')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (5, N'  Зеленая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (6, N'  Коммунистическая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (7, N'  Комсомольская')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (8, N'  Маяковского')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (9, N'  Мичурина')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (10, N'  Молодежная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (11, N'  Набережная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (12, N'  Некрасова')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (13, N'  Новая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (14, N'  Октябрьская')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (15, N'  Партизанская')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (16, N'  Победы')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (17, N'  Подгорная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (18, N'  Полевая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (19, N'  Садовая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (20, N'  Светлая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (21, N'  Северная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (22, N'  Солнечная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (23, N'  Спортивная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (24, N'  Фрунзе')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (25, N'  Цветочная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (26, N'  Чехова')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (27, N'  Школьная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (28, N'  Шоссейная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (29, N' Клубная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (30, N'   Степная')
GO
INSERT [dbo].[Supplaer] ([SupplaerId], [SupplaerName]) VALUES (1, N'PetShop')
INSERT [dbo].[Supplaer] ([SupplaerId], [SupplaerName]) VALUES (2, N'ZooMir')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Волкова Эмилия Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ', 2)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Денисов Михаил Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR', 3)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Игнатьева Алина Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Соловьев Ярослав Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9', 3)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Суслов Илья Арсентьевич', N'pixil59@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Тимофеев Михаил Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv', 3)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Филимонов Роберт Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos', 2)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Чистякова Виктория Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr', 2)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Шилова Майя Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT', 2)
INSERT [dbo].[User] ([UserID], [UserName], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Яковлева Ярослава Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickPoint] ([PickPointId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserNameId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_City] FOREIGN KEY([PickPointCityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_City]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_Street] FOREIGN KEY([PickPointStreetId])
REFERENCES [dbo].[Street] ([StreetId])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_Street]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductName] FOREIGN KEY([ProductName])
REFERENCES [dbo].[ProductName] ([ProductNameId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductName]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplaer] FOREIGN KEY([ProductSupplaer])
REFERENCES [dbo].[Supplaer] ([SupplaerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplaer]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
