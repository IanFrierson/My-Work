USE [C118_ianfrierson15_gmail]
GO

/****** Object:  Table [dbo].[FriendsV2]    Script Date: 8/28/2022 6:41:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FriendsV2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Bio] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](50) NOT NULL,
	[Headline] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
	[PrimaryImageId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_FriendsV2_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FriendsV2] ADD  CONSTRAINT [DF_FriendsV2_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[FriendsV2] ADD  CONSTRAINT [DF_FriendsV2_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO

ALTER TABLE [dbo].[FriendsV2]  WITH CHECK ADD  CONSTRAINT [FK_FriendsV2_Images] FOREIGN KEY([PrimaryImageId])
REFERENCES [dbo].[Images] ([Id])
GO

ALTER TABLE [dbo].[FriendsV2] CHECK CONSTRAINT [FK_FriendsV2_Images]
GO

ALTER TABLE [dbo].[FriendsV2]  WITH CHECK ADD  CONSTRAINT [FK_FriendsV2_Images1] FOREIGN KEY([PrimaryImageId])
REFERENCES [dbo].[Images] ([Id])
GO

ALTER TABLE [dbo].[FriendsV2] CHECK CONSTRAINT [FK_FriendsV2_Images1]
GO

