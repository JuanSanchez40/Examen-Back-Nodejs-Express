USE [master]
GO
/****** Object:  Database [testdb]    Script Date: 14/03/2024 06:51:58 p. m. ******/
CREATE DATABASE [testdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\testdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\testdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [testdb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [testdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [testdb] SET  MULTI_USER 
GO
ALTER DATABASE [testdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [testdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [testdb] SET QUERY_STORE = ON
GO
ALTER DATABASE [testdb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [testdb]
GO
/****** Object:  Table [dbo].[entradas]    Script Date: 14/03/2024 06:51:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entradas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](255) NULL,
	[autor] [nvarchar](255) NULL,
	[fecha] [nvarchar](255) NULL,
	[contenido] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 14/03/2024 06:51:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 14/03/2024 06:51:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[roleId] [int] NOT NULL,
	[userId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14/03/2024 06:51:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[entradas] ON 
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (16, N'Ricardo Lavolpe', N'Archundia Edition', N'2024-03-14', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ', CAST(N'2024-03-14T19:40:00.3270000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T19:40:00.3270000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (17, N'Alejandro', N'Artemio', N'2024-03-14', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. ', CAST(N'2024-03-14T23:23:54.3050000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:23:54.3050000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (23, N'Margarita', N'Gabriel Garcia', N'2024-03-05', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200', CAST(N'2024-03-14T23:26:04.3960000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:26:04.3960000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (24, N'Roberto', N'Suarez', N'2024-03-03', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words,', CAST(N'2024-03-14T23:26:57.2430000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:26:57.2430000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (27, N'Ramon', N'Ambriz', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:27:51.1200000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:27:51.1200000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (28, N'Manuel', N'Morales', N'2024-03-10', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. ', CAST(N'2024-03-14T23:28:27.4700000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:28:27.4700000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (29, N'Expropiacion', N'Hermosillo', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:30:25.9980000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:30:25.9980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (30, N'Jordi', N'Banrranking', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:31:22.8070000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:31:22.8070000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (31, N'Cameron', N'Stone', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:31:56.8880000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:31:56.8880000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (32, N'Alvaro', N'Pineda', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:32:40.2040000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:32:40.2040000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (33, N'Javier', N'Hernandez', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:33:06.6690000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:33:06.6690000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (34, N'Mariano', N'Barba', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:34:24.7690000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:34:24.7690000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (35, N'Adolfo', N'Peralta', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:35:18.8420000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:35:18.8420000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (36, N'Romualdo', N'Romualdo', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:36:17.4180000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:36:17.4180000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[entradas] ([id], [titulo], [autor], [fecha], [contenido], [createdAt], [updatedAt]) VALUES (37, N'Lisandro', N'Lopez', N'2024-03-14', N'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary ', CAST(N'2024-03-14T23:36:57.7100000+00:00' AS DateTimeOffset), CAST(N'2024-03-14T23:36:57.7100000+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[entradas] OFF
GO
INSERT [dbo].[roles] ([id], [name], [createdAt], [updatedAt]) VALUES (1, N'user', CAST(N'2022-10-13T17:57:59.0000000+00:00' AS DateTimeOffset), CAST(N'2022-10-13T17:57:59.0000000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[roles] ([id], [name], [createdAt], [updatedAt]) VALUES (2, N'moderator', CAST(N'2022-10-13T17:58:03.0000000+00:00' AS DateTimeOffset), CAST(N'2022-10-13T17:58:03.0000000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[roles] ([id], [name], [createdAt], [updatedAt]) VALUES (3, N'admin', CAST(N'2022-10-13T17:58:06.0000000+00:00' AS DateTimeOffset), CAST(N'2022-10-13T17:58:06.0000000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[user_roles] ([createdAt], [updatedAt], [roleId], [userId]) VALUES (CAST(N'2024-03-13T14:41:14.9960000+00:00' AS DateTimeOffset), CAST(N'2024-03-13T14:41:14.9960000+00:00' AS DateTimeOffset), 3, 1)
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password], [createdAt], [updatedAt]) VALUES (1, N'admin', N'admin@bezkoder.com', N'$2a$08$w3cYCF.N0UQZO19z8CQSZ.whzxFS5vMoi9k51g3TQx9r5tkwrIXO2', CAST(N'2020-01-13T09:21:51.0000000+00:00' AS DateTimeOffset), CAST(N'2020-01-13T09:21:51.0000000+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[roles] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [testdb] SET  READ_WRITE 
GO
