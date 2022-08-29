USE [C118_ianfrierson15_gmail]
GO

/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV3]    Script Date: 8/28/2022 6:50:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER       PROC [dbo].[Friends_SelectByIdV3]
		@Id int 

as
/*

Declare @Id int = 6;

Execute dbo.Friends_SelectByIdV3 @Id

Select @Id

		   Select *
		   From dbo.FriendsV2

*/

-- add a SKILLS TABLE 
--: Id int  not null   (PK) 
--: Name NVARCHAR(50) not nullable


-- add a FRIENDSKILLS table 
--: (PK) FriendId int  not null   FK _on FRIENDSV@ ID 
--: (PK) SkillId int  not null   FK on Skill ID
-- 

BEGIN


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
      ,f.[DateCreated]
      ,f.[DateModified]
      ,f.[UserId]
	  ,Skills = (
		    select  s.Id as id
					,s.Name as name
			From dbo.Skills s inner join dbo.FriendsSkill fs
					on fs.SkillId = s.Id
			Where fs.FriendId = f.Id
			For JSON AUTO
				)
		from dbo.Images as i inner join dbo.FriendsV2 as f
		on i.Id = f.PrimaryImageId
		inner join dbo.FriendsSkill as fs
		on f.Id = fs.FriendId
		where f.Id = @Id


END
GO

