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
	SET JanBudget = CASE WHEN @Jan IS NOT NULL THEN @Jan ELSE JanBudget END,
		FebBudget = CASE WHEN @Feb IS NOT NULL THEN @Feb ELSE FebBudget END,
		MarBudget = CASE WHEN @Mar IS NOT NULL THEN @Mar ELSE MarBudget END,
		AprBudget = CASE WHEN @Apr IS NOT NULL THEN @Apr ELSE AprBudget END,
		MayBudget = CASE WHEN @May IS NOT NULL THEN @May ELSE MayBudget END,
		JunBudget = CASE WHEN @Jun IS NOT NULL THEN @Jun ELSE JunBudget END,
		JulBudget = CASE WHEN @Jul IS NOT NULL THEN @Jul ELSE JulBudget END,
		AugBudget = CASE WHEN @Aug IS NOT NULL THEN @Aug ELSE AugBudget END,
		SepBudget = CASE WHEN @Sep IS NOT NULL THEN @Sep ELSE SepBudget END,
		OctBudget = CASE WHEN @Oct IS NOT NULL THEN @Oct ELSE OctBudget END,
		NovBudget = CASE WHEN @Nov IS NOT NULL THEN @Nov ELSE NovBudget END,
		DecBudget = CASE WHEN @Dec IS NOT NULL THEN @Dec ELSE DecBudget END
	WHERE Id = @Id
END
