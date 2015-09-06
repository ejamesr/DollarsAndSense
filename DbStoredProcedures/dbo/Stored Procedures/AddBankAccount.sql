-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddBankAccount]
	-- Add the parameters for the stored procedure here
	@HouseholdId nvarchar(max),
	@Name nvarchar(max),
	@CheckbookBalance decimal = 0,
	@ReconciledBalance decimal = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[Accounts]
           ([HouseholdId]
           ,[Name]
           ,[CheckbookBalance]
           ,[ReconciledBalance])
     VALUES
           (@HouseholdId,
           @Name,
		   @CheckbookBalance,
		   @ReconciledBalance)
END