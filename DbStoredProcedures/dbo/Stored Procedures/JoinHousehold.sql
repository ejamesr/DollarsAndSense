-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JoinHousehold]
	-- Add the parameters for the stored procedure here
	@email nvarchar(max),
	@householdId nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[AspNetUsers]
	   SET [HouseholdId] = @householdId
	WHERE email = @email
	RETURN 34
END
