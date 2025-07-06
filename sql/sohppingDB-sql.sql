USE [shopping]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 06/07/2025 11:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[userId] [int] NULL,
	[productId] [int] NULL,
 CONSTRAINT [PK_bd94725aa84f8cf37632bcde997] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 06/07/2025 11:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_9c4e4a89e3674fc9f382d733f03] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 06/07/2025 11:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK_bebc9158e480b949565b4dc7a82] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 06/07/2025 11:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cace4a159ff9f2512dd42373760] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cart_item] ON 

INSERT [dbo].[cart_item] ([id], [quantity], [userId], [productId]) VALUES (4, 4, 1, 6)
INSERT [dbo].[cart_item] ([id], [quantity], [userId], [productId]) VALUES (5, 7, 1, 5)
INSERT [dbo].[cart_item] ([id], [quantity], [userId], [productId]) VALUES (8, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (2, N'ירקות')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'מאפים')
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'מוצרי חלב')
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'משקאות')
INSERT [dbo].[category] ([id], [name]) VALUES (1, N'פירות')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (1, N'תפוח עץ', CAST(4 AS Decimal(18, 0)), 1)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (2, N'בננה', CAST(4 AS Decimal(18, 0)), 1)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (3, N'עגבנייה', CAST(2 AS Decimal(18, 0)), 2)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (4, N'מלפפון', CAST(2 AS Decimal(18, 0)), 2)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (5, N'לחם לבן', CAST(5 AS Decimal(18, 0)), 3)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (6, N'קרואסון', CAST(7 AS Decimal(18, 0)), 3)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (7, N'מים מינרליים', CAST(3 AS Decimal(18, 0)), 4)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (8, N'קולה', CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (9, N'חלב 3%', CAST(6 AS Decimal(18, 0)), 5)
INSERT [dbo].[product] ([id], [name], [price], [categoryId]) VALUES (10, N'יוגורט', CAST(4 AS Decimal(18, 0)), 5)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password]) VALUES (1, N'testuser', N'$2b$10$3GBjwoIa/b505LRD/SL9wua4tnbnOPkR5ttwg7cirq2jpi7blTBAe')
INSERT [dbo].[user] ([id], [username], [password]) VALUES (2, N'testuser1', N'$2b$10$6Dj8IdoAJO96L6yVFAfUuuXh3T4AOZHD4JTISli1KJ1eoq5k/Maou')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_23c05c292c439d77b0de816b500]    Script Date: 06/07/2025 11:52:10 ******/
ALTER TABLE [dbo].[category] ADD  CONSTRAINT [UQ_23c05c292c439d77b0de816b500] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_78a916df40e02a9deb1c4b75edb]    Script Date: 06/07/2025 11:52:10 ******/
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [UQ_78a916df40e02a9deb1c4b75edb] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FK_158f0325ccf7f68a5b395fa2f6a] FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FK_158f0325ccf7f68a5b395fa2f6a]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FK_75db0de134fe0f9fe9e4591b7bf] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FK_75db0de134fe0f9fe9e4591b7bf]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_ff0c0301a95e517153df97f6812] FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_ff0c0301a95e517153df97f6812]
GO
