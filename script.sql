USE [master]
GO
/****** Object:  Database [dbPersonellManagement]    Script Date: 29.01.2025 4:39:17 ******/
CREATE DATABASE [dbPersonellManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbPersonellManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbPersonellManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbPersonellManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbPersonellManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbPersonellManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbPersonellManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbPersonellManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbPersonellManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbPersonellManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbPersonellManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbPersonellManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbPersonellManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbPersonellManagement] SET  MULTI_USER 
GO
ALTER DATABASE [dbPersonellManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbPersonellManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbPersonellManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbPersonellManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbPersonellManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbPersonellManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbPersonellManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbPersonellManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbPersonellManagement]
GO
/****** Object:  Table [dbo].[Absences]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absences](
	[AbsenceID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[SubstituteID] [int] NULL,
	[Reason] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AbsenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendars]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendars](
	[CalendarID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[DepartmentID] [int] NULL,
	[CalendarTypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CalendarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalendarTypes]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalendarTypes](
	[CalendarTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CalendarTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CalendarTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[CandidateID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Resume] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[IdDocument] [int] NULL,
	[IdAuthor] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ManagerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DateCreated] [date] NULL,
	[DateUpdated] [date] NULL,
	[Category] [nvarchar](50) NULL,
	[HasComments] [bit] NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[MobilePhone] [nvarchar](20) NULL,
	[BirthDate] [date] NULL,
	[DepartmentID] [int] NULL,
	[PositionID] [int] NULL,
	[SupervisorID] [int] NULL,
	[AssistantID] [int] NULL,
	[WorkPhone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Office] [nvarchar](10) NULL,
	[AdditionalInfo] [nvarchar](max) NULL,
 CONSTRAINT [PK__Employee__7AD04FF1A62F8F00] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventEmployee]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[DateStart] [date] NULL,
	[DateEnd] [date] NULL,
	[EventEmployeeTypeID] [int] NULL,
 CONSTRAINT [PK_EventEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventEmployeeType]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventEmployeeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_EventEmployeeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[CalendarID] [int] NOT NULL,
	[EventName] [nvarchar](100) NOT NULL,
	[EventTypeID] [int] NOT NULL,
	[EventStatusID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ResponsiblePersons] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventStatuses]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventStatuses](
	[EventStatusID] [int] IDENTITY(1,1) NOT NULL,
	[EventStatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypes](
	[EventTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
	[ApprovalDate] [date] NOT NULL,
	[ModificationDate] [date] NOT NULL,
	[MaterialStatusID] [int] NOT NULL,
	[MaterialTypeID] [int] NOT NULL,
	[Domain] [nvarchar](100) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialStatuses]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialStatuses](
	[MaterialStatusID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialStatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialTypes]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialTypes](
	[MaterialTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingClasses]    Script Date: 29.01.2025 4:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingClasses](
	[TrainingID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[MaterialID] [int] NULL,
	[TrainingDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Calendars] ON 

INSERT [dbo].[Calendars] ([CalendarID], [EmployeeID], [DepartmentID], [CalendarTypeID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Calendars] ([CalendarID], [EmployeeID], [DepartmentID], [CalendarTypeID]) VALUES (2, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Calendars] OFF
GO
SET IDENTITY_INSERT [dbo].[CalendarTypes] ON 

INSERT [dbo].[CalendarTypes] ([CalendarTypeID], [CalendarTypeName]) VALUES (2, N'Событие сотрудника')
INSERT [dbo].[CalendarTypes] ([CalendarTypeID], [CalendarTypeName]) VALUES (1, N'События')
SET IDENTITY_INSERT [dbo].[CalendarTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Text], [DateCreated], [DateUpdated], [IdDocument], [IdAuthor]) VALUES (1, N'Test', CAST(N'2025-01-01T15:15:15.000' AS DateTime), CAST(N'2025-01-01T16:11:11.000' AS DateTime), 1, 1)
INSERT [dbo].[Comments] ([Id], [Text], [DateCreated], [DateUpdated], [IdDocument], [IdAuthor]) VALUES (2, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Description], [ManagerID]) VALUES (1, N'Департамент финансовой политики', N'Занимаются отмыванием грязных денег', 1)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([Id], [Name], [DateCreated], [DateUpdated], [Category], [HasComments]) VALUES (1, N'Test', CAST(N'2025-01-01' AS Date), CAST(N'2025-01-02' AS Date), N'Test', 1)
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [MobilePhone], [BirthDate], [DepartmentID], [PositionID], [SupervisorID], [AssistantID], [WorkPhone], [Email], [Office], [AdditionalInfo]) VALUES (1, N'Мурад', N'Курбанов', N'Гаджиевич', N'8989898989', CAST(N'2006-02-27' AS Date), 1, 2, 2, 2, N'7777777777', N'mura@gmail.com', N'Ресепшен', N'test')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [MobilePhone], [BirthDate], [DepartmentID], [PositionID], [SupervisorID], [AssistantID], [WorkPhone], [Email], [Office], [AdditionalInfo]) VALUES (2, N'Иван', N'Иванов', N'Иванович', N'+7989123', CAST(N'2005-02-27' AS Date), 1, 1, NULL, NULL, N'9999999999', N'ivan@gmail.com', N'Ресепшен', NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[EventEmployee] ON 

INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (1, 1, CAST(N'2025-01-29' AS Date), CAST(N'2025-01-30' AS Date), 1)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (2, 2, CAST(N'2025-01-29' AS Date), CAST(N'2030-01-25' AS Date), 2)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (3, 2, CAST(N'2025-01-29' AS Date), CAST(N'2025-01-25' AS Date), 2)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (4, 2, CAST(N'2025-01-29' AS Date), CAST(N'2025-01-30' AS Date), 1)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (6, 2, CAST(N'2025-01-29' AS Date), CAST(N'2025-02-07' AS Date), 3)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (7, 2, CAST(N'2025-01-29' AS Date), CAST(N'2025-02-07' AS Date), 2)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (8, 2, CAST(N'2025-01-29' AS Date), CAST(N'2025-02-07' AS Date), 1)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (9, 2, CAST(N'2025-01-29' AS Date), CAST(N'2025-02-07' AS Date), 1)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (10, 2, CAST(N'2025-01-29' AS Date), CAST(N'2025-02-07' AS Date), 1)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (11, 2, CAST(N'2025-01-29' AS Date), CAST(N'2025-02-07' AS Date), 1)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (12, 2, CAST(N'2025-01-17' AS Date), CAST(N'2025-01-25' AS Date), 1)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (13, 2, CAST(N'2025-01-17' AS Date), CAST(N'2025-01-25' AS Date), 1)
INSERT [dbo].[EventEmployee] ([Id], [EmployeeID], [DateStart], [DateEnd], [EventEmployeeTypeID]) VALUES (14, 2, CAST(N'2025-01-17' AS Date), CAST(N'2025-01-25' AS Date), 1)
SET IDENTITY_INSERT [dbo].[EventEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[EventEmployeeType] ON 

INSERT [dbo].[EventEmployeeType] ([Id], [Title]) VALUES (1, N'Обучение')
INSERT [dbo].[EventEmployeeType] ([Id], [Title]) VALUES (2, N'Отпуск')
INSERT [dbo].[EventEmployeeType] ([Id], [Title]) VALUES (3, N'Отгул')
SET IDENTITY_INSERT [dbo].[EventEmployeeType] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventID], [CalendarID], [EventName], [EventTypeID], [EventStatusID], [StartDate], [EndDate], [ResponsiblePersons], [Description]) VALUES (2, 1, N'Общее совещание в актовом зале', 1, 1, CAST(N'2025-01-21T00:00:00.000' AS DateTime), CAST(N'2025-01-22T00:00:00.000' AS DateTime), N'1', N'Все сотрудники отдела "Администраторы" собираемся')
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[EventStatuses] ON 

INSERT [dbo].[EventStatuses] ([EventStatusID], [EventStatusName]) VALUES (1, N'В ожидании')
SET IDENTITY_INSERT [dbo].[EventStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[EventTypes] ON 

INSERT [dbo].[EventTypes] ([EventTypeID], [EventTypeName]) VALUES (1, N'Совещание')
SET IDENTITY_INSERT [dbo].[EventTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionID], [PositionName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Positions] ([PositionID], [PositionName]) VALUES (1, N'Уборшик')
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Calendar__0715E7A82BE510F9]    Script Date: 29.01.2025 4:39:17 ******/
ALTER TABLE [dbo].[CalendarTypes] ADD UNIQUE NONCLUSTERED 
(
	[CalendarTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC34E4098B20]    Script Date: 29.01.2025 4:39:17 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__A9D105347D925957]    Script Date: 29.01.2025 4:39:17 ******/
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [UQ__Employee__A9D105347D925957] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__EventSta__177BEE28506BD153]    Script Date: 29.01.2025 4:39:17 ******/
ALTER TABLE [dbo].[EventStatuses] ADD UNIQUE NONCLUSTERED 
(
	[EventStatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__EventTyp__29BD765FDC30F694]    Script Date: 29.01.2025 4:39:17 ******/
ALTER TABLE [dbo].[EventTypes] ADD UNIQUE NONCLUSTERED 
(
	[EventTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Material__39E1C371EBED9334]    Script Date: 29.01.2025 4:39:17 ******/
ALTER TABLE [dbo].[MaterialStatuses] ADD UNIQUE NONCLUSTERED 
(
	[MaterialStatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Material__AB21FEE514CE2CE7]    Script Date: 29.01.2025 4:39:17 ******/
ALTER TABLE [dbo].[MaterialTypes] ADD UNIQUE NONCLUSTERED 
(
	[MaterialTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Position__E46AEF4273A26528]    Script Date: 29.01.2025 4:39:17 ******/
ALTER TABLE [dbo].[Positions] ADD UNIQUE NONCLUSTERED 
(
	[PositionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Absences]  WITH CHECK ADD  CONSTRAINT [FK__Absences__Employ__778AC167] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Absences] CHECK CONSTRAINT [FK__Absences__Employ__778AC167]
GO
ALTER TABLE [dbo].[Absences]  WITH CHECK ADD  CONSTRAINT [FK__Absences__Substi__787EE5A0] FOREIGN KEY([SubstituteID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Absences] CHECK CONSTRAINT [FK__Absences__Substi__787EE5A0]
GO
ALTER TABLE [dbo].[Calendars]  WITH CHECK ADD FOREIGN KEY([CalendarTypeID])
REFERENCES [dbo].[CalendarTypes] ([CalendarTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Calendars]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Calendars]  WITH CHECK ADD  CONSTRAINT [FK__Calendars__Emplo__59063A47] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Calendars] CHECK CONSTRAINT [FK__Calendars__Emplo__59063A47]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Documents] FOREIGN KEY([IdDocument])
REFERENCES [dbo].[Documents] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Documents]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Employees] FOREIGN KEY([IdAuthor])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__Assis__534D60F1] FOREIGN KEY([AssistantID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__Assis__534D60F1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__Depar__5070F446] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__Depar__5070F446]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__Posit__5165187F] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([PositionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__Posit__5165187F]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__Super__52593CB8] FOREIGN KEY([SupervisorID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__Super__52593CB8]
GO
ALTER TABLE [dbo].[EventEmployee]  WITH CHECK ADD  CONSTRAINT [FK_EventEmployee_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EventEmployee] CHECK CONSTRAINT [FK_EventEmployee_Employees]
GO
ALTER TABLE [dbo].[EventEmployee]  WITH CHECK ADD  CONSTRAINT [FK_EventEmployee_EventEmployeeType] FOREIGN KEY([EventEmployeeTypeID])
REFERENCES [dbo].[EventEmployeeType] ([Id])
GO
ALTER TABLE [dbo].[EventEmployee] CHECK CONSTRAINT [FK_EventEmployee_EventEmployeeType]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([CalendarID])
REFERENCES [dbo].[Calendars] ([CalendarID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([EventStatusID])
REFERENCES [dbo].[EventStatuses] ([EventStatusID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([EventTypeID])
REFERENCES [dbo].[EventTypes] ([EventTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([MaterialStatusID])
REFERENCES [dbo].[MaterialStatuses] ([MaterialStatusID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialTypes] ([MaterialTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrainingClasses]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrainingClasses]  WITH CHECK ADD FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([MaterialID])
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [dbPersonellManagement] SET  READ_WRITE 
GO
