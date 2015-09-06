-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetHouseholdUsers]
	-- Add the parameters for the stored procedure here
	@householdId nvarchar(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, HouseholdId, Name, Email, UserName FROM AspNetUsers
	WHERE HouseholdId = @householdId
END
