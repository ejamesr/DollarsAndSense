-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CreateHousehold
	-- Add the parameters for the stored procedure here
	@householdId nvarchar(max),
	@name nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Households]
           ([Name]
           ,[HouseholdId])
     VALUES
           (@name, @householdId)
END