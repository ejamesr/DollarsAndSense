-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE RemoveBankAccount
	-- Add the parameters for the stored procedure here
	@AccountId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Transactions
	WHERE AccountId = @AccountId
	DELETE FROM Accounts
	WHERE Id = @AccountId
END