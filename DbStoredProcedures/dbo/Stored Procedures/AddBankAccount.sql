-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddBankAccount]
	-- Add the parameters for the stored procedure here
	@Name nvarchar(max),
	@HouseholdId nvarchar(max),
	@CheckbookBalance nvarchar(128) = '0',
	@ReconciledBalance nvarchar(128) = '0',
	@AccountNum nvarchar(128),
	@Description nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

	DECLARE @result table (Id nvarchar(128))
    -- Insert statements for procedure here
	INSERT INTO [dbo].[Accounts]
           ([HouseholdId]
           ,[Name]
           ,[CheckbookBalance]
           ,[ReconciledBalance]
		   ,[AccountNumber]
		   ,[Description])
	-- Get Id of newly created row
	OUTPUT inserted.Id into @result
	VALUES
           (@HouseholdId,
           @Name,
		   @CheckbookBalance,
		   @ReconciledBalance,
		   @AccountNum,
		   @Description)
	-- and return the just-created row
	SELECT * FROM Accounts
	WHERE (SELECT Id from @result) = Id
END