-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CreateBudgetItem
	-- Add the parameters for the stored procedure here
	@HouseholdId nvarchar(max),
	@CategoryId int,
	@DefaultAmt decimal = null,
	@Jan decimal = null,
	@Feb decimal = null,
	@Mar decimal = null,
	@Apr decimal = null,
	@May decimal = null,
	@Jun decimal = null,
	@Jul decimal = null,
	@Aug decimal = null,
	@Sep decimal = null,
	@Oct decimal = null,
	@Nov decimal = null,
	@Dec decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[BudgetItems]
           ([HouseholdId]
           ,[CategoryId]
           ,[DefaultAmount]
           ,[Jan]
           ,[Feb]
           ,[Mar]
           ,[Apr]
           ,[May]
           ,[Jun]
           ,[Jul]
           ,[Aug]
           ,[Sep]
           ,[Oct]
           ,[Nov]
           ,[Dec])
     VALUES
           (@HouseholdId,
			@CategoryId,
			CASE WHEN @DefaultAmt IS NOT NULL THEN @DefaultAmt ELSE 0 END,
			CASE WHEN @Jan IS NOT NULL THEN @Jan ELSE 0 END,
			CASE WHEN @Feb IS NOT NULL THEN @Feb ELSE 0 END,
			CASE WHEN @Mar IS NOT NULL THEN @Mar ELSE 0 END,
			CASE WHEN @Apr IS NOT NULL THEN @Apr ELSE 0 END,
			CASE WHEN @May IS NOT NULL THEN @May ELSE 0 END,
			CASE WHEN @Jun IS NOT NULL THEN @Jun ELSE 0 END,
			CASE WHEN @Jul IS NOT NULL THEN @Jul ELSE 0 END,
			CASE WHEN @Aug IS NOT NULL THEN @Aug ELSE 0 END,
			CASE WHEN @Sep IS NOT NULL THEN @Sep ELSE 0 END,
			CASE WHEN @Oct IS NOT NULL THEN @Oct ELSE 0 END,
			CASE WHEN @Nov IS NOT NULL THEN @Nov ELSE 0 END,
			CASE WHEN @Dec IS NOT NULL THEN @Dec ELSE 0 END)
END