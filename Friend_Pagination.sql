USE [C118_ianfrierson15_gmail]
GO

/****** Object:  StoredProcedure [dbo].[Friends_PaginationV3]    Script Date: 8/28/2022 6:49:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER     PROC [dbo].[Friends_PaginationV3] 
					@PageIndex int 
                   ,@PageSize int
				  


AS
/*
		Declare @PageIndex int = 5
				,@PageSize int = 5
		

		Execute dbo.Friends_PaginationV3
				@PageIndex
				,@PageSize
			

*/

BEGIN

	  Declare @offset int = @PageIndex * @PageSize

		SELECT f.[Id]
			  ,i.[Url]
			  ,i.[Id]
			  ,i.[TypeId]
			  ,f.[Title]
			  ,f.[Bio]
			  ,f.[Summary]
			  ,f.[Headline]
			  ,f.[Slug]
			  ,f.[StatusId]
			  ,f.[DateModified]
			  ,f.[DateCreated]
			  ,f.[UserId]
			  ,TotalCount = COUNT(1) OVER()
			 
		FROM [dbo].[FriendsV2]  AS f INNER JOIN [dbo].[Images] AS i
		ON f.PrimaryImageId = i.Id
	

		ORDER BY f.Id

		
		OFFSET @offSet Rows
		Fetch Next @PageSize Rows ONLY


END
GO

