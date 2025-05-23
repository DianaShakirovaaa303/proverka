USE [matematika]
GO
/****** Object:  Table [dbo].[Обратная_связь]    Script Date: 12.05.2025 0:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Обратная_связь](
	[ID] [int] NOT NULL,
	[Роль] [int] NOT NULL,
	[Категория] [varchar](50) NOT NULL,
	[Сообщение] [text] NOT NULL,
	[Дата_отправки] [date] NOT NULL,
 CONSTRAINT [PK_Обратная_связь] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 12.05.2025 0:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](100) NULL,
	[Имя] [nvarchar](100) NULL,
	[Отчество] [nvarchar](100) NULL,
	[Роль] [int] NOT NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Пользова__3214EC274398F5D7] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 12.05.2025 0:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Название_роли] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Обратная_связь]  WITH CHECK ADD  CONSTRAINT [FK_Обратная_связь_Пользователи] FOREIGN KEY([Роль])
REFERENCES [dbo].[Пользователи] ([ID])
GO
ALTER TABLE [dbo].[Обратная_связь] CHECK CONSTRAINT [FK_Обратная_связь_Пользователи]
GO
ALTER TABLE [dbo].[Пользователи]  WITH CHECK ADD  CONSTRAINT [FK_Пользователи_Роли] FOREIGN KEY([Роль])
REFERENCES [dbo].[Роли] ([ID])
GO
ALTER TABLE [dbo].[Пользователи] CHECK CONSTRAINT [FK_Пользователи_Роли]
GO
