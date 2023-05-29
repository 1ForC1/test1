USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 29.05.2023 22:33:08 ******/
CREATE DATABASE [Trade]
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [Trade] SET RECOVERY FULL 
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
EXEC sys.sp_db_vardecimal_storage_format N'Trade', N'ON'
GO
ALTER DATABASE [Trade] SET QUERY_STORE = ON
GO
ALTER DATABASE [Trade] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29.05.2023 22:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [nvarchar](max) NOT NULL,
	[OrderPickupPointID] [int] NOT NULL,
	[UserID] [int] NULL,
	[DeliveryCode] [int] NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPickupPoint]    Script Date: 29.05.2023 22:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPickupPoint](
	[OrderPickupPointID] [int] IDENTITY(1,1) NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderPickupPoint] PRIMARY KEY CLUSTERED 
(
	[OrderPickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 29.05.2023 22:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Product_Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.05.2023 22:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductMetric] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountMAX] [tinyint] NOT NULL,
	[ProductManufacturer] [nvarchar](255) NOT NULL,
	[ProductDeliver] [nvarchar](255) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductDiscountAmount] [tinyint] NOT NULL,
	[ProductWarehouseCount] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.05.2023 22:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.05.2023 22:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (1, N'май 10 2022 12:00AM', N'май 16 2022 12:00AM', 27, 7, 811, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (2, N'май 11 2022 12:00AM', N'май 17 2022 12:00AM', 5, NULL, 812, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (3, N'май 12 2022 12:00AM', N'май 18 2022 12:00AM', 29, NULL, 813, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (4, N'май 13 2022 12:00AM', N'май 19 2022 12:00AM', 10, NULL, 814, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (5, N'май 14 2022 12:00AM', N'май 20 2022 12:00AM', 31, 8, 815, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (6, N'май 15 2022 12:00AM', N'май 21 2022 12:00AM', 32, NULL, 816, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (7, N'май 16 2022 12:00AM', N'май 22 2022 12:00AM', 20, NULL, 817, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (8, N'май 17 2022 12:00AM', N'май 23 2022 12:00AM', 34, 9, 818, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (9, N'май 18 2022 12:00AM', N'май 24 2022 12:00AM', 35, 10, 819, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (10, N'май 19 2022 12:00AM', N'май 25 2022 12:00AM', 36, NULL, 820, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (11, N'29.05.2023 19:56:56', N'03.06.2023 19:56:56', 3, NULL, 775, N'Новый')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (12, N'29.05.2023 19:57:59', N'03.06.2023 19:57:59', 3, NULL, 594, N'Новый')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (13, N'29.05.2023 20:08:05', N'03.06.2023 20:08:05', 2, NULL, 726, N'Новый')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (14, N'29.05.2023 20:17:25', N'03.06.2023 20:17:25', 3, NULL, 346, N'Новый')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (15, N'29.05.2023 20:18:54', N'03.06.2023 20:18:54', 5, NULL, 687, N'Новый')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (16, N'29.05.2023 20:19:35', N'03.06.2023 20:19:35', 3, NULL, 389, N'Новый')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointID], [UserID], [DeliveryCode], [OrderStatus]) VALUES (17, N'29.05.2023 20:21:10', N'03.06.2023 20:21:10', 4, NULL, 981, N'Новый')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderPickupPoint] ON 
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (1, N'344288, г. Кропоткин, ул. Чехова, 1')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (2, N'614164, г.Кропоткин,  ул. Степная, 30')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (3, N'394242, г. Кропоткин, ул. Коммунистическая, 43')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (4, N'660540, г. Кропоткин, ул. Солнечная, 25')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (5, N'125837, г. Кропоткин, ул. Шоссейная, 40')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (6, N'125703, г. Кропоткин, ул. Партизанская, 49')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (7, N'625283, г. Кропоткин, ул. Победы, 46')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (8, N'614611, г. Кропоткин, ул. Молодежная, 50')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (9, N'454311, г.Кропоткин, ул. Новая, 19')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (10, N'660007, г.Кропоткин, ул. Октябрьская, 19')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (11, N'603036, г. Кропоткин, ул. Садовая, 4')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (12, N'450983, г.Кропоткин, ул. Комсомольская, 26')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (13, N'394782, г. Кропоткин, ул. Чехова, 3')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (14, N'603002, г. Кропоткин, ул. Дзержинского, 28')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (15, N'450558, г. Кропоткин, ул. Набережная, 30')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (16, N'394060, г.Кропоткин, ул. Фрунзе, 43')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (17, N'410661, г. Кропоткин, ул. Школьная, 50')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (18, N'625590, г. Кропоткин, ул. Коммунистическая, 20')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (19, N'625683, г. Кропоткин, ул. 8 Марта')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (20, N'400562, г. Кропоткин, ул. Зеленая, 32')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (21, N'614510, г. Кропоткин, ул. Маяковского, 47')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (22, N'410542, г. Кропоткин, ул. Светлая, 46')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (23, N'620839, г. Кропоткин, ул. Цветочная, 8')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (24, N'443890, г. Кропоткин, ул. Коммунистическая, 1')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (25, N'603379, г. Кропоткин, ул. Спортивная, 46')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (26, N'603721, г. Кропоткин, ул. Гоголя, 41')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (27, N'410172, г. Кропоткин, ул. Северная, 13')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (28, N'420151, г. Кропоткин, ул. Вишневая, 32')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (29, N'125061, г. Кропоткин, ул. Подгорная, 8')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (30, N'630370, г. Кропоткин, ул. Шоссейная, 24')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (31, N'614753, г. Кропоткин, ул. Полевая, 35')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (32, N'426030, г. Кропоткин, ул. Маяковского, 44')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (33, N'450375, г. Кропоткин ул. Клубная, 44')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (34, N'625560, г. Кропоткин, ул. Некрасова, 12')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (35, N'630201, г. Кропоткин, ул. Комсомольская, 17')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [OrderPickupPoint]) VALUES (36, N'190949, г. Кропоткин, ул. Мичурина, 26')
GO
SET IDENTITY_INSERT [dbo].[OrderPickupPoint] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (1, N'B111C5', 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (1, N'T238C7', 7)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (2, N'E112C6', 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (2, N'T238C7', 9)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (3, N'L293S9', 8)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (3, N'M112C8', 4)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (4, N'M294G9', 6)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (4, N'S384K2', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (5, N'Q836H4', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (5, N'W874J3', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (6, N'O947D8', 4)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (6, N'R983K4', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (7, N'H497J3', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (7, N'N394K2', 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (8, N'P495H8', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (8, N'X846D3', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (9, N'K284U8', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (9, N'V378J3', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (10, N'I483H3', 7)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (10, N'N387I8', 6)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (17, N'M398S9', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Product_Count]) VALUES (17, N'N283K3', 1)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'B111C5', N'Поплин «Розовый жемчуг»', N'Рулон', CAST(8500.0000 AS Decimal(19, 4)), 5, N'БТК Текстиль', N'Раута', N'Постельные ткани', 4, 6, N'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.', N'B111C5.JPEG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'C384D8', N'Сатин «Дымчатая роза» однотонный', N'Рулон', CAST(1133.0000 AS Decimal(19, 4)), 10, N'Империя ткани', N'Раута', N'Постельные ткани', 3, 4, N'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'D938K3', N'Фланель однотонная светлая', N'Рулон', CAST(1300.0000 AS Decimal(19, 4)), 10, N'Май Фабрик', N'ГК Петров', N'Ткани для изделий', 4, 10, N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'E112C6', N'Муслин «Bej»', N'Рулон', CAST(10500.0000 AS Decimal(19, 4)), 15, N'Империя ткани', N'ООО Афо-Тек', N'Детские ткани', 3, 13, N'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.', N'E112C6.JPG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'F374S8', N'Фланель рубашечная', N'Рулон', CAST(2100.0000 AS Decimal(19, 4)), 5, N'БТК Текстиль', N'Раута', N'Ткани для изделий', 2, 5, N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'H483D9', N'Фланель детская H483D9', N'Рулон', CAST(318.0000 AS Decimal(19, 4)), 5, N'Комильфо', N'ООО Афо-Тек', N'Детские ткани', 2, 18, N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'H497J3', N'Ситец детский', N'Рулон', CAST(523.0000 AS Decimal(19, 4)), 5, N'БТК Текстиль', N'ГК Петров', N'Детские ткани', 2, 8, N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'I483H3', N'Ткань поплин «Вивьен»', N'Рулон', CAST(11300.0000 AS Decimal(19, 4)), 10, N'БТК Текстиль', N'ООО Афо-Тек', N'Постельные ткани', 2, 5, N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'K284U8', N'Бязь детская «Самолеты»', N'Рулон', CAST(5100.0000 AS Decimal(19, 4)), 25, N'Империя ткани', N'ГК Петров', N'Детские ткани', 3, 2, N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя. ', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'K839K3', N'Плюш белый в клетку', N'Рулон', CAST(765.0000 AS Decimal(19, 4)), 5, N'Империя ткани', N'ГК Петров', N'Детские ткани', 2, 3, N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.', N'K839K3.JPG ')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'L293S9', N'Плюш розовый гладкий', N'Рулон', CAST(30000.0000 AS Decimal(19, 4)), 40, N'Комильфо', N'Раута', N'Детские ткани', 3, 2, N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.', N'L293S9.JPG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'M112C8', N'Бязь детская «Совята»', N'Рулон', CAST(26000.0000 AS Decimal(19, 4)), 20, N'Империя ткани', N'Раута', N'Детские ткани', 2, 14, N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.', N'M112C8.JPG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'M294G9', N'Полотно вафельное «8 марта»', N'Рулон', CAST(5130.0000 AS Decimal(19, 4)), 5, N'Империя ткани', N'Раута', N'Ткани для изделий', 2, 1, N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.', N'M294G9.JPG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'M398S9', N'Поплин Мокко', N'Рулон', CAST(1800.0000 AS Decimal(19, 4)), 15, N'Май Фабрик', N'ГК Петров', N'Постельные ткани', 2, 6, N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.', N'M398S9.JPG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'N283K3', N'Сатин «Миндальный» однотонный', N'Рулон', CAST(6500.0000 AS Decimal(19, 4)), 5, N'Комильфо', N'Раута', N'Постельные ткани', 3, 7, N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ', N'N283K3.JPG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'N385L2', N'Сатин «Фисташковый» однотонный', N'Рулон', CAST(7000.0000 AS Decimal(19, 4)), 20, N'БТК Текстиль', N'ГК Петров', N'Постельные ткани', 2, 2, N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'N387I8', N'Полотно вафельное «Кухня»', N'Рулон', CAST(1000.0000 AS Decimal(19, 4)), 15, N'БТК Текстиль', N'ООО Афо-Тек', N'Ткани для изделий', 3, 5, N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина. ', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'N394K2', N'Ткань поплин «Лакшери»', N'Рулон', CAST(30660.0000 AS Decimal(19, 4)), 10, N'Империя ткани', N'ООО Афо-Тек', N'Постельные ткани', 4, 15, N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная. ', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'O947D8', N'Ткань для скатертей под рогожку', N'Рулон', CAST(3550.0000 AS Decimal(19, 4)), 10, N'Май Фабрик', N'ООО Афо-Тек', N'Ткани для изделий', 3, 9, N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'P495H8', N'Поплин «Густав»', N'Рулон', CAST(1000.0000 AS Decimal(19, 4)), 15, N'Комильфо', N'Раута', N'Постельные ткани', 2, 14, N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'Q836H4', N'Фланель рубашечная', N'Рулон', CAST(1350.0000 AS Decimal(19, 4)), 5, N'Май Фабрик', N'Раута', N'Ткани для изделий', 4, 7, N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'R748K3', N'Поплин Морская волна', N'Рулон', CAST(2300.0000 AS Decimal(19, 4)), 15, N'Май Фабрик', N'ГК Петров', N'Постельные ткани', 2, 6, N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'R983K4', N'Сатин «Серо-бежевый» однотонный', N'Рулон', CAST(1645.0000 AS Decimal(19, 4)), 15, N'Империя ткани', N'ООО Афо-Тек', N'Постельные ткани', 2, 13, N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'S384K2', N'Фланель черная', N'Рулон', CAST(69000.0000 AS Decimal(19, 4)), 40, N'БТК Текстиль', N'ГК Петров', N'Ткани для изделий', 4, 2, N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.', N'S384K2.JPG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'T238C7', N'Муслин «Gri»', N'Рулон', CAST(6500.0000 AS Decimal(19, 4)), 15, N'БТК Текстиль', N'ООО Афо-Тек', N'Детские ткани', 2, 12, N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.', N'T238C7.JPG')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'U947E9', N'Муслин белый горошек на однотонном фоне', N'Рулон', CAST(3411.0000 AS Decimal(19, 4)), 10, N'Империя ткани', N'ГК Петров', N'Детские ткани', 3, 4, N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'V378J3', N'Ситец детский', N'Рулон', CAST(2400.0000 AS Decimal(19, 4)), 15, N'Комильфо', N'ГК Петров', N'Детские ткани', 3, 14, N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'W874J3', N'Ткань поплин «Натурель»', N'Рулон', CAST(1600.0000 AS Decimal(19, 4)), 5, N'БТК Текстиль', N'ГК Петров', N'Постельные ткани', 3, 9, N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая. ', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'X846D3', N'Ситец детский', N'Рулон', CAST(9300.0000 AS Decimal(19, 4)), 25, N'Империя ткани', N'Раута', N'Детские ткани', 3, 5, N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMetric], [ProductCost], [ProductDiscountMAX], [ProductManufacturer], [ProductDeliver], [ProductCategory], [ProductDiscountAmount], [ProductWarehouseCount], [ProductDescription], [ProductPhoto]) VALUES (N'Z937S2', N'Поплин Голубой', N'Рулон', CAST(9000.0000 AS Decimal(19, 4)), 10, N'БТК Текстиль', N'Раута', N'Постельные ткани', 2, 15, N'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.', NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Лавров', N'Богдан', N'Львович', N'8lf0g@yandex.ru', N'2L6KZG', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Смирнова', N'Полина', N'Фёдоровна', N'1zx8@yandex.ru', N'uzWC67', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Полякова', N'София', N'Данииловна', N'x@mail.ru', N'8ntwUp', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Чеботарева', N'Марина', N'Данииловна', N'34d@gmail.com', N'YOyhfR', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Ермолов', N'Адам', N'Иванович', N'pxacl@mail.ru', N'RSbvHv', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Васильев', N'Андрей', N'Кириллович', N'7o1@gmail.com', N'rwVDh9', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Маслов', N'Максим', N'Иванович', N'1@gmail.com', N'LdNyos', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Симонов', N'Михаил', N'Тимурович', N'iut@gmail.com', N'gynQMT', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Павлова', N'Ксения', N'Михайловна', N'e3t@outlook.com', N'AtnDjr', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Трифонов', N'Григорий', N'Юрьевич', N'41clb6o2g@yandex.ru', N'JlFRCZ', 3)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderPickupPoint] FOREIGN KEY([OrderPickupPointID])
REFERENCES [dbo].[OrderPickupPoint] ([OrderPickupPointID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderPickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
