SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[get_user_role]

AS
BEGIN
	
SET NOCOUNT ON;
  
SELECT
	a.Id,
	a.UserName,
	a.Email,
	d.Name Agency,
	e.Name AgencyParent,
	c.Name Role,
	CASE
		WHEN c.Name = 'Moderator' THEN
		1 ELSE 0 
	END IsAuthorize INTO #temp 
FROM
	[User] a
	LEFT JOIN [UserRole] b ON a.Id = b.UserId
	LEFT JOIN [Role] c ON b.RoleId = c.Id
	LEFT JOIN [Agency] d ON a.Id = d.UserId
	LEFT JOIN [Agency] e ON d.ParentId = e.Id SELECT
	temp.Id UserId,
	temp.UserName,
	temp.Agency,
	temp.AgencyParent,
	temp.Email,
	CAST(SUM (IsAuthorize) AS BIT) IsAuthorize,
	STUFF(
		(
		SELECT
			', ' + CAST (Role AS VARCHAR(MAX)) 
		FROM
			#temp 
		WHERE
			(Id = temp.ID) FOR XML PATH (''), TYPE).value ('.', 'VARCHAR(MAX)'), 1, 2, ''
	) AS RolesName 
FROM
	#temp temp 
GROUP BY
	temp.Id,
	temp.UserName,
	temp.Agency,
	temp.AgencyParent,
	temp.Email 
DROP TABLE #temp

END
