-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateBudgetMonths]
	-- Add the parameters for the stored procedure here
    -- One or more months may be specified, only those specified will be modified
	@Id int,
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

    -- Insert statements for procedure
	UPDATE dbo.BudgetItems
	SET Jan = CASE WHEN @Jan IS NOT NULL THEN @Jan ELSE Jan END,
		Feb = CASE WHEN @Feb IS NOT NULL THEN @Feb ELSE Feb END,
		Mar = CASE WHEN @Mar IS NOT NULL THEN @Mar ELSE Mar END,
		Apr = CASE WHEN @Apr IS NOT NULL THEN @Apr ELSE Apr END,
		May = CASE WHEN @May IS NOT NULL THEN @May ELSE May END,
		Jun = CASE WHEN @Jun IS NOT NULL THEN @Jun ELSE Jun END,
		Jul = CASE WHEN @Jul IS NOT NULL THEN @Jul ELSE Jul END,
		Aug = CASE WHEN @Aug IS NOT NULL THEN @Aug ELSE Aug END,
		Sep = CASE WHEN @Sep IS NOT NULL THEN @Sep ELSE Sep END,
		Oct = CASE WHEN @Oct IS NOT NULL THEN @Oct ELSE Oct END,
		Nov = CASE WHEN @Nov IS NOT NULL THEN @Nov ELSE Nov END,
		Dec = CASE WHEN @Dec IS NOT NULL THEN @Dec ELSE Dec END
	WHERE Id = @Id
END
