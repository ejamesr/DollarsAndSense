-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE LeaveHousehold
	@email nvarchar(max),
	@householdId nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[AspNetUsers]
   SET [HouseholdId] = null
 WHERE email = @email AND HouseholdId = @householdId
END