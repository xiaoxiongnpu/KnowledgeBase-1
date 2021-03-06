USE [master]
GO
/****** Object:  Database [KBDB]    Script Date: 24/05/2016 7:25:24 PM ******/
CREATE DATABASE [KBDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KBDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\KBDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KBDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\KBDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KBDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KBDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KBDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KBDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KBDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KBDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KBDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KBDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KBDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KBDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KBDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KBDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KBDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KBDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KBDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KBDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KBDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KBDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KBDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KBDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KBDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KBDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KBDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KBDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KBDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KBDB] SET  MULTI_USER 
GO
ALTER DATABASE [KBDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KBDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KBDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KBDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KBDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [KBDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 24/05/2016 7:25:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 24/05/2016 7:25:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 24/05/2016 7:25:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[StepID] [int] NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Problems]    Script Date: 24/05/2016 7:25:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problems](
	[ProblemID] [int] IDENTITY(1,1) NOT NULL,
	[Tags] [nvarchar](500) NULL,
	[SubCategoryID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Problems] PRIMARY KEY CLUSTERED 
(
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Solutions]    Script Date: 24/05/2016 7:25:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solutions](
	[SolutionId] [int] IDENTITY(1,1) NOT NULL,
	[Tags] [nvarchar](500) NULL,
	[Rating] [real] NOT NULL,
	[ProblemID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Solutions] PRIMARY KEY CLUSTERED 
(
	[SolutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Steps]    Script Date: 24/05/2016 7:25:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Steps](
	[StepID] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [tinyint] NOT NULL,
	[SolutionID] [int] NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Steps] PRIMARY KEY CLUSTERED 
(
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Sequence] UNIQUE NONCLUSTERED 
(
	[Sequence] ASC,
	[SolutionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 24/05/2016 7:25:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.SubCategories] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsefulInfos]    Script Date: 24/05/2016 7:25:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsefulInfos](
	[UsefulInfoID] [int] IDENTITY(1,1) NOT NULL,
	[ProgamingLang] [int] NOT NULL,
	[URL] [nvarchar](200) NULL,
	[Tags] [nvarchar](500) NULL,
	[ProblemID] [int] NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.UsefulInfos] PRIMARY KEY CLUSTERED 
(
	[UsefulInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_StepID]    Script Date: 24/05/2016 7:25:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_StepID] ON [dbo].[Comments]
(
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubCategoryID]    Script Date: 24/05/2016 7:25:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubCategoryID] ON [dbo].[Problems]
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProblemID]    Script Date: 24/05/2016 7:25:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProblemID] ON [dbo].[Solutions]
(
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SolutionID]    Script Date: 24/05/2016 7:25:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_SolutionID] ON [dbo].[Steps]
(
	[SolutionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryID]    Script Date: 24/05/2016 7:25:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryID] ON [dbo].[SubCategories]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProblemID]    Script Date: 24/05/2016 7:25:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProblemID] ON [dbo].[UsefulInfos]
(
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Steps_StepID] FOREIGN KEY([StepID])
REFERENCES [dbo].[Steps] ([StepID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Steps_StepID]
GO
ALTER TABLE [dbo].[Problems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Problems_dbo.SubCategories_SubCategoryID] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategories] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Problems] CHECK CONSTRAINT [FK_dbo.Problems_dbo.SubCategories_SubCategoryID]
GO
ALTER TABLE [dbo].[Solutions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Solutions_dbo.Problems_ProblemID] FOREIGN KEY([ProblemID])
REFERENCES [dbo].[Problems] ([ProblemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Solutions] CHECK CONSTRAINT [FK_dbo.Solutions_dbo.Problems_ProblemID]
GO
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Steps_dbo.Solutions_SolutionID] FOREIGN KEY([SolutionID])
REFERENCES [dbo].[Solutions] ([SolutionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_dbo.Steps_dbo.Solutions_SolutionID]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubCategories_dbo.Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_dbo.SubCategories_dbo.Categories_CategoryID]
GO
ALTER TABLE [dbo].[UsefulInfos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsefulInfos_dbo.Problems_ProblemID] FOREIGN KEY([ProblemID])
REFERENCES [dbo].[Problems] ([ProblemID])
GO
ALTER TABLE [dbo].[UsefulInfos] CHECK CONSTRAINT [FK_dbo.UsefulInfos_dbo.Problems_ProblemID]
GO
USE [master]
GO
ALTER DATABASE [KBDB] SET  READ_WRITE 
GO
