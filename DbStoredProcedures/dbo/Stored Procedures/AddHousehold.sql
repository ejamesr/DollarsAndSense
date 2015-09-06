-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddHousehold]
	-- Add the parameters for the stored procedure here
	@householdId nvarchar(max),
	@name nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @result table (Id nvarchar(128))
    -- Insert statements for procedure here
	INSERT INTO [dbo].[Households]
           ([Name]
           ,[HouseholdId])
	-- Get Id of newly created row
	OUTPUT inserted.Id into @result
	VALUES
           (@name, @householdId)
	-- and return the just-created row
	SELECT * FROM Households
	WHERE (SELECT Id from @result) = Id
END