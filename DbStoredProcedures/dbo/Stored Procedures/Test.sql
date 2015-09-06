CREATE PROCEDURE [dbo].[Test]
	@Id int = 0,
	@param2 int
AS
	SELECT * FROM Transactions WHERE Transactions.Id = @Id
RETURN 0