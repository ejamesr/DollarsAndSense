CREATE PROCEDURE [dbo].[GetTransaction]
	@id int
AS
	SELECT * FROM Transactions WHERE Id = @id
