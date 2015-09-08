-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAccountInfo]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Name nvarchar(max),
	@HouseholdId nvarchar(128),
	@ReconciledBal nvarchar(128),
	@CheckbookBal nvarchar(128),
	@AccountNum nvarchar(128),
	@Desc nvarchar(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.Accounts
	SET Name = @Name,
		HouseholdId = @HouseholdId,
		ReconciledBalance = @ReconciledBal,
		CheckbookBalance = @CheckbookBal,
		AccountNumber = @AccountNum,
		Description = @Desc
	WHERE Id = @id
	RETURN 41
END
