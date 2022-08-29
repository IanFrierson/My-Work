USE [C118_ianfrierson15_gmail]
GO

/****** Object:  StoredProcedure [dbo].[Friends_Update]    Script Date: 8/28/2022 6:51:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER proc [dbo].[Friends_Update]
		@Id int
		,@Title nvarchar(50) 
		,@Bio nvarchar(50) 
		,@Summary nvarchar(50) 
		,@Headline nvarchar(50) 
		,@Slug nvarchar(50) 
		,@StatusId int 
		,@PrimaryImageUrl nvarchar(50)

		,@UserId int 

as
/*
	Declare @Id int = 6;

	Declare @Title nvarchar(50) = 'Kermitt'
		,@Bio nvarchar(50) = 'SQL Coder'
		,@Summary nvarchar(50) = 'I Love Code'
		,@Headline nvarchar(50) = 'SQL'
		,@Slug nvarchar(50) = 'logansql.com'
		,@StatusId int = 12
		,@PrimaryImageUrl nvarchar(50) = 'https://picsum.photos/200/300'
		
		,@UserId int = 3333

		Select *
		From dbo.Friends
		Where Id = @Id

	Execute dbo.Friends_Update
							 @Id
							,@Title 
							,@Bio 
							,@Summary 
							,@Headline 
							,@Slug 
							,@StatusId 
							,@PrimaryImageUrl 
							
							,@UserId 

		Select *
		From dbo.Friends
		Where Id = @Id

*/

BEGIN 

UPDATE [dbo].[Friends]
   SET [Title] = @Title
    ,[Bio]  = @Bio
	,[Summary] = @Summary
	,[Headline] = @Headline
	,[Slug]  = @Slug
	,[StatusId] = @StatusId
	,[PrimaryImageUrl] = @PrimaryImageUrl
	,[DateModified] = getutcdate()
	,[UserId]  = @UserId

 WHERE Id = @Id

END
GO

