USE [master]
GO
/****** Object:  Database [cxExample]    Script Date: 11/20/2016 11:09:21 AM ******/
CREATE DATABASE [cxExample]
 CONTAINMENT = NONE
--dkkfjk
 ON  PRIMARY 
( NAME = N'Commissioning_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\cxExample.mdf' , SIZE = 653248KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Commissioning_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\cxExample_log.ldf' , SIZE = 3456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [cxExample] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cxExample].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [cxExample] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cxExample] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cxExample] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cxExample] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cxExample] SET ARITHABORT OFF 
GO
ALTER DATABASE [cxExample] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cxExample] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cxExample] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cxExample] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cxExample] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cxExample] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cxExample] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cxExample] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cxExample] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cxExample] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cxExample] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cxExample] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cxExample] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cxExample] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cxExample] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cxExample] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cxExample] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cxExample] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cxExample] SET  MULTI_USER 
GO
ALTER DATABASE [cxExample] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [cxExample] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cxExample] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cxExample] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [cxExample] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'cxExample', N'ON'
GO
USE [cxExample]
GO
/****** Object:  User [NEPTUNE\IIS_WPG]    Script Date: 11/20/2016 11:09:28 AM ******/
CREATE USER [NEPTUNE\IIS_WPG]
GO
/****** Object:  User [Domain Admins]    Script Date: 11/20/2016 11:09:28 AM ******/
CREATE USER [Domain Admins]
GO
/****** Object:  User [BVHIS\GregA]    Script Date: 11/20/2016 11:09:28 AM ******/
CREATE USER [BVHIS\GregA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BVHis\BVH User]    Script Date: 11/20/2016 11:09:28 AM ******/
CREATE USER [BVHis\BVH User] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BUILTIN\Administrators]    Script Date: 11/20/2016 11:09:28 AM ******/
CREATE USER [BUILTIN\Administrators] FOR LOGIN [BUILTIN\Administrators]
GO
ALTER ROLE [db_owner] ADD MEMBER [NEPTUNE\IIS_WPG]
GO
ALTER ROLE [db_owner] ADD MEMBER [Domain Admins]
GO
ALTER ROLE [db_owner] ADD MEMBER [BVHis\BVH User]
GO
ALTER ROLE [db_owner] ADD MEMBER [BUILTIN\Administrators]
GO
/****** Object:  Schema [Domain Admins]    Script Date: 11/20/2016 11:09:31 AM ******/
CREATE SCHEMA [Domain Admins]
GO
/****** Object:  Table [dbo].[COMPANIES]    Script Date: 11/20/2016 11:09:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANIES](
	[COMPANY_ID] [int] IDENTITY(1,1) NOT NULL,
	[COMPANY_NAME] [nvarchar](50) NOT NULL,
	[COMPANY_ABB] [nvarchar](8) NOT NULL,
	[ISACTIVE] [bit] NULL,
 CONSTRAINT [PK_COMPANYS] PRIMARY KEY CLUSTERED 
(
	[COMPANY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPANY_HEIRACHY]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANY_HEIRACHY](
	[PROJECT_ID] [int] NOT NULL,
	[PARENT_COMPANY_ID] [int] NOT NULL,
	[SUB_COMPANY_ID] [int] NOT NULL,
 CONSTRAINT [PK_COMPANY_HEIRACHY] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC,
	[PARENT_COMPANY_ID] ASC,
	[SUB_COMPANY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DEFICIENCIES]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEFICIENCIES](
	[PROJECT_ID] [int] NOT NULL,
	[ITEM_STATUS] [nvarchar](32) NULL,
	[ITEM_NUMBER] [int] NOT NULL,
	[TAG_ID] [nvarchar](48) NOT NULL,
	[ITEM_DESC] [nvarchar](2048) NOT NULL,
	[DATE_POSTED] [datetime] NOT NULL,
	[COMPANY_ID] [int] NULL,
	[ITEM_COMMENT] [nvarchar](4000) NULL,
 CONSTRAINT [PK_DEFICIENCIES] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC,
	[ITEM_NUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHOTOS]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHOTOS](
	[ID] [varchar](50) NOT NULL,
	[Bytes] [varbinary](max) NULL,
	[Description] [varchar](max) NULL,
	[PROJECT_ID] [int] NOT NULL,
	[ITEM_NUMBER] [int] NOT NULL,
	[Url] [nvarchar](500) NULL,
	[ContentType] [nvarchar](200) NULL,
 CONSTRAINT [PK_PHOTOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[PROJECT_ID] ASC,
	[ITEM_NUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROJECT_ITEM_NUMBER]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECT_ITEM_NUMBER](
	[PROJECT_ID] [int] NOT NULL,
	[NEXT_ITEM_NUMBER] [int] NOT NULL,
 CONSTRAINT [PK_PROJECT_ITEM_NUMBER] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROJECTS]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECTS](
	[PROJECT_ID] [int] IDENTITY(1,1) NOT NULL,
	[PROJECT_NUMBER] [nvarchar](16) NOT NULL,
	[PROJECT_DESC] [nvarchar](512) NULL,
	[PROJECT_LOC] [nvarchar](50) NULL,
	[PROJECT_NAME] [nvarchar](50) NOT NULL,
	[PROJECT_OWNER] [nvarchar](50) NULL,
	[PROJECT_LEED_CA] [nvarchar](50) NULL,
	[PROJECT_LEED_EMAIL] [nvarchar](50) NULL,
	[PROJECT_CLOSED] [bit] NULL,
	[PROJECT_COMNOTICE_INFO] [nvarchar](1024) NULL,
 CONSTRAINT [PK_PROJECTS] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRADES]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRADES](
	[TRADE_ID] [int] IDENTITY(1,1) NOT NULL,
	[TRADE_DESC] [nvarchar](50) NULL,
 CONSTRAINT [PK_TRADES] PRIMARY KEY CLUSTERED 
(
	[TRADE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USAGE_LOG]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USAGE_LOG](
	[LOGIN_TIME] [datetime] NOT NULL,
	[USER_ID] [int] NOT NULL,
	[PROJECT_ID] [int] NOT NULL,
 CONSTRAINT [PK_USAGE_LOG] PRIMARY KEY CLUSTERED 
(
	[LOGIN_TIME] ASC,
	[USER_ID] ASC,
	[PROJECT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_ROLES]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_ROLES](
	[PROJECT_ID] [int] NOT NULL,
	[USER_ID] [int] NOT NULL,
	[TRADE_ID] [int] NOT NULL,
 CONSTRAINT [PK_COMPANY_ROLES] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC,
	[USER_ID] ASC,
	[TRADE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERS]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_NAME] [nvarchar](50) NOT NULL,
	[USER_PASSWORD] [nvarchar](128) NOT NULL,
	[USER_EMAIL] [nvarchar](50) NOT NULL,
	[COMPANY_ID] [int] NOT NULL,
	[USER_PHONE] [nvarchar](50) NULL,
	[ISADMIN] [bit] NULL,
	[ISACTIVE] [bit] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_USERS] UNIQUE NONCLUSTERED 
(
	[USER_EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[ContactList]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ContactList](@PROJECT_ID int)
RETURNS TABLE
AS
RETURN ( SELECT     dbo.USER_ROLES.USER_ID, dbo.USER_ROLES.TRADE_ID, dbo.USERS.USER_NAME, dbo.USERS.USER_EMAIL, dbo.USERS.USER_PHONE, 
                      dbo.COMPANIES.COMPANY_NAME, dbo.TRADES.TRADE_DESC
FROM         dbo.USER_ROLES INNER JOIN
                      dbo.TRADES ON dbo.USER_ROLES.TRADE_ID = dbo.TRADES.TRADE_ID INNER JOIN
                      dbo.USERS ON dbo.USER_ROLES.USER_ID = dbo.USERS.USER_ID INNER JOIN
                      dbo.COMPANIES ON dbo.USERS.COMPANY_ID = dbo.COMPANIES.COMPANY_ID
WHERE     (dbo.USER_ROLES.PROJECT_ID = @PROJECT_ID) )

GO
/****** Object:  UserDefinedFunction [dbo].[RPTDeficiencies Test]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[RPTDeficiencies Test](@PROJECT_ID int)
RETURNS TABLE
AS
RETURN ( SELECT     dbo.DEFICIENCIES.ITEM_NUMBER, dbo.DEFICIENCIES.TAG_ID, dbo.DEFICIENCIES.ITEM_DESC, dbo.DEFICIENCIES.DATE_POSTED, 
                      dbo.COMPANIES.COMPANY_ABB, dbo.DEFICIENCIES.ITEM_COMMENT, dbo.DEFICIENCIES.PROJECT_ID
FROM         dbo.DEFICIENCIES INNER JOIN
                      dbo.COMPANIES ON dbo.DEFICIENCIES.COMPANY_ID = dbo.COMPANIES.COMPANY_ID
WHERE     (dbo.DEFICIENCIES.PROJECT_ID = @PROJECT_ID) )

GO
/****** Object:  UserDefinedFunction [dbo].[tempdefcount]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tempdefcount]()
RETURNS TABLE
AS
RETURN ( SELECT     dbo.DEFICIENCIES.*
FROM         dbo.DEFICIENCIES
WHERE     (PROJECT_ID = 13) )

GO
/****** Object:  UserDefinedFunction [dbo].[Test Def]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Test Def]()
RETURNS TABLE
AS
RETURN ( SELECT     dbo.DEFICIENCIES.ITEM_NUMBER, dbo.DEFICIENCIES.TAG_ID, dbo.DEFICIENCIES.ITEM_DESC, dbo.DEFICIENCIES.ITEM_STATUS, 
                      dbo.DEFICIENCIES.DATE_POSTED, dbo.DEFICIENCIES.COMPANY_ID, dbo.DEFICIENCIES.ITEM_COMMENT, dbo.DEFICIENCIES.PROJECT_ID
FROM         dbo.DEFICIENCIES INNER JOIN
                      dbo.USERS ON dbo.DEFICIENCIES.COMPANY_ID = dbo.USERS.COMPANY_ID INNER JOIN
                      dbo.USER_ROLES ON dbo.USERS.USER_ID = dbo.USER_ROLES.USER_ID )

GO
/****** Object:  UserDefinedFunction [dbo].[test login]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[test login](@USER_EMAIL nvarchar(50),
@USER_PASSWORD nvarchar(128))
RETURNS TABLE
AS
RETURN ( SELECT     USER_ID, USER_NAME, ISADMIN, ISACTIVE
FROM         dbo.USERS
WHERE     (USER_EMAIL = @USER_EMAIL) AND (USER_PASSWORD = @USER_PASSWORD) AND (ISACTIVE = 1) )

GO
/****** Object:  UserDefinedFunction [dbo].[TestDateFunction]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TestDateFunction]()
RETURNS TABLE
AS
RETURN ( SELECT     DATE_POSTED
FROM         dbo.DEFICIENCIES
GROUP BY DATE_POSTED
HAVING      (DATE_POSTED = MAX(DATE_POSTED)) )

GO
/****** Object:  UserDefinedFunction [dbo].[TestDefNoResponse]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TestDefNoResponse]()
RETURNS TABLE
AS
RETURN ( SELECT     *
FROM         dbo.DEFICIENCIES
WHERE     (ITEM_COMMENT IS NOT NULL) )

GO
/****** Object:  UserDefinedFunction [dbo].[TestItemNoResponse]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TestItemNoResponse](@PROJECT_ID int)
RETURNS TABLE
AS
RETURN ( SELECT     *
FROM         dbo.DEFICIENCIES
WHERE     (PROJECT_ID = @PROJECT_ID) AND (ITEM_COMMENT IS NULL OR
                      ITEM_COMMENT = '') )

GO
ALTER TABLE [dbo].[COMPANY_HEIRACHY]  WITH CHECK ADD  CONSTRAINT [FK_COMPANY_HEIRACHY_COMPANIES] FOREIGN KEY([PARENT_COMPANY_ID])
REFERENCES [dbo].[COMPANIES] ([COMPANY_ID])
GO
ALTER TABLE [dbo].[COMPANY_HEIRACHY] CHECK CONSTRAINT [FK_COMPANY_HEIRACHY_COMPANIES]
GO
ALTER TABLE [dbo].[COMPANY_HEIRACHY]  WITH CHECK ADD  CONSTRAINT [FK_COMPANY_HEIRACHY_COMPANIES1] FOREIGN KEY([SUB_COMPANY_ID])
REFERENCES [dbo].[COMPANIES] ([COMPANY_ID])
GO
ALTER TABLE [dbo].[COMPANY_HEIRACHY] CHECK CONSTRAINT [FK_COMPANY_HEIRACHY_COMPANIES1]
GO
ALTER TABLE [dbo].[COMPANY_HEIRACHY]  WITH CHECK ADD  CONSTRAINT [FK_COMPANY_HEIRACHY_PROJECTS] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[PROJECTS] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[COMPANY_HEIRACHY] CHECK CONSTRAINT [FK_COMPANY_HEIRACHY_PROJECTS]
GO
ALTER TABLE [dbo].[DEFICIENCIES]  WITH NOCHECK ADD  CONSTRAINT [FK_DEFICIENCIES_COMPANIES] FOREIGN KEY([COMPANY_ID])
REFERENCES [dbo].[COMPANIES] ([COMPANY_ID])
GO
ALTER TABLE [dbo].[DEFICIENCIES] CHECK CONSTRAINT [FK_DEFICIENCIES_COMPANIES]
GO
ALTER TABLE [dbo].[DEFICIENCIES]  WITH NOCHECK ADD  CONSTRAINT [FK_DEFICIENCIES_PROJECTS] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[PROJECTS] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[DEFICIENCIES] CHECK CONSTRAINT [FK_DEFICIENCIES_PROJECTS]
GO
ALTER TABLE [dbo].[PHOTOS]  WITH CHECK ADD  CONSTRAINT [FK_PHOTOS_DEFICIENCIES] FOREIGN KEY([PROJECT_ID], [ITEM_NUMBER])
REFERENCES [dbo].[DEFICIENCIES] ([PROJECT_ID], [ITEM_NUMBER])
GO
ALTER TABLE [dbo].[PHOTOS] CHECK CONSTRAINT [FK_PHOTOS_DEFICIENCIES]
GO
ALTER TABLE [dbo].[USAGE_LOG]  WITH CHECK ADD  CONSTRAINT [FK_USAGE_LOG_PROJECTS] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[PROJECTS] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[USAGE_LOG] CHECK CONSTRAINT [FK_USAGE_LOG_PROJECTS]
GO
ALTER TABLE [dbo].[USAGE_LOG]  WITH CHECK ADD  CONSTRAINT [FK_USAGE_LOG_USERS] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USERS] ([USER_ID])
GO
ALTER TABLE [dbo].[USAGE_LOG] CHECK CONSTRAINT [FK_USAGE_LOG_USERS]
GO
ALTER TABLE [dbo].[USER_ROLES]  WITH NOCHECK ADD  CONSTRAINT [FK_COMPANY_ROLES_PROJECTS] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[PROJECTS] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[USER_ROLES] CHECK CONSTRAINT [FK_COMPANY_ROLES_PROJECTS]
GO
ALTER TABLE [dbo].[USER_ROLES]  WITH NOCHECK ADD  CONSTRAINT [FK_COMPANY_ROLES_TRADES] FOREIGN KEY([TRADE_ID])
REFERENCES [dbo].[TRADES] ([TRADE_ID])
GO
ALTER TABLE [dbo].[USER_ROLES] CHECK CONSTRAINT [FK_COMPANY_ROLES_TRADES]
GO
ALTER TABLE [dbo].[USER_ROLES]  WITH NOCHECK ADD  CONSTRAINT [FK_USER_ROLES_USERS] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USERS] ([USER_ID])
GO
ALTER TABLE [dbo].[USER_ROLES] CHECK CONSTRAINT [FK_USER_ROLES_USERS]
GO
ALTER TABLE [dbo].[USERS]  WITH NOCHECK ADD  CONSTRAINT [FK_USERS_COMPANIES] FOREIGN KEY([COMPANY_ID])
REFERENCES [dbo].[COMPANIES] ([COMPANY_ID])
GO
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [FK_USERS_COMPANIES]
GO
/****** Object:  StoredProcedure [dbo].[GetNextProjectItemID]    Script Date: 11/20/2016 11:09:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[GetNextProjectItemID]
	(
		@project_id int,
		@next_item_number int OUTPUT
	)
AS

IF NOT EXISTS (SELECT * FROM PROJECT_ITEM_NUMBER WHERE PROJECT_ID = @project_id)
 INSERT INTO PROJECT_ITEM_NUMBER(PROJECT_ID, NEXT_ITEM_NUMBER) VALUES (@project_id, 0) 


UPDATE PROJECT_ITEM_NUMBER SET NEXT_ITEM_NUMBER = NEXT_ITEM_NUMBER + 1 WHERE PROJECT_ID = @project_id

SELECT @next_item_number = NEXT_ITEM_NUMBER FROM PROJECT_ITEM_NUMBER WHERE PROJECT_ID = @project_id

RETURN 



GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "USER_ROLES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 106
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TRADES"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 91
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 6
               Left = 418
               Bottom = 121
               Right = 588
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "COMPANIES"
            Begin Extent = 
               Top = 6
               Left = 626
               Bottom = 121
               Right = 790
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ContactList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ContactList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ContactList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DEFICIENCIES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "COMPANIES"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 106
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RPTDeficiencies Test'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RPTDeficiencies Test'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RPTDeficiencies Test'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'tempdefcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DEFICIENCIES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'tempdefcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'tempdefcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'tempdefcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'tempdefcount.ITEM_STATUS DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'tempdefcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'tempdefcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'tempdefcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'tempdefcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DEFICIENCIES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 121
               Right = 407
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USER_ROLES"
            Begin Extent = 
               Top = 6
               Left = 445
               Bottom = 106
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'Test Def'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'Test Def'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'Test Def'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "USERS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'test login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'test login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'test login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DEFICIENCIES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestDateFunction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestDateFunction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestDateFunction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DEFICIENCIES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 131
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1605
         Alias = 900
         Table = 1455
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestDefNoResponse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestDefNoResponse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestDefNoResponse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[38] 4[36] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DEFICIENCIES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestItemNoResponse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestItemNoResponse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'TestItemNoResponse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3840 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ABB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ABB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2790 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ABB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ABB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ABB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ABB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'COMPANIES.COMPANY_NAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PARENT_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PARENT_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2340 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PARENT_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PARENT_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PARENT_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'PARENT_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'SUB_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'SUB_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1965 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'SUB_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'SUB_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'SUB_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY', @level2type=N'COLUMN',@level2name=N'SUB_COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COMPANY_HEIRACHY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1485 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1770 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'TAG_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'TAG_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2100 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'TAG_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'TAG_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'TAG_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'TAG_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=5265 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'DATE_POSTED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'DATE_POSTED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1590 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'DATE_POSTED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'DATE_POSTED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'DATE_POSTED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'DATE_POSTED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_COMMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_COMMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3180 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_COMMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_COMMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_COMMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES', @level2type=N'COLUMN',@level2name=N'ITEM_COMMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'DEFICIENCIES.PROJECT_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowHeight', @value=3165 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEFICIENCIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'NEXT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'NEXT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3735 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'NEXT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'NEXT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'NEXT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER', @level2type=N'COLUMN',@level2name=N'NEXT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECT_ITEM_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1335 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4530 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LOC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LOC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2385 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LOC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LOC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LOC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LOC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3990 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_OWNER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_OWNER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1920 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_OWNER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_OWNER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_OWNER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_OWNER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_CA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_CA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1575 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_CA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_CA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_CA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_CA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2085 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_LEED_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_CLOSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_CLOSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1965 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_CLOSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_CLOSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_CLOSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_CLOSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_COMNOTICE_INFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_COMNOTICE_INFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3075 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_COMNOTICE_INFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_COMNOTICE_INFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_COMNOTICE_INFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS', @level2type=N'COLUMN',@level2name=N'PROJECT_COMNOTICE_INFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROJECTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4020 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES', @level2type=N'COLUMN',@level2name=N'TRADE_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'TRADES.TRADE_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TRADES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'PROJECT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES', @level2type=N'COLUMN',@level2name=N'TRADE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'USER_ROLES.PROJECT_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_ROLES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=645 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2025 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PASSWORD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PASSWORD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2235 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PASSWORD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PASSWORD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PASSWORD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PASSWORD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3030 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=720 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PHONE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PHONE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PHONE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PHONE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PHONE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'USER_PHONE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISADMIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISADMIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=930 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISADMIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISADMIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISADMIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISADMIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1050 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'ISACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'USERS.USER_NAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS'
GO
USE [master]
GO
ALTER DATABASE [cxExample] SET  READ_WRITE 
GO
