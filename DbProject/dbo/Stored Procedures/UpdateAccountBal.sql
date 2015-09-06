-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAccountBal]
	-- Add the parameters for the stored procedure here
	@id int,
	@amount decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.Accounts
	SET CheckbookBalance = CheckbookBalance + @amount
	WHERE Id = @id
END