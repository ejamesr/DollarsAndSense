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
	SELECT u.Id as UserId, u.Name as UserName, u.Email as UserEmail, h.HouseholdId, h.Name as HouseholdName
	FROM AspNetUsers as u
	INNER JOIN Households as h ON u.HouseholdId = h.HouseholdId
	WHERE u.HouseholdId = @householdId 
END
