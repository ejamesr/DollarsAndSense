-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UpdateBudgetDefaultAmt
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
	SET Jan = @Amt,
		Feb = @Amt,
		Mar = @Amt,
		Apr = @Amt,
		May = @Amt,
		Jun = @Amt,
		Jul = @Amt,
		Aug = @Amt,
		Sep = @Amt,
		Oct = @Amt,
		Nov = @Amt,
		Dec = @Amt
	WHERE Id = @Id
END