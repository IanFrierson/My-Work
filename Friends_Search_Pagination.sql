USE [C118_ianfrierson15_gmail]
GO

/****** Object:  StoredProcedure [dbo].[Friends_Search_PaginationV3]    Script Date: 8/28/2022 6:50:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER     PROC [dbo].[Friends_Search_PaginationV3]
					@PageIndex int
					,@PageSize int
					,@Query nvarchar(50)




AS
/*
Execute dbo.Friends_Serach_PaginationV3

SELECT *
FROM dbo.FriendsV2

*/


BEGIN


 Declare @offset int = @PageIndex *
 @PageSize

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
			 
		

      

  WHERE (f.Id LIKE '%' + @Query + '%'
  OR
		PrimaryImageId LIKE '%' +
 @Query + '%' OR
		Title LIKE '%' + @Query
 + '%')
	ORDER BY f.Id 
		OFFSET @offset ROWS 
		FETCH NEXT @PageSize ROWS ONLY


END
GO

