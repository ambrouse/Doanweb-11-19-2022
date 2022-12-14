USE [master]
GO
/****** Object:  Database [qlshopxe_v2]    Script Date: 12/8/2022 1:51:50 PM ******/
CREATE DATABASE [qlshopxe_v2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qlshopxe', FILENAME = N'O:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\qlshopxe_v2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'qlshopxe_log', FILENAME = N'O:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\qlshopxe_v2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [qlshopxe_v2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qlshopxe_v2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qlshopxe_v2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET ARITHABORT OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [qlshopxe_v2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qlshopxe_v2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qlshopxe_v2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [qlshopxe_v2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qlshopxe_v2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [qlshopxe_v2] SET  MULTI_USER 
GO
ALTER DATABASE [qlshopxe_v2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qlshopxe_v2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qlshopxe_v2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qlshopxe_v2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [qlshopxe_v2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [qlshopxe_v2] SET QUERY_STORE = OFF
GO
USE [qlshopxe_v2]
GO
/****** Object:  User [qlshopxe]    Script Date: 12/8/2022 1:51:50 PM ******/
CREATE USER [qlshopxe] FOR LOGIN [qlshopxe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ad]    Script Date: 12/8/2022 1:51:50 PM ******/
CREATE USER [ad] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [qlshopxe]
GO
ALTER ROLE [db_owner] ADD MEMBER [ad]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [ad]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ad]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ad]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [ad]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ad]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ad]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [ad]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [ad]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [varchar](250) NULL,
	[pass] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chat]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NULL,
	[idsanpham] [int] NULL,
	[tenuser] [nvarchar](250) NULL,
	[chat] [nvarchar](255) NULL,
	[danhgia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitietdonhang]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietdonhang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idsanpham] [int] NULL,
	[iddonhang] [int] NULL,
	[ten] [nvarchar](250) NULL,
	[dongia] [money] NULL,
	[soluong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hang]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phanquyen]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phanquyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NULL,
	[idquyen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quyen]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](250) NULL,
	[gia] [money] NULL,
	[loai] [int] NULL,
	[hang] [int] NULL,
	[imgurl_1] [nvarchar](250) NULL,
	[imgurl_2] [nvarchar](250) NULL,
	[danhgia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/8/2022 1:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](250) NULL,
	[email] [nvarchar](250) NULL,
	[sodt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [ten], [pass]) VALUES (1, N'adminduy', N'3568')
INSERT [dbo].[admin] ([id], [ten], [pass]) VALUES (2, N'adminbao', N'3568')
INSERT [dbo].[admin] ([id], [ten], [pass]) VALUES (10, N'duy ngu vl', N'3568')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[chat] ON 

INSERT [dbo].[chat] ([id], [iduser], [idsanpham], [tenuser], [chat], [danhgia]) VALUES (3, 7, 36, N'anime', N'text', 10)
INSERT [dbo].[chat] ([id], [iduser], [idsanpham], [tenuser], [chat], [danhgia]) VALUES (4, 8, 36, N'duy ngu', N'text', 5)
SET IDENTITY_INSERT [dbo].[chat] OFF
GO
SET IDENTITY_INSERT [dbo].[chitietdonhang] ON 

INSERT [dbo].[chitietdonhang] ([id], [idsanpham], [iddonhang], [ten], [dongia], [soluong]) VALUES (35, 36, 7, N'Vision xanh đen', 200.0000, 1)
SET IDENTITY_INSERT [dbo].[chitietdonhang] OFF
GO
SET IDENTITY_INSERT [dbo].[hang] ON 

INSERT [dbo].[hang] ([id], [ten]) VALUES (1, N'Honda')
INSERT [dbo].[hang] ([id], [ten]) VALUES (2, N'Yamaha')
INSERT [dbo].[hang] ([id], [ten]) VALUES (3, N'Piaggio')
INSERT [dbo].[hang] ([id], [ten]) VALUES (4, N'SYM')
INSERT [dbo].[hang] ([id], [ten]) VALUES (5, N'Suzuki')
INSERT [dbo].[hang] ([id], [ten]) VALUES (6, N'Triumph')
INSERT [dbo].[hang] ([id], [ten]) VALUES (7, N'Ducati')
INSERT [dbo].[hang] ([id], [ten]) VALUES (8, N'Kawasaki')
SET IDENTITY_INSERT [dbo].[hang] OFF
GO
SET IDENTITY_INSERT [dbo].[loai] ON 

INSERT [dbo].[loai] ([id], [ten]) VALUES (1, N'xe tay ga')
INSERT [dbo].[loai] ([id], [ten]) VALUES (2, N'xe tay côn')
INSERT [dbo].[loai] ([id], [ten]) VALUES (3, N'xe PKL')
INSERT [dbo].[loai] ([id], [ten]) VALUES (4, N'xe số')
SET IDENTITY_INSERT [dbo].[loai] OFF
GO
SET IDENTITY_INSERT [dbo].[phanquyen] ON 

INSERT [dbo].[phanquyen] ([id], [iduser], [idquyen]) VALUES (14, 1, 5)
INSERT [dbo].[phanquyen] ([id], [iduser], [idquyen]) VALUES (15, 2, 5)
INSERT [dbo].[phanquyen] ([id], [iduser], [idquyen]) VALUES (20, 10, 8)
SET IDENTITY_INSERT [dbo].[phanquyen] OFF
GO
SET IDENTITY_INSERT [dbo].[quyen] ON 

INSERT [dbo].[quyen] ([id], [ten]) VALUES (1, N'Xem thông tin')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (2, N'Sửa thông tin')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (3, N'Xóa thông tin')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (4, N'Thêm thông tin')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (5, N'admin')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (6, N'Xem và Xóa')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (7, N'Xem và sửa')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (8, N'Xem và Thêm')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (9, N'Xóa và sửa')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (10, N'Xóa và Thêm')
INSERT [dbo].[quyen] ([id], [ten]) VALUES (11, N'Sửa và Thêm')
SET IDENTITY_INSERT [dbo].[quyen] OFF
GO
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (24, N'Air Blade xám', 200.0000, 1, 1, N'/imgxe/chitiet_ab01.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (25, N'Air Blade 2022 xám đen ', 200.0000, 1, 1, N'/imgxe/chitiet_ab01_2022.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (26, N'Air Blade đen', 200.0000, 1, 1, N'/imgxe/chitiet_ab02.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (27, N'Air Blade 2022 trắng đỏ ', 200.0000, 1, 1, N'/imgxe/chitiet_ab02_2022.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (28, N'Air Blade đỏ', 200.0000, 1, 1, N'/imgxe/chitiet_ab03.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (29, N'Air Blade đen nhám', 200.0000, 1, 1, N'/imgxe/chitiet_ab04_a.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (30, N'Air Blade trắng đen', 200.0000, 1, 1, N'/imgxe/chitiet_ab05.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (31, N'Vision trắng', 200.0000, 1, 1, N'/imgxe/chitiet_vs01.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (32, N'Vision đen', 200.0000, 1, 1, N'/imgxe/chitiet_vs02.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (33, N'Vision trắng đỏ', 200.0000, 1, 1, N'/imgxe/chitiet_vs03.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (34, N'Vision đỏ', 200.0000, 1, 1, N'/imgxe/chitiet_vs04.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (35, N'Vision xanh nâu', 200.0000, 1, 1, N'/imgxe/chitiet_vs05.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [danhgia]) VALUES (36, N'Vision xanh đen', 200.0000, 1, 1, N'/imgxe/chitiet_vs06.jpg', N'/imgxe/chitiet_vs_chung.jpg', 7)
SET IDENTITY_INSERT [dbo].[sanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [ten], [email], [sodt]) VALUES (7, N'anime', N'thichthichich38@gmail.com', 326032299)
INSERT [dbo].[users] ([id], [ten], [email], [sodt]) VALUES (8, N'duy ngu', N'thichthichich3568@gmail.com', 326032299)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[chitietdonhang]  WITH CHECK ADD FOREIGN KEY([idsanpham])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD FOREIGN KEY([hang])
REFERENCES [dbo].[hang] ([id])
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD FOREIGN KEY([loai])
REFERENCES [dbo].[loai] ([id])
GO
USE [master]
GO
ALTER DATABASE [qlshopxe_v2] SET  READ_WRITE 
GO
