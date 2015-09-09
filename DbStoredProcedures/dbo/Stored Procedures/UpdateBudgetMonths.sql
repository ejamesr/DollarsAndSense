-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateBudgetMonths]
	-- Add the parameters for the stored procedure here
    -- One or more months may be specified, only those specified will be modified
	@Id int,
	@JanBudget decimal,
	@FebBudget decimal,
	@MarBudget decimal,
	@AprBudget decimal,
	@MayBudget decimal,
	@JunBudget decimal,
	@JulBudget decimal,
	@AugBudget decimal,
	@SepBudget decimal,
	@OctBudget decimal,
	@NovBudget decimal,
	@DecBudget decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure
	UPDATE dbo.BudgetItems
	SET JanBudget = @JanBudget,
		FebBudget = @FebBudget,
		MarBudget = @MarBudget,
		AprBudget = @AprBudget,
		MayBudget = @MayBudget,
		JunBudget = @JunBudget,
		JulBudget = @JulBudget,
		AugBudget = @AugBudget,
		SepBudget = @SepBudget,
		OctBudget = @OctBudget,
		NovBudget = @NovBudget,
		DecBudget = @DecBudget
	WHERE Id = @Id
	RETURN 53
END
