-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveTransaction]
	-- Add the parameters for the stored procedure here
	@TransId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Get the original transaction value before removing the transaction
	DECLARE @AmtToReverse decimal, @BankAcct int
	SELECT @AmtToReverse = -t.Amount, @BankAcct = t.AccountId FROM Transactions t
	WHERE t.Id = @TransId

    -- Insert statements for procedure here
	DELETE FROM Transactions WHERE AccountId = @TransId

	-- And now update the account balance...
	EXEC dbo.UpdateAccountBal @BankAcct, @AmtToReverse
END