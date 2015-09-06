CREATE PROCEDURE [dbo].[GetBalance]
	@id int
AS
	SELECT CheckbookBalance FROM Accounts WHERE Id = @id
RETURN 0