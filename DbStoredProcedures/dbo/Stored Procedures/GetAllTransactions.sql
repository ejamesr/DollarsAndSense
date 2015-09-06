CREATE PROCEDURE [dbo].[GetAllTransactions]
	@account int
AS
	SELECT * FROM Transactions WHERE AccountId = @account
	ORDER BY Date
RETURN 0