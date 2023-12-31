Create Database [ChangDB]
GO

USE [ChangDB]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 2023/8/23 20:15:13 ******/
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
/****** Object:  Table [dbo].[Appraise]    Script Date: 2023/8/23 20:15:13 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2023/8/23 20:15:13 ******/
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
/****** Object:  Table [dbo].[Delivery]    Script Date: 2023/8/23 20:15:13 ******/
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
/****** Object:  Table [dbo].[Favorite]    Script Date: 2023/8/23 20:15:13 ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 2023/8/23 20:15:13 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/8/23 20:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersID] [int] IDENTITY(1,1) NOT NULL,
	[Orderdate] [date] NOT NULL CONSTRAINT [DF_Orders_Orderdate]  DEFAULT (getdate()),
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
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 2023/8/23 20:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrdersID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[States] [int] NULL CONSTRAINT [DF_OrdersDetail_States]  DEFAULT ((0)),
 CONSTRAINT [PK_OrdersDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 2023/8/23 20:15:13 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2023/8/23 20:15:13 ******/
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
	[Content] [nvarchar](max) NULL CONSTRAINT [DF_Product_Content]  DEFAULT (getdate()),
	[PostTime] [datetime] NULL,
	[Stock] [int] NOT NULL,
	[Photo] [nvarchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2023/8/23 20:15:13 ******/
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

INSERT [dbo].[AdminUser] ([SuID], [UserName], [Pwd], [Role]) VALUES (1, N'111', N'123', 0)
INSERT [dbo].[AdminUser] ([SuID], [UserName], [Pwd], [Role]) VALUES (2, N'张热', N'123', 0)
INSERT [dbo].[AdminUser] ([SuID], [UserName], [Pwd], [Role]) VALUES (3, N'admin', N'123', 0)
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (1, N'推荐', 1)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (2, N'推荐', 2)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (3, N'推荐', 3)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (4, N'衣服', 4)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (5, N'裤子', 5)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (6, N'鞋子', 6)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (7, N'手表', 7)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (8, N'裙子', 8)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (9, N'空', 9)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (10, N'默认排序', 10)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (11, N'热销', 11)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (12, N'价格', 12)
INSERT [dbo].[Category] ([CateID], [CateName], [ParentID]) VALUES (13, N'折扣', 13)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (1, 5, N'888', N'湖南1', N'15523871234')
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (2, 2, N'666', N'新疆1', N'15563872345')
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (3, 1006, N'张三', N'湖南', N'15563872345')
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (4, 3, N'张三', N'湖南', N'15563872345')
INSERT [dbo].[Delivery] ([DeliveryID], [UserID], [Consignee], [Complete], [Phone]) VALUES (5, 2, N'张三', N'湖南', N'15563872345')
SET IDENTITY_INSERT [dbo].[Delivery] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (1, N'大减价', N'默认排序', N'价格优惠', N'1.jpg', CAST(N'2021-03-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (2, N'最优活动', N'热销', N'价格优惠', N'2.jpg', CAST(N'2021-03-04 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (3, N'大减价', N'价格', N'价格优惠', N'3.jpg', CAST(N'2021-04-03 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (4, N'最优活动', N'折扣', N'价格优惠', N'4.jpg', CAST(N'2021-04-05 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (5, N'大减价', N'折扣', N'裤子', N'1.jpg', CAST(N'2020-02-03 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (4, CAST(N'2021-03-04' AS Date), 2, 34.0000, 1, CAST(N'2021-04-03' AS Date), 2, N'加油')
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (5, CAST(N'2023-04-05' AS Date), 1, 45.0000, 2, CAST(N'2021-11-16' AS Date), 3, N'23')
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (6, CAST(N'2023-04-05' AS Date), 1006, 23.0000, 3, CAST(N'2023-05-03' AS Date), 2, N'45')
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (7, CAST(N'2021-03-04' AS Date), 1007, NULL, 4, CAST(N'2021-04-03' AS Date), 1, N'34')
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (8, CAST(N'2021-11-16' AS Date), 1, 23.0000, 1, CAST(N'2021-11-16' AS Date), 3, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (9, CAST(N'2021-11-16' AS Date), 1, 147.0000, 1, CAST(N'2021-11-16' AS Date), 3, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (10, CAST(N'2023-05-18' AS Date), 2, 378.0000, 2, NULL, 1, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (11, CAST(N'2023-05-19' AS Date), 2, 56.0000, 2, NULL, 1, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (12, CAST(N'2023-05-22' AS Date), 2, 189.0000, 2, CAST(N'2023-06-05' AS Date), 3, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (13, CAST(N'2023-05-22' AS Date), 2, 2847.0000, 2, CAST(N'2023-06-05' AS Date), 3, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (14, CAST(N'2023-05-25' AS Date), 2, 134.0000, 2, CAST(N'2023-06-05' AS Date), 3, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (15, CAST(N'2023-05-30' AS Date), 2, 68.0000, 2, CAST(N'2023-06-05' AS Date), 3, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (16, CAST(N'2023-06-06' AS Date), 1, 23.0000, 1, NULL, 2, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (17, CAST(N'2023-06-06' AS Date), 1, 23.0000, 1, NULL, 2, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (18, CAST(N'2023-06-06' AS Date), 2, 23.0000, 2, NULL, 2, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (19, CAST(N'2023-06-06' AS Date), 1, 12.0000, 1, NULL, 2, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (20, CAST(N'2023-06-20' AS Date), 2, 189.0000, 2, NULL, 1, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (21, CAST(N'2023-06-20' AS Date), 2, 189.0000, 2, NULL, 1, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (22, CAST(N'2023-06-26' AS Date), 2, 23.0000, 2, NULL, 1, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (23, CAST(N'2023-06-26' AS Date), 2, 23.0000, 2, NULL, 1, NULL)
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserID], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (24, CAST(N'2023-06-26' AS Date), 2, 12.0000, 2, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrdersDetail] ON 

INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (3, 4, 3, 23, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (4, 5, 4, 23, 2)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (5, 6, 5, 12, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (10, 7, 13, 23, 2)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (11, 8, 21, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (12, 9, 20, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (13, 9, 4, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (14, 10, 3, 2, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (15, 11, 63, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (16, 12, 3, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (17, 13, 3, 15, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (18, 13, 22, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (19, 14, 53, 2, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (20, 15, 76, 2, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (21, 16, 5, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (22, 17, 8, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (23, 18, 5, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (24, 19, 7, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (25, 20, 3, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (26, 21, 3, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (27, 22, 64, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (28, 23, 21, 1, 1)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductID], [Quantity], [States]) VALUES (29, 24, 22, 1, 1)
SET IDENTITY_INSERT [dbo].[OrdersDetail] OFF
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (3, 3, N'1.jpg')
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (4, 4, N'2.jpg')
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (5, 5, N'3.jpg')
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (6, 7, N'4.jpg')
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (7, 13, N'8.jpg')
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (8, 14, N'9.jpg')
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (9, 15, N'2.jpg')
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (10, 16, N'3.jpg')
INSERT [dbo].[Photo] ([PhotoID], [ProductID], [PhotoUrl]) VALUES (11, 17, N'5.jpg')
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (3, N'polo领修身连衣裙秋冬女2023新款女装美式学院风裙子', 4, 199.0000, 189.0000, N'衣服', CAST(N'2021-01-02 00:00:00.000' AS DateTime), 14, N'衣服1.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (4, N'气质吊带连衣裙春夏新款吊带纯欲风碎花短裙', 4, 167.0000, 124.0000, N'衣服', CAST(N'2021-03-04 00:00:00.000' AS DateTime), 23, N'衣服2.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (5, N'爆款基础款衬衫夏季男短袖棉麻套头百搭舒适男士衬衫', 4, 245.0000, 23.0000, N'衣服', CAST(N'2021-03-04 00:00:00.000' AS DateTime), 10, N'衣服3.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (7, N'冬季羽绒服男韩系男友风袖字母印花休闲男士羽绒服', 4, 234.0000, 12.0000, N'衣服', CAST(N'2021-04-05 00:00:00.000' AS DateTime), 11, N'衣服4.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (8, N'【中国心系列】2023夏季新款水洗宽松中腰小脚男士牛仔裤', 5, 34.0000, 23.0000, N'裤子', CAST(N'2023-02-03 00:00:00.000' AS DateTime), 11, N'裤子1.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (13, N'牛仔裤男士秋季2023年潮牌ins宽松直筒浅色休闲裤子男式韩版潮流', 5, 45.0000, 23.0000, N'裤子', CAST(N'2021-03-02 00:00:00.000' AS DateTime), 12, N'裤子2.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (14, N'夏季新款牙刷绣宽松五分男士休闲中裤短裤', 5, 12.0000, 23.0000, N'裤子', CAST(N'2021-03-04 00:00:00.000' AS DateTime), 23, N'裤子3.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (15, N'【小白鞋女】板鞋女鞋新款透气透气休闲鞋女百搭潮流运动鞋女', 6, 34.0000, 12.0000, N'鞋子', CAST(N'2021-05-03 00:00:00.000' AS DateTime), 12, N'鞋子1.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (16, N'QIAODAN高帮男板鞋百搭耐磨防滑经典男士运动休闲鞋', 6, 23.0000, 12.0000, N'鞋子', CAST(N'2021-03-04 00:00:00.000' AS DateTime), 23, N'鞋子2.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (17, N'厚底小白鞋女2023年百搭萌趣面包鞋女板鞋休闲运动鞋女', 6, 12.0000, 23.0000, N'鞋子', CAST(N'2021-04-03 00:00:00.000' AS DateTime), 12, N'鞋子3.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (20, N'【天丝面料】夏季露肩连衣裙女甜辣显瘦别致小心机A字短裙', 8, 45.0000, 23.0000, N'裙子', CAST(N'2021-03-04 00:00:00.000' AS DateTime), 11, N'裙子1.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (21, N'2023夏季新款A字半身裙女减龄垂感高腰百搭中长款半截裙', 8, 45.0000, 23.0000, N'裙子', CAST(N'2021-04-05 00:00:00.000' AS DateTime), 21, N'裙子2.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (22, N'polo领连衣裙女收腰修身显瘦甜辣风短袖裙子女', 8, 45.0000, 12.0000, N'裙子', CAST(N'2021-04-06 00:00:00.000' AS DateTime), 10, N'裙子3.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (39, N'裙子女2023新款法式气质收腰显瘦连衣裙中长款甜美v领碎花裙', 8, 67.0000, 45.0000, N'裙子', CAST(N'2021-09-19 09:28:00.000' AS DateTime), 67, N'裙子4.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (53, N'多功能手表男士夜光石英防水潮牌男表新款防水名牌表', 7, 45.0000, 67.0000, N'手表', CAST(N'2021-09-12 11:44:00.000' AS DateTime), 43, N'手表1.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (63, N'绿水鬼手表男石英全自动手表运动防水夜光男士腕表', 7, 45.0000, 56.0000, N'手表', CAST(N'2021-09-24 09:47:00.000' AS DateTime), 44, N'手表2.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (64, N'男士石英表夜光手表防水月相男表-升级版', 7, 34.0000, 23.0000, N'手表', CAST(N'2021-09-24 10:00:00.000' AS DateTime), 44, N'手表3.jpg')
INSERT [dbo].[Product] ([ProductID], [Title], [CateID], [MarketPrice], [Price], [Content], [PostTime], [Stock], [Photo]) VALUES (76, N'男士石英表夜光手表防水月相男表-升级版', 7, 23.0000, 34.0000, N'手表', CAST(N'2021-09-23 13:37:00.000' AS DateTime), 32, N'手表4.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1, N'张三', N'123', N'12331', N'小帅', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (2, N'111', N'123', N'12312', N'小美', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1005, N'张热', N'123', N'12312', N'阿热', 5)
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1006, N'小厮', N'234', N'123214', N'小厮', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1007, N'加油', N'234', N'3453', N'能行', 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Appraise] ADD  CONSTRAINT [DF_Appraise_RateTime]  DEFAULT (getdate()) FOR [RateTime]
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
