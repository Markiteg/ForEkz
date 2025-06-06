USE [master]
GO
/****** Object:  Database [ekz]    Script Date: 04.05.2025 10:35:53 ******/
CREATE DATABASE [ekz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ekz', FILENAME = N'D:\sql\MSSQL16.SQLEXPRESS\MSSQL\DATA\ekz.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ekz_log', FILENAME = N'D:\sql\MSSQL16.SQLEXPRESS\MSSQL\DATA\ekz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ekz] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ekz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ekz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ekz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ekz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ekz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ekz] SET ARITHABORT OFF 
GO
ALTER DATABASE [ekz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ekz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ekz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ekz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ekz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ekz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ekz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ekz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ekz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ekz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ekz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ekz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ekz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ekz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ekz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ekz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ekz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ekz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ekz] SET  MULTI_USER 
GO
ALTER DATABASE [ekz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ekz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ekz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ekz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ekz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ekz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ekz] SET QUERY_STORE = ON
GO
ALTER DATABASE [ekz] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ekz]
GO
/****** Object:  Table [dbo].[Партнер$]    Script Date: 04.05.2025 10:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Партнер$](
	[Тип партнера] [int] NULL,
	[Наименование партнера] [nvarchar](255) NULL,
	[Директор] [nvarchar](255) NULL,
	[Электронная почта партнера] [nvarchar](255) NULL,
	[Телефон партнера] [nvarchar](255) NULL,
	[Юридический адрес партнера] [nvarchar](255) NULL,
	[ИНН] [nvarchar](50) NULL,
	[Рейтинг] [int] NULL,
	[Код] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Партнер$] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Реализация_продукции$]    Script Date: 04.05.2025 10:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Реализация_продукции$](
	[Продукция] [nvarchar](255) NULL,
	[Код_партнера] [int] NULL,
	[Количество_продукции] [int] NULL,
	[Дата_продажи] [datetime] NULL,
	[Код] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Реализация_продукции$] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_материала$]    Script Date: 04.05.2025 10:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_материала$](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Тип материала] [nvarchar](255) NULL,
	[Процент брака материала ] [float] NULL,
 CONSTRAINT [PK_Тип_материала$] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_партнера$]    Script Date: 04.05.2025 10:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_партнера$](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Тип] [nvarchar](255) NULL,
 CONSTRAINT [PK_Тип_партнера$] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_продукта$]    Script Date: 04.05.2025 10:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_продукта$](
	[Тип продукции] [nvarchar](255) NULL,
	[Коэффициент типа продукции] [float] NULL,
	[Код] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Тип_продукта$] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары$]    Script Date: 04.05.2025 10:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары$](
	[Тип продукции] [int] NULL,
	[Наименование продукции] [nvarchar](255) NULL,
	[Артикул] [int] IDENTITY(1,1) NOT NULL,
	[Минимальная стоимость для партнера] [float] NULL,
	[Код] [int] NOT NULL,
 CONSTRAINT [PK_Товары$] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Партнер$] ON 

INSERT [dbo].[Партнер$] ([Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Код]) VALUES (1, N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2.22246e+009', 7, 1)
INSERT [dbo].[Партнер$] ([Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Код]) VALUES (2, N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3.33389e+009', 7, 2)
INSERT [dbo].[Партнер$] ([Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Код]) VALUES (3, N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4.44039e+009', 7, 3)
INSERT [dbo].[Партнер$] ([Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Код]) VALUES (4, N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1.11152e+009', 5, 4)
INSERT [dbo].[Партнер$] ([Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Код]) VALUES (1, N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5.55243e+009', 10, 5)
SET IDENTITY_INSERT [dbo].[Партнер$] OFF
GO
SET IDENTITY_INSERT [dbo].[Реализация_продукции$] ON 

INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Паркетная доска Ясень темный однополосная 14 мм', 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 1, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Ламинат Дуб серый 32 класс 8 мм с фаской', 1, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Инженерная доска Дуб Французская елка однополосная 12 мм', 2, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 2, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 2, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Паркетная доска Ясень темный однополосная 14 мм', 2, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Паркетная доска Ясень темный однополосная 14 мм', 3, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Инженерная доска Дуб Французская елка однополосная 12 мм', 3, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Ламинат Дуб серый 32 класс 8 мм с фаской', 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 4, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 4, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 5, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Ламинат Дуб серый 32 класс 8 мм с фаской', 5, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Паркетная доска Ясень темный однополосная 14 мм', 5, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Реализация_продукции$] ([Продукция], [Код_партнера], [Количество_продукции], [Дата_продажи], [Код]) VALUES (N'Инженерная доска Дуб Французская елка однополосная 12 мм', 5, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime), 16)
SET IDENTITY_INSERT [dbo].[Реализация_продукции$] OFF
GO
SET IDENTITY_INSERT [dbo].[Тип_материала$] ON 

INSERT [dbo].[Тип_материала$] ([Код], [Тип материала], [Процент брака материала ]) VALUES (1, N'Тип материала 1', 0.001)
INSERT [dbo].[Тип_материала$] ([Код], [Тип материала], [Процент брака материала ]) VALUES (2, N'Тип материала 2', 0.0095)
INSERT [dbo].[Тип_материала$] ([Код], [Тип материала], [Процент брака материала ]) VALUES (3, N'Тип материала 3', 0.0028)
INSERT [dbo].[Тип_материала$] ([Код], [Тип материала], [Процент брака материала ]) VALUES (4, N'Тип материала 4', 0.0055)
INSERT [dbo].[Тип_материала$] ([Код], [Тип материала], [Процент брака материала ]) VALUES (5, N'Тип материала 5', 0.0034)
SET IDENTITY_INSERT [dbo].[Тип_материала$] OFF
GO
SET IDENTITY_INSERT [dbo].[Тип_партнера$] ON 

INSERT [dbo].[Тип_партнера$] ([Код], [Тип]) VALUES (1, N'ЗАО')
INSERT [dbo].[Тип_партнера$] ([Код], [Тип]) VALUES (2, N'ООО')
INSERT [dbo].[Тип_партнера$] ([Код], [Тип]) VALUES (3, N'ПАО')
INSERT [dbo].[Тип_партнера$] ([Код], [Тип]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[Тип_партнера$] OFF
GO
SET IDENTITY_INSERT [dbo].[Тип_продукта$] ON 

INSERT [dbo].[Тип_продукта$] ([Тип продукции], [Коэффициент типа продукции], [Код]) VALUES (N'Ламинат', 2.35, 1)
INSERT [dbo].[Тип_продукта$] ([Тип продукции], [Коэффициент типа продукции], [Код]) VALUES (N'Массивная доска', 5.15, 2)
INSERT [dbo].[Тип_продукта$] ([Тип продукции], [Коэффициент типа продукции], [Код]) VALUES (N'Паркетная доска', 4.34, 3)
INSERT [dbo].[Тип_продукта$] ([Тип продукции], [Коэффициент типа продукции], [Код]) VALUES (N'Пробковое покрытие', 1.5, 4)
SET IDENTITY_INSERT [dbo].[Тип_продукта$] OFF
GO
SET IDENTITY_INSERT [dbo].[Товары$] ON 

INSERT [dbo].[Товары$] ([Тип продукции], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [Код]) VALUES (3, N'Паркетная доска Ясень темный однополосная 14 мм', 8758385, 4456.9, 1)
INSERT [dbo].[Товары$] ([Тип продукции], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [Код]) VALUES (3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, 7330.99, 2)
INSERT [dbo].[Товары$] ([Тип продукции], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [Код]) VALUES (1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 7750282, 1799.33, 3)
INSERT [dbo].[Товары$] ([Тип продукции], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [Код]) VALUES (1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, 3890.41, 4)
INSERT [dbo].[Товары$] ([Тип продукции], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [Код]) VALUES (4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, 5450.59, 5)
SET IDENTITY_INSERT [dbo].[Товары$] OFF
GO
ALTER TABLE [dbo].[Партнер$]  WITH CHECK ADD  CONSTRAINT [FK_Партнер$_Тип_партнера$] FOREIGN KEY([Тип партнера])
REFERENCES [dbo].[Тип_партнера$] ([Код])
GO
ALTER TABLE [dbo].[Партнер$] CHECK CONSTRAINT [FK_Партнер$_Тип_партнера$]
GO
ALTER TABLE [dbo].[Реализация_продукции$]  WITH CHECK ADD  CONSTRAINT [FK_Реализация_продукции$_Партнер$] FOREIGN KEY([Код_партнера])
REFERENCES [dbo].[Партнер$] ([Код])
GO
ALTER TABLE [dbo].[Реализация_продукции$] CHECK CONSTRAINT [FK_Реализация_продукции$_Партнер$]
GO
ALTER TABLE [dbo].[Товары$]  WITH CHECK ADD  CONSTRAINT [FK_Товары$_Тип_продукта$] FOREIGN KEY([Тип продукции])
REFERENCES [dbo].[Тип_продукта$] ([Код])
GO
ALTER TABLE [dbo].[Товары$] CHECK CONSTRAINT [FK_Товары$_Тип_продукта$]
GO
USE [master]
GO
ALTER DATABASE [ekz] SET  READ_WRITE 
GO
