USE [master]
GO
/****** Object:  Database [Сафронов Практика]    Script Date: 17.01.2025 19:57:23 ******/
CREATE DATABASE [Сафронов Практика]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Сафронов Практика', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Сафронов Практика.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Сафронов Практика_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Сафронов Практика_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Сафронов Практика] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Сафронов Практика].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Сафронов Практика] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Сафронов Практика] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Сафронов Практика] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Сафронов Практика] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Сафронов Практика] SET ARITHABORT OFF 
GO
ALTER DATABASE [Сафронов Практика] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Сафронов Практика] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Сафронов Практика] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Сафронов Практика] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Сафронов Практика] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Сафронов Практика] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Сафронов Практика] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Сафронов Практика] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Сафронов Практика] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Сафронов Практика] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Сафронов Практика] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Сафронов Практика] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Сафронов Практика] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Сафронов Практика] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Сафронов Практика] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Сафронов Практика] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Сафронов Практика] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Сафронов Практика] SET RECOVERY FULL 
GO
ALTER DATABASE [Сафронов Практика] SET  MULTI_USER 
GO
ALTER DATABASE [Сафронов Практика] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Сафронов Практика] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Сафронов Практика] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Сафронов Практика] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Сафронов Практика] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Сафронов Практика] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Сафронов Практика', N'ON'
GO
ALTER DATABASE [Сафронов Практика] SET QUERY_STORE = ON
GO
ALTER DATABASE [Сафронов Практика] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Сафронов Практика]
GO
/****** Object:  DatabaseRole [Менеджер]    Script Date: 17.01.2025 19:57:23 ******/
CREATE ROLE [Менеджер]
GO
/****** Object:  DatabaseRole [Клиент]    Script Date: 17.01.2025 19:57:23 ******/
CREATE ROLE [Клиент]
GO
/****** Object:  DatabaseRole [Администратор]    Script Date: 17.01.2025 19:57:23 ******/
CREATE ROLE [Администратор]
GO
/****** Object:  Table [dbo].[Заказ_клиента]    Script Date: 17.01.2025 19:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ_клиента](
	[ID_заказа] [int] IDENTITY(1,1) NOT NULL,
	[Дата_заказа] [date] NOT NULL,
	[Дата_доставки] [date] NULL,
	[Статус_заказа] [nvarchar](50) NOT NULL,
	[ID_клиента] [int] NOT NULL,
	[ID_продукта] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 17.01.2025 19:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[ID_клиента] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](100) NOT NULL,
	[Телефон] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Материал]    Script Date: 17.01.2025 19:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Материал](
	[ID_материала] [int] IDENTITY(1,1) NOT NULL,
	[Название_материала] [nvarchar](100) NOT NULL,
	[Единица_измерения] [nvarchar](20) NOT NULL,
	[Цена] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_материала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукт]    Script Date: 17.01.2025 19:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукт](
	[ID_продукта] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](100) NOT NULL,
	[Описание] [text] NULL,
	[Цена] [decimal](10, 2) NOT NULL,
	[Количество_на_складе] [int] NOT NULL,
	[ID_материала] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_продукта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Процесс_производства]    Script Date: 17.01.2025 19:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Процесс_производства](
	[ID_процесса] [int] IDENTITY(1,1) NOT NULL,
	[Название_процесса] [nvarchar](100) NOT NULL,
	[Описание] [text] NULL,
	[Время_выполнения] [int] NOT NULL,
	[ID_материала] [int] NULL,
	[ID_сотрудника] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_процесса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 17.01.2025 19:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[ID_сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](100) NOT NULL,
	[Должность] [nvarchar](100) NOT NULL,
	[Телефон] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Заказ_клиента] ON 

INSERT [dbo].[Заказ_клиента] ([ID_заказа], [Дата_заказа], [Дата_доставки], [Статус_заказа], [ID_клиента], [ID_продукта]) VALUES (2, CAST(N'2023-10-01' AS Date), CAST(N'2023-10-05' AS Date), N'Доставлен', 10, 8)
INSERT [dbo].[Заказ_клиента] ([ID_заказа], [Дата_заказа], [Дата_доставки], [Статус_заказа], [ID_клиента], [ID_продукта]) VALUES (3, CAST(N'2023-10-02' AS Date), CAST(N'2023-10-06' AS Date), N'В обработке', 11, 9)
INSERT [dbo].[Заказ_клиента] ([ID_заказа], [Дата_заказа], [Дата_доставки], [Статус_заказа], [ID_клиента], [ID_продукта]) VALUES (4, CAST(N'2023-10-02' AS Date), CAST(N'2023-10-06' AS Date), N'В обработке', 12, 10)
INSERT [dbo].[Заказ_клиента] ([ID_заказа], [Дата_заказа], [Дата_доставки], [Статус_заказа], [ID_клиента], [ID_продукта]) VALUES (5, CAST(N'2023-10-02' AS Date), CAST(N'2023-10-06' AS Date), N'Доставлен', 13, 11)
INSERT [dbo].[Заказ_клиента] ([ID_заказа], [Дата_заказа], [Дата_доставки], [Статус_заказа], [ID_клиента], [ID_продукта]) VALUES (6, CAST(N'2023-10-02' AS Date), CAST(N'2023-10-06' AS Date), N'В обработке', 14, 12)
INSERT [dbo].[Заказ_клиента] ([ID_заказа], [Дата_заказа], [Дата_доставки], [Статус_заказа], [ID_клиента], [ID_продукта]) VALUES (7, CAST(N'2023-10-02' AS Date), CAST(N'2023-10-06' AS Date), N'В обработке', 15, 13)
INSERT [dbo].[Заказ_клиента] ([ID_заказа], [Дата_заказа], [Дата_доставки], [Статус_заказа], [ID_клиента], [ID_продукта]) VALUES (8, CAST(N'2023-10-02' AS Date), CAST(N'2023-10-06' AS Date), N'Отменён', 16, 14)
INSERT [dbo].[Заказ_клиента] ([ID_заказа], [Дата_заказа], [Дата_доставки], [Статус_заказа], [ID_клиента], [ID_продукта]) VALUES (9, CAST(N'2023-10-02' AS Date), CAST(N'2023-10-06' AS Date), N'В обработке', 17, 8)
SET IDENTITY_INSERT [dbo].[Заказ_клиента] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиент] ON 

INSERT [dbo].[Клиент] ([ID_клиента], [Имя], [Телефон], [Email]) VALUES (10, N'Иван Иванов', N'123-456-7890', N'ivan@example.com')
INSERT [dbo].[Клиент] ([ID_клиента], [Имя], [Телефон], [Email]) VALUES (11, N'Мария Петрова', N'098-765-4321', N'maria@example.com')
INSERT [dbo].[Клиент] ([ID_клиента], [Имя], [Телефон], [Email]) VALUES (12, N'Ирина Кирова', N'453-456-6453', N'maria2342@example.com')
INSERT [dbo].[Клиент] ([ID_клиента], [Имя], [Телефон], [Email]) VALUES (13, N'Игорь Петров', N'653-753-2345', N'igor23432@example.com')
INSERT [dbo].[Клиент] ([ID_клиента], [Имя], [Телефон], [Email]) VALUES (14, N'Люся Манговна', N'423-644-4321', N'hfbh4434@example.com')
INSERT [dbo].[Клиент] ([ID_клиента], [Имя], [Телефон], [Email]) VALUES (15, N'Матвей Гиров', N'234-345-3453', N'bfwes534@example.com')
INSERT [dbo].[Клиент] ([ID_клиента], [Имя], [Телефон], [Email]) VALUES (16, N'Андрей Кокошка', N'324-64-3453', N'lusa212@example.com')
INSERT [dbo].[Клиент] ([ID_клиента], [Имя], [Телефон], [Email]) VALUES (17, N'Алексей Смирнов', N'555-666-7777', N'aleksey@example.com')
SET IDENTITY_INSERT [dbo].[Клиент] OFF
GO
SET IDENTITY_INSERT [dbo].[Материал] ON 

INSERT [dbo].[Материал] ([ID_материала], [Название_материала], [Единица_измерения], [Цена]) VALUES (1, N'Материал A', N'кг', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[Материал] ([ID_материала], [Название_материала], [Единица_измерения], [Цена]) VALUES (2, N'Материал B', N'м', CAST(235.00 AS Decimal(10, 2)))
INSERT [dbo].[Материал] ([ID_материала], [Название_материала], [Единица_измерения], [Цена]) VALUES (3, N'Материал C', N'кг', CAST(345.00 AS Decimal(10, 2)))
INSERT [dbo].[Материал] ([ID_материала], [Название_материала], [Единица_измерения], [Цена]) VALUES (4, N'Материал D', N'м', CAST(355.00 AS Decimal(10, 2)))
INSERT [dbo].[Материал] ([ID_материала], [Название_материала], [Единица_измерения], [Цена]) VALUES (5, N'Материал E', N'м', CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[Материал] ([ID_материала], [Название_материала], [Единица_измерения], [Цена]) VALUES (6, N'Материал J', N'кг', CAST(175.00 AS Decimal(10, 2)))
INSERT [dbo].[Материал] ([ID_материала], [Название_материала], [Единица_измерения], [Цена]) VALUES (7, N'Материал D', N'м', CAST(235.00 AS Decimal(10, 2)))
INSERT [dbo].[Материал] ([ID_материала], [Название_материала], [Единица_измерения], [Цена]) VALUES (8, N'Материал X', N'л', CAST(10.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Материал] OFF
GO
SET IDENTITY_INSERT [dbo].[Продукт] ON 

INSERT [dbo].[Продукт] ([ID_продукта], [Название], [Описание], [Цена], [Количество_на_складе], [ID_материала]) VALUES (8, N'Товар 1', N'Apple 1', CAST(100.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[Продукт] ([ID_продукта], [Название], [Описание], [Цена], [Количество_на_складе], [ID_материала]) VALUES (9, N'Товар 2', N'Sony 2', CAST(350.50 AS Decimal(10, 2)), 16, 2)
INSERT [dbo].[Продукт] ([ID_продукта], [Название], [Описание], [Цена], [Количество_на_складе], [ID_материала]) VALUES (10, N'Товар 3', N'PC 3', CAST(250.50 AS Decimal(10, 2)), 33, 3)
INSERT [dbo].[Продукт] ([ID_продукта], [Название], [Описание], [Цена], [Количество_на_складе], [ID_материала]) VALUES (11, N'Товар 4', N'TV 4', CAST(350.50 AS Decimal(10, 2)), 45, 4)
INSERT [dbo].[Продукт] ([ID_продукта], [Название], [Описание], [Цена], [Количество_на_складе], [ID_материала]) VALUES (12, N'Товар 5', N'Samsung 5', CAST(200.50 AS Decimal(10, 2)), 95, 5)
INSERT [dbo].[Продукт] ([ID_продукта], [Название], [Описание], [Цена], [Количество_на_складе], [ID_материала]) VALUES (13, N'Товар 6', N'Xbox 6', CAST(240.50 AS Decimal(10, 2)), 30, 6)
INSERT [dbo].[Продукт] ([ID_продукта], [Название], [Описание], [Цена], [Количество_на_складе], [ID_материала]) VALUES (14, N'Товар 7', N'Xiomi 7', CAST(150.75 AS Decimal(10, 2)), 20, 7)
SET IDENTITY_INSERT [dbo].[Продукт] OFF
GO
SET IDENTITY_INSERT [dbo].[Процесс_производства] ON 

INSERT [dbo].[Процесс_производства] ([ID_процесса], [Название_процесса], [Описание], [Время_выполнения], [ID_материала], [ID_сотрудника]) VALUES (9, N'Штампока 1', N'Materials 1', 120, NULL, NULL)
INSERT [dbo].[Процесс_производства] ([ID_процесса], [Название_процесса], [Описание], [Время_выполнения], [ID_материала], [ID_сотрудника]) VALUES (10, N'Собирание 2', N'Materials 2', 120, NULL, NULL)
INSERT [dbo].[Процесс_производства] ([ID_процесса], [Название_процесса], [Описание], [Время_выполнения], [ID_материала], [ID_сотрудника]) VALUES (11, N'Относ на склад 3', N'Materials 3', 140, NULL, NULL)
INSERT [dbo].[Процесс_производства] ([ID_процесса], [Название_процесса], [Описание], [Время_выполнения], [ID_материала], [ID_сотрудника]) VALUES (12, N'Пресс 4', N'Materials 4', 132, NULL, NULL)
INSERT [dbo].[Процесс_производства] ([ID_процесса], [Название_процесса], [Описание], [Время_выполнения], [ID_материала], [ID_сотрудника]) VALUES (13, N'Плавка 5', N'Materials 5', 180, NULL, NULL)
INSERT [dbo].[Процесс_производства] ([ID_процесса], [Название_процесса], [Описание], [Время_выполнения], [ID_материала], [ID_сотрудника]) VALUES (14, N'Запекание 6', N'Materials 6', 134, NULL, NULL)
INSERT [dbo].[Процесс_производства] ([ID_процесса], [Название_процесса], [Описание], [Время_выполнения], [ID_материала], [ID_сотрудника]) VALUES (15, N'Выплавка 7', N'Materials 7', 180, NULL, NULL)
INSERT [dbo].[Процесс_производства] ([ID_процесса], [Название_процесса], [Описание], [Время_выполнения], [ID_материала], [ID_сотрудника]) VALUES (16, N'Заливка сырья 8', N'Materials 8', 90, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Процесс_производства] OFF
GO
SET IDENTITY_INSERT [dbo].[Сотрудник] ON 

INSERT [dbo].[Сотрудник] ([ID_сотрудника], [Имя], [Должность], [Телефон], [Email]) VALUES (1, N'Пётр Сидоров', N'Менеджер', N'777-888-9999', N'petr@example.com')
INSERT [dbo].[Сотрудник] ([ID_сотрудника], [Имя], [Должность], [Телефон], [Email]) VALUES (2, N'Наталья Кузнецова', N'Инженер', N'444-555-6666', N'natalya@example.com')
INSERT [dbo].[Сотрудник] ([ID_сотрудника], [Имя], [Должность], [Телефон], [Email]) VALUES (3, N'Игорь Киров', N'Инженер', N'543-535-6666', N'123123@example.com')
INSERT [dbo].[Сотрудник] ([ID_сотрудника], [Имя], [Должность], [Телефон], [Email]) VALUES (4, N'Магомед Киртизян', N'Литейник', N'535-5467-3444', N'wefwef34@example.com')
INSERT [dbo].[Сотрудник] ([ID_сотрудника], [Имя], [Должность], [Телефон], [Email]) VALUES (5, N'Сергей Воробьев', N'Дизайнер', N'333-222-1111', N'sergey@example.com')
SET IDENTITY_INSERT [dbo].[Сотрудник] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Клиент__A9D105343C4373C3]    Script Date: 17.01.2025 19:57:23 ******/
ALTER TABLE [dbo].[Клиент] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Сотрудни__A9D10534A4BC4E9E]    Script Date: 17.01.2025 19:57:23 ******/
ALTER TABLE [dbo].[Сотрудник] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказ_клиента]  WITH CHECK ADD FOREIGN KEY([ID_клиента])
REFERENCES [dbo].[Клиент] ([ID_клиента])
GO
ALTER TABLE [dbo].[Заказ_клиента]  WITH CHECK ADD  CONSTRAINT [FK_ProductID] FOREIGN KEY([ID_продукта])
REFERENCES [dbo].[Продукт] ([ID_продукта])
GO
ALTER TABLE [dbo].[Заказ_клиента] CHECK CONSTRAINT [FK_ProductID]
GO
ALTER TABLE [dbo].[Продукт]  WITH CHECK ADD  CONSTRAINT [FK_MaterialID] FOREIGN KEY([ID_материала])
REFERENCES [dbo].[Материал] ([ID_материала])
GO
ALTER TABLE [dbo].[Продукт] CHECK CONSTRAINT [FK_MaterialID]
GO
ALTER TABLE [dbo].[Процесс_производства]  WITH CHECK ADD  CONSTRAINT [FK_MaterialsID] FOREIGN KEY([ID_материала])
REFERENCES [dbo].[Материал] ([ID_материала])
GO
ALTER TABLE [dbo].[Процесс_производства] CHECK CONSTRAINT [FK_MaterialsID]
GO
ALTER TABLE [dbo].[Процесс_производства]  WITH CHECK ADD  CONSTRAINT [FK_SotrudnikID] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[Процесс_производства] CHECK CONSTRAINT [FK_SotrudnikID]
GO
ALTER TABLE [dbo].[Материал]  WITH CHECK ADD CHECK  (([Цена]>=(0)))
GO
ALTER TABLE [dbo].[Продукт]  WITH CHECK ADD CHECK  (([Количество_на_складе]>=(0)))
GO
ALTER TABLE [dbo].[Продукт]  WITH CHECK ADD CHECK  (([Цена]>=(0)))
GO
ALTER TABLE [dbo].[Процесс_производства]  WITH CHECK ADD CHECK  (([Время_выполнения]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [Сафронов Практика] SET  READ_WRITE 
GO
