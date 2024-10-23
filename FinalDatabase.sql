USE [master]
GO
/****** Object:  Database [FitnessCenter]    Script Date: 16.09.2021 12:44:42 ******/
CREATE DATABASE [FitnessCenter]
GO
ALTER DATABASE [FitnessCenter] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitnessCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitnessCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitnessCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitnessCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitnessCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitnessCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitnessCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitnessCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitnessCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitnessCenter] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitnessCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitnessCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitnessCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitnessCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitnessCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FitnessCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FitnessCenter] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FitnessCenter] SET  MULTI_USER 
GO
ALTER DATABASE [FitnessCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitnessCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitnessCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitnessCenter] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FitnessCenter] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FitnessCenter]
GO
/****** Object:  Table [dbo].[Betreuung]    Script Date: 16.09.2021 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Betreuung](
	[Kundennummer] [int] NOT NULL,
	[Personalnummer] [int] NOT NULL,
	[Notizen] [varchar](2000) NULL,
	[VonKKBezahlt] [bit] NULL,
 CONSTRAINT [pk_Betreuung] PRIMARY KEY CLUSTERED 
(
	[Kundennummer] ASC,
	[Personalnummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunden]    Script Date: 16.09.2021 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunden](
	[Kundennummer] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [varchar](30) NOT NULL,
	[Nachname] [varchar](30) NOT NULL,
	[Geschlecht] [char](1) NULL,
	[Geburtsdatum] [smalldatetime] NULL,
	[Wohnort] [int] NULL,
	[Krankenkasse] [varchar](50) NULL,
 CONSTRAINT [pk_Kunden] PRIMARY KEY CLUSTERED 
(
	[Kundennummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 16.09.2021 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[Personalnummer] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [varchar](30) NOT NULL,
	[Nachname] [varchar](30) NOT NULL,
	[Monatslohn] [int] NULL,
 CONSTRAINT [pk_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[Personalnummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orte]    Script Date: 16.09.2021 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orte](
	[OrtId] [int] IDENTITY(1,1) NOT NULL,
	[PLZ] [varchar](10) NULL,
	[Ortname] [varchar](50) NOT NULL,
	[Kanton] [char](2) NULL,
 CONSTRAINT [pk_Orte] PRIMARY KEY CLUSTERED 
(
	[OrtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Betreuung] ([Kundennummer], [Personalnummer], [Notizen], [VonKKBezahlt]) VALUES (2, 2, N'Rückentherapie.', 1)
GO
INSERT [dbo].[Betreuung] ([Kundennummer], [Personalnummer], [Notizen], [VonKKBezahlt]) VALUES (2, 3, N'Koordinationsübungen.', 0)
GO
INSERT [dbo].[Betreuung] ([Kundennummer], [Personalnummer], [Notizen], [VonKKBezahlt]) VALUES (3, 1, N'Aufbau von Muskelmasse.', 0)
GO
INSERT [dbo].[Betreuung] ([Kundennummer], [Personalnummer], [Notizen], [VonKKBezahlt]) VALUES (10, 3, N'Rehabilitation nach Sportverletzung.', 1)
GO
SET IDENTITY_INSERT [dbo].[Kunden] ON 
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (1, N'Beatrix', N'Hugentobler', N'w', CAST(N'1963-03-24T00:00:00' AS SmallDateTime), 1956, N'CSS Versicherung')
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (2, N'Viktor', N'Meyer', N'm', CAST(N'1960-12-18T00:00:00' AS SmallDateTime), 1939, N'Group Mutuel')
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (3, N'Yanick', N'Merz', N'm', CAST(N'1996-08-03T00:00:00' AS SmallDateTime), 1964, NULL)
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (4, N'Joshua', N'Pfister', N'm', CAST(N'2001-05-28T00:00:00' AS SmallDateTime), 1955, N'Concordia')
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (5, N'Franziska', N'Tobler', N'w', CAST(N'1975-03-04T00:00:00' AS SmallDateTime), 1933, N'CSS Versicherung')
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (6, N'Michele', N'd''Angelo', N'm', CAST(N'2002-06-30T00:00:00' AS SmallDateTime), 1934, N'CSS Versicherung')
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (7, N'Petra', N'Nussbaumer', N'w', CAST(N'1969-08-25T00:00:00' AS SmallDateTime), 1943, N'Group Mutuel')
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (8, N'Admir', N'Smajic', N'm', CAST(N'1963-09-07T00:00:00' AS SmallDateTime), 1947, N'CSS Versicherung')
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (9, N'Lars', N'Ramseier', N'm', CAST(N'1999-01-25T00:00:00' AS SmallDateTime), 1961, NULL)
GO
INSERT [dbo].[Kunden] ([Kundennummer], [Vorname], [Nachname], [Geschlecht], [Geburtsdatum], [Wohnort], [Krankenkasse]) VALUES (10, N'Erna', N'Tschurtschenthaler', N'w', CAST(N'1989-11-13T00:00:00' AS SmallDateTime), 1950, N'CSS Versicherung')
GO
SET IDENTITY_INSERT [dbo].[Kunden] OFF
GO
SET IDENTITY_INSERT [dbo].[Mitarbeiter] ON 
GO
INSERT [dbo].[Mitarbeiter] ([Personalnummer], [Vorname], [Nachname], [Monatslohn]) VALUES (1, N'Rafael', N'Szanislo', 5500)
GO
INSERT [dbo].[Mitarbeiter] ([Personalnummer], [Vorname], [Nachname], [Monatslohn]) VALUES (2, N'Jürg', N'Müller', 5200)
GO
INSERT [dbo].[Mitarbeiter] ([Personalnummer], [Vorname], [Nachname], [Monatslohn]) VALUES (3, N'Markus', N'Meister', 4800)
GO
INSERT [dbo].[Mitarbeiter] ([Personalnummer], [Vorname], [Nachname], [Monatslohn]) VALUES (4, N'Franco', N'Dell''Amore', 5050)
GO
SET IDENTITY_INSERT [dbo].[Mitarbeiter] OFF
GO
SET IDENTITY_INSERT [dbo].[Orte] ON 
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1, N'1000', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2, N'1000', N'Lausanne 25', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3, N'1000', N'Lausanne 26', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4, N'1000', N'Lausanne 27', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (5, N'1003', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (6, N'1004', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (7, N'1005', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (8, N'1006', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (9, N'1007', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (10, N'1008', N'Prilly', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (11, N'1009', N'Pully', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (12, N'1010', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (13, N'1011', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (14, N'1012', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (15, N'1015', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (16, N'1018', N'Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (17, N'1020', N'Renens VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (18, N'1022', N'Chavannes-près-Renens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (19, N'1023', N'Crissier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (20, N'1024', N'Ecublens VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (21, N'1025', N'St-Sulpice VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (22, N'1027', N'Lonay', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (23, N'1028', N'Préverenges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (24, N'1030', N'Bussigny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (25, N'1032', N'Romanel-sur-Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (26, N'1033', N'Cheseaux-sur-Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (27, N'1037', N'Etagnières', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (28, N'1038', N'Bercher', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (29, N'1040', N'Echallens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (30, N'1040', N'St-Barthélemy VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (31, N'1377', N'Oulens-sous-Echallens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (32, N'1042', N'Bettens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (33, N'1040', N'Villars-le-Terroir', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (34, N'1417', N'Epautheyres', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (35, N'1041', N'Dommartin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (36, N'1063', N'Peyres-Possens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (37, N'1063', N'Boulens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (38, N'1041', N'Poliez-le-Grand', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (39, N'1041', N'Poliez-Pittet', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (40, N'1041', N'Bottens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (41, N'1053', N'Bretigny-sur-Morrens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (42, N'1034', N'Boussens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (43, N'1035', N'Bournens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (44, N'1036', N'Sullens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (45, N'1042', N'Assens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (46, N'1043', N'Sugnens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (47, N'1044', N'Fey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (48, N'1045', N'Ogens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (49, N'1407', N'Bioley-Magnoux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (50, N'1042', N'Bioley-Orjulaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (51, N'1052', N'Le Mont-sur-Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (52, N'1053', N'Cugy VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (53, N'1054', N'Morrens VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (54, N'1055', N'Froideville', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (55, N'1410', N'Thierrens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (56, N'1066', N'Epalinges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (57, N'1073', N'Savigny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (58, N'1083', N'Mézières VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (59, N'1092', N'Belmont-sur-Lausanne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (60, N'1093', N'La Conversion', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (61, N'1094', N'Paudex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (62, N'1095', N'Lutry', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (63, N'1096', N'Cully', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (64, N'1097', N'Riex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (65, N'1098', N'Epesses', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (66, N'1058', N'Villars-Tiercelin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (67, N'1059', N'Peney-le-Jorat', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (68, N'1061', N'Villars-Mendraz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (69, N'1062', N'Sottens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (70, N'1063', N'Chapelle-sur-Moudon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (71, N'1410', N'St-Cierges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (72, N'1073', N'Mollie-Margot', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (73, N'1080', N'Les Cullayes', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (74, N'1081', N'Montpreveyres', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (75, N'1082', N'Corcelles-le-Jorat', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (76, N'1088', N'Ropraz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (77, N'1084', N'Carrouge VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (78, N'1085', N'Vulliens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (79, N'1509', N'Vucherens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (80, N'1510', N'Syens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (81, N'1076', N'Ferlens VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (82, N'1077', N'Servion', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (83, N'1078', N'Essertes', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (84, N'1673', N'Auboranges', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (85, N'1110', N'Morges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (86, N'1112', N'Echichens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (87, N'1167', N'Lussy-sur-Morges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (88, N'1132', N'Lully VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (89, N'1131', N'Tolochenaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (90, N'1125', N'Monnaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (91, N'1126', N'Vaux-sur-Morges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (92, N'1127', N'Clarmont', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (93, N'1128', N'Reverolle', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (94, N'1113', N'St-Saphorin-sur-Morges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (95, N'1114', N'Colombier VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (96, N'1115', N'Vullierens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (97, N'1116', N'Cottens VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (98, N'1117', N'Grancy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (99, N'1304', N'Senarclens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (100, N'1121', N'Bremblens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (101, N'1122', N'Romanel-sur-Morges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (102, N'1123', N'Aclens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (103, N'1124', N'Gollion', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (104, N'1134', N'Vufflens-le-Château', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (105, N'1135', N'Denens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (106, N'1136', N'Bussy-Chardonney', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (107, N'1169', N'Yens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (108, N'1168', N'Villars-sous-Yens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (109, N'1144', N'Ballens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (110, N'1149', N'Berolle', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (111, N'1146', N'Mollens VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (112, N'1147', N'Montricher', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (113, N'1142', N'Pampigny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (114, N'1141', N'Sévery', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (115, N'1143', N'Apples', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (116, N'1145', N'Bière', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (117, N'1148', N'L''Isle', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (118, N'1162', N'St-Prex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (119, N'1163', N'Etoy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (120, N'1164', N'Buchillon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (121, N'1165', N'Allaman', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (122, N'1166', N'Perroy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (123, N'1170', N'Aubonne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (124, N'1172', N'Bougy-Villars', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (125, N'1173', N'Féchy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (126, N'1174', N'Montherod', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (127, N'1175', N'Lavigny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (128, N'1176', N'St-Livres', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (129, N'1180', N'Rolle', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (130, N'1182', N'Gilly', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (131, N'1183', N'Bursins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (132, N'1184', N'Vinzel', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (133, N'1184', N'Luins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (134, N'1185', N'Mont-sur-Rolle', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (135, N'1186', N'Essertines-sur-Rolle', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (136, N'1187', N'St-Oyens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (137, N'1189', N'Saubraz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (138, N'1188', N'Gimel', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (139, N'1196', N'Gland', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (140, N'1197', N'Prangins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (141, N'1200', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (142, N'1201', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (143, N'1202', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (144, N'1203', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (145, N'1204', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (146, N'1205', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (147, N'1206', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (148, N'1207', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (149, N'1208', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (150, N'1209', N'Genève', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (151, N'1212', N'Grand-Lancy', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (152, N'1213', N'Petit-Lancy', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (153, N'1213', N'Onex', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (154, N'1214', N'Vernier', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (155, N'1215', N'Genève 15 Aéroport', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (156, N'1216', N'Cointrin', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (157, N'1217', N'Meyrin', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (158, N'1218', N'Le Grand-Saconnex', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (159, N'1219', N'Le Lignon', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (160, N'1219', N'Aïre', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (161, N'1219', N'Châtelaine', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (162, N'1220', N'Les Avanchets', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (163, N'1222', N'Vésenaz', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (164, N'1223', N'Cologny', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (165, N'1224', N'Chêne-Bougeries', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (166, N'1225', N'Chêne-Bourg', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (167, N'1226', N'Thônex', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (168, N'1227', N'Carouge GE', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (169, N'1227', N'Les Acacias', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (170, N'1228', N'Plan-les-Ouates', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (171, N'1231', N'Conches', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (172, N'1232', N'Confignon', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (173, N'1233', N'Bernex', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (174, N'1234', N'Vessy', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (175, N'1236', N'Cartigny', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (176, N'1237', N'Avully', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (177, N'1239', N'Collex', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (178, N'1241', N'Puplinge', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (179, N'1242', N'Satigny', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (180, N'1243', N'Presinge', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (181, N'1244', N'Choulex', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (182, N'1245', N'Collonge-Bellerive', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (183, N'1246', N'Corsier GE', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (184, N'1247', N'Anières', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (185, N'1248', N'Hermance', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (186, N'1251', N'Gy', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (187, N'1252', N'Meinier', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (188, N'1253', N'Vandoeuvres', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (189, N'1254', N'Jussy', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (190, N'1255', N'Veyrier', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (191, N'1256', N'Troinex', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (192, N'1257', N'La Croix-de-Rozon', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (193, N'1258', N'Perly', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (194, N'1260', N'Nyon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (195, N'1277', N'Borex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (196, N'1278', N'La Rippe', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (197, N'1279', N'Chavannes-de-Bogis', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (198, N'1274', N'Grens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (199, N'1275', N'Chéserex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (200, N'1276', N'Gingins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (201, N'1270', N'Trélex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (202, N'1271', N'Givrins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (203, N'1272', N'Genolier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (204, N'1273', N'Le Muids', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (205, N'1273', N'Arzier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (206, N'1268', N'Burtigny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (207, N'1261', N'Marchissy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (208, N'1261', N'Le Vaud', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (209, N'1269', N'Bassins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (210, N'1261', N'Longirod', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (211, N'1188', N'St-George', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (212, N'1262', N'Eysins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (213, N'1263', N'Crassier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (214, N'1264', N'St-Cergue', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (215, N'1265', N'La Cure', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (216, N'1266', N'Duillier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (217, N'1268', N'Begnins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (218, N'1281', N'Russin', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (219, N'1283', N'Dardagny', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (220, N'1283', N'La Plaine', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (221, N'1284', N'Chancy', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (222, N'1285', N'Athenaz (Avusy)', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (223, N'1286', N'Soral', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (224, N'1287', N'Laconnex', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (225, N'1288', N'Aire-la-Ville', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (226, N'1290', N'Versoix', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (227, N'1291', N'Commugny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (228, N'1292', N'Chambésy', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (229, N'1293', N'Bellevue', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (230, N'1294', N'Genthod', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (231, N'1296', N'Coppet', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (232, N'1297', N'Founex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (233, N'1298', N'Céligny', N'GE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (234, N'1299', N'Crans-près-Céligny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (235, N'1302', N'Vufflens-la-Ville', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (236, N'1304', N'Cossonay-Ville', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (237, N'1304', N'Dizy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (238, N'1307', N'Lussery-Villars', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (239, N'1305', N'Penthalaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (240, N'1315', N'La Sarraz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (241, N'1317', N'Orny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (242, N'1316', N'Chevilly', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (243, N'1337', N'Vallorbe', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (244, N'1338', N'Ballaigues', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (245, N'1341', N'Orient', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (246, N'1346', N'Les Bioux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (247, N'1344', N'L''Abbaye', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (248, N'1342', N'Le Pont', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (249, N'1343', N'Les Charbonnières', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (250, N'1345', N'Le Lieu', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (251, N'1347', N'Le Sentier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (252, N'1348', N'Le Brassus', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (253, N'1306', N'Daillens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (254, N'1303', N'Penthaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (255, N'1308', N'La Chaux (Cossonay)', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (256, N'1148', N'Cuarnens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (257, N'1313', N'Ferreyres', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (258, N'1148', N'Moiry VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (259, N'1321', N'Arnex-sur-Orbe', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (260, N'1318', N'Pompaples', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (261, N'1312', N'Eclépens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (262, N'1329', N'Bretonnières', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (263, N'1322', N'Croy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (264, N'1323', N'Romainmôtier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (265, N'1324', N'Premier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (266, N'1325', N'Vaulion', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (267, N'1326', N'Juriens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (268, N'1148', N'La Praz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (269, N'1148', N'Mont-la-Ville', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (270, N'1350', N'Orbe', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (271, N'1352', N'Agiez', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (272, N'1353', N'Bofflens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (273, N'1354', N'Montcherand', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (274, N'1355', N'L''Abergement', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (275, N'1356', N'Les Clées', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (276, N'1357', N'Lignerolle', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (277, N'1358', N'Valeyres-sous-Rances', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (278, N'1439', N'Rances', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (279, N'1373', N'Chavornay', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (280, N'1372', N'Bavois', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (281, N'1374', N'Corcelles-sur-Chavornay', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (282, N'1375', N'Penthéréaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (283, N'1376', N'Goumoens-la-Ville', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (284, N'1400', N'Yverdon-les-Bains', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (285, N'1417', N'Essertines-sur-Yverdon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (286, N'1416', N'Pailly', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (287, N'1418', N'Vuarrens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (288, N'1420', N'Fiez', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (289, N'1421', N'Fontaines-sur-Grandson', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (290, N'1423', N'Villars-Burquin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (291, N'1453', N'Mauborget', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (292, N'1429', N'Giez', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (293, N'1430', N'Orges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (294, N'1431', N'Vugelles-La Mothe', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (295, N'1405', N'Pomy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (296, N'1406', N'Cronay', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (297, N'1407', N'Donneloye', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (298, N'1408', N'Prahins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (299, N'1409', N'Chanéaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (300, N'1412', N'Valeyres-sous-Ursins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (301, N'1413', N'Orzens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (302, N'1046', N'Rueyres', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (303, N'1404', N'Cuarny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (304, N'1427', N'Bonvillars', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (305, N'1424', N'Champagne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (306, N'1431', N'Novalles', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (307, N'1423', N'Fontanezier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (308, N'1415', N'Molondin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (309, N'1422', N'Grandson', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (310, N'1425', N'Onnens VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (311, N'1426', N'Concise', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (312, N'1426', N'Corcelles-près-Concise', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (313, N'1432', N'Belmont-sur-Yverdon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (314, N'1433', N'Suchy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (315, N'1434', N'Ependes VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (316, N'1435', N'Essert-Pittet', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (317, N'1436', N'Treycovagnes', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (318, N'1437', N'Suscévaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (319, N'1438', N'Mathod', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (320, N'1441', N'Valeyres-sous-Montagny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (321, N'1442', N'Montagny-près-Yverdon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (322, N'1443', N'Champvent', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (323, N'1445', N'Vuiteboeuf', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (324, N'1446', N'Baulmes', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (325, N'1450', N'Ste-Croix', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (326, N'1450', N'La Sagne (Ste-Croix)', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (327, N'1454', N'L''Auberson', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (328, N'1452', N'Les Rasses', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (329, N'1453', N'Bullet', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (330, N'1450', N'Le Château-de-Ste-Croix', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (331, N'1462', N'Yvonand', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (332, N'1463', N'Rovray', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (333, N'1464', N'Chavannes-le-Chêne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (334, N'1464', N'Chêne-Pâquier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (335, N'1468', N'Cheyres', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (336, N'1470', N'Estavayer-le-Lac', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (337, N'1473', N'Font', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (338, N'1474', N'Châbles FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (339, N'1483', N'Montet (Broye)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (340, N'1482', N'Cugy FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (341, N'1541', N'Bussy FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (342, N'1484', N'Aumont', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (343, N'1485', N'Nuvilly', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (344, N'1486', N'Vuissens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (345, N'1537', N'Champtauroz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (346, N'1538', N'Treytorrens (Payerne)', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (347, N'1489', N'Murist', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (348, N'1510', N'Moudon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (349, N'1512', N'Chavannes-sur-Moudon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (350, N'1513', N'Hermenches', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (351, N'1514', N'Bussy-sur-Moudon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (352, N'1522', N'Oulens-sur-Lucens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (353, N'1515', N'Villars-le-Comte', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (354, N'1515', N'Neyruz-sur-Moudon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (355, N'1410', N'Denezy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (356, N'1522', N'Lucens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (357, N'1521', N'Curtilles', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (358, N'1523', N'Granges-près-Marnand', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (359, N'1527', N'Villeneuve FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (360, N'1528', N'Surpierre', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (361, N'1529', N'Cheiry', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (362, N'1530', N'Payerne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (363, N'1532', N'Fétigny', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (364, N'1533', N'Ménières', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (365, N'1534', N'Sassel', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (366, N'1536', N'Combremont-le-Petit', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (367, N'1526', N'Forel-sur-Lucens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (368, N'1526', N'Cremin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (369, N'1542', N'Rueyres-les-Prés', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (370, N'1543', N'Grandcour', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (371, N'1544', N'Gletterens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (372, N'1545', N'Chevroux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (373, N'1551', N'Vers-chez-Perrin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (374, N'1552', N'Trey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (375, N'1553', N'Châtonnaye', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (376, N'1554', N'Sédeilles', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (377, N'1555', N'Villarzel', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (378, N'1682', N'Villars-Bramard', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (379, N'1682', N'Dompierre VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (380, N'1535', N'Combremont-le-Grand', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (381, N'1562', N'Corcelles-près-Payerne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (382, N'1563', N'Dompierre FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (383, N'1564', N'Domdidier', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (384, N'1565', N'Missy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (385, N'1475', N'Autavaux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (386, N'1567', N'Delley', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (387, N'1568', N'Portalban', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (388, N'1566', N'St-Aubin FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (389, N'1580', N'Avenches', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (390, N'1583', N'Villarepos', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (391, N'1584', N'Villars-le-Grand', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (392, N'1585', N'Salavaux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (393, N'1586', N'Vallamand', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (394, N'1587', N'Montmagny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (395, N'1589', N'Chabrey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (396, N'1587', N'Constantine', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (397, N'1588', N'Cudrefin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (398, N'1595', N'Faoug', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (399, N'1607', N'Palézieux-Village', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (400, N'1610', N'Châtillens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (401, N'1673', N'Ecublens FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (402, N'1525', N'Henniez', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (403, N'1524', N'Marnand', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (404, N'1090', N'La Croix (Lutry)', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (405, N'1091', N'Grandvaux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (406, N'1091', N'Aran', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (407, N'1070', N'Puidoux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (408, N'1071', N'Chexbres', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (409, N'1072', N'Forel (Lavaux)', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (410, N'1607', N'Palézieux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (411, N'1614', N'Granges (Veveyse)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (412, N'1615', N'Bossonnens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (413, N'1616', N'Attalens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (414, N'1617', N'Remaufens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (415, N'1618', N'Châtel-St-Denis', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (416, N'1619', N'Les Paccots', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (417, N'1623', N'Semsales', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (418, N'1624', N'La Verrerie', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (419, N'1627', N'Vaulruz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (420, N'1628', N'Vuadens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (421, N'1630', N'Bulle', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (422, N'1633', N'Vuippens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (423, N'1642', N'Sorens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (424, N'1643', N'Gumefens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (425, N'1644', N'Avry-devant-Pont', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (426, N'1645', N'Le Bry', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (427, N'1646', N'Echarlens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (428, N'1647', N'Corbières', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (429, N'1648', N'Hauteville', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (430, N'1656', N'Im Fang', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (431, N'1656', N'Jaun', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (432, N'1657', N'Abländschen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (433, N'1654', N'Cerniat FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (434, N'1651', N'Villarvolard', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (435, N'1652', N'Botterens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (436, N'1638', N'Morlon', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (437, N'1663', N'Moléson-sur-Gruyères', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (438, N'1632', N'Riaz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (439, N'1633', N'Marsens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (440, N'1634', N'La Roche FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (441, N'1649', N'Pont-la-Ville', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (442, N'1635', N'La Tour-de-Trême', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (443, N'1636', N'Broc', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (444, N'1637', N'Charmey (Gruyère)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (445, N'1661', N'Le Pâquier-Montbarry', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (446, N'1663', N'Pringy', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (447, N'1665', N'Estavannens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (448, N'1667', N'Enney', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (449, N'1669', N'Neirivue', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (450, N'1669', N'Albeuve', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (451, N'1663', N'Gruyères', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (452, N'1663', N'Epagny', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (453, N'1666', N'Grandvillard', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (454, N'1610', N'Oron-la-Ville', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (455, N'1675', N'Vauderens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (456, N'1670', N'Ursy', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (457, N'1674', N'Vuarmarens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (458, N'1673', N'Rue', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (459, N'1673', N'Promasens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (460, N'1678', N'Siviriez', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (461, N'1679', N'Villaraboud', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (462, N'1676', N'Chavannes-les-Forts', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (463, N'1677', N'Prez-vers-Siviriez', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (464, N'1680', N'Romont FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (465, N'1681', N'Billens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (466, N'1682', N'Prévonloup', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (467, N'1683', N'Brenles', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (468, N'1683', N'Chesalles-sur-Moudon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (469, N'1694', N'Orsonnens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (470, N'1694', N'Villarsiviriaux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (471, N'1695', N'Villarlod', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (472, N'1696', N'Vuisternens-en-Ogoz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (473, N'1684', N'Mézières FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (474, N'1685', N'Villariaz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (475, N'1687', N'Estévenens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (476, N'1686', N'Grangettes-près-Romont', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (477, N'1689', N'Le Châtelard-près-Romont', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (478, N'1688', N'Sommentier', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (479, N'1626', N'Romanens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (480, N'1692', N'Massonnens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (481, N'1687', N'Vuisternens-devant-Romont', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (482, N'1625', N'Sâles (Gruyère)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (483, N'1612', N'Ecoteaux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (484, N'1613', N'Maracon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (485, N'1608', N'Oron-le-Châtel', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (486, N'1609', N'St-Martin FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (487, N'1611', N'Le Crêt-près-Semsales', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (488, N'1697', N'La Joux FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (489, N'1699', N'Bouloz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (490, N'1699', N'Porsel', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (491, N'1699', N'Pont (Veveyse)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (492, N'1700', N'Fribourg', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (493, N'1763', N'Granges-Paccot', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (494, N'1720', N'Corminboeuf', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (495, N'1735', N'Giffers', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (496, N'1736', N'St. Silvester', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (497, N'1737', N'Plasselb', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (498, N'1738', N'Sangernboden', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (499, N'1716', N'Schwarzsee', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (500, N'1724', N'Bonnefontaine', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (501, N'1727', N'Corpataux-Magnedens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (502, N'1728', N'Rossens FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (503, N'1719', N'Brünisried', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (504, N'1731', N'Ependes FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (505, N'1732', N'Arconciel', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (506, N'1733', N'Treyvaux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (507, N'1720', N'Chésopelloz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (508, N'1712', N'Tafers', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (509, N'1713', N'St. Antoni', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (510, N'1714', N'Heitenried', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (511, N'1715', N'Alterswil FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (512, N'1716', N'Plaffeien', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (513, N'1717', N'St. Ursen', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (514, N'1718', N'Rechthalten', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (515, N'1722', N'Bourguillon', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (516, N'1723', N'Marly', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (517, N'1724', N'Le Mouret', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (518, N'1725', N'Posieux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (519, N'1726', N'Farvagny', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (520, N'1746', N'Prez-vers-Noréaz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (521, N'1747', N'Corserey', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (522, N'1748', N'Torny-le-Grand', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (523, N'1749', N'Middes', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (524, N'1740', N'Neyruz FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (525, N'1741', N'Cottens FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (526, N'1744', N'Chénens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (527, N'1745', N'Lentigny', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (528, N'1742', N'Autigny', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (529, N'1695', N'Estavayer-le-Gibloux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (530, N'1691', N'Villarimboud', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (531, N'1752', N'Villars-sur-Glâne', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (532, N'1753', N'Matran', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (533, N'1754', N'Rosé', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (534, N'1756', N'Onnens FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (535, N'1757', N'Noréaz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (536, N'1690', N'Villaz-St-Pierre', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (537, N'1762', N'Givisiez', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (538, N'1772', N'Grolley', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (539, N'1773', N'Léchelles', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (540, N'1774', N'Cousset', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (541, N'1776', N'Montagny-la-Ville', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (542, N'1795', N'Courlevon', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (543, N'1796', N'Courgevaux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (544, N'1797', N'Münchenwiler', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (545, N'1794', N'Salvenach', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (546, N'1793', N'Jeuss', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (547, N'1792', N'Cordast', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (548, N'1791', N'Courtaman', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (549, N'1788', N'Praz (Vully)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (550, N'1789', N'Lugnorre', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (551, N'1782', N'Belfaux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (552, N'1783', N'Pensier', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (553, N'1784', N'Courtepin', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (554, N'1785', N'Cressier FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (555, N'1786', N'Sugiez', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (556, N'1787', N'Môtier (Vully)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (557, N'1800', N'Vevey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (558, N'1801', N'Le Mont-Pèlerin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (559, N'1808', N'Les Monts-de-Corsier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (560, N'1809', N'Fenil-sur-Corsier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (561, N'1802', N'Corseaux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (562, N'1803', N'Chardonne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (563, N'1804', N'Corsier-sur-Vevey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (564, N'1805', N'Jongny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (565, N'1806', N'St-Légier-La Chiésaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (566, N'1807', N'Blonay', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (567, N'1071', N'Rivaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (568, N'1071', N'St-Saphorin (Lavaux)', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (569, N'1814', N'La Tour-de-Peilz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (570, N'1815', N'Clarens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (571, N'1816', N'Chailly-Montreux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (572, N'1817', N'Brent', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (573, N'1820', N'Montreux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (574, N'1822', N'Chernex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (575, N'1823', N'Glion', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (576, N'1824', N'Caux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (577, N'1832', N'Villard-sur-Chamby', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (578, N'1669', N'Les Sciernes-d''Albeuve', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (579, N'1658', N'La Tine', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (580, N'1660', N'Les Moulins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (581, N'1659', N'Flendruz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (582, N'1660', N'L''Etivaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (583, N'1832', N'Chamby', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (584, N'1833', N'Les Avants', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (585, N'1669', N'Montbovon', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (586, N'1658', N'Rossinière', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (587, N'1660', N'Château-d''Oex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (588, N'1659', N'Rougemont', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (589, N'1844', N'Villeneuve VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (590, N'1847', N'Rennaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (591, N'1845', N'Noville', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (592, N'1846', N'Chessel', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (593, N'1852', N'Roche VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (594, N'1853', N'Yvorne', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (595, N'1854', N'Leysin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (596, N'1867', N'St-Triphon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (597, N'1860', N'Aigle', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (598, N'1856', N'Corbeyrier', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (599, N'1862', N'La Comballaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (600, N'1862', N'Les Mosses', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (601, N'1866', N'La Forclaz VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (602, N'1884', N'Huémoz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (603, N'1867', N'Panex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (604, N'1863', N'Le Sépey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (605, N'1864', N'Vers-l''Eglise', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (606, N'1865', N'Les Diablerets', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (607, N'1867', N'Ollon VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (608, N'1868', N'Collombey', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (609, N'1870', N'Monthey', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (610, N'1871', N'Choëx', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (611, N'1871', N'Les Giettes', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (612, N'1872', N'Troistorrents', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (613, N'1873', N'Val-d''Illiez', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (614, N'1874', N'Champéry', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (615, N'1875', N'Morgins', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (616, N'1880', N'Bex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (617, N'1880', N'Fenalet-sur-Bex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (618, N'1880', N'Frenières-sur-Bex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (619, N'1880', N'Les Plans-sur-Bex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (620, N'1882', N'Gryon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (621, N'1884', N'Villars-sur-Ollon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (622, N'1885', N'Chesières', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (623, N'1890', N'St-Maurice', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (624, N'1890', N'Mex VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (625, N'1891', N'Vérossaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (626, N'1869', N'Massongex', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (627, N'1895', N'Vionnaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (628, N'1897', N'Les Evouettes', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (629, N'1899', N'Torgon', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (630, N'1892', N'Lavey-Village', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (631, N'1893', N'Muraz (Collombey)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (632, N'1896', N'Vouvry', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (633, N'1896', N'Miex', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (634, N'1897', N'Bouveret', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (635, N'1898', N'St-Gingolph', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (636, N'1902', N'Evionnaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (637, N'1903', N'Collonges', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (638, N'1904', N'Vernayaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (639, N'1905', N'Dorénaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (640, N'1906', N'Charrat', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (641, N'1907', N'Saxon', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (642, N'1908', N'Riddes', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (643, N'1912', N'Leytron', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (644, N'1911', N'Ovronnaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (645, N'1913', N'Saillon', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (646, N'1914', N'Isérables', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (647, N'1918', N'La Tzoumaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (648, N'1955', N'Chamoson', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (649, N'1955', N'St-Pierre-de-Clages', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (650, N'1957', N'Ardon', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (651, N'1920', N'Martigny', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (652, N'1921', N'Martigny-Croix', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (653, N'1923', N'Le Trétien', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (654, N'1925', N'Le Châtelard VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (655, N'1927', N'Chemin', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (656, N'1929', N'Trient', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (657, N'1928', N'Ravoire', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (658, N'1922', N'Salvan', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (659, N'1922', N'Les Granges (Salvan)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (660, N'1923', N'Les Marécottes', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (661, N'1925', N'Finhaut', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (662, N'1926', N'Fully', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (663, N'1932', N'Bovernier', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (664, N'1947', N'Versegères', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (665, N'1941', N'Vollèges', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (666, N'1942', N'Levron', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (667, N'1948', N'Lourtier', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (668, N'1948', N'Fionnay', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (669, N'1948', N'Sarreyer', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (670, N'1945', N'Liddes', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (671, N'1946', N'Bourg-St-Pierre', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (672, N'1943', N'Praz-de-Fort', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (673, N'1944', N'La Fouly VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (674, N'1933', N'Sembrancher', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (675, N'1934', N'Le Châble VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (676, N'1936', N'Verbier', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (677, N'1937', N'Orsières', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (678, N'1938', N'Champex-Lac', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (679, N'1950', N'Sion', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (680, N'1975', N'St-Séverin', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (681, N'1976', N'Erde', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (682, N'1976', N'Aven', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (683, N'1976', N'Daillon', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (684, N'1971', N'Grimisuat', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (685, N'1974', N'Arbaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (686, N'1961', N'Vernamiège', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (687, N'1973', N'Nax', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (688, N'1968', N'Mase', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (689, N'1969', N'St-Martin VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (690, N'1981', N'Vex', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (691, N'1982', N'Euseigne', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (692, N'1984', N'Les Haudères', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (693, N'1986', N'Arolla', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (694, N'1985', N'La Sage', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (695, N'1987', N'Hérémence', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (696, N'1988', N'Les Collons', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (697, N'1991', N'Salins', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (698, N'1992', N'Les Agettes', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (699, N'1992', N'Les Mayens-de-Sion', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (700, N'1993', N'Veysonnaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (701, N'1997', N'Siviez (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (702, N'1996', N'Fey (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (703, N'1996', N'Beuson (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (704, N'1996', N'Baar (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (705, N'1996', N'Basse-Nendaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (706, N'1997', N'Haute-Nendaz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (707, N'1994', N'Aproz (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (708, N'1962', N'Pont-de-la-Morge (Sion)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (709, N'1963', N'Vétroz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (710, N'1964', N'Conthey', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (711, N'1966', N'Signèse (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (712, N'1967', N'Bramois', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (713, N'1983', N'Evolène', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (714, N'1972', N'Anzère', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (715, N'1988', N'Thyon', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (716, N'2000', N'Neuchâtel', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (717, N'2012', N'Auvernier', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (718, N'2013', N'Colombier NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (719, N'2014', N'Bôle', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (720, N'2015', N'Areuse', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (721, N'2016', N'Cortaillod', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (722, N'2017', N'Boudry', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (723, N'2022', N'Bevaix', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (724, N'2023', N'Gorgier', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (725, N'2024', N'St-Aubin-Sauges', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (726, N'2025', N'Chez-le-Bart', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (727, N'2028', N'Vaumarcus', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (728, N'2034', N'Peseux', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (729, N'2035', N'Corcelles NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (730, N'2036', N'Cormondrèche', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (731, N'2042', N'Valangin', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (732, N'2043', N'Boudevilliers', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (733, N'2046', N'Fontaines NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (734, N'2052', N'Fontainemelon', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (735, N'2053', N'Cernier', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (736, N'2054', N'Chézard-St-Martin', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (737, N'2054', N'Les Vieux-Prés', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (738, N'2056', N'Dombresson', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (739, N'2057', N'Villiers', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (740, N'2058', N'Le Pâquier NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (741, N'2063', N'Vilars NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (742, N'2065', N'Savagnier', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (743, N'2067', N'Chaumont', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (744, N'2068', N'Hauterive NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (745, N'2072', N'St-Blaise', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (746, N'2073', N'Enges', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (747, N'2074', N'Marin-Epagnier', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (748, N'3238', N'Gals', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (749, N'2087', N'Cornaux NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (750, N'2088', N'Cressier NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (751, N'2318', N'Brot-Plamboz', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (752, N'2103', N'Noiraigue', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (753, N'2105', N'Travers', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (754, N'2108', N'Couvet', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (755, N'2112', N'Môtiers NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (756, N'2113', N'Boveresse', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (757, N'2114', N'Fleurier', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (758, N'2115', N'Buttes', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (759, N'2117', N'La Côte-aux-Fées', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (760, N'2123', N'St-Sulpice NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (761, N'2406', N'La Brévine', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (762, N'2126', N'Les Verrières', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (763, N'2406', N'Le Brouillet', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (764, N'2406', N'Les Taillères', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (765, N'2127', N'Les Bayards', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (766, N'2149', N'Champ-du-Moulin', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (767, N'2124', N'Les Sagnettes', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (768, N'2116', N'Mont-de-Buttes', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (769, N'1454', N'La Vraconnaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (770, N'2019', N'Chambrelien', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (771, N'2019', N'Rochefort', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (772, N'2037', N'Montmollin', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (773, N'2206', N'Les Geneveys-sur-Coffrane', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (774, N'2207', N'Coffrane', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (775, N'2208', N'Les Hauts-Geneveys', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (776, N'2300', N'La Chaux-de-Fonds', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (777, N'2316', N'Petit-Martel', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (778, N'2338', N'Les Emibois', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (779, N'2314', N'La Sagne NE', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (780, N'2316', N'Les Ponts-de-Martel', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (781, N'2322', N'Le Crêt-du-Locle', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (782, N'2325', N'Les Planchettes', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (783, N'2300', N'La Cibourg', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (784, N'2333', N'La Ferrière', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (785, N'2336', N'Les Bois', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (786, N'2400', N'Le Locle', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (787, N'2406', N'La Châtagne', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (788, N'2405', N'La Chaux-du-Milieu', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (789, N'2400', N'Le Prévoux', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (790, N'2414', N'Le Cerneux-Péquignot', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (791, N'2416', N'Les Brenets', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (792, N'2500', N'Biel/Bienne', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (793, N'2502', N'Biel/Bienne', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (794, N'2503', N'Biel/Bienne', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (795, N'2504', N'Biel/Bienne', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (796, N'2505', N'Biel/Bienne', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (797, N'2512', N'Tüscherz-Alfermée', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (798, N'2513', N'Twann', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (799, N'2514', N'Ligerz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (800, N'2515', N'Prêles', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (801, N'2516', N'Lamboing', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (802, N'2517', N'Diesse', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (803, N'2518', N'Nods', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (804, N'2520', N'La Neuveville', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (805, N'2523', N'Lignières', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (806, N'2525', N'Le Landeron', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (807, N'2532', N'Magglingen/Macolin', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (808, N'2533', N'Evilard', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (809, N'2534', N'Orvin', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (810, N'2534', N'Les Prés-d''Orvin', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (811, N'2535', N'Frinvillier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (812, N'2536', N'Plagne', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (813, N'2537', N'Vauffelin', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (814, N'2538', N'Romont BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (815, N'2540', N'Grenchen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (816, N'2542', N'Pieterlen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (817, N'2543', N'Lengnau BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (818, N'2544', N'Bettlach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (819, N'2545', N'Selzach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (820, N'2552', N'Orpund', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (821, N'2553', N'Safnern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (822, N'2554', N'Meinisberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (823, N'2555', N'Brügg BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (824, N'2556', N'Scheuren', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (825, N'2557', N'Studen BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (826, N'2558', N'Aegerten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (827, N'2560', N'Nidau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (828, N'2562', N'Port', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (829, N'2563', N'Ipsach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (830, N'2564', N'Bellmund', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (831, N'2565', N'Jens', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (832, N'2572', N'Sutz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (833, N'2575', N'Täuffelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (834, N'2576', N'Lüscherz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (835, N'2577', N'Siselen BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (836, N'3237', N'Brüttelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (837, N'2603', N'Péry', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (838, N'2604', N'La Heutte', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (839, N'2605', N'Sonceboz-Sombeval', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (840, N'2606', N'Corgémont', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (841, N'2607', N'Cortébert', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (842, N'2608', N'Courtelary', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (843, N'2608', N'Montagne-de-Courtelary', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (844, N'2610', N'St-Imier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (845, N'2610', N'Mont-Soleil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (846, N'2610', N'Mont-Crosin', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (847, N'2612', N'Cormoret', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (848, N'2613', N'Villeret', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (849, N'2615', N'Sonvilier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (850, N'2615', N'Montagne-de-Sonvilier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (851, N'2616', N'Renan BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (852, N'2710', N'Tavannes', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (853, N'2712', N'Le Fuet', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (854, N'2714', N'Le Prédame', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (855, N'2717', N'Fornet-Dessous', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (856, N'2718', N'Fornet-Dessus', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (857, N'2716', N'Sornetan', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (858, N'2713', N'Bellelay', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (859, N'2714', N'Les Genevez JU', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (860, N'2718', N'Lajoux JU', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (861, N'2720', N'Tramelan', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (862, N'2720', N'La Tanne', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (863, N'2722', N'Les Reussilles', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (864, N'2723', N'Mont-Tramelan', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (865, N'2345', N'Les Breuleux', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (866, N'2345', N'Le Cerneux-Veusil', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (867, N'2345', N'La Chaux-des-Breuleux', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (868, N'2340', N'Le Noirmont', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (869, N'2350', N'Saignelégier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (870, N'2353', N'Les Pommerats', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (871, N'2354', N'Goumois', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (872, N'2732', N'Reconvilier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (873, N'2732', N'Saicourt', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (874, N'2732', N'Saules BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (875, N'2732', N'Loveresse', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (876, N'2733', N'Pontenet', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (877, N'2735', N'Bévilard', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (878, N'2736', N'Sorvilier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (879, N'2738', N'Court', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (880, N'2740', N'Moutier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (881, N'2742', N'Perrefitte', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (882, N'2748', N'Souboz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (883, N'2743', N'Eschert', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (884, N'2744', N'Belprahon', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (885, N'2747', N'Seehof', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (886, N'2745', N'Grandval', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (887, N'2746', N'Crémines', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (888, N'2747', N'Corcelles BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (889, N'2762', N'Roches BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (890, N'2832', N'Rebeuvelier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (891, N'2830', N'Courrendlin', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (892, N'2800', N'Delémont', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (893, N'2802', N'Develier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (894, N'2803', N'Bourrignon', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (895, N'2805', N'Soyhières', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (896, N'2806', N'Mettembert', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (897, N'2807', N'Pleigne', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (898, N'2807', N'Lucelle', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (899, N'2812', N'Movelier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (900, N'2813', N'Ederswiler', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (901, N'2814', N'Roggenburg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (902, N'2822', N'Courroux', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (903, N'2823', N'Courcelon', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (904, N'2824', N'Vicques', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (905, N'2825', N'Courchapoix', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (906, N'2826', N'Corban', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (907, N'2827', N'Mervelier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (908, N'2828', N'Montsevelier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (909, N'2829', N'Vermes', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (910, N'2842', N'Rossemaison', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (911, N'2843', N'Châtillon JU', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (912, N'2852', N'Courtételle', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (913, N'2853', N'Courfaivre', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (914, N'2854', N'Bassecourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (915, N'2855', N'Glovelier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (916, N'2856', N'Boécourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (917, N'2857', N'Montavon', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (918, N'2863', N'Undervelier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (919, N'2864', N'Soulce', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (920, N'2873', N'Saulcy', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (921, N'2882', N'St-Ursanne', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (922, N'2883', N'Montmelon', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (923, N'2884', N'Montenol', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (924, N'2885', N'Epauvillers', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (925, N'2886', N'Epiquerez', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (926, N'2887', N'Soubey', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (927, N'2888', N'Seleute', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (928, N'2889', N'Ocourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (929, N'2950', N'Courgenay', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (930, N'2900', N'Porrentruy', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (931, N'2902', N'Fontenais', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (932, N'2903', N'Villars-sur-Fontenais', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (933, N'2904', N'Bressaucourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (934, N'2905', N'Courtedoux', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (935, N'2906', N'Chevenez', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (936, N'2907', N'Rocourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (937, N'2908', N'Grandfontaine', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (938, N'2912', N'Roche-d''Or', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (939, N'2914', N'Damvant', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (940, N'2915', N'Bure', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (941, N'2916', N'Fahy', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (942, N'2922', N'Courchavon', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (943, N'2923', N'Courtemaîche', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (944, N'2924', N'Montignez', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (945, N'2925', N'Buix', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (946, N'2926', N'Boncourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (947, N'2932', N'Coeuve', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (948, N'2935', N'Beurnevésin', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (949, N'2942', N'Alle', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (950, N'2943', N'Vendlincourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (951, N'2944', N'Bonfol', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (952, N'2946', N'Miécourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (953, N'2947', N'Charmoille', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (954, N'2952', N'Cornol', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (955, N'2954', N'Asuel', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (956, N'3000', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (957, N'3004', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (958, N'3005', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (959, N'3006', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (960, N'3007', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (961, N'3008', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (962, N'3010', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (963, N'3011', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (964, N'3012', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (965, N'3013', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (966, N'3014', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (967, N'3015', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (968, N'3018', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (969, N'3019', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (970, N'3020', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (971, N'3027', N'Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (972, N'3095', N'Spiegel b. Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (973, N'3032', N'Hinterkappelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (974, N'3033', N'Wohlen b. Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (975, N'3034', N'Murzelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (976, N'3035', N'Frieswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (977, N'3036', N'Detligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (978, N'3037', N'Herrenschwanden', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (979, N'3038', N'Kirchlindach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (980, N'3042', N'Ortschwaben', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (981, N'3043', N'Uettligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (982, N'3049', N'Säriswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (983, N'3045', N'Meikirch', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (984, N'3046', N'Wahlendorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (985, N'3047', N'Bremgarten b. Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (986, N'3048', N'Worblaufen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (987, N'3052', N'Zollikofen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (988, N'3053', N'Münchenbuchsee', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (989, N'3054', N'Schüpfen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (990, N'3063', N'Ittigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (991, N'3065', N'Bolligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (992, N'3066', N'Stettlen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (993, N'3067', N'Boll', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (994, N'3068', N'Utzigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (995, N'3072', N'Ostermundigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (996, N'3073', N'Gümligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (997, N'3074', N'Muri b. Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (998, N'3075', N'Rüfenacht BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (999, N'3076', N'Worb', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1000, N'3077', N'Enggistein', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1001, N'3078', N'Richigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1002, N'3082', N'Schlosswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1003, N'3083', N'Trimstein', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1004, N'3084', N'Wabern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1005, N'3088', N'Oberbütschel', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1006, N'3086', N'Zimmerwald', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1007, N'3087', N'Niedermuhlern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1008, N'3088', N'Rüeggisberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1009, N'3089', N'Hinterfultigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1010, N'3096', N'Oberbalm', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1011, N'3097', N'Liebefeld', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1012, N'3098', N'Köniz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1013, N'3098', N'Schliern b. Köniz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1014, N'3099', N'Rüti b. Riggisberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1015, N'3110', N'Münsingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1016, N'3112', N'Allmendingen b. Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1017, N'3114', N'Wichtrach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1018, N'3115', N'Gerzensee', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1019, N'3116', N'Kirchdorf BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1020, N'3629', N'Kiesen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1021, N'3628', N'Uttigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1022, N'3122', N'Kehrsatz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1023, N'3123', N'Belp', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1024, N'3124', N'Belpberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1025, N'3125', N'Toffen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1026, N'3126', N'Kaufdorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1027, N'3127', N'Mühlethurnen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1028, N'3128', N'Kirchenthurnen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1029, N'3132', N'Riggisberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1030, N'3664', N'Burgistein', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1031, N'3665', N'Wattenwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1032, N'3662', N'Seftigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1033, N'3663', N'Gurzelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1034, N'3661', N'Uetendorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1035, N'3144', N'Gasel', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1036, N'3145', N'Niederscherli', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1037, N'3147', N'Mittelhäusern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1038, N'3148', N'Lanzenhäusern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1039, N'3150', N'Schwarzenburg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1040, N'3152', N'Mamishaus', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1041, N'3153', N'Rüschegg Gambach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1042, N'3154', N'Rüschegg Heubach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1043, N'3155', N'Helgisried-Rohrbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1044, N'3156', N'Riffenmatt', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1045, N'3157', N'Milken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1046, N'3158', N'Guggisberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1047, N'3159', N'Riedstätt', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1048, N'3172', N'Niederwangen b. Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1049, N'3173', N'Oberwangen b. Bern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1050, N'3174', N'Thörishaus', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1051, N'3175', N'Flamatt', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1052, N'3176', N'Neuenegg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1053, N'3177', N'Laupen BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1054, N'3178', N'Bösingen', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1055, N'3179', N'Kriechenwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1056, N'3182', N'Ueberstorf', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1057, N'3183', N'Albligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1058, N'3184', N'Wünnewil', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1059, N'3186', N'Düdingen', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1060, N'3126', N'Gelterfingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1061, N'3202', N'Frauenkappelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1062, N'3203', N'Mühleberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1063, N'3204', N'Rosshäusern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1064, N'3205', N'Gümmenen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1065, N'3206', N'Rizenbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1066, N'3207', N'Wileroltigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1067, N'3208', N'Gurbrü', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1068, N'3210', N'Kerzers', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1069, N'3216', N'Ried b. Kerzers', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1070, N'3215', N'Gempenach', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1071, N'3214', N'Ulmiz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1072, N'3213', N'Liebistorf', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1073, N'3212', N'Gurmels', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1074, N'3225', N'Müntschemier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1075, N'3226', N'Treiten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1076, N'3232', N'Ins', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1077, N'3233', N'Tschugg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1078, N'3234', N'Vinelz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1079, N'3235', N'Erlach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1080, N'3236', N'Gampelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1081, N'3250', N'Lyss', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1082, N'3251', N'Wengi b. Büren', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1083, N'3252', N'Worben', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1084, N'3253', N'Schnottwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1085, N'3254', N'Messen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1086, N'3255', N'Rapperswil BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1087, N'3256', N'Dieterswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1088, N'3257', N'Grossaffoltern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1089, N'3257', N'Ammerzwil BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1090, N'3262', N'Suberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1091, N'3263', N'Büetigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1092, N'3264', N'Diessbach b. Büren', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1093, N'3266', N'Wiler b. Seedorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1094, N'3267', N'Seedorf BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1095, N'3268', N'Lobsigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1096, N'3270', N'Aarberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1097, N'3271', N'Radelfingen b. Aarberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1098, N'3272', N'Walperswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1099, N'3273', N'Kappelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1100, N'3274', N'Hermrigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1101, N'3280', N'Murten', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1102, N'3280', N'Meyriez', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1103, N'3282', N'Bargen BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1104, N'3283', N'Kallnach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1105, N'3284', N'Fräschels', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1106, N'3285', N'Galmiz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1107, N'3286', N'Muntelier', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1108, N'3292', N'Busswil BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1109, N'3293', N'Dotzigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1110, N'3294', N'Büren an der Aare', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1111, N'3295', N'Rüti b. Büren', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1112, N'3296', N'Arch', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1113, N'3297', N'Leuzigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1114, N'3298', N'Oberwil b. Büren', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1115, N'3302', N'Moosseedorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1116, N'3303', N'Jegenstorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1117, N'3308', N'Grafenried', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1118, N'3312', N'Fraubrunnen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1119, N'3313', N'Büren zum Hof', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1120, N'3314', N'Schalunen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1121, N'3315', N'Bätterkinden', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1122, N'3315', N'Kräiligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1123, N'3322', N'Urtenen-Schönbühl', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1124, N'3322', N'Mattstetten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1125, N'3323', N'Bäriswil BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1126, N'3324', N'Hindelbank', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1127, N'3325', N'Hettiswil b. Hindelbank', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1128, N'3326', N'Krauchthal', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1129, N'3303', N'Zuzwil BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1130, N'3305', N'Iffwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1131, N'3306', N'Etzelkofen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1132, N'3307', N'Brunnenthal', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1133, N'3309', N'Kernenried', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1134, N'3317', N'Limpach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1135, N'3317', N'Mülchi', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1136, N'3360', N'Herzogenbuchsee', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1137, N'4556', N'Aeschi SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1138, N'3376', N'Graben', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1139, N'3372', N'Wanzwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1140, N'3373', N'Heimenhausen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1141, N'3373', N'Röthenbach Herzogenbuchsee', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1142, N'3374', N'Wangenried', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1143, N'3362', N'Niederönz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1144, N'3363', N'Oberönz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1145, N'3365', N'Seeberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1146, N'3365', N'Grasswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1147, N'3366', N'Bettenhausen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1148, N'3367', N'Thörigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1149, N'3368', N'Bleienbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1150, N'3400', N'Burgdorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1151, N'3412', N'Heimiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1152, N'3413', N'Kaltacker', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1153, N'3414', N'Oberburg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1154, N'3416', N'Affoltern im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1155, N'3417', N'Rüegsau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1156, N'3418', N'Rüegsbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1157, N'3419', N'Biembach im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1158, N'3421', N'Lyssach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1159, N'3422', N'Kirchberg BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1160, N'3422', N'Rüdtligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1161, N'3422', N'Alchenflüh', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1162, N'3423', N'Ersigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1163, N'3424', N'Niederösch', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1164, N'3425', N'Koppigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1165, N'3426', N'Aefligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1166, N'3427', N'Utzenstorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1167, N'3428', N'Wiler b. Utzenstorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1168, N'3432', N'Lützelflüh-Goldbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1169, N'3433', N'Schwanden im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1170, N'3434', N'Obergoldbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1171, N'3435', N'Ramsei', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1172, N'3436', N'Zollbrück', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1173, N'3437', N'Rüderswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1174, N'3438', N'Lauperswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1175, N'3439', N'Ranflüh', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1176, N'3452', N'Grünenmatt', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1177, N'3453', N'Heimisbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1178, N'3454', N'Sumiswald', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1179, N'3455', N'Grünen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1180, N'3456', N'Trachselwald', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1181, N'3457', N'Wasen im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1182, N'3462', N'Weier im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1183, N'3463', N'Häusernmoos im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1184, N'3464', N'Schmidigen-Mühleweg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1185, N'3465', N'Dürrenroth', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1186, N'3472', N'Wynigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1187, N'3473', N'Alchenstorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1188, N'3474', N'Rüedisbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1189, N'3475', N'Riedtwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1190, N'3475', N'Hermiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1191, N'3476', N'Oschwand', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1192, N'3111', N'Tägertschi', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1193, N'3503', N'Gysenstein', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1194, N'3504', N'Niederhünigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1195, N'3506', N'Grosshöchstetten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1196, N'3507', N'Biglen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1197, N'3508', N'Arni BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1198, N'3510', N'Konolfingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1199, N'3512', N'Walkringen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1200, N'3513', N'Bigenthal', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1201, N'3415', N'Schafhausen im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1202, N'3672', N'Oberdiessbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1203, N'3672', N'Aeschlen b. Oberdiessbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1204, N'3673', N'Linden', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1205, N'3674', N'Bleiken b. Oberdiessbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1206, N'3671', N'Brenzikofen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1207, N'3531', N'Oberthal', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1208, N'3532', N'Zäziwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1209, N'3533', N'Bowil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1210, N'3534', N'Signau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1211, N'3535', N'Schüpbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1212, N'3536', N'Aeschau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1213, N'3537', N'Eggiwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1214, N'3538', N'Röthenbach im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1215, N'3543', N'Emmenmatt', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1216, N'3550', N'Langnau im Emmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1217, N'3551', N'Oberfrittenbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1218, N'3552', N'Bärau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1219, N'3553', N'Gohl', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1220, N'3555', N'Trubschachen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1221, N'3556', N'Trub', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1222, N'3557', N'Fankhaus (Trub)', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1223, N'3600', N'Thun', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1224, N'3603', N'Thun', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1225, N'3604', N'Thun', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1226, N'3608', N'Thun', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1227, N'3617', N'Fahrni b. Thun', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1228, N'3618', N'Süderen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1229, N'3619', N'Eriz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1230, N'3619', N'Innereriz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1231, N'3622', N'Homberg b. Thun', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1232, N'3635', N'Uebeschi', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1233, N'3631', N'Höfen b. Thun', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1234, N'3636', N'Längenbühl', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1235, N'3612', N'Steffisburg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1236, N'3613', N'Steffisburg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1237, N'3614', N'Unterlangenegg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1238, N'3615', N'Heimenschwand', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1239, N'3616', N'Schwarzenegg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1240, N'3623', N'Teuffenthal b. Thun', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1241, N'3624', N'Goldiwil (Thun)', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1242, N'3625', N'Heiligenschwendi', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1243, N'3626', N'Hünibach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1244, N'3627', N'Heimberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1245, N'3633', N'Amsoldingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1246, N'3634', N'Thierachern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1247, N'3638', N'Blumenstein', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1248, N'3638', N'Pohlern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1249, N'3645', N'Gwatt (Thun)', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1250, N'3646', N'Einigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1251, N'3647', N'Reutigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1252, N'3652', N'Hilterfingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1253, N'3653', N'Oberhofen am Thunersee', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1254, N'3654', N'Gunten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1255, N'3655', N'Sigriswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1256, N'3656', N'Tschingel ob Gunten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1257, N'3656', N'Aeschlen ob Gunten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1258, N'3657', N'Schwanden (Sigriswil)', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1259, N'3658', N'Merligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1260, N'3700', N'Spiez', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1261, N'3702', N'Hondrich', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1262, N'3703', N'Aeschi b. Spiez', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1263, N'3703', N'Aeschiried', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1264, N'3704', N'Krattigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1265, N'3705', N'Faulensee', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1266, N'3706', N'Leissigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1267, N'3707', N'Därligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1268, N'3711', N'Emdthal', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1269, N'3711', N'Mülenen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1270, N'3713', N'Reichenbach im Kandertal', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1271, N'3714', N'Frutigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1272, N'3714', N'Wengi b. Frutigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1273, N'3715', N'Adelboden', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1274, N'3716', N'Kandergrund', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1275, N'3717', N'Blausee-Mitholz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1276, N'3718', N'Kandersteg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1277, N'3722', N'Scharnachtal', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1278, N'3723', N'Kiental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1279, N'3724', N'Ried (Frutigen)', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1280, N'3725', N'Achseten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1281, N'3752', N'Wimmis', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1282, N'3753', N'Oey', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1283, N'3754', N'Diemtigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1284, N'3755', N'Horboden', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1285, N'3756', N'Zwischenflüh', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1286, N'3757', N'Schwenden im Diemtigtal', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1287, N'3758', N'Latterbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1288, N'3762', N'Erlenbach im Simmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1289, N'3763', N'Därstetten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1290, N'3764', N'Weissenburg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1291, N'3765', N'Oberwil im Simmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1292, N'3766', N'Boltigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1293, N'3770', N'Zweisimmen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1294, N'3771', N'Blankenburg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1295, N'3772', N'St. Stephan', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1296, N'3773', N'Matten (St. Stephan)', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1297, N'3775', N'Lenk im Simmental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1298, N'3776', N'Oeschseite', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1299, N'3777', N'Saanenmöser', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1300, N'3778', N'Schönried', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1301, N'3780', N'Gstaad', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1302, N'3781', N'Turbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1303, N'3782', N'Lauenen b. Gstaad', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1304, N'3783', N'Grund b. Gstaad', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1305, N'3784', N'Feutersoey', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1306, N'3785', N'Gsteig b. Gstaad', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1307, N'3792', N'Saanen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1308, N'3800', N'Interlaken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1309, N'3800', N'Unterseen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1310, N'3800', N'Matten b. Interlaken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1311, N'3801', N'Jungfraujoch', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1312, N'3803', N'Beatenberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1313, N'3804', N'Habkern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1314, N'3805', N'Goldswil b. Interlaken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1315, N'3806', N'Bönigen b. Interlaken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1316, N'3807', N'Iseltwald', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1317, N'3812', N'Wilderswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1318, N'3813', N'Saxeten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1319, N'3814', N'Gsteigwiler', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1320, N'3815', N'Zweilütschinen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1321, N'3816', N'Lütschental', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1322, N'3816', N'Burglauenen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1323, N'3818', N'Grindelwald', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1324, N'3822', N'Lauterbrunnen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1325, N'3822', N'Isenfluh', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1326, N'3823', N'Wengen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1327, N'3824', N'Stechelberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1328, N'3825', N'Mürren', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1329, N'3826', N'Gimmelwald', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1330, N'3852', N'Ringgenberg BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1331, N'3853', N'Niederried b. Interlaken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1332, N'3854', N'Oberried am Brienzersee', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1333, N'3855', N'Brienz BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1334, N'3855', N'Axalp', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1335, N'3856', N'Brienzwiler', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1336, N'3857', N'Unterbach BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1337, N'3858', N'Hofstetten b. Brienz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1338, N'3860', N'Meiringen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1339, N'3860', N'Rosenlaui', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1340, N'3862', N'Innertkirchen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1341, N'3863', N'Gadmen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1342, N'3864', N'Guttannen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1343, N'3900', N'Brig', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1344, N'3900', N'Gamsen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1345, N'3949', N'Hohtenn', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1346, N'3903', N'Birgisch', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1347, N'3903', N'Mund', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1348, N'3914', N'Blatten b. Naters', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1349, N'3914', N'Belalp', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1350, N'3913', N'Rosswald', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1351, N'3911', N'Ried-Brig', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1352, N'3912', N'Termen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1353, N'3901', N'Rothwald', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1354, N'3907', N'Simplon Hospiz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1355, N'3907', N'Simplon Dorf', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1356, N'3907', N'Gabi (Simplon)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1357, N'3907', N'Gondo', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1358, N'3922', N'Eisten', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1359, N'3908', N'Saas-Balen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1360, N'3910', N'Saas-Grund', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1361, N'3902', N'Glis', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1362, N'3917', N'Goppenstein', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1363, N'3916', N'Ferden', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1364, N'3917', N'Kippel', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1365, N'3918', N'Wiler (Lötschen)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1366, N'3919', N'Blatten (Lötschen)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1367, N'3904', N'Naters', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1368, N'3905', N'Saas-Almagell', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1369, N'3906', N'Saas-Fee', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1370, N'3920', N'Zermatt', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1371, N'3923', N'Törbel', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1372, N'3926', N'Embd', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1373, N'3927', N'Herbriggen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1374, N'3928', N'Randa', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1375, N'3929', N'Täsch', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1376, N'3922', N'Stalden VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1377, N'3922', N'Kalpetran', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1378, N'3924', N'St. Niklaus VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1379, N'3925', N'Grächen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1380, N'3930', N'Visp', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1381, N'3942', N'St. German', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1382, N'3933', N'Staldenried', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1383, N'3937', N'Baltschieder', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1384, N'3938', N'Ausserberg', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1385, N'3939', N'Eggerberg', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1386, N'3930', N'Eyholz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1387, N'3931', N'Lalden', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1388, N'3932', N'Visperterminen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1389, N'3934', N'Zeneggen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1390, N'3935', N'Bürchen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1391, N'3943', N'Eischoll', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1392, N'3944', N'Unterbäch VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1393, N'3947', N'Ergisch', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1394, N'3948', N'Unterems', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1395, N'3946', N'Gruben', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1396, N'3948', N'Oberems', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1397, N'3951', N'Agarn', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1398, N'3955', N'Albinen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1399, N'3956', N'Guttet-Feschel', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1400, N'3957', N'Erschmatt', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1401, N'3953', N'Varen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1402, N'3976', N'Noës', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1403, N'3978', N'Flanthey', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1404, N'1978', N'Lens', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1405, N'1977', N'Icogne', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1406, N'3979', N'Grône', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1407, N'3942', N'Raron', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1408, N'3942', N'Niedergesteln', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1409, N'3945', N'Gampel', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1410, N'3946', N'Turtmann', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1411, N'3952', N'Susten', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1412, N'3953', N'Leuk Stadt', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1413, N'3953', N'Inden', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1414, N'3954', N'Leukerbad', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1415, N'3970', N'Salgesch', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1416, N'3977', N'Granges VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1417, N'1958', N'St-Léonard', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1418, N'3960', N'Sierre', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1419, N'3960', N'Corin-de-la-Crête', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1420, N'3960', N'Loc', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1421, N'3971', N'Chermignon', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1422, N'3971', N'Chermignon-d''en-Bas', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1423, N'3971', N'Ollon VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1424, N'3972', N'Miège', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1425, N'3973', N'Venthône', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1426, N'3974', N'Mollens VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1427, N'3975', N'Randogne', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1428, N'3961', N'Vissoie', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1429, N'3961', N'St-Luc', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1430, N'3961', N'Chandolin', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1431, N'3961', N'Ayer', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1432, N'3961', N'Zinal', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1433, N'3961', N'Grimentz', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1434, N'3967', N'Vercorin', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1435, N'3963', N'Montana', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1436, N'3963', N'Crans-Montana', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1437, N'3960', N'Muraz (Sierre)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1438, N'3965', N'Chippis', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1439, N'3966', N'Chalais', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1440, N'3966', N'Réchy', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1441, N'3968', N'Veyras', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1442, N'3982', N'Bitsch', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1443, N'3993', N'Grengiols', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1444, N'3994', N'Lax', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1445, N'3997', N'Bellwald', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1446, N'3989', N'Niederwald', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1447, N'3989', N'Blitzingen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1448, N'3989', N'Biel VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1449, N'3998', N'Gluringen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1450, N'3998', N'Reckingen VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1451, N'3985', N'Geschinen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1452, N'3988', N'Obergesteln', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1453, N'3999', N'Oberwald', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1454, N'3986', N'Ried-Mörel', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1455, N'3987', N'Riederalp', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1456, N'3991', N'Betten', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1457, N'3992', N'Bettmeralp', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1458, N'3995', N'Ernen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1459, N'3996', N'Binn', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1460, N'3983', N'Mörel', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1461, N'3984', N'Fiesch', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1462, N'3985', N'Münster VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1463, N'3988', N'Ulrichen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1464, N'4000', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1465, N'4001', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1466, N'4031', N'Basel Universitätsspital', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1467, N'4051', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1468, N'4052', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1469, N'4053', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1470, N'4054', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1471, N'4055', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1472, N'4056', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1473, N'4057', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1474, N'4058', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1475, N'4059', N'Basel', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1476, N'4101', N'Bruderholz', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1477, N'4102', N'Binningen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1478, N'4103', N'Bottmingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1479, N'4104', N'Oberwil BL', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1480, N'4105', N'Biel-Benken BL', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1481, N'4106', N'Therwil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1482, N'4107', N'Ettingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1483, N'4108', N'Witterswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1484, N'4112', N'Bättwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1485, N'4112', N'Flüh', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1486, N'4114', N'Hofstetten SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1487, N'4115', N'Mariastein', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1488, N'4116', N'Metzerlen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1489, N'4117', N'Burg im Leimental', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1490, N'4118', N'Rodersdorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1491, N'4123', N'Allschwil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1492, N'4124', N'Schönenbuch', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1493, N'4125', N'Riehen', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1494, N'4126', N'Bettingen', N'BS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1495, N'4127', N'Birsfelden', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1496, N'4132', N'Muttenz', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1497, N'4133', N'Pratteln', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1498, N'4142', N'Münchenstein', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1499, N'4143', N'Dornach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1500, N'4144', N'Arlesheim', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1501, N'4145', N'Gempen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1502, N'4146', N'Hochwald', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1503, N'4147', N'Aesch BL', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1504, N'4148', N'Pfeffingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1505, N'4153', N'Reinach BL', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1506, N'4202', N'Duggingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1507, N'4203', N'Grellingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1508, N'4206', N'Seewen SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1509, N'4207', N'Bretzwil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1510, N'4208', N'Nunningen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1511, N'4222', N'Zwingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1512, N'4225', N'Brislach', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1513, N'4226', N'Breitenbach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1514, N'4227', N'Büsserach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1515, N'4228', N'Erschwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1516, N'4242', N'Laufen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1517, N'4243', N'Dittingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1518, N'4244', N'Röschenz', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1519, N'4245', N'Kleinlützel', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1520, N'4204', N'Himmelried', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1521, N'4223', N'Blauen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1522, N'4224', N'Nenzlingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1523, N'4229', N'Beinwil SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1524, N'4232', N'Fehren', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1525, N'4233', N'Meltingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1526, N'4234', N'Zullwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1527, N'4246', N'Wahlen b. Laufen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1528, N'4247', N'Grindel', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1529, N'4252', N'Bärschwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1530, N'4253', N'Liesberg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1531, N'4254', N'Liesberg Dorf', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1532, N'4302', N'Augst BL', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1533, N'4303', N'Kaiseraugst', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1534, N'4304', N'Giebenach', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1535, N'4305', N'Olsberg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1536, N'4310', N'Rheinfelden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1537, N'4312', N'Magden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1538, N'4313', N'Möhlin', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1539, N'4314', N'Zeiningen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1540, N'4315', N'Zuzgen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1541, N'4316', N'Hellikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1542, N'4317', N'Wegenstetten', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1543, N'4322', N'Mumpf', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1544, N'4323', N'Wallbach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1545, N'4324', N'Obermumpf', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1546, N'4325', N'Schupfart', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1547, N'4332', N'Stein AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1548, N'4333', N'Münchwilen AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1549, N'4334', N'Sisseln AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1550, N'5080', N'Laufenburg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1551, N'5082', N'Kaisten', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1552, N'5083', N'Ittenthal', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1553, N'5084', N'Rheinsulz', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1554, N'5085', N'Sulz AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1555, N'5275', N'Etzgen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1556, N'5274', N'Mettau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1557, N'5273', N'Oberhofen AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1558, N'5272', N'Gansingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1559, N'5276', N'Wil AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1560, N'5277', N'Hottwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1561, N'5326', N'Schwaderloch', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1562, N'5325', N'Leibstadt', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1563, N'5324', N'Full-Reuenthal', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1564, N'4402', N'Frenkendorf', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1565, N'4410', N'Liestal', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1566, N'4411', N'Seltisberg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1567, N'4412', N'Nuglar', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1568, N'4413', N'Büren SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1569, N'4414', N'Füllinsdorf', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1570, N'4415', N'Lausen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1571, N'4416', N'Bubendorf', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1572, N'4417', N'Ziefen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1573, N'4418', N'Reigoldswil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1574, N'4419', N'Lupsingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1575, N'4421', N'St. Pantaleon', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1576, N'4422', N'Arisdorf', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1577, N'4423', N'Hersberg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1578, N'4424', N'Arboldswil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1579, N'4425', N'Titterten', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1580, N'4426', N'Lauwil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1581, N'4431', N'Bennwil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1582, N'4432', N'Lampenberg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1583, N'4433', N'Ramlinsburg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1584, N'4434', N'Hölstein', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1585, N'4435', N'Niederdorf', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1586, N'4436', N'Oberdorf BL', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1587, N'4437', N'Waldenburg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1588, N'4438', N'Langenbruck', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1589, N'4441', N'Thürnen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1590, N'4442', N'Diepflingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1591, N'4443', N'Wittinsburg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1592, N'4444', N'Rümlingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1593, N'4445', N'Häfelfingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1594, N'4446', N'Buckten', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1595, N'4447', N'Känerkinden', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1596, N'4448', N'Läufelfingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1597, N'4450', N'Sissach', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1598, N'4451', N'Wintersingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1599, N'4452', N'Itingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1600, N'4453', N'Nusshof', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1601, N'4455', N'Zunzgen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1602, N'4456', N'Tenniken', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1603, N'4457', N'Diegten', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1604, N'4458', N'Eptingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1605, N'4460', N'Gelterkinden', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1606, N'4461', N'Böckten', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1607, N'4465', N'Hemmiken', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1608, N'4469', N'Anwil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1609, N'4462', N'Rickenbach BL', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1610, N'4463', N'Buus', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1611, N'4464', N'Maisprach', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1612, N'4466', N'Ormalingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1613, N'4467', N'Rothenfluh', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1614, N'4468', N'Kienberg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1615, N'4492', N'Tecknau', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1616, N'4493', N'Wenslingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1617, N'4494', N'Oltingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1618, N'4495', N'Zeglingen', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1619, N'4496', N'Kilchberg BL', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1620, N'4497', N'Rünenberg', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1621, N'4500', N'Solothurn', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1622, N'4515', N'Weissenstein b. Solothurn', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1623, N'4525', N'Balm b. Günsberg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1624, N'4523', N'Niederwil SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1625, N'4535', N'Hubersdorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1626, N'4539', N'Rumisberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1627, N'4539', N'Farnern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1628, N'4557', N'Horriwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1629, N'4558', N'Hersiwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1630, N'4512', N'Bellach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1631, N'4513', N'Langendorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1632, N'4514', N'Lommiswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1633, N'4515', N'Oberdorf SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1634, N'4522', N'Rüttenen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1635, N'4524', N'Günsberg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1636, N'4528', N'Zuchwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1637, N'4532', N'Feldbrunnen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1638, N'4533', N'Riedholz', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1639, N'4534', N'Flumenthal', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1640, N'4536', N'Attiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1641, N'4537', N'Wiedlisbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1642, N'4538', N'Oberbipp', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1643, N'4552', N'Derendingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1644, N'4553', N'Subingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1645, N'4554', N'Etziken', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1646, N'3375', N'Inkwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1647, N'4562', N'Biberist', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1648, N'4563', N'Gerlafingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1649, N'4564', N'Obergerlafingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1650, N'4564', N'Zielebach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1651, N'4565', N'Recherswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1652, N'4566', N'Kriegstetten', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1653, N'4581', N'Küttigkofen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1654, N'4586', N'Kyburg-Buchegg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1655, N'4582', N'Brügglen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1656, N'4583', N'Mühledorf SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1657, N'4579', N'Gossliwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1658, N'4578', N'Bibern SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1659, N'4571', N'Ichertswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1660, N'4576', N'Tscheppach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1661, N'4577', N'Hessigkofen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1662, N'4585', N'Biezwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1663, N'4587', N'Aetingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1664, N'4588', N'Unterramsern', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1665, N'4588', N'Oberramsern', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1666, N'4574', N'Nennigkofen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1667, N'4574', N'Lüsslingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1668, N'4600', N'Olten', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1669, N'4612', N'Wangen b. Olten', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1670, N'4613', N'Rickenbach SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1671, N'4614', N'Hägendorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1672, N'4616', N'Kappel SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1673, N'4617', N'Gunzgen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1674, N'4618', N'Boningen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1675, N'4622', N'Egerkingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1676, N'4623', N'Neuendorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1677, N'4624', N'Härkingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1678, N'4625', N'Oberbuchsiten', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1679, N'4626', N'Niederbuchsiten', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1680, N'4632', N'Trimbach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1681, N'4652', N'Winznau', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1682, N'4653', N'Obergösgen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1683, N'4654', N'Lostorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1684, N'4655', N'Stüsslingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1685, N'4655', N'Rohr b. Olten', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1686, N'4656', N'Starrkirch-Wil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1687, N'4657', N'Dulliken', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1688, N'4658', N'Däniken SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1689, N'4663', N'Aarburg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1690, N'4665', N'Oftringen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1691, N'4615', N'Allerheiligenberg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1692, N'4633', N'Hauenstein', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1693, N'4634', N'Wisen SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1694, N'4702', N'Oensingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1695, N'4703', N'Kestenholz', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1696, N'4704', N'Niederbipp', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1697, N'3380', N'Wangen an der Aare', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1698, N'3377', N'Walliswil b. Wangen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1699, N'4543', N'Deitingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1700, N'4542', N'Luterbach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1701, N'4710', N'Balsthal', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1702, N'4714', N'Aedermannsdorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1703, N'4715', N'Herbetswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1704, N'4719', N'Ramiswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1705, N'4712', N'Laupersdorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1706, N'4713', N'Matzendorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1707, N'4716', N'Welschenrohr', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1708, N'4716', N'Gänsbrunnen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1709, N'4717', N'Mümliswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1710, N'4718', N'Holderbank SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1711, N'4800', N'Zofingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1712, N'4802', N'Strengelbach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1713, N'4803', N'Vordemwald', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1714, N'4805', N'Brittnau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1715, N'4806', N'Wikon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1716, N'4812', N'Mühlethal', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1717, N'4813', N'Uerkheim', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1718, N'4814', N'Bottenwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1719, N'4852', N'Rothrist', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1720, N'4853', N'Murgenthal', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1721, N'4629', N'Fulenbach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1722, N'4628', N'Wolfwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1723, N'4856', N'Glashütten', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1724, N'4853', N'Riken AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1725, N'4900', N'Langenthal', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1726, N'4911', N'Schwarzhäusern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1727, N'4912', N'Aarwangen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1728, N'4913', N'Bannwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1729, N'4914', N'Roggwil BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1730, N'4915', N'St. Urban', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1731, N'4916', N'Untersteckholz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1732, N'4917', N'Melchnau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1733, N'4917', N'Busswil b. Melchnau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1734, N'4955', N'Gondiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1735, N'4919', N'Reisiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1736, N'4922', N'Bützberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1737, N'4923', N'Wynau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1738, N'4924', N'Obersteckholz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1739, N'4932', N'Lotzwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1740, N'4933', N'Rütschelen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1741, N'4934', N'Madiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1742, N'4935', N'Leimiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1743, N'4936', N'Kleindietwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1744, N'4937', N'Ursenbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1745, N'4938', N'Rohrbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1746, N'4942', N'Walterswil BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1747, N'4943', N'Oeschenbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1748, N'4944', N'Auswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1749, N'4938', N'Rohrbachgraben', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1750, N'4950', N'Huttwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1751, N'4952', N'Eriswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1752, N'4953', N'Schwarzenbach (Huttwil)', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1753, N'4954', N'Wyssachen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1754, N'5000', N'Aarau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1755, N'5004', N'Aarau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1756, N'5012', N'Schönenwerd', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1757, N'5013', N'Niedergösgen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1758, N'5014', N'Gretzenbach', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1759, N'5015', N'Erlinsbach SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1760, N'5017', N'Barmelweid', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1761, N'5022', N'Rombach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1762, N'5023', N'Biberstein', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1763, N'5024', N'Küttigen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1764, N'5025', N'Asp', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1765, N'5026', N'Densbüren', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1766, N'5027', N'Herznach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1767, N'5028', N'Ueken', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1768, N'5032', N'Aarau Rohr', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1769, N'5033', N'Buchs AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1770, N'5034', N'Suhr', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1771, N'5035', N'Unterentfelden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1772, N'5036', N'Oberentfelden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1773, N'5037', N'Muhen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1774, N'5040', N'Schöftland', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1775, N'5042', N'Hirschthal', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1776, N'5043', N'Holziken', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1777, N'5044', N'Schlossrued', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1778, N'5046', N'Schmiedrued', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1779, N'5046', N'Walde AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1780, N'5053', N'Staffelbach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1781, N'5054', N'Kirchleerau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1782, N'5054', N'Moosleerau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1783, N'5056', N'Attelwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1784, N'5057', N'Reitnau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1785, N'5102', N'Rupperswil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1786, N'5103', N'Wildegg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1787, N'5105', N'Auenstein', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1788, N'5106', N'Veltheim AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1789, N'5107', N'Schinznach Dorf', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1790, N'5108', N'Oberflachs', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1791, N'5112', N'Thalheim AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1792, N'5113', N'Holderbank AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1793, N'5103', N'Möriken AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1794, N'5116', N'Schinznach Bad', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1795, N'5245', N'Habsburg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1796, N'5246', N'Scherz', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1797, N'5200', N'Brugg AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1798, N'5210', N'Windisch', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1799, N'5212', N'Hausen AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1800, N'5213', N'Villnachern', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1801, N'5222', N'Umiken', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1802, N'5223', N'Riniken', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1803, N'5233', N'Stilli', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1804, N'5234', N'Villigen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1805, N'5235', N'Rüfenach AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1806, N'5236', N'Remigen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1807, N'5237', N'Mönthal', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1808, N'5242', N'Birr', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1809, N'5242', N'Lupfig', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1810, N'5243', N'Mülligen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1811, N'5244', N'Birrhard', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1812, N'5078', N'Effingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1813, N'5076', N'Bözen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1814, N'5077', N'Elfingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1815, N'5079', N'Zeihen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1816, N'5075', N'Hornussen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1817, N'5070', N'Frick', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1818, N'5072', N'Oeschgen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1819, N'5073', N'Gipf-Oberfrick', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1820, N'5064', N'Wittnau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1821, N'5063', N'Wölflinswil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1822, N'5062', N'Oberhof', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1823, N'5074', N'Eiken', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1824, N'5300', N'Turgi', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1825, N'5301', N'Siggenthal Station', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1826, N'5303', N'Würenlingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1827, N'5304', N'Endingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1828, N'5305', N'Unterendingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1829, N'5306', N'Tegerfelden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1830, N'5312', N'Döttingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1831, N'5313', N'Klingnau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1832, N'5314', N'Kleindöttingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1833, N'5315', N'Böttstein', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1834, N'5316', N'Leuggern', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1835, N'5317', N'Hettenschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1836, N'5318', N'Mandach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1837, N'5322', N'Koblenz', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1838, N'5400', N'Baden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1839, N'5408', N'Ennetbaden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1840, N'5404', N'Baden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1841, N'5412', N'Gebenstorf', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1842, N'5413', N'Birmenstorf AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1843, N'5415', N'Nussbaumen AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1844, N'5416', N'Kirchdorf AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1845, N'5417', N'Untersiggenthal', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1846, N'5420', N'Ehrendingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1847, N'5423', N'Freienwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1848, N'5425', N'Schneisingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1849, N'5426', N'Lengnau AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1850, N'5430', N'Wettingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1851, N'5432', N'Neuenhof', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1852, N'5442', N'Fislisbach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1853, N'5443', N'Niederrohrdorf', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1854, N'5444', N'Künten', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1855, N'5445', N'Eggenwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1856, N'5452', N'Oberrohrdorf', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1857, N'5453', N'Remetschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1858, N'5454', N'Bellikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1859, N'5502', N'Hunzenschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1860, N'5503', N'Schafisheim', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1861, N'5504', N'Othmarsingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1862, N'5505', N'Brunegg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1863, N'5506', N'Mägenwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1864, N'5507', N'Mellingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1865, N'5512', N'Wohlenschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1866, N'5522', N'Tägerig', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1867, N'5524', N'Nesselnbach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1868, N'5524', N'Niederwil AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1869, N'5525', N'Fischbach-Göslikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1870, N'5600', N'Lenzburg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1871, N'5600', N'Ammerswil AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1872, N'5603', N'Staufen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1873, N'5604', N'Hendschiken', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1874, N'5605', N'Dottikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1875, N'5606', N'Dintikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1876, N'5607', N'Hägglingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1877, N'5608', N'Stetten AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1878, N'5610', N'Wohlen AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1879, N'5611', N'Anglikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1880, N'5619', N'Büttikon AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1881, N'5612', N'Villmergen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1882, N'5613', N'Hilfikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1883, N'5614', N'Sarmenstorf', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1884, N'5615', N'Fahrwangen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1885, N'5616', N'Meisterschwanden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1886, N'5617', N'Tennwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1887, N'5618', N'Bettwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1888, N'5620', N'Bremgarten AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1889, N'5621', N'Zufikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1890, N'5622', N'Waltenschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1891, N'5623', N'Boswil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1892, N'5624', N'Bünzen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1893, N'5625', N'Kallern', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1894, N'5626', N'Hermetschwil-Staffeln', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1895, N'5627', N'Besenbüren', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1896, N'5628', N'Aristau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1897, N'5630', N'Muri AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1898, N'5632', N'Buttwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1899, N'5634', N'Merenschwand', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1900, N'5636', N'Benzenschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1901, N'5637', N'Beinwil (Freiamt)', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1902, N'5642', N'Mühlau', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1903, N'5643', N'Sins', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1904, N'5644', N'Auw', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1905, N'5645', N'Aettenschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1906, N'5646', N'Abtwil AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1907, N'5647', N'Oberrüti', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1908, N'5643', N'Alikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1909, N'5702', N'Niederlenz', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1910, N'5703', N'Seon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1911, N'5704', N'Egliswil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1912, N'5705', N'Hallwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1913, N'5706', N'Boniswil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1914, N'5707', N'Seengen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1915, N'5708', N'Birrwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1916, N'5712', N'Beinwil am See', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1917, N'5722', N'Gränichen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1918, N'5723', N'Teufenthal AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1919, N'5724', N'Dürrenäsch', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1920, N'5725', N'Leutwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1921, N'5726', N'Unterkulm', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1922, N'5727', N'Oberkulm', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1923, N'5728', N'Gontenschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1924, N'5732', N'Zetzwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1925, N'5733', N'Leimbach AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1926, N'5734', N'Reinach AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1927, N'5735', N'Pfeffikon LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1928, N'5736', N'Burg AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1929, N'5737', N'Menziken', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1930, N'5742', N'Kölliken', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1931, N'5745', N'Safenwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1932, N'5746', N'Walterswil SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1933, N'6000', N'Luzern', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1934, N'6003', N'Luzern', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1935, N'6004', N'Luzern', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1936, N'6005', N'Luzern', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1937, N'6006', N'Luzern', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1938, N'6010', N'Kriens', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1939, N'6012', N'Obernau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1940, N'6013', N'Eigenthal', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1941, N'6014', N'Luzern', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1942, N'6015', N'Luzern', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1943, N'6016', N'Hellbühl', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1944, N'6017', N'Ruswil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1945, N'6019', N'Sigigen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1946, N'6018', N'Buttisholz', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1947, N'6020', N'Emmenbrücke', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1948, N'6022', N'Grosswangen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1949, N'6023', N'Rothenburg', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1950, N'6024', N'Hildisrieden', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1951, N'6025', N'Neudorf', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1952, N'6026', N'Rain', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1953, N'6027', N'Römerswil LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1954, N'6028', N'Herlisberg', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1955, N'6030', N'Ebikon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1956, N'6032', N'Emmen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1957, N'6033', N'Buchrain', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1958, N'6034', N'Inwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1959, N'6035', N'Perlen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1960, N'6036', N'Dierikon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1961, N'6037', N'Root', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1962, N'6038', N'Gisikon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1963, N'6042', N'Dietwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1964, N'6043', N'Adligenswil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1965, N'6044', N'Udligenswil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1966, N'6045', N'Meggen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1967, N'6047', N'Kastanienbaum', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1968, N'6048', N'Horw', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1969, N'6052', N'Hergiswil NW', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1970, N'6053', N'Alpnachstad', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1971, N'6055', N'Alpnach Dorf', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1972, N'6056', N'Kägiswil', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1973, N'6060', N'Sarnen', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1974, N'6060', N'Ramersberg', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1975, N'6068', N'Melchsee-Frutt', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1976, N'6062', N'Wilen (Sarnen)', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1977, N'6063', N'Stalden (Sarnen)', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1978, N'6064', N'Kerns', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1979, N'6066', N'St. Niklausen OW', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1980, N'6067', N'Melchtal', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1981, N'6072', N'Sachseln', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1982, N'6073', N'Flüeli-Ranft', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1983, N'6074', N'Giswil', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1984, N'6078', N'Bürglen OW', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1985, N'6078', N'Lungern', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1986, N'3860', N'Brünig', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1987, N'6083', N'Hasliberg Hohfluh', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1988, N'6084', N'Hasliberg Wasserwendi', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1989, N'6085', N'Hasliberg Goldern', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1990, N'6086', N'Hasliberg Reuti', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1991, N'6010', N'Pilatus Kulm', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1992, N'6102', N'Malters', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1993, N'6103', N'Schwarzenberg LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1994, N'6105', N'Schachen LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1995, N'6106', N'Werthenstein', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1996, N'6110', N'Wolhusen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1997, N'6114', N'Steinhuserberg', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1998, N'6110', N'Fontannen b. Wolhusen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (1999, N'6112', N'Doppleschwand', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2000, N'6113', N'Romoos', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2001, N'6122', N'Menznau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2002, N'6123', N'Geiss', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2003, N'6125', N'Menzberg', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2004, N'6126', N'Daiwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2005, N'6130', N'Willisau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2006, N'6132', N'Rohrmatt', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2007, N'6133', N'Hergiswil b. Willisau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2008, N'6142', N'Gettnau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2009, N'6143', N'Ohmstal', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2010, N'6144', N'Zell LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2011, N'6145', N'Fischbach LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2012, N'6146', N'Grossdietwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2013, N'6147', N'Altbüron', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2014, N'6152', N'Hüswil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2015, N'6153', N'Ufhusen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2016, N'6154', N'Hofstatt', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2017, N'6156', N'Luthern', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2018, N'6162', N'Entlebuch', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2019, N'6163', N'Ebnet', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2020, N'6162', N'Rengg', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2021, N'6162', N'Finsterwald b. Entlebuch', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2022, N'6166', N'Hasle LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2023, N'6167', N'Bramboden', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2024, N'6170', N'Schüpfheim', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2025, N'6173', N'Flühli LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2026, N'6174', N'Sörenberg', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2027, N'6182', N'Escholzmatt', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2028, N'6192', N'Wiggen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2029, N'6196', N'Marbach LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2030, N'6197', N'Schangnau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2031, N'6203', N'Sempach Station', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2032, N'6204', N'Sempach', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2033, N'6205', N'Eich', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2034, N'6206', N'Neuenkirch', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2035, N'6207', N'Nottwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2036, N'6208', N'Oberkirch LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2037, N'6210', N'Sursee', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2038, N'6211', N'Buchs LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2039, N'6212', N'St. Erhard', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2040, N'6213', N'Knutwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2041, N'6214', N'Schenkon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2042, N'6215', N'Beromünster', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2043, N'6215', N'Schwarzenbach LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2044, N'6216', N'Mauensee', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2045, N'6217', N'Kottwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2046, N'6218', N'Ettiswil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2047, N'6221', N'Rickenbach LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2048, N'6222', N'Gunzwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2049, N'6231', N'Schlierbach', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2050, N'6232', N'Geuensee', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2051, N'6233', N'Büron', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2052, N'6234', N'Triengen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2053, N'6234', N'Kulmerau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2054, N'6236', N'Wilihof', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2055, N'6235', N'Winikon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2056, N'6242', N'Wauwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2057, N'6243', N'Egolzwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2058, N'6244', N'Nebikon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2059, N'6245', N'Ebersecken', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2060, N'6246', N'Altishofen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2061, N'6247', N'Schötz', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2062, N'6248', N'Alberswil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2063, N'6252', N'Dagmersellen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2064, N'6253', N'Uffikon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2065, N'6260', N'Reiden', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2066, N'6260', N'Reidermoos', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2067, N'6262', N'Langnau b. Reiden', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2068, N'6263', N'Richenthal', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2069, N'6264', N'Pfaffnau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2070, N'6265', N'Roggliswil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2071, N'6274', N'Eschenbach LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2072, N'6275', N'Ballwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2073, N'6276', N'Hohenrain', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2074, N'6277', N'Kleinwangen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2075, N'6280', N'Hochdorf', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2076, N'6280', N'Urswil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2077, N'6283', N'Baldegg', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2078, N'6284', N'Gelfingen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2079, N'6285', N'Hitzkirch', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2080, N'6285', N'Retschwil', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2081, N'6289', N'Müswangen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2082, N'6286', N'Altwis', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2083, N'6287', N'Aesch LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2084, N'6288', N'Schongau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2085, N'6294', N'Ermensee', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2086, N'6295', N'Mosen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2087, N'6300', N'Zug', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2088, N'6313', N'Edlibach', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2089, N'6313', N'Finstersee', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2090, N'6319', N'Allenwinden', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2091, N'6315', N'Morgarten', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2092, N'6312', N'Steinhausen', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2093, N'6313', N'Menzingen', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2094, N'6314', N'Unterägeri', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2095, N'6314', N'Neuägeri', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2096, N'6315', N'Oberägeri', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2097, N'6315', N'Alosen', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2098, N'6300', N'Zugerberg', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2099, N'6317', N'Oberwil b. Zug', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2100, N'6318', N'Walchwil', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2101, N'6330', N'Cham', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2102, N'6331', N'Hünenberg', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2103, N'6332', N'Hagendorn', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2104, N'6340', N'Baar', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2105, N'6343', N'Rotkreuz', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2106, N'6344', N'Meierskappel', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2107, N'6345', N'Neuheim', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2108, N'6353', N'Weggis', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2109, N'6354', N'Vitznau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2110, N'6356', N'Rigi Kaltbad', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2111, N'6362', N'Stansstad', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2112, N'6363', N'Obbürgen', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2113, N'6365', N'Kehrsiten', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2114, N'6370', N'Stans', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2115, N'6372', N'Ennetmoos', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2116, N'6373', N'Ennetbürgen', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2117, N'6374', N'Buochs', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2118, N'6375', N'Beckenried', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2119, N'6376', N'Emmetten', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2120, N'6377', N'Seelisberg', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2121, N'6382', N'Büren NW', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2122, N'6383', N'Dallenwil', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2123, N'6383', N'Niederrickenbach', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2124, N'6386', N'Wolfenschiessen', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2125, N'6387', N'Oberrickenbach', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2126, N'6388', N'Grafenort', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2127, N'6390', N'Engelberg', N'OW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2128, N'6402', N'Merlischachen', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2129, N'6403', N'Küssnacht am Rigi', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2130, N'6404', N'Greppen', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2131, N'6405', N'Immensee', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2132, N'6410', N'Goldau', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2133, N'6410', N'Rigi Klösterli', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2134, N'6410', N'Rigi Staffel', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2135, N'6410', N'Rigi Kulm', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2136, N'6414', N'Oberarth', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2137, N'6415', N'Arth', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2138, N'6416', N'Steinerberg', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2139, N'6417', N'Sattel', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2140, N'6418', N'Rothenthurm', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2141, N'6422', N'Steinen', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2142, N'6423', N'Seewen SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2143, N'6424', N'Lauerz', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2144, N'6430', N'Schwyz', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2145, N'6436', N'Ried (Muotathal)', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2146, N'6432', N'Rickenbach b. Schwyz', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2147, N'6433', N'Stoos SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2148, N'6434', N'Illgau', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2149, N'6436', N'Muotathal', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2150, N'6436', N'Bisisthal', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2151, N'6438', N'Ibach', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2152, N'6440', N'Brunnen', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2153, N'6441', N'Rütli', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2154, N'6442', N'Gersau', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2155, N'6443', N'Morschach', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2156, N'6452', N'Sisikon', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2157, N'6452', N'Riemenstalden', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2158, N'6454', N'Flüelen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2159, N'6460', N'Altdorf UR', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2160, N'6461', N'Isenthal', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2161, N'6462', N'Seedorf UR', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2162, N'6463', N'Bürglen UR', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2163, N'6464', N'Spiringen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2164, N'6465', N'Unterschächen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2165, N'6466', N'Bauen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2166, N'6467', N'Schattdorf', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2167, N'6469', N'Haldi b. Schattdorf', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2168, N'6468', N'Attinghausen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2169, N'6472', N'Erstfeld', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2170, N'6473', N'Silenen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2171, N'6474', N'Amsteg', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2172, N'6475', N'Bristen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2173, N'6476', N'Intschi', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2174, N'6482', N'Gurtnellen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2175, N'6484', N'Wassen UR', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2176, N'6485', N'Meien', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2177, N'6487', N'Göschenen', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2178, N'6490', N'Andermatt', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2179, N'6491', N'Realp', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2180, N'6493', N'Hospental', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2181, N'6500', N'Bellinzona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2182, N'6503', N'Bellinzona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2183, N'6512', N'Giubiasco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2184, N'6513', N'Monte Carasso', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2185, N'6514', N'Sementina', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2186, N'6515', N'Gudo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2187, N'6516', N'Cugnasco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2188, N'6517', N'Arbedo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2189, N'6518', N'Gorduno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2190, N'6525', N'Gnosca', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2191, N'6526', N'Prosito', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2192, N'6527', N'Lodrino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2193, N'6528', N'Camorino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2194, N'6532', N'Castione', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2195, N'6533', N'Lumino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2196, N'6534', N'S. Vittore', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2197, N'6535', N'Roveredo GR', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2198, N'6537', N'Grono', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2199, N'6523', N'Preonzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2200, N'6524', N'Moleno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2201, N'6582', N'Pianezzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2202, N'6583', N'S. Antonio (Val Morobbia)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2203, N'6584', N'Carena', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2204, N'6549', N'Laura', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2205, N'6540', N'Castaneda', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2206, N'6541', N'Sta. Maria in Calanca', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2207, N'6538', N'Verdabbio', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2208, N'6542', N'Buseno', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2209, N'6543', N'Arvigo', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2210, N'6544', N'Braggio', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2211, N'6545', N'Selma', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2212, N'6546', N'Cauco', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2213, N'6547', N'Augio', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2214, N'6548', N'Rossa', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2215, N'6556', N'Leggia', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2216, N'6565', N'S. Bernardino', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2217, N'6557', N'Cama', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2218, N'6558', N'Lostallo', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2219, N'6562', N'Soazza', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2220, N'6563', N'Mesocco', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2221, N'6572', N'Quartino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2222, N'6573', N'Magadino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2223, N'6574', N'Vira (Gambarogno)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2224, N'6575', N'S. Nazzaro', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2225, N'6575', N'Vairano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2226, N'6576', N'Gerra (Gambarogno)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2227, N'6577', N'Ranzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2228, N'6578', N'Caviano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2229, N'6579', N'Piazzogna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2230, N'6571', N'Indemini', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2231, N'6592', N'S. Antonino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2232, N'6593', N'Cadenazzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2233, N'6594', N'Contone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2234, N'6595', N'Riazzino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2235, N'6596', N'Gordola', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2236, N'6597', N'Agarone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2237, N'6598', N'Tenero', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2238, N'6599', N'Robasacco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2239, N'6600', N'Locarno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2240, N'6600', N'Muralto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2241, N'6605', N'Locarno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2242, N'6605', N'Monte Brè sopra Locarno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2243, N'6656', N'Golino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2244, N'6618', N'Arcegno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2245, N'6646', N'Contra', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2246, N'6647', N'Mergoscia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2247, N'6661', N'Auressio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2248, N'6661', N'Loco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2249, N'6661', N'Berzona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2250, N'6611', N'Mosogno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2251, N'6662', N'Russo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2252, N'6664', N'Vergeletto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2253, N'6611', N'Gresso', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2254, N'6611', N'Crana', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2255, N'6663', N'Comologno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2256, N'6663', N'Spruga', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2257, N'6632', N'Vogorno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2258, N'6631', N'Corippo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2259, N'6633', N'Lavertezzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2260, N'6634', N'Brione (Verzasca)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2261, N'6635', N'Gerra (Verzasca)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2262, N'6636', N'Frasco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2263, N'6637', N'Sonogno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2264, N'6612', N'Ascona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2265, N'6613', N'Porto Ronco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2266, N'6614', N'Brissago', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2267, N'6614', N'Isole di Brissago', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2268, N'6616', N'Losone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2269, N'6622', N'Ronco sopra Ascona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2270, N'6644', N'Orselina', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2271, N'6645', N'Brione sopra Minusio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2272, N'6648', N'Minusio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2273, N'6655', N'Verdasio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2274, N'6655', N'Rasa', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2275, N'6657', N'Palagnedra', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2276, N'6658', N'Borgnone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2277, N'6659', N'Camedo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2278, N'6659', N'Moneto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2279, N'6652', N'Tegna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2280, N'6653', N'Verscio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2281, N'6654', N'Cavigliano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2282, N'6655', N'Intragna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2283, N'6670', N'Avegno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2284, N'6677', N'Moghegno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2285, N'6678', N'Coglio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2286, N'6678', N'Lodano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2287, N'6678', N'Giumaglio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2288, N'6674', N'Riveo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2289, N'6682', N'Linescio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2290, N'6683', N'Cerentino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2291, N'6685', N'Bosco/Gurin', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2292, N'6683', N'Niva (Vallemaggia)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2293, N'6684', N'Campo (Vallemaggia)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2294, N'6684', N'Cimalmotto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2295, N'6690', N'Cavergno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2296, N'6690', N'S. Carlo (Val Bavona)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2297, N'6692', N'Brontallo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2298, N'6692', N'Menzonio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2299, N'6693', N'Broglio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2300, N'6694', N'Prato-Sornico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2301, N'6695', N'Peccia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2302, N'6695', N'Piano di Peccia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2303, N'6696', N'Fusio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2304, N'6672', N'Gordevio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2305, N'6673', N'Maggia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2306, N'6674', N'Someo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2307, N'6675', N'Cevio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2308, N'6676', N'Bignasco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2309, N'6702', N'Claro', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2310, N'6703', N'Osogna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2311, N'6705', N'Cresciano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2312, N'6707', N'Iragna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2313, N'6710', N'Biasca', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2314, N'6721', N'Ludiano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2315, N'6722', N'Corzoneso', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2316, N'6716', N'Leontica', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2317, N'6723', N'Prugiasco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2318, N'6723', N'Castro', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2319, N'6724', N'Ponto Valentino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2320, N'6716', N'Lottigna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2321, N'6719', N'Aquila', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2322, N'6720', N'Campo (Blenio)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2323, N'6721', N'Motto (Blenio)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2324, N'6713', N'Malvaglia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2325, N'6714', N'Semione', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2326, N'6715', N'Dongio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2327, N'6716', N'Acquarossa', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2328, N'6717', N'Dangio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2329, N'6717', N'Torre', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2330, N'6718', N'Olivone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2331, N'6718', N'Camperio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2332, N'6742', N'Pollegio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2333, N'6743', N'Bodio TI', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2334, N'6745', N'Giornico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2335, N'6746', N'Lavorgo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2336, N'6746', N'Calonico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2337, N'6746', N'Nivo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2338, N'6747', N'Chironico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2339, N'6760', N'Faido', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2340, N'6760', N'Molare', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2341, N'6760', N'Calpiogna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2342, N'6760', N'Campello', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2343, N'6760', N'Carì', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2344, N'6772', N'Rodi-Fiesso', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2345, N'6775', N'Ambrì', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2346, N'6776', N'Piotta', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2347, N'6777', N'Quinto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2348, N'6777', N'Varenzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2349, N'6780', N'Airolo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2350, N'6781', N'Villa Bedretto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2351, N'6780', N'Madrano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2352, N'6781', N'Bedretto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2353, N'6744', N'Personico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2354, N'6748', N'Anzonico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2355, N'6749', N'Sobrio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2356, N'6749', N'Cavagnago', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2357, N'6763', N'Mairengo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2358, N'6763', N'Osco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2359, N'6760', N'Rossura', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2360, N'6764', N'Chiggiogna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2361, N'6773', N'Prato (Leventina)', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2362, N'6774', N'Dalpe', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2363, N'6802', N'Rivera', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2364, N'6804', N'Bironico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2365, N'6803', N'Camignolo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2366, N'6807', N'Taverne', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2367, N'6808', N'Torricella', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2368, N'6815', N'Melide', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2369, N'6816', N'Bissone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2370, N'6817', N'Maroggia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2371, N'6818', N'Melano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2372, N'6822', N'Arogno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2373, N'6825', N'Capolago', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2374, N'6826', N'Riva San Vitale', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2375, N'6828', N'Balerna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2376, N'6830', N'Chiasso', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2377, N'6839', N'Sagno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2378, N'6837', N'Caneggio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2379, N'6837', N'Bruzella', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2380, N'6838', N'Cabbio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2381, N'6838', N'Muggio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2382, N'6838', N'Scudellate', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2383, N'6832', N'Pedrinate', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2384, N'6832', N'Seseglio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2385, N'6833', N'Vacallo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2386, N'6834', N'Morbio Inferiore', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2387, N'6835', N'Morbio Superiore', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2388, N'6809', N'Medeglia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2389, N'6810', N'Isone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2390, N'6805', N'Mezzovico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2391, N'6806', N'Sigirino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2392, N'6821', N'Rovio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2393, N'6823', N'Pugerna', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2394, N'6850', N'Mendrisio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2395, N'6875', N'Monte', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2396, N'6875', N'Casima', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2397, N'6873', N'Corteglia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2398, N'6852', N'Genestrerio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2399, N'6853', N'Ligornetto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2400, N'6854', N'S. Pietro', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2401, N'6855', N'Stabio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2402, N'6862', N'Rancate', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2403, N'6863', N'Besazio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2404, N'6864', N'Arzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2405, N'6865', N'Tremona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2406, N'6866', N'Meride', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2407, N'6867', N'Serpiano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2408, N'6872', N'Salorino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2409, N'6872', N'Somazzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2410, N'6874', N'Castel San Pietro', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2411, N'6877', N'Coldrerio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2412, N'6883', N'Novazzano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2413, N'6900', N'Lugano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2414, N'6900', N'Massagno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2415, N'6913', N'Carabbia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2416, N'6915', N'Pambio-Noranco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2417, N'6916', N'Grancia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2418, N'6917', N'Barbengo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2419, N'6919', N'Carabietta', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2420, N'6921', N'Vico Morcote', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2421, N'6928', N'Manno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2422, N'6929', N'Gravesano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2423, N'6930', N'Bedano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2424, N'6939', N'Arosio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2425, N'6939', N'Mugena', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2426, N'6938', N'Vezio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2427, N'6937', N'Breno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2428, N'6938', N'Fescoggia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2429, N'6949', N'Comano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2430, N'6979', N'Brè sopra Lugano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2431, N'6827', N'Brusino Arsizio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2432, N'6912', N'Pazzallo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2433, N'6914', N'Carona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2434, N'6918', N'Figino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2435, N'6922', N'Morcote', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2436, N'6924', N'Sorengo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2437, N'6925', N'Gentilino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2438, N'6926', N'Montagnola', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2439, N'6927', N'Agra', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2440, N'6932', N'Breganzona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2441, N'6933', N'Muzzano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2442, N'6934', N'Bioggio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2443, N'6935', N'Bosco Luganese', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2444, N'6936', N'Cademario', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2445, N'6942', N'Savosa', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2446, N'6943', N'Vezia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2447, N'6948', N'Porza', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2448, N'6950', N'Tesserete', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2449, N'6944', N'Cureglia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2450, N'6945', N'Origlio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2451, N'6946', N'Ponte Capriasca', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2452, N'6947', N'Vaglio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2453, N'6954', N'Sala Capriasca', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2454, N'6954', N'Bigorio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2455, N'6953', N'Lugaggia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2456, N'6951', N'Insone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2457, N'6951', N'Odogno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2458, N'6956', N'Lopagno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2459, N'6957', N'Roveredo TI', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2460, N'6958', N'Bidogno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2461, N'6958', N'Corticiasca', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2462, N'6951', N'Scareglia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2463, N'6951', N'Colla', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2464, N'6951', N'Bogno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2465, N'6951', N'Cozzo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2466, N'6955', N'Cagiallo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2467, N'6955', N'Oggio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2468, N'6951', N'Signôra', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2469, N'6959', N'Cimadera', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2470, N'6959', N'Maglio di Colla', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2471, N'6959', N'Certara', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2472, N'6959', N'Curtina', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2473, N'6959', N'Piandera Paese', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2474, N'6952', N'Canobbio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2475, N'6962', N'Viganello', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2476, N'6963', N'Pregassona', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2477, N'6964', N'Davesco-Soragno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2478, N'6965', N'Cadro', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2479, N'6966', N'Villa Luganese', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2480, N'6967', N'Dino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2481, N'6968', N'Sonvico', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2482, N'6974', N'Aldesago', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2483, N'6976', N'Castagnola', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2484, N'6977', N'Ruvigliana', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2485, N'6978', N'Gandria', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2486, N'6990', N'Cassina d''Agno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2487, N'6991', N'Neggio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2488, N'6992', N'Vernate', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2489, N'6993', N'Iseo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2490, N'6994', N'Aranno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2491, N'6992', N'Cimo', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2492, N'6981', N'Bedigliora', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2493, N'6981', N'Biogno-Beride', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2494, N'6980', N'Castelrotto', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2495, N'6981', N'Bombinasco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2496, N'6981', N'Banco', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2497, N'6999', N'Astano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2498, N'6986', N'Miglieglia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2499, N'6989', N'Purasca', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2500, N'6995', N'Molinazzo di Monteggio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2501, N'6996', N'Ponte Cremenaga', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2502, N'6997', N'Sessa', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2503, N'6998', N'Termine', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2504, N'6982', N'Agno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2505, N'6983', N'Magliaso', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2506, N'6984', N'Pura', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2507, N'6986', N'Curio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2508, N'6986', N'Novaggio', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2509, N'6987', N'Caslano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2510, N'6988', N'Ponte Tresa', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2511, N'7000', N'Chur', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2512, N'7012', N'Felsberg', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2513, N'7013', N'Domat/Ems', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2514, N'7015', N'Tamins', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2515, N'7017', N'Flims Dorf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2516, N'7018', N'Flims Waldhaus', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2517, N'7023', N'Haldenstein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2518, N'7026', N'Maladers', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2519, N'7031', N'Laax GR', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2520, N'7032', N'Laax GR 2', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2521, N'7050', N'Arosa', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2522, N'7062', N'Passugg', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2523, N'7063', N'Praden', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2524, N'7064', N'Tschiertschen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2525, N'7074', N'Malix', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2526, N'7075', N'Churwalden', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2527, N'7076', N'Parpan', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2528, N'7077', N'Valbella', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2529, N'7078', N'Lenzerheide/Lai', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2530, N'7082', N'Vaz/Obervaz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2531, N'7083', N'Lantsch/Lenz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2532, N'7084', N'Brienz/Brinzauls GR', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2533, N'7014', N'Trin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2534, N'7016', N'Trin Mulin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2535, N'7019', N'Fidaz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2536, N'7027', N'Lüen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2537, N'7027', N'Castiel', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2538, N'7028', N'St. Peter', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2539, N'7028', N'Pagig', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2540, N'7056', N'Molinis', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2541, N'7029', N'Peist', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2542, N'7057', N'Langwies', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2543, N'7058', N'Litzirüti', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2544, N'7104', N'Versam', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2545, N'7104', N'Arezen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2546, N'7106', N'Tenna', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2547, N'7107', N'Safien Platz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2548, N'7109', N'Thalkirch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2549, N'7122', N'Valendas', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2550, N'7122', N'Carrera', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2551, N'7126', N'Castrisch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2552, N'7130', N'Ilanz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2553, N'7154', N'Ruschein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2554, N'7155', N'Ladir', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2555, N'7151', N'Schluein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2556, N'7153', N'Falera', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2557, N'7152', N'Sagogn', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2558, N'7127', N'Sevgein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2559, N'7128', N'Riein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2560, N'7111', N'Pitasch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2561, N'7112', N'Duvin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2562, N'7113', N'Camuns', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2563, N'7114', N'Uors (Lumnezia)', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2564, N'7115', N'Surcasti', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2565, N'7116', N'Tersnaus', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2566, N'7141', N'Luven', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2567, N'7142', N'Cumbel', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2568, N'7143', N'Morissen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2569, N'7144', N'Vella', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2570, N'7145', N'Degen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2571, N'7146', N'Vattiz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2572, N'7147', N'Vignogn', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2573, N'7148', N'Lumbrein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2574, N'7148', N'Surin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2575, N'7149', N'Vrin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2576, N'7137', N'Flond', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2577, N'7138', N'Surcuolm', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2578, N'7132', N'Vals', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2579, N'7133', N'Obersaxen Affeier', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2580, N'7134', N'Obersaxen Meierhof', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2581, N'7135', N'Obersaxen Giraniga', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2582, N'7136', N'Obersaxen Friggahüs', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2583, N'7156', N'Pigniu', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2584, N'7156', N'Rueun', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2585, N'7157', N'Siat', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2586, N'7158', N'Waltensburg/Vuorz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2587, N'7159', N'Andiast', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2588, N'7162', N'Tavanasa', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2589, N'7163', N'Danis', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2590, N'7164', N'Dardin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2591, N'7165', N'Breil/Brigels', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2592, N'7166', N'Trun', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2593, N'7168', N'Schlans', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2594, N'7167', N'Zignau', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2595, N'7172', N'Rabius', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2596, N'7175', N'Sumvitg', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2597, N'7174', N'S. Benedetg', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2598, N'7180', N'Disentis/Mustér', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2599, N'7182', N'Cavardiras', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2600, N'7183', N'Mumpé Medel', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2601, N'7184', N'Curaglia', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2602, N'7185', N'Platta', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2603, N'7186', N'Segnas', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2604, N'7187', N'Camischolas', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2605, N'7189', N'Rueras', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2606, N'7188', N'Sedrun', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2607, N'7173', N'Surrein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2608, N'7176', N'Cumpadials', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2609, N'7201', N'Untervaz Bahnhof', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2610, N'7203', N'Trimmis', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2611, N'7202', N'Says', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2612, N'7204', N'Untervaz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2613, N'7205', N'Zizers', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2614, N'7206', N'Igis', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2615, N'7208', N'Malans GR', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2616, N'7212', N'Seewis Dorf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2617, N'7213', N'Valzeina', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2618, N'7214', N'Grüsch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2619, N'7215', N'Fanas', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2620, N'7220', N'Schiers', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2621, N'7228', N'Schuders', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2622, N'7226', N'Stels', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2623, N'7222', N'Mittellunden', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2624, N'7223', N'Buchen im Prättigau', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2625, N'7224', N'Putz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2626, N'7228', N'Pusserein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2627, N'7231', N'Pragg-Jenaz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2628, N'7232', N'Furna', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2629, N'7233', N'Jenaz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2630, N'7235', N'Fideris', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2631, N'7240', N'Küblis', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2632, N'7242', N'Luzein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2633, N'7243', N'Pany', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2634, N'7244', N'Gadenstätt', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2635, N'7245', N'Ascharina', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2636, N'7246', N'St. Antönien', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2637, N'7241', N'Conters im Prättigau', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2638, N'7247', N'Saas im Prättigau', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2639, N'7249', N'Serneus', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2640, N'7250', N'Klosters', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2641, N'7252', N'Klosters Dorf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2642, N'7260', N'Davos Dorf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2643, N'7265', N'Davos Wolfgang', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2644, N'7270', N'Davos Platz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2645, N'7272', N'Davos Clavadel', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2646, N'7276', N'Davos Frauenkirch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2647, N'7277', N'Davos Glaris', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2648, N'7278', N'Davos Monstein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2649, N'7302', N'Landquart', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2650, N'7303', N'Mastrils', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2651, N'7304', N'Maienfeld', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2652, N'7306', N'Fläsch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2653, N'7307', N'Jenins', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2654, N'7310', N'Bad Ragaz', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2655, N'7317', N'Valens', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2656, N'7317', N'Vasön', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2657, N'7314', N'Vadura', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2658, N'7315', N'Vättis', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2659, N'7312', N'Pfäfers', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2660, N'7313', N'St. Margrethenberg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2661, N'7320', N'Sargans', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2662, N'7325', N'Schwendi im Weisstannental', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2663, N'7326', N'Weisstannen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2664, N'7323', N'Wangs', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2665, N'7324', N'Vilters', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2666, N'7402', N'Bonaduz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2667, N'7403', N'Rhäzüns', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2668, N'7404', N'Feldis/Veulden', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2669, N'7405', N'Rothenbrunnen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2670, N'7408', N'Cazis', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2671, N'7408', N'Realta', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2672, N'7411', N'Sils im Domleschg', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2673, N'7412', N'Scharans', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2674, N'7413', N'Fürstenaubruck', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2675, N'7414', N'Fürstenau', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2676, N'7415', N'Rodels', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2677, N'7416', N'Almens', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2678, N'7417', N'Paspels', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2679, N'7407', N'Trans', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2680, N'7418', N'Tumegl/Tomils', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2681, N'7419', N'Scheid', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2682, N'7430', N'Thusis', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2683, N'7425', N'Masein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2684, N'7426', N'Flerden', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2685, N'7427', N'Urmein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2686, N'7428', N'Tschappina', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2687, N'7428', N'Glaspass', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2688, N'7421', N'Summaprada', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2689, N'7422', N'Tartar', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2690, N'7423', N'Sarn', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2691, N'7424', N'Präz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2692, N'7424', N'Dalin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2693, N'7431', N'Mutten', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2694, N'7430', N'Rongellen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2695, N'7432', N'Zillis', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2696, N'7433', N'Donat', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2697, N'7433', N'Farden', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2698, N'7433', N'Mathon', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2699, N'7433', N'Wergenstein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2700, N'7433', N'Lohn GR', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2701, N'7434', N'Sufers', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2702, N'7435', N'Splügen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2703, N'7436', N'Medels im Rheinwald', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2704, N'7437', N'Nufenen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2705, N'7438', N'Hinterrhein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2706, N'7440', N'Andeer', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2707, N'7442', N'Clugin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2708, N'7443', N'Pignia', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2709, N'7444', N'Ausserferrera', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2710, N'7445', N'Innerferrera', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2711, N'7446', N'Campsut-Cröt', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2712, N'7447', N'Cresta (Avers)', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2713, N'7447', N'Am Bach (Avers)', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2714, N'7448', N'Juf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2715, N'7450', N'Tiefencastel', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2716, N'7458', N'Mon', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2717, N'7459', N'Stierva', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2718, N'7451', N'Alvaschein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2719, N'7452', N'Cunter', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2720, N'7453', N'Tinizong', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2721, N'7454', N'Rona', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2722, N'7455', N'Mulegns', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2723, N'7456', N'Sur', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2724, N'7457', N'Bivio', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2725, N'7460', N'Savognin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2726, N'7462', N'Salouf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2727, N'7463', N'Riom', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2728, N'7464', N'Parsonz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2729, N'7472', N'Surava', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2730, N'7473', N'Alvaneu Bad', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2731, N'7477', N'Filisur', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2732, N'7482', N'Bergün/Bravuogn', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2733, N'7482', N'Stugl/Stuls', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2734, N'7484', N'Latsch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2735, N'7482', N'Preda', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2736, N'7492', N'Alvaneu Dorf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2737, N'7493', N'Schmitten (Albula)', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2738, N'7494', N'Davos Wiesen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2739, N'7500', N'St. Moritz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2740, N'7502', N'Bever', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2741, N'7503', N'Samedan', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2742, N'7504', N'Pontresina', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2743, N'7505', N'Celerina/Schlarigna', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2744, N'7512', N'Champfèr', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2745, N'7513', N'Silvaplana', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2746, N'7514', N'Sils/Segl Maria', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2747, N'7514', N'Fex', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2748, N'7515', N'Sils/Segl Baselgia', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2749, N'7516', N'Maloja', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2750, N'7517', N'Plaun da Lej', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2751, N'7522', N'La Punt-Chamues-ch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2752, N'7523', N'Madulain', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2753, N'7524', N'Zuoz', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2754, N'7525', N'S-chanf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2755, N'7526', N'Cinuos-chel', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2756, N'7527', N'Brail', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2757, N'7530', N'Zernez', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2758, N'7532', N'Tschierv', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2759, N'7533', N'Fuldera', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2760, N'7534', N'Lü', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2761, N'7535', N'Valchava', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2762, N'7536', N'Sta. Maria Val Müstair', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2763, N'7537', N'Müstair', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2764, N'7542', N'Susch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2765, N'7543', N'Lavin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2766, N'7545', N'Guarda', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2767, N'7546', N'Ardez', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2768, N'7550', N'Scuol', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2769, N'7551', N'Ftan', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2770, N'7552', N'Vulpera', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2771, N'7553', N'Tarasp', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2772, N'7554', N'Sent', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2773, N'7554', N'Crusch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2774, N'7556', N'Ramosch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2775, N'7557', N'Vnà', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2776, N'7558', N'Strada', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2777, N'7559', N'Tschlin', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2778, N'7560', N'Martina', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2779, N'7562', N'Samnaun-Compatsch', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2780, N'7563', N'Samnaun Dorf', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2781, N'7602', N'Casaccia', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2782, N'7603', N'Vicosoprano', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2783, N'7604', N'Borgonovo', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2784, N'7605', N'Stampa', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2785, N'7606', N'Promontogno', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2786, N'7610', N'Soglio', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2787, N'7608', N'Castasegna', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2788, N'7742', N'Poschiavo', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2789, N'7742', N'Sfazù', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2790, N'7742', N'La Rösa', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2791, N'7743', N'Brusio', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2792, N'7747', N'Viano', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2793, N'7744', N'Campocologno', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2794, N'7710', N'Ospizio Bernina', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2795, N'7741', N'S. Carlo (Poschiavo)', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2796, N'7710', N'Alp Grüm', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2797, N'7745', N'Li Curt', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2798, N'7746', N'Le Prese', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2799, N'7748', N'Campascio', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2800, N'8000', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2801, N'8001', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2802, N'8002', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2803, N'8003', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2804, N'8004', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2805, N'8005', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2806, N'8006', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2807, N'8008', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2808, N'8032', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2809, N'8037', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2810, N'8038', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2811, N'8041', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2812, N'8044', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2813, N'8045', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2814, N'8046', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2815, N'8047', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2816, N'8048', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2817, N'8049', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2818, N'8050', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2819, N'8051', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2820, N'8052', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2821, N'8053', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2822, N'8055', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2823, N'8057', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2824, N'8064', N'Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2825, N'8102', N'Oberengstringen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2826, N'8103', N'Unterengstringen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2827, N'8104', N'Weiningen ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2828, N'8105', N'Regensdorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2829, N'8105', N'Watt', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2830, N'8107', N'Buchs ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2831, N'8108', N'Dällikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2832, N'8112', N'Otelfingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2833, N'8113', N'Boppelsen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2834, N'8114', N'Dänikon ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2835, N'8115', N'Hüttikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2836, N'5436', N'Würenlos', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2837, N'8117', N'Fällanden', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2838, N'8121', N'Benglen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2839, N'8122', N'Binz', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2840, N'8123', N'Ebmatingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2841, N'8124', N'Maur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2842, N'8125', N'Zollikerberg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2843, N'8126', N'Zumikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2844, N'8127', N'Forch', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2845, N'8132', N'Hinteregg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2846, N'8132', N'Egg b. Zürich', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2847, N'8133', N'Esslingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2848, N'8134', N'Adliswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2849, N'8135', N'Langnau am Albis', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2850, N'8136', N'Gattikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2851, N'8143', N'Uetliberg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2852, N'8142', N'Uitikon Waldegg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2853, N'8143', N'Stallikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2854, N'8152', N'Glattbrugg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2855, N'8152', N'Opfikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2856, N'8153', N'Rümlang', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2857, N'8154', N'Oberglatt ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2858, N'8155', N'Niederhasli', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2859, N'8156', N'Oberhasli', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2860, N'8157', N'Dielsdorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2861, N'8158', N'Regensberg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2862, N'8162', N'Steinmaur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2863, N'8164', N'Bachs', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2864, N'8165', N'Schöfflisdorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2865, N'8166', N'Niederweningen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2866, N'8172', N'Niederglatt ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2867, N'8173', N'Neerach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2868, N'8174', N'Stadel b. Niederglatt', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2869, N'8175', N'Windlach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2870, N'8180', N'Bülach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2871, N'8181', N'Höri', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2872, N'8182', N'Hochfelden', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2873, N'8184', N'Bachenbülach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2874, N'8185', N'Winkel', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2875, N'8192', N'Glattfelden', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2876, N'8193', N'Eglisau', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2877, N'8194', N'Hüntwangen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2878, N'8195', N'Wasterkingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2879, N'8196', N'Wil ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2880, N'8197', N'Rafz', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2881, N'8200', N'Schaffhausen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2882, N'8203', N'Schaffhausen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2883, N'8207', N'Schaffhausen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2884, N'8208', N'Schaffhausen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2885, N'8219', N'Trasadingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2886, N'8228', N'Beggingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2887, N'8231', N'Hemmental', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2888, N'8234', N'Stetten SH', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2889, N'8235', N'Lohn SH', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2890, N'8236', N'Opfertshofen SH', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2891, N'8236', N'Büttenhardt', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2892, N'8242', N'Bibern SH', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2893, N'8242', N'Hofen SH', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2894, N'8243', N'Altdorf SH', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2895, N'8239', N'Dörflingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2896, N'8212', N'Neuhausen am Rheinfall', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2897, N'8213', N'Neunkirch', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2898, N'8214', N'Gächlingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2899, N'8215', N'Hallau', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2900, N'8216', N'Oberhallau', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2901, N'8217', N'Wilchingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2902, N'8218', N'Osterfingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2903, N'8222', N'Beringen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2904, N'8223', N'Guntmadingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2905, N'8224', N'Löhningen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2906, N'8225', N'Siblingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2907, N'8226', N'Schleitheim', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2908, N'8232', N'Merishausen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2909, N'8233', N'Bargen SH', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2910, N'8240', N'Thayngen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2911, N'8241', N'Barzheim', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2912, N'8245', N'Feuerthalen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2913, N'8246', N'Langwiesen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2914, N'8247', N'Flurlingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2915, N'8252', N'Schlatt TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2916, N'8254', N'Basadingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2917, N'8259', N'Kaltenbach', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2918, N'8253', N'Diessenhofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2919, N'8255', N'Schlattingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2920, N'8259', N'Etzwilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2921, N'8260', N'Stein am Rhein', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2922, N'8259', N'Wagenhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2923, N'8261', N'Hemishofen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2924, N'8262', N'Ramsen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2925, N'8263', N'Buch SH', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2926, N'8264', N'Eschenz', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2927, N'8265', N'Mammern', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2928, N'8266', N'Steckborn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2929, N'8267', N'Berlingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2930, N'8268', N'Mannenbach-Salenstein', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2931, N'8272', N'Ermatingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2932, N'8273', N'Triboltingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2933, N'8274', N'Tägerwilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2934, N'8280', N'Kreuzlingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2935, N'8302', N'Kloten', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2936, N'8303', N'Bassersdorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2937, N'8304', N'Wallisellen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2938, N'8305', N'Dietlikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2939, N'8306', N'Brüttisellen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2940, N'8307', N'Effretikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2941, N'8315', N'Lindau', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2942, N'8308', N'Illnau', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2943, N'8308', N'Agasul', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2944, N'8309', N'Nürensdorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2945, N'8310', N'Kemptthal', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2946, N'8312', N'Winterberg ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2947, N'8311', N'Brütten', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2948, N'8307', N'Ottikon b. Kemptthal', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2949, N'8314', N'Kyburg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2950, N'8320', N'Fehraltorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2951, N'8489', N'Wildberg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2952, N'8322', N'Madetswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2953, N'8330', N'Pfäffikon ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2954, N'8331', N'Auslikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2955, N'8332', N'Russikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2956, N'8335', N'Hittnau', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2957, N'8340', N'Hinwil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2958, N'8342', N'Wernetshausen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2959, N'8344', N'Bäretswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2960, N'8345', N'Adetswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2961, N'8352', N'Elsau', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2962, N'8353', N'Elgg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2963, N'8354', N'Hofstetten ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2964, N'8355', N'Aadorf', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2965, N'8356', N'Ettenhausen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2966, N'8357', N'Guntershausen b. Aadorf', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2967, N'8360', N'Eschlikon TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2968, N'8362', N'Balterswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2969, N'8363', N'Bichelsee', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2970, N'8370', N'Sirnach', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2971, N'8372', N'Wiezikon b. Sirnach', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2972, N'8374', N'Oberwangen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2973, N'8374', N'Dussnang', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2974, N'8376', N'Fischingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2975, N'8376', N'Au TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2976, N'8400', N'Winterthur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2977, N'8404', N'Winterthur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2978, N'8405', N'Winterthur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2979, N'8406', N'Winterthur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2980, N'8408', N'Winterthur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2981, N'8409', N'Winterthur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2982, N'8412', N'Aesch (Neftenbach)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2983, N'8413', N'Neftenbach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2984, N'8414', N'Buch am Irchel', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2985, N'8415', N'Berg am Irchel', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2986, N'8415', N'Gräslikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2987, N'8416', N'Flaach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2988, N'8418', N'Schlatt b. Winterthur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2989, N'8422', N'Pfungen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2990, N'8421', N'Dättlikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2991, N'8424', N'Embrach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2992, N'8425', N'Oberembrach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2993, N'8426', N'Lufingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2994, N'8428', N'Teufen ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2995, N'8192', N'Zweidlen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2996, N'8187', N'Weiach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2997, N'5466', N'Kaiserstuhl AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2998, N'5467', N'Fisibach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (2999, N'5332', N'Rekingen AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3000, N'5330', N'Bad Zurzach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3001, N'5323', N'Rietheim', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3002, N'5464', N'Rümikon AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3003, N'5465', N'Mellikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3004, N'5463', N'Wislikofen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3005, N'5462', N'Siglistorf', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3006, N'5333', N'Baldingen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3007, N'5334', N'Böbikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3008, N'8442', N'Hettlingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3009, N'8444', N'Henggart', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3010, N'8447', N'Dachsen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3011, N'8248', N'Uhwiesen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3012, N'8450', N'Andelfingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3013, N'8453', N'Alten', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3014, N'8451', N'Kleinandelfingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3015, N'8452', N'Adlikon b. Andelfingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3016, N'8457', N'Humlikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3017, N'8458', N'Dorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3018, N'8459', N'Volken', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3019, N'8454', N'Buchberg', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3020, N'8455', N'Rüdlingen', N'SH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3021, N'8460', N'Marthalen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3022, N'8464', N'Ellikon am Rhein', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3023, N'8461', N'Oerlingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3024, N'8465', N'Rudolfingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3025, N'8466', N'Trüllikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3026, N'8462', N'Rheinau', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3027, N'8463', N'Benken ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3028, N'8472', N'Seuzach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3029, N'8404', N'Reutlingen (Winterthur)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3030, N'8474', N'Dinhard', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3031, N'8475', N'Ossingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3032, N'8476', N'Unterstammheim', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3033, N'8477', N'Oberstammheim', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3034, N'8471', N'Rutschwil (Dägerlen)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3035, N'8478', N'Thalheim an der Thur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3036, N'8479', N'Altikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3037, N'8467', N'Truttikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3038, N'8468', N'Guntalingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3039, N'8468', N'Waltalingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3040, N'8482', N'Sennhof (Winterthur)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3041, N'8483', N'Kollbrunn', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3042, N'8484', N'Weisslingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3043, N'8484', N'Neschwil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3044, N'8484', N'Theilingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3045, N'8486', N'Rikon im Tösstal', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3046, N'8487', N'Rämismühle', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3047, N'8487', N'Zell ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3048, N'8488', N'Turbenthal', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3049, N'8492', N'Wila', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3050, N'8493', N'Saland', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3051, N'8494', N'Bauma', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3052, N'8496', N'Steg im Tösstal', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3053, N'8497', N'Fischenthal', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3054, N'8498', N'Gibswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3055, N'8495', N'Schmidrüti', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3056, N'8499', N'Sternenberg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3057, N'8500', N'Frauenfeld', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3058, N'8500', N'Gerlikon', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3059, N'8505', N'Pfyn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3060, N'8506', N'Lanzenneunforn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3061, N'8507', N'Hörhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3062, N'8508', N'Homburg', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3063, N'8512', N'Thundorf', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3064, N'8512', N'Lustdorf', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3065, N'8514', N'Amlikon-Bissegg', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3066, N'8522', N'Häuslenen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3067, N'8523', N'Hagenbuch ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3068, N'8524', N'Uesslingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3069, N'8525', N'Niederneunforn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3070, N'8526', N'Oberneunforn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3071, N'8532', N'Warth', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3072, N'8524', N'Buch b. Frauenfeld', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3073, N'8532', N'Weiningen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3074, N'8535', N'Herdern', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3075, N'8536', N'Hüttwilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3076, N'8537', N'Nussbaumen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3077, N'8542', N'Wiesendangen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3078, N'8404', N'Stadel (Winterthur)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3079, N'8545', N'Rickenbach ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3080, N'8544', N'Attikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3081, N'8546', N'Islikon', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3082, N'8547', N'Gachnang', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3083, N'8548', N'Ellikon an der Thur', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3084, N'8552', N'Felben-Wellhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3085, N'8554', N'Müllheim-Wigoltingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3086, N'8554', N'Bonau', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3087, N'8555', N'Müllheim Dorf', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3088, N'8556', N'Wigoltingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3089, N'8564', N'Lipperswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3090, N'8558', N'Raperswilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3091, N'8269', N'Fruthwilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3092, N'8560', N'Märstetten', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3093, N'8561', N'Ottoberg', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3094, N'8565', N'Hugelshofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3095, N'8566', N'Dotnacht', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3096, N'8566', N'Neuwilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3097, N'8564', N'Engwilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3098, N'8564', N'Wäldi', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3099, N'8570', N'Weinfelden', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3100, N'8572', N'Berg TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3101, N'8573', N'Siegershausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3102, N'8574', N'Illighausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3103, N'8575', N'Bürglen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3104, N'8576', N'Mauren TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3105, N'8577', N'Schönholzerswilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3106, N'9217', N'Neukirch an der Thur', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3107, N'8580', N'Amriswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3108, N'8580', N'Sommeri', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3109, N'8582', N'Dozwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3110, N'8580', N'Hagenwil b. Amriswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3111, N'8581', N'Schocherswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3112, N'8588', N'Zihlschlacht', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3113, N'8589', N'Sitterdorf', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3114, N'8583', N'Sulgen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3115, N'8583', N'Götighofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3116, N'8583', N'Donzhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3117, N'8584', N'Leimbach TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3118, N'8584', N'Opfershofen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3119, N'8585', N'Mattwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3120, N'8585', N'Happerswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3121, N'8585', N'Langrickenbach', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3122, N'8585', N'Zuben', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3123, N'8586', N'Erlen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3124, N'8586', N'Andwil TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3125, N'8586', N'Kümmertshausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3126, N'8586', N'Riedt b. Erlen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3127, N'8587', N'Oberaach', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3128, N'8590', N'Romanshorn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3129, N'8599', N'Salmsach', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3130, N'8592', N'Uttwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3131, N'8593', N'Kesswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3132, N'8594', N'Güttingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3133, N'8595', N'Altnau', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3134, N'8596', N'Scherzingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3135, N'8597', N'Landschlacht', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3136, N'8598', N'Bottighofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3137, N'8600', N'Dübendorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3138, N'8602', N'Wangen b. Dübendorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3139, N'8603', N'Schwerzenbach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3140, N'8604', N'Volketswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3141, N'8605', N'Gutenswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3142, N'8606', N'Nänikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3143, N'8606', N'Greifensee', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3144, N'8607', N'Aathal-Seegräben', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3145, N'8608', N'Bubikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3146, N'8610', N'Uster', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3147, N'8614', N'Bertschikon (Gossau ZH)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3148, N'8615', N'Wermatswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3149, N'8616', N'Riedikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3150, N'8617', N'Mönchaltorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3151, N'8618', N'Oetwil am See', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3152, N'8620', N'Wetzikon ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3153, N'8623', N'Wetzikon ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3154, N'8624', N'Grüt (Gossau ZH)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3155, N'8625', N'Gossau ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3156, N'8626', N'Ottikon (Gossau ZH)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3157, N'8627', N'Grüningen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3158, N'8630', N'Rüti ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3159, N'8632', N'Tann', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3160, N'8633', N'Wolfhausen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3161, N'8634', N'Hombrechtikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3162, N'8635', N'Dürnten', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3163, N'8636', N'Wald ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3164, N'8637', N'Laupen ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3165, N'8638', N'Goldingen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3166, N'8640', N'Rapperswil SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3167, N'8645', N'Jona', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3168, N'8646', N'Wagen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3169, N'8700', N'Küsnacht ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3170, N'8702', N'Zollikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3171, N'8703', N'Erlenbach ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3172, N'8704', N'Herrliberg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3173, N'8706', N'Meilen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3174, N'8707', N'Uetikon am See', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3175, N'8708', N'Männedorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3176, N'8712', N'Stäfa', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3177, N'8713', N'Uerikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3178, N'8714', N'Feldbach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3179, N'8715', N'Bollingen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3180, N'8716', N'Schmerikon', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3181, N'8717', N'Benken SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3182, N'8718', N'Schänis', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3183, N'8722', N'Kaltbrunn', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3184, N'8723', N'Rufi', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3185, N'8725', N'Ernetschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3186, N'8726', N'Ricken SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3187, N'8727', N'Walde SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3188, N'8730', N'Uznach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3189, N'8732', N'Neuhaus SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3190, N'8733', N'Eschenbach SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3191, N'8734', N'Ermenswil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3192, N'8735', N'St. Gallenkappel', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3193, N'8735', N'Rüeterswil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3194, N'8737', N'Gommiswald', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3195, N'8738', N'Uetliburg SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3196, N'8739', N'Rieden SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3197, N'8750', N'Glarus', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3198, N'8750', N'Riedern', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3199, N'8750', N'Klöntal', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3200, N'8751', N'Urnerboden', N'UR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3201, N'8752', N'Näfels', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3202, N'8753', N'Mollis', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3203, N'8754', N'Netstal', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3204, N'8755', N'Ennenda', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3205, N'8756', N'Mitlödi', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3206, N'8762', N'Schwanden GL', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3207, N'8762', N'Schwändi b. Schwanden', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3208, N'8762', N'Sool', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3209, N'8765', N'Engi', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3210, N'8766', N'Matt', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3211, N'8767', N'Elm', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3212, N'8772', N'Nidfurn', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3213, N'8773', N'Haslen GL', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3214, N'8775', N'Luchsingen', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3215, N'8775', N'Hätzingen', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3216, N'8777', N'Diesbach GL', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3217, N'8782', N'Rüti GL', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3218, N'8783', N'Linthal', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3219, N'8784', N'Braunwald', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3220, N'8800', N'Thalwil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3221, N'8802', N'Kilchberg ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3222, N'8803', N'Rüschlikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3223, N'8804', N'Au ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3224, N'8805', N'Richterswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3225, N'8806', N'Bäch SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3226, N'8807', N'Freienbach', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3227, N'8808', N'Pfäffikon SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3228, N'8810', N'Horgen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3229, N'8815', N'Horgenberg', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3230, N'8816', N'Hirzel', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3231, N'8820', N'Wädenswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3232, N'8824', N'Schönenberg ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3233, N'8825', N'Hütten', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3234, N'8832', N'Wollerau', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3235, N'8833', N'Samstagern', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3236, N'8834', N'Schindellegi', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3237, N'8835', N'Feusisberg', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3238, N'8836', N'Bennau', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3239, N'8840', N'Einsiedeln', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3240, N'8840', N'Trachslau', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3241, N'8849', N'Alpthal', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3242, N'8846', N'Willerzell', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3243, N'8847', N'Egg SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3244, N'8841', N'Gross', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3245, N'8844', N'Euthal', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3246, N'8845', N'Studen SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3247, N'8842', N'Unteriberg', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3248, N'8843', N'Oberiberg', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3249, N'8852', N'Altendorf', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3250, N'8853', N'Lachen SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3251, N'8854', N'Siebnen', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3252, N'8854', N'Galgenen', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3253, N'8855', N'Wangen SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3254, N'8856', N'Tuggen', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3255, N'8857', N'Vorderthal', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3256, N'8858', N'Innerthal', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3257, N'8862', N'Schübelbach', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3258, N'8863', N'Buttikon SZ', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3259, N'8864', N'Reichenburg', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3260, N'8865', N'Bilten', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3261, N'8866', N'Ziegelbrücke', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3262, N'8867', N'Niederurnen', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3263, N'8868', N'Oberurnen', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3264, N'8872', N'Weesen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3265, N'8873', N'Amden', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3266, N'8874', N'Mühlehorn', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3267, N'8758', N'Obstalden', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3268, N'8757', N'Filzbach', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3269, N'8877', N'Murg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3270, N'8878', N'Quinten', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3271, N'8880', N'Walenstadt', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3272, N'8881', N'Walenstadtberg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3273, N'8881', N'Knoblisbühl', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3274, N'8881', N'Tscherlach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3275, N'8882', N'Unterterzen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3276, N'8883', N'Quarten', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3277, N'8884', N'Oberterzen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3278, N'8885', N'Mols', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3279, N'8887', N'Mels', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3280, N'8886', N'Mädris-Vermol', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3281, N'8889', N'Plons', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3282, N'8888', N'Heiligkreuz (Mels)', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3283, N'8890', N'Flums', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3284, N'8892', N'Berschis', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3285, N'8893', N'Flums Hochwiese', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3286, N'8894', N'Flumserberg Saxli', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3287, N'8895', N'Flumserberg Portels', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3288, N'8896', N'Flumserberg Bergheim', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3289, N'8897', N'Flumserberg Tannenheim', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3290, N'8898', N'Flumserberg Tannenbodenalp', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3291, N'8902', N'Urdorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3292, N'8903', N'Birmensdorf ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3293, N'8904', N'Aesch ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3294, N'8906', N'Bonstetten', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3295, N'8907', N'Wettswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3296, N'8908', N'Hedingen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3297, N'8910', N'Affoltern am Albis', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3298, N'8909', N'Zwillikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3299, N'8911', N'Rifferswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3300, N'8912', N'Obfelden', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3301, N'8913', N'Ottenbach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3302, N'8914', N'Aeugst am Albis', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3303, N'8914', N'Aeugstertal', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3304, N'8915', N'Hausen am Albis', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3305, N'8916', N'Jonen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3306, N'8917', N'Oberlunkhofen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3307, N'8918', N'Unterlunkhofen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3308, N'8919', N'Rottenschwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3309, N'8925', N'Ebertswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3310, N'8926', N'Kappel am Albis', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3311, N'8932', N'Mettmenstetten', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3312, N'8933', N'Maschwanden', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3313, N'8934', N'Knonau', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3314, N'8942', N'Oberrieden', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3315, N'8135', N'Sihlbrugg Station', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3316, N'6340', N'Sihlbrugg', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3317, N'8951', N'Fahrweid', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3318, N'8952', N'Schlieren', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3319, N'8953', N'Dietikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3320, N'8954', N'Geroldswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3321, N'8955', N'Oetwil an der Limmat', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3322, N'8956', N'Killwangen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3323, N'8957', N'Spreitenbach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3324, N'8962', N'Bergdietikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3325, N'8964', N'Rudolfstetten', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3326, N'8965', N'Berikon', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3327, N'8966', N'Oberwil-Lieli', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3328, N'8967', N'Widen', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3329, N'9000', N'St. Gallen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3330, N'9008', N'St. Gallen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3331, N'9010', N'St. Gallen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3332, N'9011', N'St. Gallen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3333, N'9012', N'St. Gallen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3334, N'9014', N'St. Gallen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3335, N'9015', N'St. Gallen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3336, N'9016', N'St. Gallen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3337, N'9030', N'Abtwil SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3338, N'9032', N'Engelburg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3339, N'9033', N'Untereggen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3340, N'9034', N'Eggersriet', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3341, N'9035', N'Grub AR', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3342, N'9036', N'Grub SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3343, N'9037', N'Speicherschwendi', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3344, N'9038', N'Rehetobel', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3345, N'9042', N'Speicher', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3346, N'9043', N'Trogen', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3347, N'9044', N'Wald AR', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3348, N'9050', N'Appenzell', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3349, N'9052', N'Niederteufen', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3350, N'9053', N'Teufen AR', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3351, N'9054', N'Haslen AI', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3352, N'9055', N'Bühler', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3353, N'9056', N'Gais', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3354, N'9057', N'Weissbad', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3355, N'9058', N'Brülisau', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3356, N'9062', N'Lustmühle', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3357, N'9063', N'Stein AR', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3358, N'9064', N'Hundwil', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3359, N'9100', N'Herisau', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3360, N'9103', N'Schwellbrunn', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3361, N'9104', N'Waldstatt', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3362, N'9105', N'Schönengrund', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3363, N'9107', N'Urnäsch', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3364, N'9108', N'Gonten', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3365, N'9112', N'Schachen b. Herisau', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3366, N'9113', N'Degersheim', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3367, N'9114', N'Hoffeld', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3368, N'9115', N'Dicken', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3369, N'9116', N'Wolfertswil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3370, N'9122', N'Mogelsberg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3371, N'9123', N'Nassen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3372, N'9125', N'Brunnadern', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3373, N'9126', N'Necker', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3374, N'9127', N'St. Peterzell', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3375, N'9633', N'Bächli (Hemberg)', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3376, N'9200', N'Gossau SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3377, N'9203', N'Niederwil SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3378, N'9204', N'Andwil SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3379, N'9205', N'Waldkirch', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3380, N'9212', N'Arnegg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3381, N'9213', N'Hauptwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3382, N'9216', N'Heldswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3383, N'9215', N'Schönenberg an der Thur', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3384, N'9215', N'Buhwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3385, N'9220', N'Bischofszell', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3386, N'9223', N'Schweizersholz', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3387, N'9223', N'Halden', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3388, N'9216', N'Hohentannen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3389, N'9225', N'Wilen (Gottshaus)', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3390, N'9225', N'St. Pelagiberg', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3391, N'9230', N'Flawil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3392, N'9231', N'Egg (Flawil)', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3393, N'9604', N'Oberrindal', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3394, N'9604', N'Lütisburg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3395, N'9240', N'Uzwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3396, N'9240', N'Niederglatt SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3397, N'9242', N'Oberuzwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3398, N'9248', N'Bichwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3399, N'9243', N'Jonschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3400, N'9244', N'Niederuzwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3401, N'9245', N'Oberbüren', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3402, N'9246', N'Niederbüren', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3403, N'9247', N'Henau', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3404, N'9249', N'Algetshausen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3405, N'9300', N'Wittenbach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3406, N'9304', N'Bernhardzell', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3407, N'9305', N'Berg SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3408, N'9306', N'Freidorf TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3409, N'9315', N'Winden', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3410, N'9308', N'Lömmenschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3411, N'9312', N'Häggenschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3412, N'9313', N'Muolen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3413, N'9314', N'Steinebrunn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3414, N'9315', N'Neukirch (Egnach)', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3415, N'9320', N'Arbon', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3416, N'9320', N'Frasnacht', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3417, N'9320', N'Stachen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3418, N'9322', N'Egnach', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3419, N'9323', N'Steinach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3420, N'9325', N'Roggwil TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3421, N'9326', N'Horn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3422, N'9327', N'Tübach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3423, N'9400', N'Rorschach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3424, N'9404', N'Rorschacherberg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3425, N'9402', N'Mörschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3426, N'9403', N'Goldach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3427, N'9405', N'Wienacht-Tobel', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3428, N'9410', N'Heiden', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3429, N'9411', N'Reute AR', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3430, N'9413', N'Oberegg', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3431, N'9414', N'Schachen b. Reute', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3432, N'9422', N'Staad SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3433, N'9423', N'Altenrhein', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3434, N'9424', N'Rheineck', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3435, N'9425', N'Thal', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3436, N'9426', N'Lutzenberg', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3437, N'9427', N'Wolfhalden', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3438, N'9428', N'Walzenhausen', N'AR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3439, N'9430', N'St. Margrethen SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3440, N'9434', N'Au SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3441, N'9435', N'Heerbrugg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3442, N'9436', N'Balgach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3443, N'9437', N'Marbach SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3444, N'9450', N'Lüchingen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3445, N'9442', N'Berneck', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3446, N'9443', N'Widnau', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3447, N'9444', N'Diepoldsau', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3448, N'9445', N'Rebstein', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3449, N'9450', N'Altstätten SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3450, N'9451', N'Kriessern', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3451, N'9452', N'Hinterforst', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3452, N'9453', N'Eichberg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3453, N'9462', N'Montlingen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3454, N'9463', N'Oberriet SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3455, N'9464', N'Rüthi (Rheintal)', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3456, N'9464', N'Lienz', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3457, N'9465', N'Salez', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3458, N'9466', N'Sennwald', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3459, N'9467', N'Frümsen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3460, N'9468', N'Sax', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3461, N'9469', N'Haag (Rheintal)', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3462, N'9470', N'Buchs SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3463, N'9472', N'Grabs', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3464, N'9472', N'Grabserberg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3465, N'9473', N'Gams', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3466, N'9475', N'Sevelen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3467, N'9476', N'Weite', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3468, N'9477', N'Trübbach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3469, N'9478', N'Azmoos', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3470, N'9479', N'Oberschan', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3471, N'9485', N'Nendeln', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3472, N'9486', N'Schaanwald', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3473, N'9487', N'Gamprin-Bendern', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3474, N'9488', N'Schellenberg', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3475, N'9490', N'Vaduz', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3476, N'9491', N'Ruggell', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3477, N'9492', N'Eschen', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3478, N'9493', N'Mauren FL', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3479, N'9494', N'Schaan', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3480, N'9495', N'Triesen', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3481, N'9496', N'Balzers', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3482, N'9497', N'Triesenberg', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3483, N'9500', N'Wil SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3484, N'9502', N'Braunau', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3485, N'9503', N'Stehrenberg', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3486, N'9504', N'Friltschen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3487, N'9506', N'Lommis', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3488, N'9507', N'Stettfurt', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3489, N'9508', N'Weingarten-Kalthäusern', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3490, N'9512', N'Rossrüti', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3491, N'9514', N'Wuppenau', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3492, N'9515', N'Hosenruck', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3493, N'9517', N'Mettlen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3494, N'9565', N'Rothenhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3495, N'9523', N'Züberwangen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3496, N'9524', N'Zuzwil SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3497, N'9525', N'Lenggenwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3498, N'9526', N'Zuckenriet', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3499, N'9527', N'Niederhelfenschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3500, N'9532', N'Rickenbach b. Wil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3501, N'9533', N'Kirchberg SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3502, N'9534', N'Gähwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3503, N'9535', N'Wilen b. Wil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3504, N'9536', N'Schwarzenbach SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3505, N'9542', N'Münchwilen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3506, N'9543', N'St. Margarethen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3507, N'9545', N'Wängi', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3508, N'9546', N'Tuttwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3509, N'9547', N'Wittenwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3510, N'9548', N'Matzingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3511, N'9552', N'Bronschhofen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3512, N'9553', N'Bettwiesen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3513, N'9554', N'Tägerschen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3514, N'9555', N'Tobel', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3515, N'9556', N'Affeltrangen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3516, N'9562', N'Märwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3517, N'9565', N'Schmidshof', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3518, N'9565', N'Oppikon', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3519, N'9565', N'Bussnang', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3520, N'9573', N'Littenheid', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3521, N'9601', N'Lütisburg Station', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3522, N'9602', N'Bazenheid', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3523, N'9602', N'Müselbach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3524, N'9606', N'Bütschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3525, N'9607', N'Mosnang', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3526, N'9608', N'Ganterschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3527, N'9612', N'Dreien', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3528, N'9613', N'Mühlrüti', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3529, N'9614', N'Libingen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3530, N'9615', N'Dietfurt', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3531, N'9620', N'Lichtensteig', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3532, N'9621', N'Oberhelfenschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3533, N'9622', N'Krinau', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3534, N'9630', N'Wattwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3535, N'9631', N'Ulisbach', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3536, N'9633', N'Hemberg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3537, N'9642', N'Ebnat-Kappel', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3538, N'9643', N'Krummenau', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3539, N'9650', N'Nesslau', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3540, N'9651', N'Ennetbühl', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3541, N'9655', N'Stein SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3542, N'9652', N'Neu St. Johann', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3543, N'9656', N'Alt St. Johann', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3544, N'9657', N'Unterwasser', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3545, N'9658', N'Wildhaus', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3546, N'3185', N'Schmitten FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3547, N'3113', N'Rubigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3548, N'6911', N'Campione d''Italia', N'IT')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3549, N'8238', N'Büsingen', N'DE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3550, N'1934', N'Bruson', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3551, N'3800', N'Sundlauenen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3552, N'1031', N'Mex VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3553, N'1734', N'Tentlingen', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3554, N'1029', N'Villars-Ste-Croix', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3555, N'1400', N'Cheseaux-Noréaz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3556, N'3044', N'Innerberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3557, N'1295', N'Mies', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3558, N'1295', N'Tannay', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3559, N'6370', N'Oberdorf NW', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3560, N'8317', N'Tagelswangen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3561, N'3855', N'Schwanden b. Brienz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3562, N'3961', N'St-Jean VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3563, N'3380', N'Walliswil b. Niederbipp', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3564, N'1267', N'Vich', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3565, N'1267', N'Coinsins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3566, N'8044', N'Gockhausen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3567, N'8614', N'Sulzbach', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3568, N'1965', N'Chandolin (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3569, N'1595', N'Clavaleyres', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3570, N'2735', N'Champoz', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3571, N'2715', N'Monible', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3572, N'2827', N'Schelten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3573, N'2830', N'Vellerat', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3574, N'2717', N'Rebévelier', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3575, N'2575', N'Hagneck', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3576, N'2572', N'Mörigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3577, N'2556', N'Schwadernau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3578, N'1470', N'Bollion', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3579, N'1773', N'Chandon', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3580, N'1534', N'Chapelle (Broye)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3581, N'1473', N'Châtillon FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3582, N'1475', N'Forel FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3583, N'1483', N'Frasses', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3584, N'1566', N'Les Friques', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3585, N'1484', N'Granges-de-Vesin', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3586, N'1470', N'Lully FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3587, N'1475', N'Montbrelloz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3588, N'1541', N'Morens FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3589, N'1528', N'Praratoud', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3590, N'1410', N'Prévondavaux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3591, N'1773', N'Russy', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3592, N'1470', N'Seiry', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3593, N'1541', N'Sévaz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3594, N'1565', N'Vallon', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3595, N'1483', N'Vesin', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3596, N'1680', N'Berlens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3597, N'1670', N'Bionnens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3598, N'1675', N'Blessens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3599, N'1608', N'Chapelle (Glâne)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3600, N'1694', N'Chavannes-sous-Orsonnens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3601, N'1697', N'Les Ecasseys', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3602, N'1670', N'Esmonts', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3603, N'1673', N'Gillarens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3604, N'1681', N'Hennens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3605, N'1688', N'Lieffrens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3606, N'1690', N'Lussy FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3607, N'1687', N'La Magne', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3608, N'1674', N'Montet (Glâne)', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3609, N'1674', N'Morlens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3610, N'1675', N'Mossel', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3611, N'1686', N'La Neirigue', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3612, N'1694', N'Villargiroud', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3613, N'1653', N'Châtel-sur-Montsalvens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3614, N'1669', N'Lessoc', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3615, N'1625', N'Maules', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3616, N'1652', N'Villarbeney', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3617, N'1666', N'Villars-sous-Mont', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3618, N'1782', N'Autafond', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3619, N'1782', N'La Corbaz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3620, N'1754', N'Corjolens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3621, N'1782', N'Cormagens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3622, N'1730', N'Ecuvillens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3623, N'1724', N'Essert FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3624, N'1726', N'Farvagny-le-Petit', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3625, N'1724', N'Ferpicloz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3626, N'1726', N'Grenilles', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3627, N'1782', N'Lossy', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3628, N'1756', N'Lovens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3629, N'1727', N'Magnedens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3630, N'1724', N'Montévraz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3631, N'1724', N'Oberried FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3632, N'1723', N'Pierrafortscha', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3633, N'1772', N'Ponthaux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3634, N'1726', N'Posat', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3635, N'1695', N'Rueyres-St-Laurent', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3636, N'1724', N'Senèdes', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3637, N'1695', N'Villarsel-le-Gibloux', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3638, N'1723', N'Villarsel-sur-Marly', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3639, N'1724', N'Zénauva', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3640, N'1721', N'Cormérod', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3641, N'1721', N'Courtion', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3642, N'1792', N'Guschelmuth', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3643, N'1784', N'Wallenried', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3644, N'1716', N'Oberschrot', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3645, N'1719', N'Zumholz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3646, N'1609', N'Besencens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3647, N'1609', N'Fiaugères', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3648, N'1624', N'Grattavache', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3649, N'1174', N'Pizy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3650, N'1787', N'Mur (Vully) VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3651, N'1580', N'Oleyres', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3652, N'1148', N'Chavannes-le-Veyron', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3653, N'1148', N'Mauraz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3654, N'1376', N'Eclagnens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3655, N'1376', N'Goumoens-le-Jux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3656, N'1041', N'Naz', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3657, N'1421', N'Grandevent', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3658, N'1428', N'Mutrux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3659, N'1423', N'Romairon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3660, N'1423', N'Vaugondry', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3661, N'1008', N'Jouxtens-Mézery', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3662, N'1134', N'Chigny', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3663, N'1026', N'Denges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3664, N'1410', N'Correvon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3665, N'1682', N'Lovatens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3666, N'1063', N'Martherenges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3667, N'1041', N'Montaubion-Chardonney', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3668, N'1513', N'Rossenges', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3669, N'1683', N'Sarzens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3670, N'1277', N'Arnex-sur-Nyon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3671, N'1279', N'Bogis-Bossey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3672, N'1290', N'Chavannes-des-Bois', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3673, N'1355', N'Sergey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3674, N'1608', N'Bussigny-sur-Oron', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3675, N'1608', N'Chesalles-sur-Oron', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3676, N'1607', N'Les Tavernes', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3677, N'1607', N'Les Thioleyres', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3678, N'1610', N'Vuibroye', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3679, N'1682', N'Cerniaz VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3680, N'1554', N'Rossens VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3681, N'1525', N'Seigneux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3682, N'1195', N'Dully', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3683, N'1180', N'Tartegnin', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3684, N'1436', N'Chamblon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3685, N'1415', N'Démoret', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3686, N'1443', N'Essert-sous-Champvent', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3687, N'1443', N'Villars-sous-Champvent', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3688, N'1407', N'Gossens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3689, N'1432', N'Gressy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3690, N'1407', N'Mézery-près-Donneloye', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3691, N'1047', N'Oppens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3692, N'1412', N'Ursins', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3693, N'1404', N'Villars-Epeney', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3694, N'2027', N'Montalchez', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3695, N'2063', N'Engollon', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3696, N'2933', N'Damphreux', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3697, N'2953', N'Fregiécourt', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3698, N'8165', N'Oberweningen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3699, N'8165', N'Schleinikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3700, N'8543', N'Bertschikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3701, N'3283', N'Niederried b. Kallnach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3702, N'4932', N'Gutenburg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3703, N'3294', N'Meienried', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3704, N'3429', N'Hellsau', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3705, N'3429', N'Höchstetten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3706, N'3324', N'Mötschwil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3707, N'3424', N'Oberösch', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3708, N'3472', N'Rumendingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3709, N'3421', N'Rüti b. Lyssach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3710, N'3425', N'Willadingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3711, N'2577', N'Finsterhennen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3712, N'3303', N'Ballmoos', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3713, N'3256', N'Bangerten b. Dieterswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3714, N'3053', N'Deisswil b. Münchenbuchsee', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3715, N'3053', N'Diemerswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3716, N'3303', N'Münchringen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3717, N'3251', N'Ruppoldsried', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3718, N'3305', N'Scheunen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3719, N'3053', N'Wiggiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3720, N'3309', N'Zauggenried', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3721, N'3510', N'Freimettigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3722, N'3510', N'Häutligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3723, N'3671', N'Herbligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3724, N'3532', N'Mirchel', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3725, N'3629', N'Oppligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3726, N'3504', N'Oberhünigen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3727, N'3207', N'Golaten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3728, N'3274', N'Bühl b. Aarberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3729, N'3272', N'Epsach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3730, N'3274', N'Merzligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3731, N'3632', N'Niederstocken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3732, N'3086', N'Englisberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3733, N'3629', N'Jaberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3734, N'3127', N'Lohnstorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3735, N'3116', N'Mühledorf BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3736, N'3116', N'Noflen BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3737, N'3128', N'Rümligen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3738, N'3636', N'Forst b. Längenbühl', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3739, N'3623', N'Horrenbach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3740, N'3624', N'Schwendibach', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3741, N'3645', N'Zwieselberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3742, N'3376', N'Berken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3743, N'3366', N'Bollodingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3744, N'3367', N'Ochlenberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3745, N'4704', N'Wolfisberg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3746, N'6289', N'Hämikon', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3747, N'6277', N'Lieli LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3748, N'6284', N'Sulz LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3749, N'6038', N'Honau', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3750, N'8777', N'Betschwanden', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3751, N'8774', N'Leuggelbach', N'GL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3752, N'3216', N'Agriswil', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3753, N'3215', N'Büchslen', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3754, N'3280', N'Greng', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3755, N'3213', N'Kleinbösingen', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3756, N'3212', N'Kleingurmels', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3757, N'3215', N'Lurtigen', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3758, N'3206', N'Wallenbuch', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3759, N'4583', N'Aetigkofen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3760, N'3254', N'Balm b. Messen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3761, N'4584', N'Gächliwil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3762, N'4556', N'Bolken', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3763, N'4556', N'Burgäschi', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3764, N'4566', N'Halten', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3765, N'4558', N'Heinrichswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3766, N'4554', N'Hüniken', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3767, N'4566', N'Oekingen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3768, N'4556', N'Steinhof SO', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3769, N'4558', N'Winistorf', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3770, N'4535', N'Kammersrohr', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3771, N'4436', N'Liedertswil', N'BL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3772, N'9057', N'Schwende', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3773, N'7456', N'Marmorera', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3774, N'7130', N'Schnaus', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3775, N'7116', N'St. Martin (Lugnez)', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3776, N'7415', N'Pratval', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3777, N'7423', N'Portein', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3778, N'7027', N'Calfreisen', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3779, N'5619', N'Uezwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3780, N'2912', N'Réclère', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3781, N'1820', N'Veytaux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3782, N'5012', N'Eppenberg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3783, N'8905', N'Islisberg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3784, N'5637', N'Geltwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3785, N'5058', N'Wiliberg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3786, N'8580', N'Hefenhofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3787, N'8586', N'Buchackern', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3788, N'8586', N'Engishofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3789, N'8586', N'Ennetaach', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3790, N'8253', N'Willisdorf', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3791, N'8546', N'Kefikon TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3792, N'8553', N'Eschikofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3793, N'8553', N'Harenwilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3794, N'8553', N'Mettendorf TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3795, N'8573', N'Alterswilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3796, N'8573', N'Altishausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3797, N'8566', N'Ellighausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3798, N'8566', N'Lippoldswilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3799, N'8274', N'Gottlieben', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3800, N'8585', N'Schönenbaumgarten', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3801, N'8585', N'Herrenhof', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3802, N'8564', N'Sonterswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3803, N'9562', N'Buch b. Märwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3804, N'9556', N'Zezikon', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3805, N'8512', N'Wetzikon TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3806, N'8360', N'Wallenwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3807, N'8537', N'Uerschhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3808, N'8505', N'Dettighofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3809, N'8259', N'Rheinklingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3810, N'8572', N'Andhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3811, N'8572', N'Graltshausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3812, N'8585', N'Birwinken', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3813, N'8572', N'Guntershausen b. Berg', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3814, N'8585', N'Klarsreuti', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3815, N'8575', N'Istighofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3816, N'8556', N'Engwang', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3817, N'8556', N'Illhart', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3818, N'6720', N'Ghirone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3819, N'6724', N'Largario', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3820, N'6723', N'Marolta', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3821, N'6963', N'Cureggia', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3822, N'6814', N'Lamone', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3823, N'3995', N'Ausserbinn', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3824, N'3995', N'Mühlebach (Goms)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3825, N'3989', N'Ritzingen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3826, N'3989', N'Selkingen', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3827, N'3995', N'Steinhaus', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3828, N'3957', N'Bratsch', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3829, N'3983', N'Bister', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3830, N'3983', N'Filet', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3831, N'3983', N'Goppisberg', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3832, N'3994', N'Martisberg', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3833, N'3940', N'Steg VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3834, N'9498', N'Planken', N'FL')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3835, N'6212', N'Kaltbach', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3836, N'8525', N'Wilen b. Neunforn', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3837, N'2735', N'Malleray', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3838, N'1653', N'Crésuz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3839, N'1626', N'Treyfayes', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3840, N'2027', N'Fresens', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3841, N'2933', N'Lugnez', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3842, N'2953', N'Pleujouse', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3843, N'1624', N'Progens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3844, N'5012', N'Wöschnau', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3845, N'3984', N'Fieschertal', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3846, N'6814', N'Cadempino', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3847, N'4584', N'Lüterswil', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3848, N'8905', N'Arni AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3849, N'8553', N'Hüttlingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3850, N'9470', N'Werdenberg', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3851, N'8427', N'Freienstein', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3852, N'8427', N'Rorbas', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3853, N'1626', N'Rueyres-Treyfayes', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3854, N'1884', N'Arveyes', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3855, N'3963', N'Aminona', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3856, N'5053', N'Wittwil', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3857, N'6005', N'St. Niklausen LU', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3858, N'6995', N'Madonna del Piano', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3859, N'7226', N'Fajauna', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3860, N'7743', N'Miralago', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3861, N'8212', N'Nohl', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3862, N'8471', N'Dägerlen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3863, N'9122', N'Ebersol', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3864, N'6900', N'Paradiso', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3865, N'1754', N'Avry-sur-Matran', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3866, N'1783', N'Barberêche', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3867, N'1774', N'Montagny-les-Monts', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3868, N'1585', N'Bellerive VD', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3869, N'2052', N'La Vue-des-Alpes', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3870, N'3656', N'Ringoldswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3871, N'4922', N'Thunstetten', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3872, N'1195', N'Bursinel', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3873, N'3900', N'Brigerbad', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3874, N'8118', N'Pfaffhausen', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3875, N'1428', N'Provence', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3876, N'2715', N'Châtelat', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3877, N'1091', N'Chenaux', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3878, N'6600', N'Solduno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3879, N'6363', N'Bürgenstock', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3880, N'8832', N'Wilen b. Wollerau', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3881, N'5316', N'Felsenau AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3882, N'1775', N'Mannens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3883, N'1775', N'Grandsivaz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3884, N'8926', N'Hauptikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3885, N'8926', N'Uerzlikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3886, N'1026', N'Echandens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3887, N'5405', N'Dättwil AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3888, N'5406', N'Rütihof', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3889, N'8106', N'Adlikon b. Regensdorf', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3890, N'6343', N'Buonas', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3891, N'6343', N'Risch', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3892, N'6343', N'Holzhäusern ZG', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3893, N'3945', N'Niedergampel', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3894, N'1965', N'Drône (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3895, N'3415', N'Rüegsauschachen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3896, N'3415', N'Hasle b. Burgdorf', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3897, N'6363', N'Fürigen', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3898, N'6410', N'Rigi Scheidegg', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3899, N'4571', N'Lüterkofen', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3900, N'8268', N'Salenstein', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3901, N'8522', N'Aawangen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3902, N'9503', N'Lanterswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3903, N'8574', N'Oberhofen TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3904, N'6260', N'Hintermoos', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3905, N'6383', N'Wiesenberg', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3906, N'4573', N'Lohn-Ammannsegg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3907, N'8725', N'Gebertingen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3908, N'1958', N'Uvrier', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3909, N'4524', N'Balmberg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3910, N'4524', N'Oberbalmberg', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3911, N'6156', N'Luthern Bad', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3912, N'6260', N'Mehlsecken', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3913, N'6677', N'Aurigeno', N'TI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3914, N'7431', N'Obermutten', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3915, N'1892', N'Lavey-les-Bains', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3916, N'2575', N'Gerolfingen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3917, N'9214', N'Kradolf', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3918, N'8640', N'Hurden', N'SZ')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3919, N'1660', N'La Lécherette', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3920, N'2075', N'Thielle', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3921, N'2075', N'Wavre', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3922, N'1721', N'Misery', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3923, N'3632', N'Oberstocken', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3924, N'1068', N'Les Monts-de-Pully', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3925, N'9476', N'Fontnas', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3926, N'5018', N'Erlinsbach', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3927, N'1274', N'Signy', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3928, N'8564', N'Hefenhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3929, N'8564', N'Wagerswil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3930, N'8586', N'Buch b. Kümmertshausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3931, N'9565', N'Oberbussnang', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3932, N'2950', N'Courtemautruy', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3933, N'1347', N'Le Solliat', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3934, N'1148', N'Villars-Bozon', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3935, N'1304', N'Allens', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3936, N'5624', N'Waldhäusern AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3937, N'3960', N'Niouc', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3938, N'1912', N'Produit (Leytron)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3939, N'1912', N'Montagnon (Leytron)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3940, N'1912', N'Dugny (Leytron)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3941, N'1914', N'Auddes-sur-Riddes', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3942, N'1932', N'Les Valettes (Bovernier)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3943, N'1933', N'Vens (Sembrancher)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3944, N'1933', N'Chamoille (Sembrancher)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3945, N'1933', N'La Garde (Sembrancher)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3946, N'1941', N'Cries (Vollèges)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3947, N'1945', N'Fontaine Dessus (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3948, N'1945', N'Fontaine Dessous (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3949, N'1945', N'Dranse (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3950, N'1945', N'Chandonne (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3951, N'1945', N'Rive Haute (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3952, N'1945', N'Fornex (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3953, N'1945', N'Les Moulins VS (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3954, N'1945', N'Vichères (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3955, N'1945', N'Palasuit (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3956, N'1945', N'Chez Petit (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3957, N'1945', N'Petit Vichères (Liddes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3958, N'1947', N'Champsec', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3959, N'1955', N'Les Vérines (Chamoson)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3960, N'1955', N'Némiaz (Chamoson)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3961, N'1955', N'Grugnay (Chamoson)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3962, N'1965', N'Roumaz (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3963, N'1965', N'Granois (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3964, N'1965', N'St-Germain (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3965, N'1965', N'Ormône (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3966, N'1965', N'Mayens-de-la-Zour (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3967, N'1966', N'Fortunau (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3968, N'1966', N'Luc (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3969, N'1966', N'St-Romain (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3970, N'1966', N'Saxonne (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3971, N'1966', N'Villa (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3972, N'1966', N'La Place (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3973, N'1966', N'Botyre (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3974, N'1966', N'Blignou (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3975, N'1966', N'Argnou (Ayent)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3976, N'1969', N'Liez (St-Martin)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3977, N'1969', N'Trogne (St-Martin)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3978, N'1969', N'Suen (St-Martin)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3979, N'1971', N'Champlan (Grimisuat)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3980, N'1983', N'Lanna', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3981, N'1991', N'Arvillard (Salins)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3982, N'1991', N'Pravidondaz (Salins)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3983, N'1991', N'Turin (Salins)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3984, N'1991', N'Misériez (Salins)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3985, N'1993', N'Clèbes (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3986, N'1996', N'Brignon (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3987, N'1992', N'La Vernaz (Les Agettes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3988, N'1992', N'Crête-à-l''Oeil(Les Agettes)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3989, N'1996', N'Bieudron (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3990, N'1996', N'Condémines (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3991, N'1996', N'Saclentse', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3992, N'1911', N'Mayens-de-Chamoson', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3993, N'1585', N'Cotterd', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3994, N'1873', N'Champoussin', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3995, N'2063', N'Fenin', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3996, N'2063', N'Saules', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3997, N'1873', N'Les Crosets', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3998, N'1965', N'Monteiller (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (3999, N'1772', N'Nierlet-les-Bois', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4000, N'1787', N'Mur (Vully) FR', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4001, N'1892', N'Morcles', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4002, N'9479', N'Gretschins', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4003, N'9479', N'Malans SG', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4004, N'8564', N'Hattenhausen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4005, N'2149', N'Fretereules', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4006, N'2149', N'Brot-Dessous', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4007, N'9249', N'Oberstetten', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4008, N'9249', N'Niederstetten', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4009, N'8564', N'Gunterswilen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4010, N'3815', N'Gündlischwand', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4011, N'3860', N'Schattenhalb', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4012, N'2610', N'Les Pontins', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4013, N'1617', N'Tatroz', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4014, N'1096', N'Villette (Lavaux)', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4015, N'6383', N'Wirzweli', N'NW')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4016, N'2333', N'La Cibourg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4017, N'2616', N'La Cibourg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4018, N'8556', N'Lamperswil TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4019, N'6039', N'Root D4', N'LU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4020, N'2037', N'Montezillon', N'NE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4021, N'1820', N'Territet', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4022, N'2338', N'Muriaux', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4023, N'2748', N'Les Ecorcheresses', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4024, N'8615', N'Freudwil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4025, N'1969', N'Eison (St.Martin)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4026, N'3623', N'Buchen BE', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4027, N'4588', N'Brittern', N'SO')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4028, N'5415', N'Hertenstein AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4029, N'5415', N'Rieden AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4030, N'8596', N'Münsterlingen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4031, N'9604', N'Unterrindal', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4032, N'3976', N'Champzabé', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4033, N'3983', N'Greich', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4034, N'8546', N'Menzengrüt', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4035, N'3053', N'Lätti', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4036, N'3256', N'Seewil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4037, N'8135', N'Sihlwald', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4038, N'8152', N'Glattpark (Opfikon)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4039, N'5645', N'Fenkrieden', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4040, N'1782', N'Formangueires', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4041, N'7513', N'Silvaplana-Surlej', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4042, N'8543', N'Gundetswil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4043, N'8109', N'Kloster Fahr', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4044, N'1148', N'La Coudre', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4045, N'8352', N'Ricketwil (Winterthur)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4046, N'6333', N'Hünenberg See', N'ZG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4047, N'8545', N'Rickenbach Sulz', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4048, N'8543', N'Kefikon ZH', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4049, N'8310', N'Grafstal', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4050, N'8465', N'Wildensbuch', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4051, N'8471', N'Oberwil (Dägerlen)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4052, N'8471', N'Berg (Dägerlen)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4053, N'8471', N'Bänk (Dägerlen)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4054, N'8412', N'Riet (Neftenbach)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4055, N'8412', N'Hünikon (Neftenbach)', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4056, N'5643', N'Meienberg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4057, N'3823', N'Kleine Scheidegg', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4058, N'3823', N'Eigergletscher', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4059, N'9050', N'Appenzell Eggerstanden', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4060, N'9050', N'Appenzell Enggenhütten', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4061, N'9050', N'Appenzell Meistersrüte', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4062, N'9050', N'Appenzell Steinegg', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4063, N'9050', N'Appenzell Schlatt', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4064, N'9057', N'Wasserauen', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4065, N'9108', N'Gontenbad', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4066, N'9108', N'Jakobsbad', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4067, N'9442', N'Büriswilen', N'AI')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4068, N'7110', N'Peiden', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4069, N'1356', N'La Russille', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4070, N'9245', N'Sonnental', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4071, N'3206', N'Ferenbalm', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4072, N'3206', N'Biberen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4073, N'3206', N'Gammen', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4074, N'2360', N'Le Bémont JU', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4075, N'2362', N'Montfaucon', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4076, N'2362', N'Montfavergier', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4077, N'2363', N'Les Enfers', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4078, N'2364', N'St-Brais', N'JU')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4079, N'9030', N'St. Josefen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4080, N'8723', N'Maseltrangen', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4081, N'3434', N'Landiswil', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4082, N'1984', N'La Tour VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4083, N'1985', N'La Forclaz VS', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4084, N'1985', N'Villa (Evolène)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4085, N'5412', N'Vogelsang AG', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4086, N'1997', N'Sornard (Nendaz)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4087, N'9533', N'Dietschwil', N'SG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4088, N'8162', N'Sünikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4089, N'8332', N'Rumlikon', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4090, N'8322', N'Gündisau', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4091, N'8371', N'Busswil TG', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4092, N'7212', N'Seewis-Pardisla', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4093, N'7212', N'Seewis-Schmitten', N'GR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4094, N'3075', N'Vielbringen b. Worb', N'BE')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4095, N'8574', N'Lengwil', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4096, N'8574', N'Dettighofen (Lengwil)', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4097, N'1880', N'Les Posses-sur-Bex', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4098, N'8155', N'Nassenwil', N'ZH')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4099, N'1345', N'Le Séchey', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4100, N'1580', N'Donatyre', N'VD')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4101, N'1721', N'Cournillens', N'FR')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4102, N'5225', N'Bözberg', N'AG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4103, N'3961', N'Mission', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4104, N'1965', N'Diolly (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4105, N'1965', N'La Muraz (Savièse)', N'VS')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4106, N'8580', N'Biessenhofen', N'TG')
GO
INSERT [dbo].[Orte] ([OrtId], [PLZ], [Ortname], [Kanton]) VALUES (4107, N'6875', N'Campora', N'TI')
GO
SET IDENTITY_INSERT [dbo].[Orte] OFF
GO
ALTER TABLE [dbo].[Betreuung] ADD  DEFAULT ((0)) FOR [VonKKBezahlt]
GO
ALTER TABLE [dbo].[Betreuung]  WITH CHECK ADD  CONSTRAINT [fk_BetreuungKunden] FOREIGN KEY([Kundennummer])
REFERENCES [dbo].[Kunden] ([Kundennummer])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Betreuung] CHECK CONSTRAINT [fk_BetreuungKunden]
GO
ALTER TABLE [dbo].[Betreuung]  WITH CHECK ADD  CONSTRAINT [fk_BetreuungMitarbeiter] FOREIGN KEY([Personalnummer])
REFERENCES [dbo].[Mitarbeiter] ([Personalnummer])
GO
ALTER TABLE [dbo].[Betreuung] CHECK CONSTRAINT [fk_BetreuungMitarbeiter]
GO
ALTER TABLE [dbo].[Kunden]  WITH CHECK ADD  CONSTRAINT [fk_KundenOrte] FOREIGN KEY([Wohnort])
REFERENCES [dbo].[Orte] ([OrtId])
GO
ALTER TABLE [dbo].[Kunden] CHECK CONSTRAINT [fk_KundenOrte]
GO
USE [master]
GO
ALTER DATABASE [FitnessCenter] SET  READ_WRITE 
GO
