Create Database [ChangDB]
GO

USE [ChangDB]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[SuID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED 
(
	[SuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Appraise]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appraise](
	[AppraiseID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Grade] [int] NOT NULL,
	[RateTime] [datetime] NULL,
 CONSTRAINT [PK_Appraise] PRIMARY KEY CLUSTERED 
(
	[AppraiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NOT NULL,
	[ParentID] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[DeliveryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Consignee] [nvarchar](50) NOT NULL,
	[Complete] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[DeliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[FavoriteID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[FavoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[NTypes] [nvarchar](10) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[PhotoUrl] [nvarchar](200) NOT NULL,
	[PushTime] [datetime] NULL,
	[States] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersID] [int] IDENTITY(1,1) NOT NULL,
	[Orderdate] [date] NOT NULL,
	[UserID] [int] NOT NULL,
	[Total] [money] NULL,
	[DeliveryID] [int] NULL,
	[DeliveryDate] [date] NULL,
	[States] [int] NOT NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrdersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrdersID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[States] [int] NULL,
 CONSTRAINT [PK_OrdersDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoUrl] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CateID] [int] NOT NULL,
	[MarketPrice] [money] NOT NULL,
	[Price] [money] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[PostTime] [datetime] NULL,
	[Stock] [int] NOT NULL,
	[Photo] [nvarchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021/11/16 11:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Nick] [nvarchar](50) NULL,
	[DeliveryID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

GO
INSERT [dbo].[AdminUser] ([SuID], [UserName], [Pwd], [Role]) VALUES (1, N'111', N'123', 0)
GO
INSERT [dbo].[AdminUser] ([SuID], [UserName], [Pwd], [Role]) VALUES (2, N'张热', N'123', 0)
GO
INSERT [dbo].[AdminUser] ([SuID], [UserName], [Pwd], [Role]) VALUES (3, N'admin', N'123', 0)
GO
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (1, N'首页', 1)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (2, N'品牌', 2)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (3, N'女装', 3)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (4, N'女包', 4)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (5, N'女鞋', 5)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (6, N'男装', 6)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (7, N'男包', 7)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (8, N'男鞋', 8)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (9, N'配饰', 9)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (10, N'默认排序', 10)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (11, N'热销', 11)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (12, N'价格', 12)
GO
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (13, N'折扣', 13)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (1, 5, N'王者', N'湖南', N'15523871234')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (2, 2, N'藏撒', N'有意', N'15563872345')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (3, 1006, N'张三', N'湖南', N'15563872345')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (4, 3, N'张三', N'湖南', N'15563872345')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (5, 2, N'张三', N'湖南', N'15563872345')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (6, 1, N'藏撒', N'有意', N'15563872345')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (7, 3, N'张而', N'永州', N'674563')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (8, 4, N'属于', N'湖南', N'12324543')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (9, 4, N'王', N'湖北', N'3434')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (10, 2, N'罗丽', N'永州', N'15886529272')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (11, 0, N'王', N'共同', N'3435')
GO
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (12, 0, N'王', N'发', N'345')
GO
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

GO
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (1, N'大减价', N'默认排序', N'价格优惠', N'1.jpg', CAST(0x0000ACDF00000000 AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (2, N'最优活动', N'热销', N'价格优惠', N'2.jpg', CAST(0x0000ACE100000000 AS DateTime), 2)
GO
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (3, N'大减价', N'价格', N'价格优惠', N'3.jpg', CAST(0x0000ACFF00000000 AS DateTime), 3)
GO
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (4, N'最优活动', N'折扣', N'价格优惠', N'4.jpg', CAST(0x0000AD0100000000 AS DateTime), 4)
GO
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (5, N'大减价', N'折扣', N'裤子', N'1.jpg', CAST(0x0000AB5600000000 AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

GO
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (4, CAST(0x3C420B00 AS Date), 2, 34.0000, 1, CAST(0x5A420B00 AS Date), 1, N'加油')
GO
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (5, CAST(0x36450B00 AS Date), 1, 45.0000, 2, CAST(0x3D430B00 AS Date), 3, N'23')
GO
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (6, CAST(0x36450B00 AS Date), 1006, 23.0000, 3, CAST(0x52450B00 AS Date), 2, N'45')
GO
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (7, CAST(0x3C420B00 AS Date), 1007, NULL, 4, CAST(0x5A420B00 AS Date), 1, N'34')
GO
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (8, CAST(0x3D430B00 AS Date), 1, 23.0000, 1, CAST(0x3D430B00 AS Date), 3, NULL)
GO
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (9, CAST(0x3D430B00 AS Date), 1, 147.0000, 1, CAST(0x3D430B00 AS Date), 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetail] ON 

GO
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (3, 4, 3, 23, 1)
GO
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (4, 5, 4, 23, 2)
GO
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (5, 6, 5, 12, 1)
GO
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (10, 7, 13, 23, 2)
GO
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (11, 8, 21, 1, 1)
GO
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (12, 9, 20, 1, 1)
GO
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (13, 9, 4, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[OrdersDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Photo] ON 

GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (3, 3, N'1.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (4, 4, N'2.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (5, 5, N'3.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (6, 7, N'4.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (7, 13, N'8.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (8, 14, N'9.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (9, 15, N'2.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (10, 16, N'3.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (11, 17, N'5.jpg')
GO
SET IDENTITY_INSERT [dbo].[Photo] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (3, N'FERRAGMO', 1, 199.0000, 189.0000, N'【季末清仓】FERRAGAMO菲拉', CAST(0x0000ACA400000000 AS DateTime), 34, N'1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (4, N'DIANE FURSTENBERS', 2, 167.0000, 124.0000, N'【季末清仓】DIANE FURSTENBERS', CAST(0x0000ACE100000000 AS DateTime), 23, N'2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (5, N'SWAROVSKI', 1, 245.0000, 23.0000, N'【季末清仓】SWAROVSKI', CAST(0x0000ACE100000000 AS DateTime), 12, N'3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (7, N'CREAZIONI IL C', 1, 234.0000, 12.0000, N'【季末清仓】CREAZIONI IL C', CAST(0x0000AD0100000000 AS DateTime), 12, N'4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (8, N'moschino', 1, 34.0000, 23.0000, N'【季末清仓】moschino', CAST(0x0000AF9E00000000 AS DateTime), 12, N'5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (13, N'BLACKGATEONE', 1, 45.0000, 23.0000, N'【季末清仓】BLACKGATEONE', CAST(0x0000ACDF00000000 AS DateTime), 12, N'8.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (14, N'GATEONE', 1, 12.0000, 23.0000, N'【季末清仓】ATEONE', CAST(0x0000ACE100000000 AS DateTime), 23, N'9.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (15, N'CREAZIONI', 1, 34.0000, 12.0000, N'【季末清仓】CREAZION', CAST(0x0000AD1D00000000 AS DateTime), 12, N'2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (16, N'MARC JACOBS', 2, 23.0000, 12.0000, N'MarcJcobs彩色时尚街头甜', CAST(0x0000ACE100000000 AS DateTime), 23, N'3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (17, N'SAINT LAURENT', 2, 12.0000, 23.0000, N'SaintLaurentParis/YSL圣罗兰男', CAST(0x0000ACFF00000000 AS DateTime), 12, N'5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (20, N'FGKSEA', 5, 45.0000, 23.0000, N'小闭包', CAST(0x0000ACE100000000 AS DateTime), 11, N'女鞋1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (21, N'DIANE VON', 3, 45.0000, 23.0000, N'衣服', CAST(0x0000AD0100000000 AS DateTime), 22, N'女装1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (22, N'DIANE VON', 3, 45.0000, 12.0000, N'衣服', CAST(0x0000AD0200000000 AS DateTime), 12, N'女装2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (24, N'DFEWR', 2, 23.0000, 34.0000, N'标记', CAST(0x0000AD93011DA500 AS DateTime), 34, N'1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (34, N'DFEWR', 2, 23.0000, 12.0000, N'裤子', CAST(0x0000ACE100000000 AS DateTime), 34, N'4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (35, N'DFEWR', 9, 45.0000, 23.0000, N'裤子', CAST(0x0000ADAF0153C090 AS DateTime), 45, N'配饰5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (36, N'EFJI', 4, 34.0000, 45.0000, N'衣服', CAST(0x0000ADAF009AE840 AS DateTime), 45, N'女包1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (37, N'KILGS', 4, 45.0000, 12.0000, N'裤子', CAST(0x0000ADA8009B2E90 AS DateTime), 12, N'女包3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (38, N'kfeFG', 4, 23.0000, 45.0000, N'标记', CAST(0x0000ADA1009BBB30 AS DateTime), 56, N'女包2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (39, N'YUJ', 4, 67.0000, 45.0000, N'衣服', CAST(0x0000ADA8009C0180 AS DateTime), 67, N'女包6.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (40, N'RTDFGF', 4, 56.0000, 34.0000, N'包包', CAST(0x0000ADA800B054A0 AS DateTime), 56, N'女包1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (41, N'DRTG', 5, 34.0000, 45.0000, N'女鞋', CAST(0x0000ADAF00B240D0 AS DateTime), 45, N'女鞋2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (42, N'RTHD', 5, 45.0000, 34.0000, N'女鞋', CAST(0x0000ADA700B2CD70 AS DateTime), 34, N'女鞋3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (43, N'DFEWR', 5, 34.0000, 56.0000, N'女鞋', CAST(0x0000ADAA00B2CD70 AS DateTime), 56, N'女鞋4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (44, N'KILGS', 5, 34.0000, 12.0000, N'女鞋', CAST(0x0000ADAF00B313C0 AS DateTime), 45, N'女鞋5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (45, N'kfeFG', 6, 78.0000, 123.0000, N'男装', CAST(0x0000ADAE00B80560 AS DateTime), 45, N'男装8.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (46, N'kfeFG', 6, 78.0000, 34.0000, N'男装', CAST(0x0000ADA800B89200 AS DateTime), 34, N'男装5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (47, N'EFJI', 6, 45.0000, 67.0000, N'男装', CAST(0x0000ADA700B9F190 AS DateTime), 45, N'男装4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (48, N'F', 6, 34.0000, 56.0000, N'男装', CAST(0x0000ADAB00BD83A0 AS DateTime), 34, N'男装5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (49, N'YUJ', 6, 23.0000, 12.0000, N'男装', CAST(0x0000ADA700BE1040 AS DateTime), 67, N'男装7.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (50, N'EFJI', 7, 23.0000, 67.0000, N'男包', CAST(0x0000ADA100C0CF60 AS DateTime), 23, N'男包1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (51, N'YUJ', 7, 78.0000, 34.0000, N'男包', CAST(0x0000ADA800C0CF60 AS DateTime), 34, N'男包2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (52, N'F', 7, 23.0000, 45.0000, N'男包', CAST(0x0000ADAD00C115B0 AS DateTime), 23, N'男包3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (53, N'KILGS', 7, 45.0000, 67.0000, N'男包', CAST(0x0000ADA100C15C00 AS DateTime), 45, N'男包4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (54, N'kfeFG', 7, 23.0000, 45.0000, N'男包', CAST(0x0000ADAE00C15C00 AS DateTime), 12, N'男包5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (55, N'DRTH', 8, 34.0000, 45.0000, N'男鞋', CAST(0x0000ADAB009BBB30 AS DateTime), 34, N'男鞋2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (56, N'DFEWR', 8, 56.0000, 34.0000, N'男鞋', CAST(0x0000ADAB009BBB30 AS DateTime), 45, N'男鞋2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (57, N'KILGS', 8, 45.0000, 67.0000, N'男鞋', CAST(0x0000ADAB009C47D0 AS DateTime), 45, N'男鞋4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (58, N'kfeFG', 8, 34.0000, 45.0000, N'男鞋', CAST(0x0000ADAD009C8E20 AS DateTime), 34, N'男鞋5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (59, N'KILGS', 8, 45.0000, 34.0000, N'男鞋', CAST(0x0000ADAD009CD470 AS DateTime), 45, N'男鞋6.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (60, N'BEISHI', 9, 56.0000, 34.0000, N'配饰', CAST(0x0000ADB400A0ACD0 AS DateTime), 45, N'配饰1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (61, N'PEISHI', 9, 45.0000, 34.0000, N'配饰', CAST(0x0000ADBD00A0F320 AS DateTime), 45, N'配饰2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (62, N'PEISHI', 9, 56.0000, 23.0000, N'配饰', CAST(0x0000ADAF00A13970 AS DateTime), 23, N'配饰3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (63, N'PEISHI', 9, 45.0000, 56.0000, N'配饰', CAST(0x0000ADAD00A13970 AS DateTime), 45, N'配饰5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (64, N'NVZHUANG', 3, 34.0000, 23.0000, N'女装', CAST(0x0000ADAD00A4CB80 AS DateTime), 45, N'女装4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (65, N'NVZHUANG', 3, 45.0000, 23.0000, N'女装', CAST(0x0000ADB500A8EA30 AS DateTime), 34, N'女装7.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (66, N'NVZHUANG', 3, 45.0000, 34.0000, N'女装', CAST(0x0000ADAF00A8EA30 AS DateTime), 45, N'女装9.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (67, N'DFEWR', 10, 23.0000, 34.0000, N'默认排序', CAST(0x0000ADA70174FC60 AS DateTime), 12, N'男装3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (68, N'DRFE', 10, 450.0000, 56.0000, N'默认排序', CAST(0x0000ADAF0174FC60 AS DateTime), 12, N'男鞋5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (69, N'kfeFG', 10, 56.0000, 34.0000, N'默认排序', CAST(0x0000ADA4017542B0 AS DateTime), 34, N'男包1.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (70, N'YUJ', 10, 34.0000, 23.0000, N'默认排序', CAST(0x0000ADAE01758900 AS DateTime), 34, N'男鞋4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (71, N'EFJI', 10, 34.0000, 23.0000, N'默认排序', CAST(0x0000ADA801758900 AS DateTime), 34, N'女鞋7.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (72, N'KILGS', 11, 34.0000, 23.0000, N'热销', CAST(0x0000ADA300DF9260 AS DateTime), 34, N'2.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (73, N'YUJ', 11, 45.0000, 23.0000, N'热销', CAST(0x0000ADA700DFD8B0 AS DateTime), 34, N'男包4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (74, N'KILGS', 12, 34.0000, 23.0000, N'折扣', CAST(0x0000ADB100E01F00 AS DateTime), 45, N'男包6.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (75, N'YUJ', 12, 34.0000, 23.0000, N'折扣', CAST(0x0000ADA000E01F00 AS DateTime), 12, N'女鞋6.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (76, N'YUJ', 13, 23.0000, 34.0000, N'价格', CAST(0x0000ADAC00E06550 AS DateTime), 34, N'男装7.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (77, N'YUJ', 12, 45.0000, 45.0000, N'gr', CAST(0x0000ADA600E17E90 AS DateTime), 34, N'男装3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (78, N'EFJI', 13, 45.0000, 56.0000, N'价格', CAST(0x0000ADA600E1C4E0 AS DateTime), 45, N'女鞋5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (79, N'RTG', 12, 450.0000, 67.0000, N'折扣', CAST(0x0000ADA500E20B30 AS DateTime), 42, N'女装5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (80, N'EFJI', 11, 56.0000, 78.0000, N'热销', CAST(0x0000ADA500E25180 AS DateTime), 45, N'男鞋5.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (81, N'F', 12, 43.0000, 56.0000, N'热销', CAST(0x0000ADAD00E297D0 AS DateTime), 34, N'配饰4.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (82, N'YUJ', 11, 67.0000, 34.0000, N'热销', CAST(0x0000ADA100E297D0 AS DateTime), 45, N'男装11.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (83, N'kfeFG', 13, 45.0000, 67.0000, N'价格', CAST(0x0000ADA100E2DE20 AS DateTime), 12, N'配饰7.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (84, N'F', 13, 56.0000, 34.0000, N'热销', CAST(0x0000ADA500E2DE20 AS DateTime), 34, N'男包3.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (86, N'价格', 5, 23.0000, 45.0000, N'裤子', CAST(0x0000ADDD009C47D0 AS DateTime), 0, N'8.jpg')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1, N'张三', N'123', N'12331', N'爱好', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (2, N'111', N'123', N'12312', N'阿萨', 2)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1005, N'张热', N'123', NULL, NULL, 5)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1006, N'张热', N'234', N'123214', N'美誉', 3)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1007, N'加油', N'234', N'3453', N'能行', 4)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Appraise] ADD  CONSTRAINT [DF_Appraise_RateTime]  DEFAULT (getdate()) FOR [RateTime]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Orderdate]  DEFAULT (getdate()) FOR [Orderdate]
GO
ALTER TABLE [dbo].[OrdersDetail] ADD  CONSTRAINT [DF_OrdersDetail_States]  DEFAULT ((0)) FOR [States]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Content]  DEFAULT (getdate()) FOR [Content]
GO
ALTER TABLE [dbo].[Appraise]  WITH CHECK ADD  CONSTRAINT [FK_Appraise_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Appraise] CHECK CONSTRAINT [FK_Appraise_Product]
GO
ALTER TABLE [dbo].[Appraise]  WITH CHECK ADD  CONSTRAINT [FK_Appraise_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Appraise] CHECK CONSTRAINT [FK_Appraise_Users]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([CateID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Product]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Delivery] FOREIGN KEY([DeliveryID])
REFERENCES [dbo].[Delivery] ([DeliveryID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Delivery]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Orders] FOREIGN KEY([OrdersID])
REFERENCES [dbo].[Orders] ([OrdersID])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Orders]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Product]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([CateID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Delivery] FOREIGN KEY([DeliveryID])
REFERENCES [dbo].[Delivery] ([DeliveryID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Delivery]
GO
