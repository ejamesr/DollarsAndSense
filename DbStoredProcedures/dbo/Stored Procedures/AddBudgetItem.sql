-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Add a new Budget item
-- =============================================
CREATE PROCEDURE [dbo].[AddBudgetItem]
	-- Add the parameters for the stored procedure here
	@HouseholdId nvarchar(max),
	@CategoryId int,
	@DefaultAmt decimal = 0,
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
           ,[JanBudget]
           ,[FebBudget]
           ,[MarBudget]
           ,[AprBudget]
           ,[MayBudget]
           ,[JunBudget]
           ,[JulBudget]
           ,[AugBudget]
           ,[SepBudget]
           ,[OctBudget]
           ,[NovBudget]
           ,[DecBudget]
           ,[JanActual]
           ,[FebActual]
           ,[MarActual]
           ,[AprActual]
           ,[MayActual]
           ,[JunActual]
           ,[JulActual]
           ,[AugActual]
           ,[SepActual]
           ,[OctActual]
           ,[NovActual]
           ,[DecActual])
     VALUES
           (@HouseholdId,
			@CategoryId,
			@DefaultAmt,
			CASE WHEN @Jan IS NOT NULL THEN @Jan ELSE @DefaultAmt END,
			CASE WHEN @Feb IS NOT NULL THEN @Feb ELSE @DefaultAmt END,
			CASE WHEN @Mar IS NOT NULL THEN @Mar ELSE @DefaultAmt END,
			CASE WHEN @Apr IS NOT NULL THEN @Apr ELSE @DefaultAmt END,
			CASE WHEN @May IS NOT NULL THEN @May ELSE @DefaultAmt END,
			CASE WHEN @Jun IS NOT NULL THEN @Jun ELSE @DefaultAmt END,
			CASE WHEN @Jul IS NOT NULL THEN @Jul ELSE @DefaultAmt END,
			CASE WHEN @Aug IS NOT NULL THEN @Aug ELSE @DefaultAmt END,
			CASE WHEN @Sep IS NOT NULL THEN @Sep ELSE @DefaultAmt END,
			CASE WHEN @Oct IS NOT NULL THEN @Oct ELSE @DefaultAmt END,
			CASE WHEN @Nov IS NOT NULL THEN @Nov ELSE @DefaultAmt END,
			CASE WHEN @Dec IS NOT NULL THEN @Dec ELSE @DefaultAmt END,
			0,0,0,0,0,0,0,0,0,0,0,0)
END