USE [C118_ianfrierson15_gmail]
GO

/****** Object:  StoredProcedure [dbo].[Friends_InsertV2]    Script Date: 8/28/2022 6:44:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE    proc [dbo].[Friends_InsertV2]
					@Title nvarchar(50) 
					,@Bio nvarchar(50) 
					,@Summary nvarchar(50) 
					,@Headline nvarchar(50) 
					,@Slug nvarchar(50)
					,@StatusId int
					--,@PrimaryImageId int
					,@ImageTypeId int
					,@ImageUrl nvarchar(50)
					,@UserId int
					,@Id int OUTPUT
as
/*
Declare @Id int = 0;

Declare @Title nvarchar(50) = 'Shawn'
					,@Bio nvarchar(50) = 'SQL Coder'
					,@Summary nvarchar(50) = 'I Love Code!'
					,@Headline nvarchar(50) = 'SQL'
					,@Slug nvarchar(50) = 'logansql.com'
					,@StatusId int = 13
					,@PrimaryImageId int = 1
					,@ImageTypeId int = 3
					,@ImageUrl nvarchar(50) = 'https://picsum.photos/200/300'
					,@UserId int = 321


		   Execute dbo.Friends_InsertV2 
					@Title  
					,@Bio 
					,@Summary 
					,@Headline  
					,@Slug 
					,@StatusId 
					,@PrimaryImageId
					,@ImageTypeId
					,@ImageUrl
					,@UserId
					,@Id OUTPUT

		
		
		   Select @Id

		   Select *
		   From dbo.FriendsV2
		   Where Id = @Id 

*/

BEGIN

DECLARE @ImageId int = 0;

INSERT INTO [dbo].[Images]
		(TypeId
		,[Url])
			
			VALUES 
				(@ImageTypeId
				,@ImageUrl)

			SET @ImageId = SCOPE_IDENTITY()

INSERT INTO [dbo].[FriendsV2]
           ([Title]
           ,[Bio]
           ,[Summary]
           ,[Headline]
           ,[Slug]
           ,[StatusId]
           ,[PrimaryImageId]
           ,[UserId])
     VALUES
           (@Title  
			,@Bio 
		    ,@Summary 
			,@Headline 
			,@Slug 
			,@StatusId 
			,@ImageId
			,@UserId)

			SET @Id = SCOPE_IDENTITY()
			

END
GO

