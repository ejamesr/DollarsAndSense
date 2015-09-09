-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddCategory]
	-- Add the parameters for the stored procedure here
	@HouseholdId nvarchar(max),
	@Name nvarchar(max),
	@Type int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @result table (Id nvarchar(128))

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Categories]
           ([HouseholdId]
           ,[Name]
           ,[Type])
	-- Get Id of newly created row
	OUTPUT inserted.Id into @result
    VALUES
           (@HouseholdId
           ,@Name
           ,@Type)
	-- and return the just-created row
	SELECT * FROM Categories
	WHERE (SELECT Id from @result) = Id
END