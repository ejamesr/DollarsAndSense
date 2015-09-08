-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateBudgetDefaultAmt]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Amt decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure
	UPDATE dbo.BudgetItems
	SET JanBudget = @Amt,
		FebBudget = @Amt,
		MarBudget = @Amt,
		AprBudget = @Amt,
		MayBudget = @Amt,
		JunBudget = @Amt,
		JulBudget = @Amt,
		AugBudget = @Amt,
		SepBudget = @Amt,
		OctBudget = @Amt,
		NovBudget = @Amt,
		DecBudget = @Amt
	WHERE Id = @Id
END
