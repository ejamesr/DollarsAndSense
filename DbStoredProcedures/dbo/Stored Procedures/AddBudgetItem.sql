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
	@Jan decimal = -1.0,
	@Feb decimal = -1.0,
	@Mar decimal = -1.0,
	@Apr decimal = -1.0,
	@May decimal = -1.0,
	@Jun decimal = -1.0,
	@Jul decimal = -1.0,
	@Aug decimal = -1.0,
	@Sep decimal = -1.0,
	@Oct decimal = -1.0,
	@Nov decimal = -1.0,
	@Dec decimal = -1.0
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
			CASE WHEN @Jan >= 0.0 THEN @Jan ELSE @DefaultAmt END,
			CASE WHEN @Feb >= 0.0 THEN @Feb ELSE @DefaultAmt END,
			CASE WHEN @Mar >= 0.0 THEN @Mar ELSE @DefaultAmt END,
			CASE WHEN @Apr >= 0.0 THEN @Apr ELSE @DefaultAmt END,
			CASE WHEN @May >= 0.0 THEN @May ELSE @DefaultAmt END,
			CASE WHEN @Jun >= 0.0 THEN @Jun ELSE @DefaultAmt END,
			CASE WHEN @Jul >= 0.0 THEN @Jul ELSE @DefaultAmt END,
			CASE WHEN @Aug >= 0.0 THEN @Aug ELSE @DefaultAmt END,
			CASE WHEN @Sep >= 0.0 THEN @Sep ELSE @DefaultAmt END,
			CASE WHEN @Oct >= 0.0 THEN @Oct ELSE @DefaultAmt END,
			CASE WHEN @Nov >= 0.0 THEN @Nov ELSE @DefaultAmt END,
			CASE WHEN @Dec >= 0.0 THEN @Dec ELSE @DefaultAmt END,
			0,0,0,0,0,0,0,0,0,0,0,0)
	RETURN 51
END